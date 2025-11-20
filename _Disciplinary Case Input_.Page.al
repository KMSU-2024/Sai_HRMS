page 33065735 "Disciplinary Case Input"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'Disciplinary Cases of Employee';

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(HRMSID;HRMSID)
                {
                    ApplicationArea = All;
                    Caption = 'HRMS ID';
                    TableRelation = Employee."No." where("SLCM Employee"=const(false));

                    trigger onValidate()var Employee: Record 5200;
                    begin
                        Employee.Reset();
                        Employee.SetRange("No.", HRMSID);
                        If Employee.FindFirst()then begin
                            Name:=Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                            Designation:=Employee.Designation;
                        end;
                    end;
                }
                field("Employee Name";Name)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Designation;Designation)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                // Start Anmol 21 jan 25 comment 
                // field(DisciplinaryCharges; DisciplinaryCharges)
                // {
                //     ApplicationArea = All;
                // }
                field(DisciplinaryCaseLetterNo;DisciplinaryCaseLetterNo)
                {
                    ApplicationArea = All;
                }
                field(DisciplinaryCaseLatterDate;DisciplinaryCaseDate)
                {
                    ApplicationArea = All;
                }
                field(DisciplinaryCasesStatus;DisciplinaryCaseStatus)
                {
                    ApplicationArea = All;
                }
                field(WhetherPlacedUnderSuspension;WhetherPlacedUnderSuspension)
                {
                    ApplicationArea = All;

                    trigger Onvalidate()var myInt: Integer;
                    begin
                        if WhetherReinstated = true then Error('You Can not tick this boolean because Reinstated boolean is already true. If you want to tick this boolean then please untick Reinstated boolean.');
                    end;
                }
                field(WhetherReinstated;WhetherReinstated)
                {
                    ApplicationArea = All;

                    trigger onvalidate()var myInt: Integer;
                    begin
                        if WhetherPlacedUnderSuspension = true then Error('You Can not tick this boolean because suspension boolean is already true. If you want to tick this boolean then please untick suspension boolean.');
                    end;
                }
                // Start Anmol 17 Jan 2025 add new field VigilanceCasePending
                field(VigilanceCasePending;VigilanceCasePending)
                {
                    ApplicationArea = All;
                    Caption = 'Vigilance Case Pending';
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            //anmol start
            action("Upload Disciplinary Charge Doc.")
            {
                ApplicationArea = All;
                Image = Add;

                trigger OnAction()var begin
                    fileName:=Filemgm.BLOBImportWithFilter(Tempblob, 'Upload File', '', 'All Files (*.*)|*.pdf*', '.pdf');
                    ins:=Tempblob.CreateInStream();
                    if Tempblob.Length() > 3000000 then Error('File size must be less than or equal to 3MB')
                    else
                        Message('File uploded');
                end;
            }
            action(" Download Disciplinary Charge Doc.")
            {
                ApplicationArea = All;
                Image = Download;

                trigger OnAction()var FilemngCU: Codeunit "File Management";
                begin
                    if Tempblob.Length() > 0 then fileName:=FilemngCU.BLOBExport(Tempblob, 'Application_' + HRMSID + '.pdf', true)
                    else
                        Error('Document Not found');
                end;
            }
            //anmol end
            action("Submit")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction()begin
                    DisciplinaryHist.Init();
                    DisciplinaryHist."HRMS ID":=HRMSID;
                    DisciplinaryHist.Name:=Name;
                    DisciplinaryHist.Designation:=Designation;
                    // DisciplinaryHist."Disciplinary Charges":=DisciplinaryCharges;
                    DisciplinaryHist."Disciplinary Charges File Name":=fileName; // Start Anmol renamed
                    DisciplinaryHist."Disciplinary CaseLetter No":=DisciplinaryCaseLetterNo;
                    DisciplinaryHist."Disciplinary CaseDate":=DisciplinaryCaseDate;
                    DisciplinaryHist."Disciplinary CaseStatus":=DisciplinaryCaseStatus;
                    DisciplinaryHist."WhetherPlaced under suspension":=WhetherPlacedUnderSuspension;
                    DisciplinaryHist."Whether reinstated":=WhetherReinstated;
                    //Start Anmol
                    DisciplinaryHist.VigilanceCasePending:=VigilanceCasePending;
                    if fileName <> '' then begin
                        DisciplinaryHist."Upload Disciplinary ChargesDoc".CreateOutStream(outs);
                        CopyStream(outs, ins);
                    end;
                    //End Anmol
                    DisciplinaryHist.Insert(true);
                    Message('Disciplinary Case Filed Successfully against employee %1', HRMSID);
                    CurrPage.Close();
                end;
            }
        }
    }
    var HRMSID: Code[20];
    Name: Text[90];
    Designation: Code[20];
    DisciplinaryCharges: Text[50];
    DisciplinaryCaseLetterNo: Code[20];
    DisciplinaryCaseDate: Date;
    DisciplinaryCaseStatus: Enum "Discipinary CaseStatus";
    WhetherPlacedUnderSuspension: Boolean;
    WhetherReinstated: Boolean;
    // Start Anmol add new field Vigilance Case Pending
    VigilanceCasePending: Boolean;
    //VigilanceCasePending: Enum YESorNO;
    DisciplinaryHist: Record "Disciplinary History";
    // Start Anmol 
    Filemgm: Codeunit "File Management";
    ins: InStream;
    outs: OutStream;
    Tempblob: Codeunit "Temp Blob";
    fileName: Text;
// End Anmol
}
