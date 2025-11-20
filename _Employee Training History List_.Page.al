page 33065747 "Employee Training History List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Employee Training History";
    // CardPageId = "Employee Training History Card";
    ModifyAllowed = false;
    InsertAllowed = false;
    DeleteAllowed = false;

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

                field("Type Of Training"; rec."Type Of Training")
                {
                    ApplicationArea = All;
                }
                field("Certificate FileName"; "Certificate FileName")//megha 18-11-25
                {
                    Caption = 'Application File Name';

                    ApplicationArea = all;
                }
                field("Traing Course Title"; rec."Course Name")
                {
                    ApplicationArea = All;
                }
                field("Training Starting Date"; rec."Start Date")
                {
                    ApplicationArea = All;
                }
                field("Training Ending Date"; rec.EndDate)
                {
                    ApplicationArea = All;
                }
                field("Duration Of Training"; rec."Duration Of Training")
                {
                    ApplicationArea = All;
                }
                field("Conducted By"; rec."Conducted By")
                {
                    ApplicationArea = All;
                }

                field("Training Location"; rec."Training Location")
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
            /* action(Download)
            {
                ApplicationArea = All;
                // Promoted = true;
                Image = Download;

                trigger OnAction()var FilemngCU: Codeunit "File Management";
                inst: InStream;
                os: OutStream;
                tempblobloc: Codeunit "Temp Blob";
                begin
                    Rec.CalcFields(Certificate);
                    if Rec.Certificate.HasValue then begin
                        Rec.Certificate.CreateInStream(inst);
                        tempblobloc.CreateOutStream(os);
                        CopyStream(os, inst);
                        FilemngCU.BLOBExport(tempblobloc, 'Employee_training_' + Rec."HRMS ID" + '.pdf', true);
                    end
                    else
                        Error('File Not found');
                end;
            } */
            action("Download Documents") //SS07OCT
            {
                ApplicationArea = All;
                Caption = 'Download Documents';
                Image = Download;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    FilemngCU: Codeunit "File Management";
                    TempBlob: Codeunit "Temp Blob";
                    InstreamVar: InStream;
                    OutstreamVar: OutStream;
                begin
                    Rec.CalcFields(Certificate); // your BLOB field
                    if Rec.Certificate.HasValue then begin
                        Rec.Certificate.CreateInStream(InstreamVar);
                        TempBlob.CreateOutStream(OutstreamVar);
                        CopyStream(OutstreamVar, InstreamVar);
                        FilemngCU.BLOBExport(TempBlob, 'TrainingDoc_' + Rec."HRMS ID" + '_' + Format(Rec."Entry No") + '.pdf', true);
                    end
                    else
                        Error('No document found for HRMS ID: %1, Entry No: %2', Rec."HRMS ID", Rec."Entry No");
                end;
            }
        }
    }
}
