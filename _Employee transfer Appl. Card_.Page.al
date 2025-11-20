page 33066448 "Employee transfer Appl. Card"
{
    Caption = 'Employee transfer application consolidated Card';
    PageType = Card;
    SourceTable = "Transfer Application Employee";

    //ApplicationArea = All;
    //UsageCategory = History;
    //InsertAllowed = false;
    // ModifyAllowed = false;
    //DeleteAllowed = false;
    layout
    {
        area(content)
        {
            group(General)
            {
                field("Sl. No";Rec."Sl. No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Sl. No field.';
                }
                field("HRMS ID";Rec."HRMS ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the HRMS ID field.';
                }
                field("Employee Name";Rec."Employee Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field(Designation;Rec.Designation)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Designation field.';
                }
                field("Current Station";Rec."Current Station")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Current Station field.';
                }
                field("Curren Date";Rec."Date of transfer application")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Date of transfer application field.';
                }
                field(Ground;Rec.Ground)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Ground field.';
                }
                field("First Preference";Rec."First Preference")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the First Preference field.';
                }
                field("Second Preference";Rec."Second Preference")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Second Preference field.';
                }
                field("Third Preference";Rec."Third Preference")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Third Preference field.';
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

                    trigger OnValidate()var myInt: Integer;
                    begin
                        rec.TestField(Status, Status::Rejected);
                    end;
                }
                field("File Name";"File Name") //megha 25-8-25
                {
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
