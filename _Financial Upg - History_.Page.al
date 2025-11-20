page 33065973 "Financial Upg - History" //ss16oct
{
    PageType = List;
    SourceTable = "Financial Upg App history";
    UsageCategory = Lists;
    RefreshOnActivate = true;
    Caption = 'Increment History';

    // SourceTableView = where(Isconfirmed = const(true));
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Sl_no;rec.Sl_no)
                {
                    ApplicationArea = All;
                }
                field("HRMS ID";rec."HRMS ID")
                {
                    ApplicationArea = All;
                }
                field("Current Station";rec."Current Station")
                {
                    ApplicationArea = All;
                }
                field("no of versions";rec."no of versions")
                {
                    ApplicationArea = All;
                }
                //ss16oct added start
                field("Effective Date Of MACP";rec."Effective Date Of MACP")
                {
                    Caption = 'Effective Date of Increment';
                    ApplicationArea = All;
                }
                field("Increment Amount";Rec."Increment Amount")
                {
                    ApplicationArea = All;
                }
                field("Type of increment";Rec."Type of increment")
                {
                    ApplicationArea = All;
                }
                field(Status;Rec.Status)
                {
                    ApplicationArea = all;
                }
                field("Date of application upload";rec."Date of application upload")
                {
                    ApplicationArea = All;
                }
            // add more fields as required by your history table 
            //ss16oct end
            }
        }
    }
    actions
    {
        area(processing)
        {
            // ============================================================
            // Download Document (History)
            // ============================================================
            action(DownloadDocument) //ss16oct
            {
                Caption = 'Download Document';
                Image = Download;
                ApplicationArea = All;
                ToolTip = 'Download the archived document stored with this increment record.'; //ss16oct

                trigger OnAction()var InStreamVar: InStream;
                FileName: Text;
                begin
                    Rec.CalcFields("Application file"); // ✅ ensure blob is loaded
                    if Rec."Application file".HasValue then begin
                        Rec."Application file".CreateInStream(InStreamVar);
                        FileName:=Rec."Application file name";
                        if FileName = '' then FileName:='Archived_Increment_' + Format(Rec."HRMS ID") + '.dat'; // fallback name
                        DownloadFromStream(InStreamVar, '', '', '', FileName);
                    end
                    else
                        Message('No file available for HRMS ID %1 in history.', Rec."HRMS ID");
                end;
            }
        }
    }
}
