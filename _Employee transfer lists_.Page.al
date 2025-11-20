page 33066434 "Employee transfer lists"
{
    Caption = 'Employee transfer application consolidated list';
    PageType = List;
    SourceTable = "Transfer Application Employee";
    ApplicationArea = All;
    UsageCategory = History;
    InsertAllowed = false;
    // ModifyAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Sl. No";Rec."Sl. No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Sl. No field.';
                    Editable = false;
                    Enabled = false;
                }
                field("HRMS ID";Rec."HRMS ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the HRMS ID field.';
                    Editable = false;
                }
                field("Employee Name";Rec."Employee Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                    Editable = false;
                }
                field(Designation;Rec.Designation)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Designation field.';
                    Editable = false;
                }
                field("Current Station";Rec."Current Station")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Current Station field.';
                    Editable = false;
                }
                field("Curren Date";Rec."Date of transfer application")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Date of transfer application field.';
                    Editable = false;
                }
                field(Ground;Rec.Ground)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Ground field.';
                    Editable = false;
                }
                field("First Preference";Rec."First Preference")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the First Preference field.';
                    Editable = false;
                }
                field("Second Preference";Rec."Second Preference")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Second Preference field.';
                    Editable = false;
                }
                field("Third Preference";Rec."Third Preference")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Third Preference field.';
                    Editable = false;
                }
                // field("File Name"; Rec."File Name")
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Specifies the value of the File Name field.';
                //     Visible = false;
                // }
                field(Status;Rec.Status)
                {
                    ApplicationArea = All;

                    trigger OnValidate()begin
                        if rec.Status = rec.Status::Rejected then BoolCheck:=true
                        else
                            BoolCheck:=false;
                    end;
                }
                field("Reason for rejection";rec."Reason for rejection")
                {
                    ApplicationArea = All;
                    Enabled = BoolCheck;
                    Editable = BoolCheck;

                    trigger OnValidate()var myInt: Integer;
                    begin
                        rec.TestField(Status, Status::Rejected);
                    end;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            /* action("Download Document")
            {
                ApplicationArea = All;
                Promoted = true;
                Image = Download;

                trigger OnAction()var FilemngCU: Codeunit "File Management";
                inst: InStream;
                os: OutStream;
                tempblobloc: Codeunit "Temp Blob";
                begin
                    Rec.CalcFields("Upload Document");
                    if Rec."Upload Document".HasValue then begin
                        Rec."Upload Document".CreateInStream(inst);
                        tempblobloc.CreateOutStream(os);
                        CopyStream(os, inst);
                        FilemngCU.BLOBExport(tempblobloc, rec."HRMS ID" + '.pdf', true);
                    end
                    else
                        Error('File Not found');
                end;
            } */
            action("Download Document") //SS07OCT
            {
                ApplicationArea = All;
                Promoted = true;
                Image = Download;

                trigger OnAction()var FilemngCU: Codeunit "File Management";
                inst: InStream;
                os: OutStream;
                tempblobloc: Codeunit "Temp Blob";
                begin
                    Rec.CalcFields("Upload Document");
                    if Rec."Upload Document".HasValue then begin
                        Rec."Upload Document".CreateInStream(inst);
                        tempblobloc.CreateOutStream(os);
                        CopyStream(os, inst);
                        FilemngCU.BLOBExport(tempblobloc, rec."HRMS ID" + '.pdf', true);
                    end
                    else
                        Error('File Not found');
                end;
            }
        }
    }
    trigger OnAfterGetCurrRecord()begin
        if rec.Status = rec.Status::Rejected then BoolCheck:=true
        else
            BoolCheck:=false;
    end;
    var BoolCheck: Boolean;
}
