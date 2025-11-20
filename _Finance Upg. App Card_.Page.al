page 33066446 "Finance Upg. App Card"
{
    PageType = Card;
    //ApplicationArea = All;
    //UsageCategory = Administration;
    SourceTable = "Financial Upg Application";
    Caption = 'Financial Upgradation consolidated list';

    layout
    {
        area(Content)
        {
            Group(Genearl)
            {
                field("Entry No.";rec."Entry No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("HRMS ID";rec."HRMS ID")
                {
                    ApplicationArea = All;
                //Editable = false;
                }
                field("Employee Name";rec.Name)
                {
                    ApplicationArea = All;
                //Editable = false;
                }
                field(Designation;rec.Designation)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Date of application upload(Current Date)";rec."Date of application upload")
                {
                    ApplicationArea = All;
                //Editable = false;
                }
                // Start Anmol 27 jan 25
                field("Effective Date Of MACP";Rec."Effective Date Of MACP")
                {
                    ApplicationArea = All;
                }
                // End Anmol 27 jan 25
                field(Type;rec.Type)
                {
                    ApplicationArea = All;
                //Editable = false;
                }
                field("Current Station";rec."Current Station")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Status;rec.Status)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Download Document")
            {
                ApplicationArea = All;
                // Promoted = true;
                Image = Download;

                trigger OnAction()var FilemngCU: Codeunit "File Management";
                inst: InStream;
                os: OutStream;
                tempblobloc: Codeunit "Temp Blob";
                begin
                    Rec.CalcFields("Application file");
                    if Rec."Application file".HasValue then begin
                        Rec."Application file".CreateInStream(inst);
                        tempblobloc.CreateOutStream(os);
                        CopyStream(os, inst);
                        FilemngCU.BLOBExport(tempblobloc, Rec."Application file name" + 'finc.pdf', true);
                    end
                    else
                        Error('File Not found');
                end;
            }
        }
    }
    var myInt: Integer;
}
