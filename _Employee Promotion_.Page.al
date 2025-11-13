page 33065733 "Employee Promotion"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'Employee Promotion Card';

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(HRMSID; HRMSID)
                {
                    ApplicationArea = All;
                    Caption = 'HRMS ID';
                    TableRelation = Employee."No." where("SLCM Employee" = const(false));

                    trigger onValidate()
                    var
                        Employee: Record 5200;
                    begin
                        Employee.Reset();
                        Employee.SetRange("No.", HRMSID);
                        If Employee.FindFirst() then begin
                            Name := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                            CurrDesignation := Employee.Designation;
                        end;
                    end;
                }
                field("Employee Name"; Name)
                {
                    ApplicationArea = All;
                }
                field(CurrDesignation; CurrDesignation)
                {
                    ApplicationArea = All;
                    Caption = 'From Designation';
                    Editable = false;
                }
                field(ToDesignation; ToDesignation)
                {
                    ApplicationArea = All;
                    Caption = 'To Designation';
                    TableRelation = Designation.Code;
                }
                field(PromotionOrderDate; PromotionOrderDate)
                {
                    ApplicationArea = All;
                    Caption = 'Promotion Order Date';
                }
                field(LetterNo; LetterNo)
                {
                    ApplicationArea = All;
                    Caption = 'Letter No';
                }
                field("Promotion Order Issuing Authority"; OrderIssueAuthVar)
                {
                    ApplicationArea = All;
                    Caption = 'Promotion Order Issuing Authority';
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            group("Promotion Order Document")
            {
                action("Upload Promotion Order")
                {
                    ApplicationArea = All;
                    Image = Add;

                    trigger OnAction()
                    var
                    begin
                        fileName := Filemgm.BLOBImportWithFilter(Tempblob, 'Upload File', '', 'All Files (*.*)|*.pdf*', '.pdf');
                        ins := Tempblob.CreateInStream();
                        if Tempblob.Length() > 3000000 then
                            Error('File size must be less than or equal to 3MB')
                        else
                            Message('File uploded');
                    end;
                }
                action("View Promotion Order")
                {
                    ApplicationArea = All;
                    Image = Download;

                    trigger OnAction()
                    var
                        FilemngCU: Codeunit "File Management";
                    begin
                        if Tempblob.Length() > 0 then
                            fileName := FilemngCU.BLOBExport(Tempblob, 'Promotion Order_' + HRMSID + '.pdf', true)
                        else
                            Error('Document Not found');
                    end;
                }
            }
            action(Submit)//SS07OCT
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    PromotionHist1.Reset();
                    PromotionHist1.SetRange("HRMS ID", HRMSID);
                    PromotionHist1.SetRange("Letter NO", LetterNo);
                    if Not PromotionHist1.FindFirst() then begin
                        PromotionHist.Init();
                        PromotionHist."HRMS ID" := HRMSID;
                        PromotionHist.Name := Name;
                        PromotionHist."From Designation" := CurrDesignation;
                        PromotionHist."To Designation" := ToDesignation;
                        PromotionHist."Promotion Order Date" := PromotionOrderDate;
                        PromotionHist."Letter NO" := LetterNo;
                        PromotionHist."Order Issuing Authority" := OrderIssueAuthVar;
                        PromotionHist."Modified By" := UserId; //SS07OCT
                        PromotionHist."Modified Date Time" := CurrentDateTime; //SS07OCT
                        if fileName <> '' then begin
                            PromotionHist."Promotion Order".CreateOutStream(outs);
                            CopyStream(outs, ins);
                        end;
                        PromotionHist.Insert(true);
                        Message('Employee successfully promoted.');
                        If employee.Get(HRMSID) then begin
                            employee.Designation := ToDesignation;
                            employee.Modify(true);
                        end;
                    end
                    else
                        Error('Employee already got promoted with this letter no.');
                    CurrPage.Close();
                end;
            }
        }
    }
    var
        HRMSID: Code[20];
        Name: Text[90];
        CurrDesignation: Code[20];
        ToDesignation: Code[20];
        PromotionOrderDate: Date;
        LetterNo: Code[20];
        PromotionHist: Record "Employee Promotion History";
        employee: Record 5200;
        PromotionHist1: Record "Employee Promotion History";
        OrderIssueAuthVar: Option "DTE&T","SDTE",Principal;
        Tempblob: Codeunit "Temp Blob";
        fileName: Text;
        Filemgm: Codeunit "File Management";
        ins: InStream;
        outs: OutStream;
}
