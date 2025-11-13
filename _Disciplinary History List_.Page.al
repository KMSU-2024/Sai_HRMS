page 33065745 "Disciplinary History List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = History;
    SourceTable = "Disciplinary History";
    ModifyAllowed = false;
    DeleteAllowed = false;
    InsertAllowed = false;
    // CardPageId = "Disciplinary History Card";
    Caption = 'Employee Disciplinary Case History List';

    layout
    {
        area(Content)
        {
            repeater(GroupName)
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
                field(Designation; rec.Designation)
                {
                    ApplicationArea = All;
                }
                // start anmol 28 jan 25 replace Disciplinary Charges with Disciplinary Charges File Name 
                // field("Disciplinary Charges"; rec."Disciplinary Charges")
                // {
                //     ApplicationArea = All;
                // }
                field("Disciplinary Charges File Name"; Rec."Disciplinary Charges File Name")
                {
                    ApplicationArea = All;
                }
                // End Anmol 28 Jan 25
                field("Disciplinary CaseLetter No"; rec."Disciplinary CaseLetter No")
                {
                    ApplicationArea = All;
                }
                field("Disciplinary CaseDate"; rec."Disciplinary CaseDate")
                {
                    ApplicationArea = All;
                }
                field("Disciplinary CasesStatus"; rec."Disciplinary CaseStatus")
                {
                    ApplicationArea = All;
                }
                field("WhetherPlaced under suspension"; rec."WhetherPlaced under suspension")
                {
                    ApplicationArea = All;
                }
                field("Whether reinstated"; rec."Whether reinstated")
                {
                    ApplicationArea = All;
                }
                // Start Anmol 27 jan 25
                field(VigilanceCasePending; Rec.VigilanceCasePending)
                {
                    ApplicationArea = All;
                    Caption = 'Vigilance Case Pending';
                }
                // End Anmol 27 jan 25
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
            // Start Anmol 28 jan 25 Action added
            action(" Download Disciplinary Charge Doc.")
            {
                ApplicationArea = All;
                Image = Download;

                trigger OnAction()
                var
                    Tempblob: Codeunit "Temp Blob";
                    inst: InStream;
                    os: OutStream;
                    fileName: Text;
                    FilemngCU: Codeunit "File Management";
                begin
                    Rec.CalcFields("Upload Disciplinary ChargesDoc");
                    if Rec."Upload Disciplinary ChargesDoc".HasValue then begin
                        Rec."Upload Disciplinary ChargesDoc".CreateInStream(inst);
                        Tempblob.CreateOutStream(os);
                        CopyStream(os, inst);
                    end;
                    if Tempblob.Length() > 0 then
                        FilemngCU.BLOBExport(Tempblob, 'Application_' + Rec."HRMS ID" + '.pdf', true)
                    else
                        Error('Document Not found');
                end;
            }
        }
    }
}
