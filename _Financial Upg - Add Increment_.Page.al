page 33065971 "Financial Upg - Add Increment" //ss16oct

{

    PageType = Card;

    SourceTable = "Financial Upg Application";

    Caption = 'Add Increment';
    UsageCategory = Documents;

    // ApplicationArea = All;

    layout

    {

        area(content)

        {

            group(General)

            {

                field("HRMS ID"; rec."HRMS ID") { ApplicationArea = All; }

                field(Name; rec.Name) { ApplicationArea = All; Editable = false; }

                field(Designation; rec.Designation) { ApplicationArea = All; Editable = false; }
                field("Type of increment"; Rec."Type of increment") { ApplicationArea = All; }

                field("Current Station"; rec."Current Station") { ApplicationArea = All; }
                field("Increment Amount"; Rec."Increment Amount") { ApplicationArea = All; }

                field("Type"; rec."Type") { Visible = false; ApplicationArea = All; }

                field("Effective Date Of MACP"; rec."Effective Date Of MACP")
                {
                    Caption = 'Effective Date of Increment';
                    ApplicationArea = All;
                }

                field("Application file name"; rec."Application file name") { ApplicationArea = All; }

                field("Application file"; rec."Application file") { ApplicationArea = All; }

                field("Date of application upload"; rec."Date of application upload") { ApplicationArea = All; Editable = false; }

                field("Status"; rec."Status") { ApplicationArea = All; Editable = false; }

                field("IsConfirmed"; rec."IsConfirmed") { ApplicationArea = All; Editable = false; } //ss16oct

            }

        }

    }

    actions

    {

        area(processing)

        {

            action(SaveNew)

            {

                Caption = 'Save (Interim)'; // saves as Applied //ss16oct

                Image = Save;

                ApplicationArea = All;

                trigger OnAction()
                begin
                    Rec.TestField("Application file"); //ss16oct - ensure document uploaded before saving

                    // Rec.Validate("Date of application upload", CreateDateTime(); //ss16oct - convert Date to DateTime
                    rec."Date of application upload" := WorkDate(); //ss16oct

                    Rec.Validate("Status", Rec.Status::Applied); //ss16oct

                    Rec."IsConfirmed" := false; //ss16oct

                    if Rec."Entry No." = 0 then begin

                        Rec.Insert(true);

                        Message('Saved interim increment (Entry No. %1).', Rec."Entry No.");

                    end else begin

                        Rec.Modify(true);

                        Message('Updated interim increment (Entry No. %1).', Rec."Entry No.");

                    end;

                end;

            }

            action(Cancel)

            {

                Caption = 'Cancel';

                ApplicationArea = All;

                Image = Close;

                trigger OnAction()

                begin

                    CurrPage.Close();

                end;

            }
            action(UploadDocument) //SS07OCT
            {
                ApplicationArea = All;
                Image = Attach;
                Caption = 'Upload Document';
                ToolTip = 'Upload a PDF document (max 3MB).';

                trigger OnAction()
                var
                    InStr: InStream;
                    OutStr: OutStream;
                begin
                    // Clear previous document
                    if Rec."Application file".HasValue() then Clear(Rec."Application file");
                    Clear(FileName);
                    Clear(TempBlob);
                    // Upload PDF file
                    if UploadIntoStream('Upload File', '', 'PDF Files (*.pdf)|*.pdf', FileName, InStr) then begin
                        TempBlob.CreateOutStream(OutStr);
                        CopyStream(OutStr, InStr);
                        if TempBlob.Length() > 3000000 then Error('File size must be less than or equal to 3MB.');
                        Rec."Application file".CreateOutStream(OutStr);
                        TempBlob.CreateInStream(InStr);
                        CopyStream(OutStr, InStr);
                        Rec."Application file Name" := FileName;
                        rec."Date of application upload" := WorkDate(); //ss16oct
                        Rec.Modify();
                        Message('Document %1 uploaded successfully.', FileName);
                    end;
                    // No message if user cancels (Back)
                end;
            }
            action(DownloadDocument) //SS07OCT
            {
                ApplicationArea = All;
                Image = Download;
                Caption = 'Download Document';
                ToolTip = 'Download the uploaded document.';

                trigger OnAction()
                var
                    FileMngCU: Codeunit "File Management";
                    InStr: InStream;
                begin
                    if Rec."Application file".HasValue() then begin
                        Rec."Application file".CreateInStream(InStr);
                        FileMngCU.BLOBExport(TempBlob, 'Application_' + Rec."HRMS ID" + '.pdf', true);
                    end
                    else
                        Error('No document found to download.');
                end;
            }


        }

    }

    trigger OnOpenPage()

    begin

        // When creating a new increment ensure Entry No. cleared to allow auto-increment insert //ss16oct

        if Rec."Entry No." <> 0 then begin

            // leave as-is when editing an existing record

        end else begin

            Rec.Init();

        end;

    end;

    var
        Tempblob: Codeunit "Temp Blob";
        fileName: Text;



}

