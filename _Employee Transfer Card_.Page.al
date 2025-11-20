page 33066450 "Employee Transfer Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Lists;
    // SourceTable = "Transfer Application Employee";
    Caption = 'Transfer application of employee';

    layout
    {
        area(Content)
        {
            group("Employee Detailes")
            {
                field("HRMS ID";HRMSID)
                {
                    ApplicationArea = All;
                    TableRelation = Employee."No." where("SLCM Employee"=const(false));

                    trigger OnValidate()var EmpVar: Record Employee;
                    begin
                        if EmpVar.Get(HRMSID)then begin
                            EmpNameVar:=EmpVar."First Name";
                            DesigngVar:=EmpVar.Designation;
                            currstation:=EmpVar."Current Station";
                            currDate:=Today;
                        end;
                    end;
                }
                field("Employee Name";EmpNameVar)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Designation;DesigngVar)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Current Station";currstation)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }
            group("Transfer detailes")
            {
                field("Current Date";currDate)
                {
                    Caption = 'Current Date';
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Ground;GroundVar)
                {
                    ApplicationArea = All;
                }
                field("First Preference";FirstRef)
                {
                    ApplicationArea = All;
                    TableRelation = District.Code;

                    trigger OnValidate()var myInt: Integer;
                    begin
                        if(FirstRef = SecondtRef) or (FirstRef = ThirdRef)then Error('This %1 Preference is already Select', FirstRef);
                    end;
                }
                field("Second Preference";SecondtRef)
                {
                    ApplicationArea = All;
                    TableRelation = District.Code;

                    trigger OnValidate()var myInt: Integer;
                    begin
                        if(SecondtRef = FirstRef) or (SecondtRef = ThirdRef)then Error('This %1 Preference is already Select', SecondtRef);
                    end;
                }
                field("Third Preference";ThirdRef)
                {
                    ApplicationArea = All;
                    TableRelation = District.Code;

                    trigger OnValidate()var myInt: Integer;
                    begin
                        if(ThirdRef = FirstRef) or (ThirdRef = SecondtRef)then Error('This %1 Preference is already Select', ThirdRef);
                    end;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            /* action("upload application")
            {
                ApplicationArea = All;
                Image = Add;

                trigger OnAction()var filePath: Text;
                txt: Text;
                flname: Text;
                begin
                    fileName:=Filemgm.BLOBImportWithFilter(Tempblob, 'Upload File', '', 'All Files (*.*)|*.pdf*', '.pdf');
                    ins:=Tempblob.CreateInStream();
                    if Tempblob.Length() > 3000000 then Error('File size must be less than or equal to 3MB')
                    else
                        Message('File uploded');
                end;
            }
            action("Download Document")
            {
                ApplicationArea = All;
                Image = Download;

                trigger OnAction()var FilemngCU: Codeunit "File Management";
                begin
                    if Tempblob.Length() > 0 then fileName:=FilemngCU.BLOBExport(Tempblob, 'Transfer_Application_' + HRMSID + '.pdf', true)
                    else
                        Error('Document Not found');
                end;
            }
            action("Apply")
            {
                ApplicationArea = All;
                Promoted = true;
                Image = Save;

                trigger OnAction()var TransferEmpRec: Record "Transfer Application Employee";
                begin
                    if Confirm('Do you want to submit the current Document ?', false)then begin
                        TransferEmpRec.Reset();
                        TransferEmpRec.Init();
                        TransferEmpRec.Validate("HRMS ID", HRMSID);
                        TransferEmpRec."Date of transfer application":=currDate;
                        TransferEmpRec.Ground:=GroundVar;
                        TransferEmpRec."First Preference":=FirstRef;
                        TransferEmpRec."Second Preference":=SecondtRef;
                        TransferEmpRec."Third Preference":=ThirdRef;
                        TransferEmpRec."Current Station":=currstation;
                        TransferEmpRec.Status:=TransferEmpRec.Status::Submitted;
                        TransferEmpRec."File Name":=fileName;
                        if fileName <> '' then begin
                            TransferEmpRec."Upload Document".CreateOutStream(outs);
                            CopyStream(outs, ins);
                        end;
                        TransferEmpRec.Insert(true);
                        Message('Document Submit.');
                        CurrPage.Close();
                    end;
                end;
            } */
            action("upload application") //SS07OCT
            {
                ApplicationArea = All;
                Image = Add;

                trigger OnAction()var filePath: Text;
                txt: Text;
                flname: Text;
                begin
                    fileName:=Filemgm.BLOBImportWithFilter(Tempblob, 'Upload File', '', 'All Files (*.*)|*.pdf*', '.pdf');
                    ins:=Tempblob.CreateInStream();
                    if Tempblob.Length() > 3000000 then Error('File size must be less than or equal to 3MB')
                    else
                        Message('File uploded');
                end;
            }
            action("Download Document") //SS07OCT
            {
                ApplicationArea = All;
                Image = Download;

                trigger OnAction()var FilemngCU: Codeunit "File Management";
                begin
                    if Tempblob.Length() > 0 then fileName:=FilemngCU.BLOBExport(Tempblob, 'Transfer_Application_' + HRMSID + '.pdf', true)
                    else
                        Error('Document Not found');
                end;
            }
            action("Apply") //SS07OCT
            {
                ApplicationArea = All;
                Promoted = true;
                Image = Save;

                trigger OnAction()var TransferEmpRec: Record "Transfer Application Employee";
                begin
                    if Confirm('Do you want to submit the current Document ?', false)then begin
                        TransferEmpRec.Reset();
                        TransferEmpRec.Init();
                        TransferEmpRec.Validate("HRMS ID", HRMSID);
                        TransferEmpRec."Date of transfer application":=currDate;
                        TransferEmpRec.Ground:=GroundVar;
                        TransferEmpRec."First Preference":=FirstRef;
                        TransferEmpRec."Second Preference":=SecondtRef;
                        TransferEmpRec."Third Preference":=ThirdRef;
                        TransferEmpRec."Current Station":=currstation;
                        TransferEmpRec.Status:=TransferEmpRec.Status::Submitted;
                        TransferEmpRec."File Name":=fileName;
                        if fileName <> '' then begin
                            TransferEmpRec."Upload Document".CreateOutStream(outs);
                            CopyStream(outs, ins);
                        end;
                        TransferEmpRec.Insert(true);
                        Message('Document Submit.');
                        CurrPage.Close();
                    end;
                end;
            }
        }
    }
    var Filemgm: Codeunit "File Management";
    Tempblob: Codeunit "Temp Blob";
    ins: InStream;
    outs: OutStream;
    HRMSID: code[20];
    EmpNameVar: text[50];
    DesigngVar: Code[20];
    currstation: Code[20];
    currDate: Date;
    GroundVar: Option " ", "Medical Ground - Self", "Medical ground - Dependents", "Child Education", "Other";
    FirstRef: Code[20];
    SecondtRef: Code[20];
    ThirdRef: Code[20];
    fileName: Text;
}
