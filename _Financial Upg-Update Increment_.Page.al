page 33065972 "Financial Upg-Update Increment"
{
    PageType = List;
    SourceTable = "Financial Upg Application";
    Caption = 'Update / Confirm Increments';
    UsageCategory = Lists;
    ApplicationArea = All;
    InsertAllowed = false;//ssnov20

    //SourceTableView = where(IsConfirmed = const(true));
    layout
    {
        area(content)
        {
            group(IncrementList)
            {
                Caption = 'Increment Records';

                repeater(Group)
                {
                    field("Entry No."; rec."Entry No.")
                    {
                        ApplicationArea = All;
                    }
                    field("HRMS ID"; rec."HRMS ID")
                    {
                        ApplicationArea = All;
                    }

                    field(Name; rec.Name)
                    {
                        ApplicationArea = All;
                    }
                    field("Increment Amount"; Rec."Increment Amount") //ss16oct
                    {
                        ApplicationArea = All;
                    }

                    field("Effective Date Of MACP"; "Effective Date Of MACP")
                    {
                        ApplicationArea = all;
                        Caption = 'Effective Date of Increment';//ss20nov
                    }
                    field("Type of increment"; Rec."Type of increment") //ss16oct
                    {
                        ApplicationArea = All;
                    }
                    field("Date of application upload"; rec."Date of application upload")//sNov18
                    {
                        ApplicationArea = All;
                    }
                    field("Application file name"; "Application file name") //ssnov20
                    {
                        ApplicationArea = all;
                    }
                    field("IsConfirmed"; rec."IsConfirmed")
                    {
                        ApplicationArea = All;
                    } //ss16oct
                    field(Status; rec.Status)
                    {
                        ApplicationArea = All;
                    }
                }
                // Embedded History Subpage //ss16oct
                /*group(HistorySection)

                        {

                            Caption = 'Increment History'; //ss16oct

                            part(HistoryList; "Financial Upg - History")

                            {

                                ApplicationArea = All;

                                SubPageLink = "HRMS ID" = field("HRMS ID"); // link to employee //ss16oct

                                // ShowCaption = false;

                            }

                        }*/
            }
        }
    }
    actions
    {
        area(processing)
        {
            action(SaveAndConfirm)

            {

                Caption = 'Save & Confirm Increment';

                Image = Confirm;

                ApplicationArea = All;

                Promoted = true;

                PromotedCategory = Process;

                trigger OnAction()

                var

                    Hist: Record "Financial Upg App history";

                    InS: InStream;

                    OutS: OutStream;

                    NextSl: Integer;
                    EmpRec: Record Employee;

                begin

                    Rec.TestField("HRMS ID");

                    Rec.TestField("Increment Amount");

                    // 1️⃣ Insert or modify main record

                    if Rec."Entry No." = 0 then begin

                        Rec."Date of application upload" := WorkDate();

                        Rec.Status := Rec.Status::Processed;   // CHANGE STATUS TO PROCESSED

                        Rec."IsConfirmed" := true;

                        Rec.Modify(true);

                    end else begin

                        Rec.Status := Rec.Status::Processed;   // CHANGE STATUS TO PROCESSED

                        Rec."IsConfirmed" := true;

                        Rec.Modify(true);

                    end;

                    // 2️⃣ Prepare next history entry number

                    Hist.Reset();

                    if Hist.FindLast() then
                        NextSl := Hist.Sl_no + 1

                    else
                        NextSl := 1;


                    Hist.Init();

                    Hist.Sl_no := NextSl;

                    Hist."HRMS ID" := Rec."HRMS ID";

                    Hist.Name := Rec.Name;
                    EmpRec.Reset();
                    EmpRec.SetRange("No.", Rec."HRMS ID");

                    if EmpRec.FindFirst() then begin
                        EmpRec.Validate("Basic Gr. Pay", EmpRec."Basic Gr. Pay" + Hist."Increment Amount");
                        EmpRec.Modify(true);
                    end;


                    Hist."Increment Amount" := Rec."Increment Amount";

                    Hist.Status := Hist.Status::Processed;

                    Hist."Current Station" := Rec."Current Station";

                    Hist."Application file name" := Rec."Application file name";

                    Hist."Effective Date Of MACP" := Rec."Effective Date Of MACP";

                    Hist."Type of increment" := Format(Rec."Type of increment");//ss18nov

                    Hist."no of versions" := Rec.GetNextVersion(Rec."HRMS ID");
                    Hist."Date of application upload" := Rec."Date of application upload";

                    Hist."User Id" := UserId();

                    Hist."Modified Date Time" := CurrentDateTime;


                    Rec.CalcFields("Application file");

                    if Rec."Application file".HasValue then begin

                        Rec."Application file".CreateInStream(InS);

                        Hist."Application file".CreateOutStream(OutS);

                        CopyStream(OutS, InS);

                    end;

                    Hist.Insert(true);

                    Message('Increment for %1 saved and confirmed.', Rec."HRMS ID");

                    CurrPage.Update(false);

                end;

            }


            action(CreateNewVersion)
            {
                Caption = 'Create New Version';
                Image = New;
                ApplicationArea = All;
                Promoted = false;
                Visible = false; //ss16oct

                trigger OnAction()
                var
                    NewRec: Record "Financial Upg Application";
                begin
                    if not Rec."IsConfirmed" then begin
                        Message('Record not yet confirmed — you can edit it directly.');
                        exit;
                    end;
                    // Clone current record into a new interim version //ss16oct
                    NewRec := Rec;
                    NewRec."Entry No." := 0;
                    NewRec."Status" := NewRec.Status::Applied;
                    NewRec."IsConfirmed" := false;
                    NewRec.Insert(true);
                    Message('New version created (Entry No. %1).', NewRec."Entry No.");
                    CurrPage.Update(false);
                end;
            }
            action(ViewFile)
            {
                Caption = 'View Application File';
                Image = View;
                ApplicationArea = All;
                Visible = false; //ss16oct

                trigger OnAction()
                var
                    TempBlob: InStream;
                    FileName: text;
                begin
                    if rec."Application file".HasValue then begin
                        Message('No application file attached for Entry No. %1.', Rec."Entry No.");
                        exit;
                    end;
                    rec."Application file".CreateInStream(TempBlob);
                    DownloadFromStream(TempBlob, 'Save Application File', // Dialog Title
 '', // ToFolder (blank = user chooses)
 '', // ToFilter (blank = all files)
 FileName // var ToFile
                    );
                end;
            }
            // ============================================================
            // Upload Document Action
            // ============================================================
            /* action(UploadDocument) //ss16oct
             {
                 Caption = 'Upload Document';
                 Image = Import;
                 ApplicationArea = All;
                 ToolTip = 'Upload or replace the application document for this increment.'; //ss16oct

                 trigger OnAction()
                 var
                     InStreamVar: InStream;
                     FileName: Text;
                 begin
                     if UploadIntoStream('Select document to upload', '', '', FileName, InStreamVar) then begin
                         Rec."Application file".ImportStream(InStreamVar, FileName);
                         Rec."Application file name" := FileName;
                         Rec.Modify(true);
                         Message('Document "%1" uploaded successfully for HRMS ID %2.', FileName, Rec."HRMS ID");
                     end else
                         Message('No file selected.');
                 end;
             }*/
            // ============================================================
            // Download Document Action
            // ============================================================
            action(DownloadDocument) //ss16oct
            {
                Caption = 'Download Document';
                Image = Download;
                ApplicationArea = All;
                ToolTip = 'Download the uploaded application file for this increment.';

                trigger OnAction()
                var
                    InStreamVar: InStream;
                    FileName: Text;
                begin
                    Rec.CalcFields("Application file");
                    if Rec."Application file".HasValue then begin
                        Rec."Application file".CreateInStream(InStreamVar);
                        FileName := Rec."Application file name";
                        DownloadFromStream(InStreamVar, '', '', '', FileName);
                    end
                    else
                        Message('No file available to download for HRMS ID %1.', Rec."HRMS ID");
                end;
            }
        }
    }
    trigger OnAfterGetRecord()
    begin
        //CurrPage.HistoryList.PAGE.Update(false); // auto-refresh history //ss16oct
    end;
    //ss16oct start
    local procedure GetNextSlNo(): Integer
    var
        hist2: Record "Financial Upg App history";
    begin
        hist2.Reset();
        if hist2.FindLast() then
            exit(hist2.Sl_no + 1)
        else
            exit(1);
    end;

    local procedure GetNextVersion1(HRmsid: Code[20]): Integer //ss16oct
    var
        EmpArchive: Record "Financial Upg App history";
    begin
        EmpArchive.Reset();
        EmpArchive.SetRange("HRMS ID", HRmsid); // ✅ limit to that employee only
        if EmpArchive.FindLast() then
            exit(EmpArchive."no of versions" + 1)
        else
            exit(1);
    end;
    //ss16oct end
}
