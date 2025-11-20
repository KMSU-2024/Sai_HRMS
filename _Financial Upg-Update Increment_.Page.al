page 33065972 "Financial Upg-Update Increment"
{
    PageType = List;
    SourceTable = "Financial Upg Application";
    Caption = 'Update / Confirm Increments';
    UsageCategory = Lists;
    ApplicationArea = All;

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
                    field("Entry No.";rec."Entry No.")
                    {
                        ApplicationArea = All;
                    }
                    field("HRMS ID";rec."HRMS ID")
                    {
                        ApplicationArea = All;
                    }
                    field("Increment Amount";Rec."Increment Amount") //ss16oct
                    {
                        ApplicationArea = All;
                    }
                    field(Name;rec.Name)
                    {
                        ApplicationArea = All;
                    }
                    field("Type of increment";Rec."Type of increment") //ss16oct
                    {
                        ApplicationArea = All;
                    }
                    field("Status";rec."Status")
                    {
                        ApplicationArea = All;
                    }
                    field("Date of application upload";rec."Date of application upload")
                    {
                        ApplicationArea = All;
                    }
                    field("IsConfirmed";rec."IsConfirmed")
                    {
                        ApplicationArea = All;
                    } //ss16oct
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
            action(SaveAndConfirm) // unified action //ss16oct
            {
                Caption = 'Save & Confirm Increment'; //ss16oct
                Image = Confirm;
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;

                trigger OnAction()var hist: Record "Financial Upg App history";
                entrno: Integer;
                InStreamVar: InStream; //ss16oct
                OutStreamVar: OutStream; //ss16oct
                begin
                    // Ensure mandatory fields exist //ss16oct
                    Rec.TestField("HRMS ID");
                    Rec.TestField("Increment Amount"); //ss16oct
                    //  rec.TestField("Type of increment");//ss16oct
                    // Save (if not yet inserted) //ss16oct
                    if Rec."Entry No." = 0 then begin
                        // Rec.Validate("Date of application upload", WorkDate());
                        rec."Date of application upload":=WorkDate(); //ss16oct
                        Rec.Validate("Status", Rec.Status::Applied);
                        Rec."IsConfirmed":=false;
                        Rec.Insert(true);
                    end
                    else
                        Rec.Modify(true);
                    // Confirm and archive //ss16oct
                    if Rec."Status" <> Rec.Status::Processed then begin
                        /* ss16oct  Rec.Validate("Status", Rec.Status::Processed);

                           Rec.Validate("IsConfirmed", true);

                           Rec.Modify(true);*/
                        // Archive snapshot into history //ss16oct
                        hist.Reset();
                        if hist.FindLast()then entrno:=hist.Sl_no + 1
                        else
                            entrno:=1;
                        hist.Init();
                        //hist.TransferFields(Rec, false); // false = copy only matching fields safely
                        // ✅ Manual assignments to ensure accuracy //ss16oct
                        hist."IsConfirmed":=Rec."IsConfirmed";
                        hist."User Id":=UserId();
                        hist."Modified Date Time":=CurrentDateTime();
                        //hist."college code" := 'DEFAULT'; // optional placeholder
                        // hist."no of versions" := GetNextVersion(Rec."HRMS ID");
                        hist.Sl_no:=entrno;
                        hist."HRMS ID":=Rec."HRMS ID";
                        hist."Increment Amount":=Rec."Increment Amount";
                        hist.Status:=Rec.Status::Processed; //ss16oct
                        hist."Current Station":=Rec."Current Station";
                        hist."Application file":=Rec."Application file";
                        hist."Application file name":=Rec."Application file name";
                        hist."Date of application upload":=WorkDate(); //ss16oct
                        hist."Effective Date Of MACP":=rec."Effective Date Of MACP";
                        //ss16oct start
                        hist."Type of increment":=Rec."Type of increment";
                        // ✅ Copy BLOB (Application file) to history table
                        Rec.CalcFields("Application file");
                        if Rec."Application file".HasValue then begin
                            Rec."Application file".CreateInStream(InStreamVar);
                            hist."Application file".CreateOutStream(OutStreamVar);
                            CopyStream(OutStreamVar, InStreamVar);
                        end;
                        //ss16oct end
                        hist."no of versions":=Rec.GetNextVersion(Rec."HRMS ID");
                        hist.Insert(true);
                        Message('Increment for HRMS ID %1 saved, confirmed, and archived (Entry No. %2).', Rec."HRMS ID", Rec."Entry No.");
                    end
                    else
                        Message('This increment (Entry No. %1) is already confirmed.', Rec."Entry No.");
                    CurrPage.Update(false); // Refresh history subpage //ss16oct
                end;
            }
            action(CreateNewVersion)
            {
                Caption = 'Create New Version';
                Image = New;
                ApplicationArea = All;
                Promoted = false;

                trigger OnAction()var NewRec: Record "Financial Upg Application";
                begin
                    if not Rec."IsConfirmed" then begin
                        Message('Record not yet confirmed — you can edit it directly.');
                        exit;
                    end;
                    // Clone current record into a new interim version //ss16oct
                    NewRec:=Rec;
                    NewRec."Entry No.":=0;
                    NewRec."Status":=NewRec.Status::Applied;
                    NewRec."IsConfirmed":=false;
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

                trigger OnAction()var TempBlob: InStream;
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

                trigger OnAction()var InStreamVar: InStream;
                FileName: Text;
                begin
                    Rec.CalcFields("Application file");
                    if Rec."Application file".HasValue then begin
                        Rec."Application file".CreateInStream(InStreamVar);
                        FileName:=Rec."Application file name";
                        DownloadFromStream(InStreamVar, '', '', '', FileName);
                    end
                    else
                        Message('No file available to download for HRMS ID %1.', Rec."HRMS ID");
                end;
            }
        }
    }
    trigger OnAfterGetRecord()begin
    //CurrPage.HistoryList.PAGE.Update(false); // auto-refresh history //ss16oct
    end;
    //ss16oct start
    local procedure GetNextSlNo(): Integer var hist2: Record "Financial Upg App history";
    begin
        hist2.Reset();
        if hist2.FindLast()then exit(hist2.Sl_no + 1)
        else
            exit(1);
    end;
    local procedure GetNextVersion1(HRmsid: Code[20]): Integer //ss16oct
 var EmpArchive: Record "Financial Upg App history";
    begin
        EmpArchive.Reset();
        EmpArchive.SetRange("HRMS ID", HRmsid); // ✅ limit to that employee only
        if EmpArchive.FindLast()then exit(EmpArchive."no of versions" + 1)
        else
            exit(1);
    end;
//ss16oct end
}
