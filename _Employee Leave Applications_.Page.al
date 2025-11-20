page 33066442 "Employee Leave Applications"
{
    ApplicationArea = All;
    Caption = 'Employee Leave Application Consolidated List';
    PageType = List;
    SourceTable = "Employee Leave Application";
    UsageCategory = History;
    DeleteAllowed = false;
    InsertAllowed = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("HRMS ID"; Rec."HRMS ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the HRMS ID field.';
                    Editable = false;
                    // AssistEdit = false;
                    Lookup = false;
                    // DrillDown = false;
                    Enabled = false;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field(Designation; Rec.Designation)
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Designation field.';
                }
                field("Leave From Date"; Rec."Leave From Date")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Leave From Date field.';
                }
                field("Leave To Date"; Rec."Leave To Date")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Leave To Date field.';
                }
                field("Type of Leave"; Rec."Type of Leave")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Type of Leave field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                // Start Anmol 17 Jan 2025
                field("Reason for Decline"; Rec."Reason for Decline")
                {
                    ApplicationArea = All;
                }
                // End Anmol
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
                Image = Download;

                trigger OnAction()
                var
                    FilemngCU: Codeunit "File Management";
                    inst: InStream;
                    os: OutStream;
                    tempblobloc: Codeunit "Temp Blob";
                begin
                    Rec.CalcFields("Upload Document");
                    if Rec."Upload Document".HasValue then begin
                        Rec."Upload Document".CreateInStream(inst);
                        tempblobloc.CreateOutStream(os);
                        CopyStream(os, inst);
                        FilemngCU.BLOBExport(tempblobloc, Rec."HRMS ID" + '_Leave_Application.pdf', true);
                    end
                    else
                        Error('File Not found');
                end;
            }
        }
    }
}
