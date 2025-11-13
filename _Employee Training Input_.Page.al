page 33065736 "Employee Training Input"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    //SS07OCT start
    SourceTable = "Employee Training";

    //SourceTableTemporary = true; // Use temporary record to avoid premature insertion
    layout
    {
        area(Content)
        {
            group(General)
            {
                field(HRMSID; Rec."HRMS ID")
                {
                    ApplicationArea = All;
                    Caption = 'HRMS ID';
                    TableRelation = Employee."No." where("SLCM Employee" = const(false));

                    trigger OnValidate()
                    var
                        Employee: Record Employee;
                        ExistingRec: Record "Employee Training";
                        UpdateConfirmQst: Label 'A record for HRMS ID %1 already exists. Do you want to update it?', Comment = '%1 = HRMS ID';
                    begin
                        // Populate Name and Designation from Employee table
                        Employee.Reset();
                        Employee.SetRange("No.", Rec."HRMS ID");
                        if Employee.FindFirst() then begin
                            Rec.Name := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                            Rec.Designation := Employee.Designation;
                        end;
                        // Check for existing record in permanent table
                        ExistingRec.SetRange("HRMS ID", Rec."HRMS ID");
                        if ExistingRec.FindFirst() then begin
                            if Confirm(UpdateConfirmQst, false, Rec."HRMS ID") then begin
                                // Load existing values into temporary record for update
                                Rec.TransferFields(ExistingRec);
                                Rec.Modify();
                                IsUpdateMode := true; // Flag to indicate update mode
                            end
                            else begin
                                // Clear temporary record to prevent proceeding
                                Rec.Init();
                                Error('Operation canceled. Please select a different HRMS ID or update the existing record.');
                            end;
                        end
                        else begin
                            IsUpdateMode := false; // New record mode
                        end;
                    end;
                }
                field("Employee Name"; Rec.Name)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Designation; Rec.Designation)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Type Of Training"; Rec."Type Of Training")
                {
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin
                        if Rec."Type Of Training" = Rec."Type Of Training"::Other then
                            SpefyEnable := true
                        else begin
                            SpefyEnable := false;
                            Rec."Spcified Type of training" := '';
                        end;
                    end;
                }
                field("Specify Training"; Rec."Spcified Type of training")
                {
                    Editable = SpefyEnable;
                    ApplicationArea = All;
                    Caption = 'Specify Type of Training';
                }
                field("Course Name"; Rec."Course Name")
                {
                    ApplicationArea = All;
                    Caption = 'Training Course Title';
                }
                field("Training Starting Date"; Rec."Start Date")
                {
                    ApplicationArea = All;
                }
                field("Training Ending Date"; Rec.EndDate)
                {
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin
                        if (Rec."Start Date" <> 0D) and (Rec.EndDate <> 0D) then
                            Rec."Duration Of Training" := (Rec.EndDate - Rec."Start Date") + 1
                        else
                            Rec."Duration Of Training" := 0;
                    end;
                }
                field("Duration Of Training"; Rec."Duration Of Training")
                {
                    ApplicationArea = All;
                    Caption = 'Duration Of Training (Days)';
                    Editable = false;
                }
                field("Conducted By"; Rec."Conducted By")
                {
                    ApplicationArea = All;
                }
                field("Training Location"; Rec."Training Location")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    //SS07OCT end
    /* layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(HRMSID; HRMSID)
                {
                    ApplicationArea = All;
                    Caption = 'HRMS ID';
                    TableRelation = Employee."No." where("SLCM Employee" = const(false));

                    trigger onValidate()
                    var
                        Employee: Record 5200;
                    begin
                        Employee.Reset();
                        Employee.SetRange("No.", HRMSID);
                        If Employee.FindFirst() then begin
                            Name := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                            Designation := Employee.Designation;
                        end;
                    end;
                }
                field("Employee Name"; Name)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Designation; Designation)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Type Of Training"; TypeOfTraining)
                {
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin
                        if TypeOfTraining = TypeOfTraining::Other then
                            SpefyEnable := true
                        else
                            SpefyEnable := false;
                    end;
                }
                field("Specify Training"; SpecifiedTypeTrain)
                {
                    Editable = SpefyEnable;
                    ApplicationArea = All;
                    Caption = 'Specify type of Training';
                }
                field("Course Name"; CourseName)
                {
                    ApplicationArea = All;
                    Caption = 'Traning Course Title';
                }
                field("Training Starting Date"; StartDate)
                {
                    ApplicationArea = All;
                }
                field("Training Ending Date"; EndDate)
                {
                    ApplicationArea = All;

                    trigger Onvalidate()
                    var
                    begin
                        DurationOfTraining := (EndDate - StartDate) + 1;
                    end;
                }
                field("Duration Of Training"; DurationOfTraining)
                {
                    ApplicationArea = All;
                    Caption = 'Duration Of Training(Days)';
                }
                field("Conducted By"; ConductedBy)
                {
                    ApplicationArea = All;
                }
                field("Training Location"; TrainingLocation)
                {
                    ApplicationArea = All;
                }
            }
        }
    } */
    /* actions
    {
        area(Processing)
        {
            /* action("Upload Document")
            {
                ApplicationArea = All;
                Image = Add;

                trigger OnAction()var filePath: Text;
                txt: Text;
                flname: Text;
                begin
                    fileName:=Filemgmt.BLOBImportWithFilter(Tempblob, 'Upload File', '', 'All Files (*.*)|*.pdf*', '.pdf');
                    Instream1:=Tempblob.CreateInStream();
                    if Tempblob.Length() > 3000000 then Error('File size must be less than or equal to 3MB')
                    else
                        Message('File uploded');
                end;
            }
            action("Download Document")
            {
                ApplicationArea = All;
                Image = Download;

                trigger OnAction()var FilemngCU: Codeunit "File Management";
                begin
                    if Tempblob.Length() > 0 then fileName:=FilemngCU.BLOBExport(Tempblob, 'Application_' + HRMSID + '.pdf', true)
                    else
                        Error('Document Not found');
                end;
            }
            action("Submit")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction()begin
                    EmployeeTrainingHist.Init();
                    EmployeeTrainingHist."HRMS ID":=HRMSID;
                    EmployeeTrainingHist.Name:=Name;
                    EmployeeTrainingHist.Designation:=Designation;
                    EmployeeTrainingHist."Type Of Training":=TypeOfTraining;
                    EmployeeTrainingHist."Course Name":=CourseName;
                    EmployeeTrainingHist."Start Date":=StartDate;
                    EmployeeTrainingHist.EndDate:=EndDate;
                    EmployeeTrainingHist."Duration Of Training":=(EndDate - StartDate) + 1;
                    EmployeeTrainingHist."Conducted By":=ConductedBy;
                    EmployeeTrainingHist."Training Location":=TrainingLocation;
                    EmployeeTrainingHist."Certificate FileName":=fileName;
                    if fileName <> '' then begin
                        EmployeeTrainingHist.Certificate.CreateOutStream(Outstream1);
                        CopyStream(Outstream1, Instream1);
                    end;
                    EmployeeTrainingHist.Insert(true);
                    Message('Training Assigned Successfully to employee %1', HRMSID);
                    CurrPage.Close();
                end;
            } */



    actions
    {
        area(Processing)
        {
            /*   action(ArchiveEmployee)
              {
                  ApplicationArea = All;
                  Caption = 'Archive Employee';
                  Image = Archive;
                  trigger OnAction()
                  var
                      ArchiveMgt: Codeunit "Employee Archive Mgt.";
                  begin
                      ArchiveMgt.ArchiveEmployeeHistory(rec);
                      Message('Employee %1 archived successfully.', Rec."HRMS ID");
                  end;
              } */
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
                    if Rec.Certificate.HasValue() then Clear(Rec.Certificate);
                    Clear(FileName);
                    Clear(TempBlob);
                    // Upload PDF file
                    if UploadIntoStream('Upload File', '', 'PDF Files (*.pdf)|*.pdf', FileName, InStr) then begin
                        TempBlob.CreateOutStream(OutStr);
                        CopyStream(OutStr, InStr);
                        if TempBlob.Length() > 3000000 then Error('File size must be less than or equal to 3MB.');
                        Rec.Certificate.CreateOutStream(OutStr);
                        TempBlob.CreateInStream(InStr);
                        CopyStream(OutStr, InStr);
                        Rec."Certificate FileName" := FileName;
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
                    if Rec.Certificate.HasValue() then begin
                        Rec.Certificate.CreateInStream(InStr);
                        FileMngCU.BLOBExport(TempBlob, 'Application_' + Rec."HRMS ID" + '.pdf', true);
                    end
                    else
                        Error('No document found to download.');
                end;
            }
            action(UpdateTraining) //SS07OCT
            {
                Caption = 'Update Training';
                ApplicationArea = All;
                Image = EditLines;

                trigger OnAction()
                var
                    ArchiveRec: Record "Employee Training History";
                    InStr: InStream;
                    OutStr: OutStream;
                    LastVersion: Integer;
                    MissingFieldErr: Label 'Please fill in all required fields: %1.';
                    CurrentRec: Record "Employee Training";
                    PermanentRec: Record "Employee Training";
                    MissingFields: Text;
                begin
                    // Find last archive version for this employee
                    MissingFields := '';
                    if Rec."HRMS ID" = '' then MissingFields += 'HRMS ID, ';
                    if Rec."Course Name" = '' then MissingFields += 'Course Name, ';
                    if Rec."Start Date" = 0D then MissingFields += 'Start Date, ';
                    if Rec.EndDate = 0D then MissingFields += 'End Date, ';
                    if MissingFields <> '' then Error(MissingFieldErr, CopyStr(MissingFields, 1, StrLen(MissingFields) - 2));
                    ArchiveRec.Reset();
                    ArchiveRec.SetRange("HRMS ID", Rec."HRMS ID");
                    if ArchiveRec.FindLast() then
                        LastVersion := ArchiveRec.slno
                    else
                        LastVersion := 0;
                    // Archive old record
                    Clear(ArchiveRec);
                    ArchiveRec.Init();
                    ArchiveRec.Init();
                    // Copy fields one by one from Employee Training → Archive Employee Training
                    //  ArchiveRec."Entry No" := Rec."Entry No";
                    ArchiveRec."HRMS ID" := Rec."HRMS ID";
                    ArchiveRec.Name := Rec.Name;
                    ArchiveRec.Designation := Rec.Designation;
                    ArchiveRec."Type Of Training" := Rec."Type Of Training";
                    ArchiveRec."Spcified Type of training" := Rec."Spcified Type of training";
                    ArchiveRec."Course Name" := Rec."Course Name";
                    ArchiveRec."Start Date" := Rec."Start Date";
                    ArchiveRec.EndDate := Rec.EndDate;
                    ArchiveRec."Duration Of Training" := Rec."Duration Of Training";
                    ArchiveRec."Conducted By" := Rec."Conducted By";
                    ArchiveRec."Training Location" := Rec."Training Location";
                    ArchiveRec.Certificate := Rec.Certificate; // if BLOB field exists in archive
                    ArchiveRec."Certificate FileName" := Rec."Certificate FileName";
                    // Now assign archive-specific fields
                    ArchiveRec.slno := LastVersion + 1;
                    // Copy document BLOB into archive record
                    /*  if Rec.Certificate.HasValue() then begin

                          Rec.Certificate.CreateInStream(InStr);

                          ArchiveRec.Certificate.CreateOutStream(OutStr);

                          CopyStream(OutStr, InStr);

                      end;*/
                    // transfer blob properly
                    Rec.CalcFields("Certificate");
                    if Rec.Certificate.HasValue then begin
                        Rec.Certificate.CreateInStream(InStr);
                        ArchiveRec.Certificate.CreateOutStream(OutStr);
                        CopyStream(OutStr, InStr);
                    end;
                    //ArchiveRec."Entry No" := 0; // Auto-increment if set
                    ArchiveRec."Modified By" := UserId;
                    ArchiveRec."Modified Date Time" := CurrentDateTime;
                    ArchiveRec.slno := LastVersion + 1;
                    ArchiveRec."Modified By" := UserId;
                    ArchiveRec."Modified Date Time" := CurrentDateTime;
                    ArchiveRec.Insert(true);
                    // Update latest record with modified info
                    CurrentRec.Get(Rec."Entry No");
                    CurrentRec."Modified By" := UserId;
                    CurrentRec."Modified Date Time" := CurrentDateTime;
                    CurrentRec.Modify(true);
                    Message('Training record updated. ');
                end;
            }
            action(Test)
            {
                ApplicationArea = all;
                trigger OnAction()
                var
                    EmpSummary: Codeunit "Employee Diary Summary Mgt";
                begin
                    EmpSummary.LoadFinancialUpgHistData('43000069');
                end;
            }
            /*    action(ViewTrainingHistory)
                   {
                       Caption = 'View Training History';
                       ApplicationArea = All;
                       Image = History;
                       RunObject = page "Training History List";
                       RunPageLink = "HRMS ID" = field("HRMS ID");
                   } */
            /*      action(Submit) //1.4 b
                     {
                         ApplicationArea = All;
                         Promoted = true;
                         PromotedIsBig = true;
                         Caption = 'Submit';
                         Image = Save;
                         ToolTip = 'Submit a new training record.';

                         trigger OnAction()
                         var
                             PermanentRec: Record "Employee Training";
                             MissingFieldErr: Label 'Please fill in all required fields: %1.';
                             NoDocumentErr: Label 'A document must be uploaded to submit the record.';
                             DuplicateErr: Label 'A record for HRMS ID %1 already exists. Use Update to modify it.', Comment = '%1 = HRMS ID';
                             MissingFields: Text;
                         begin
                             // Check for existing record
                               PermanentRec.SetRange("HRMS ID", Rec."HRMS ID");
                             //  if PermanentRec.FindFirst() then Error(DuplicateErr, Rec."HRMS ID");
                             // Validate required fields
                             MissingFields := '';
                             if Rec."HRMS ID" = '' then MissingFields += 'HRMS ID, ';
                             if Rec."Course Name" = '' then MissingFields += 'Course Name, ';
                             if Rec."Start Date" = 0D then MissingFields += 'Start Date, ';
                             if Rec.EndDate = 0D then MissingFields += 'End Date, ';
                             if MissingFields <> '' then Error(MissingFieldErr, MissingFields);
                             // Validate document upload
                             if not Rec.Certificate.HasValue() then Error(NoDocumentErr);
                             // Insert into permanent table
                             PermanentRec.Init();
                             PermanentRec.TransferFields(Rec);
                             PermanentRec."Modified By" := UserId;
                             PermanentRec."Modified Date Time" := CurrentDateTime;
                             PermanentRec.Insert(true);
                             Rec.Delete();
                             Commit();
                             Message('Training record submitted for HRMS ID: %1', Rec."HRMS ID");
                             CurrPage.Close();
                         end;
                     }
              */
        }
    }
    var
        HRMSID: Code[20];
        Name: Text[90];
        Designation: Text[30];
        TypeOfTraining: Enum "Type Of Training";
        CourseName: Text[30];
        StartDate: Date;
        EndDate: Date;
        DurationOfTraining: Integer;
        ConductedBy: Text[30];
        TrainingLocation: Text[30];
        EmployeeTrainingHist: Record "Employee Training History";
        SpecifiedTypeTrain: Text[50];
        SpefyEnable: Boolean;
        fileName: Text;
        Filemgmt: Codeunit "File Management";
        Tempblob: Codeunit "Temp Blob";
        Instream1: InStream;
        Outstream1: OutStream;

        IsUpdateMode: Boolean;//SS07OCT

}
