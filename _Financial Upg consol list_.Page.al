page 33065496 "Financial Upg consol list" //sai added actions for update and history    //SS07OCT c
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = History;
    SourceTable = "Financial Upg Application";
    //  DeleteAllowed = false;
    // InsertAllowed = false;
    Caption = 'Financial Upgradation consolidated list';
    // CardPageId = "Financial Upg Application";
    CardPageId = "Financial Upg Application";

    //  CardPageId= "Finance Upg. App Card";
    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Entry No.";rec."Entry No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("HRMS ID";rec."HRMS ID")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Employee Name";rec.Name)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Designation;rec.Designation)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Date of application upload(Current Date)";rec."Date of application upload")
                {
                    ApplicationArea = All;
                    Editable = false;
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
                    Editable = false;
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
            action(UpdateRecord) //SS07OCT
            {
                ApplicationArea = All;
                Caption = 'Update';
                Image = EditLines;

                trigger OnAction()var FinUpgApp: Record "Financial Upg Application";
                begin
                    // Get current record
                    FinUpgApp.Get(Rec."Entry No.", Rec."HRMS ID");
                    PAGE.Run(PAGE::"Financial Upg Application", FinUpgApp);
                end;
            }
            action(ViewHistory) //SS07OCT
            {
                ApplicationArea = All;
                Caption = 'View History';
                Image = History;

                trigger OnAction()var HistoryRec: Record "Financial Upg App history";
                begin
                    HistoryRec.SetRange("HRMS ID", Rec."HRMS ID");
                    PAGE.Run(PAGE::"Financial Upg App History", HistoryRec);
                end;
            }
            /*     action("Download Document")
                {
                    ApplicationArea = All;
                    // Promoted = true;
                    Image = Download;

                    trigger OnAction()
                    var
                        FilemngCU: Codeunit "File Management";
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
                } */
            action("Download Document") //SS07OCT
            {
                ApplicationArea = All;
                Image = Download;

                trigger OnAction()var InStr: InStream;
                FileName: Text;
                begin
                    // Make sure the BLOB is loaded
                    Rec.CalcFields("Application file");
                    if Rec."Application file".HasValue then begin
                        // Stream out the BLOB
                        Rec."Application file".CreateInStream(InStr);
                        // Use the saved filename, fallback if empty
                        FileName:=Rec."Application file name";
                        if FileName = '' then FileName:='Application_' + Rec."HRMS ID" + '.pdf';
                        // Download the file
                        DownloadFromStream(InStr, 'Download File', '', '', FileName);
                    end
                    else
                        Error('Document Not found');
                end;
            }
        }
    }
    var myInt: Integer;
    isedit: Boolean;
    Tempblob: Codeunit "Temp Blob";
}
