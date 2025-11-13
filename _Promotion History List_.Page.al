page 33065741 "Promotion History List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Employee Promotion History";
    CardPageId = "Promotion History Card";
    Editable = false;
    Caption = 'Employee promotion History list';
    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Entry No"; rec."Entry No")
                {
                    ApplicationArea = All;
                }
                field("HRMS ID"; rec."HRMS ID")
                {
                    ApplicationArea = All;
                }
                field("Employee Name"; rec.Name)
                {
                    ApplicationArea = All;
                }
                field("From Designation"; rec."From Designation")
                {
                    ApplicationArea = All;
                }
                field("To Designation"; rec."To Designation")
                {
                    ApplicationArea = All;
                }
                field("Promotion Order Date"; rec."Promotion Order Date")
                {
                    ApplicationArea = All;
                }
                field("Letter NO"; rec."Letter NO")
                {
                    ApplicationArea = All;
                }
                // (g) Modified fields //SS07OCT
                field("Modified By"; Rec."Modified By")
                {
                    ApplicationArea = All;
                }
                field("Modified DateTime"; Rec."Modified Date Time")
                {
                    ApplicationArea = All;
                }
            }
        }
        area(Factboxes)
        {
        }
    }
    actions
    {
        area(Processing)
        {
            /* action("Download Promotion Order")
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    FilemngCU: Codeunit "File Management";
                    inst: InStream;
                    os: OutStream;
                    tempblobloc: Codeunit "Temp Blob";
                begin
                    Rec.CalcFields("Promotion Order");
                    if Rec."Promotion Order".HasValue then begin
                        Rec."Promotion Order".CreateInStream(inst);
                        tempblobloc.CreateOutStream(os);
                        CopyStream(os, inst);
                        FilemngCU.BLOBExport(tempblobloc, Rec."HRMS ID" + '_Promotion Order.pdf', true);
                    end
                    else
                        Error('File Not found');
                end;
            } */
            // (a) Update Action → opens Employee Promotion Card
            action("Update Promotion2") //SS07OCT
            {
                Caption = 'Update';
                ApplicationArea = All;
                Image = EditLines;

                trigger OnAction()
                var
                    promotionhistoryrecord: Record "Employee Promotion History";
                    TEMPPROMOTIONHIST: Record "Employee Promotion History" temporary;
                begin
                    if promotionhistoryrecord.Get(Rec."Entry No") then begin
                        PAGE.Run(PAGE::"Promotion History Card", promotionhistoryrecord);
                    end;
                    //  PAGE.Run(PAGE::"Promotion History Card", promotionhistoryrecord);
                end;
            }
            action("Promotion History") //SS07OCT
            {
                Caption = 'Promotion History';
                ApplicationArea = All;
                Image = History;
                RunObject = page "Promotion History Card1"; // new card page (see below)
                RunPageLink = "HRMS ID" = field("HRMS ID"); // Show history for selected employee
            }

        }
    }

    trigger OnAfterGetRecord()
    var
        emp: Record "Employee Promot History Arch"; //SS07OCT
    begin
        emp.Reset();
        emp.SetRange("HRMS ID", rec."HRMS ID");
        if emp.FindLast() then begin
            rec."From Designation" := emp."From Designation";
            rec."To Designation" := emp."To Designation";
            rec.Modify();
        end;
    end;
}
