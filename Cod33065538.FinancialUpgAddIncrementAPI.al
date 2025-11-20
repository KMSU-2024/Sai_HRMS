codeunit 33065488 "FinancialUpg Add Increment API"

{

    Subtype = Normal;


    /* [ServiceEnabled]

    procedure SaveIncrement(HRMSID: Code[20]; EmployeeName: Text[100]; Designation: Text[100];
                            IncrementAmount: Decimal; IncrementType: Option "Annual increment","Promotional increment";
                            CurrentStation: Text[100]; EffectiveDate: Date;
                            ApplicationFileName: Text[100]; ApplicationFileContent: Text): Text

     var

         RecApp: Record "Financial Upg Application";

         TempBlob: Codeunit "Temp Blob";

         InStr: InStream;

         OutStr: OutStream;

     begin


         if HRMSID = '' then
             Error('HRMS ID is required.');

         if IncrementAmount = 0 then
             Error('Increment Amount must be greater than zero.');


         if not RecApp.Get(HRMSID) then begin

             RecApp.Init();

             RecApp."HRMS ID" := HRMSID;

             RecApp.Insert(true);

         end;


         RecApp.Validate("Increment Amount", IncrementAmount);

         RecApp.Validate("Type of increment", IncrementType);

         RecApp.Validate("Current Station", CurrentStation);

         RecApp.Validate("Effective Date Of MACP", EffectiveDate);

         RecApp."Application file name" := ApplicationFileName;

         RecApp."Date of application upload" := DT2Date(CurrentDateTime);

         RecApp.Validate("Status", RecApp.Status::Applied);

         RecApp."IsConfirmed" := false;


         if ApplicationFileContent <> '' then begin

             TempBlob.CreateOutStream(OutStr);

             OutStr.WriteText(ApplicationFileContent);

             TempBlob.CreateInStream(InStr);

             RecApp."Application file".CreateOutStream(OutStr);

             CopyStream(OutStr, InStr);

         end;


         if RecApp."Entry No." = 0 then
             RecApp.Insert(true)

         else
             RecApp.Modify(true);

         exit(StrSubstNo('Increment saved successfully for HRMS ID %1 (Entry No. %2).', HRMSID, RecApp."Entry No."));

     end;



     [ServiceEnabled]

     procedure CancelIncrement(HRMSID: Code[20]): Text

     var

         RecApp: Record "Financial Upg Application";

     begin

         if not RecApp.Get(HRMSID) then
             Error('No increment found for HRMS ID %1.', HRMSID);

         RecApp.Validate("Status", RecApp.Status::Rejected);

         RecApp."IsConfirmed" := false;

         RecApp.Modify(true);

         exit(StrSubstNo('Increment cancelled successfully for HRMS ID %1.', HRMSID));

     end;



     [ServiceEnabled]

     procedure UploadDocument(HRMSID: Code[20]; FileName: Text[100]; FileContent: Text): Text

     var

         RecApp: Record "Financial Upg Application";

         TempBlob: Codeunit "Temp Blob";

         InStr: InStream;

         OutStr: OutStream;

     begin

         if not RecApp.Get(HRMSID) then
             Error('No increment found for HRMS ID %1.', HRMSID);

         if FileContent = '' then
             Error('No file content received.');

         TempBlob.CreateOutStream(OutStr);

         OutStr.WriteText(FileContent);

         TempBlob.CreateInStream(InStr);

         RecApp."Application file".CreateOutStream(OutStr);

         CopyStream(OutStr, InStr);

         RecApp."Application file name" := FileName;

         RecApp."Date of application upload" := DT2Date(CurrentDateTime);

         RecApp.Modify(true);

         exit(StrSubstNo('Document "%1" uploaded successfully for HRMS ID %2.', FileName, HRMSID));

     end;



     [ServiceEnabled]

     procedure DownloadDocument(HRMSID: Code[20]): Text

     var

         RecApp: Record "Financial Upg Application";

         TempBlob: Codeunit "Temp Blob";

         InStr: InStream;

         OutStr: OutStream;

         Content: Text;

     begin

         if not RecApp.Get(HRMSID) then
             Error('No increment found for HRMS ID %1.', HRMSID);

         RecApp.CalcFields("Application file");

         if not RecApp."Application file".HasValue then
             Error('No document available for HRMS ID %1.', HRMSID);

         RecApp."Application file".CreateInStream(InStr);

         TempBlob.CreateOutStream(OutStr);

         CopyStream(OutStr, InStr);

         TempBlob.CreateInStream(InStr);

         InStr.ReadText(Content);

         exit(Content);

     end;*/
    /* [ServiceEnabled]
     procedure SaveIncrement(HRMSID: Code[20]; EmployeeName: Text[100]; Designation: Text[100];
                             IncrementAmount: Decimal; IncrementType: Option "Annual increment","Promotional increment";
                             CurrentStation: Text[100]; EffectiveDate: Date;
                             ApplicationFileName: Text[100]; ApplicationFileContent: Text): Text
     var
         RecApp: Record "Financial Upg Application";
         TempBlob: Codeunit "Temp Blob";
         InStr: InStream;
         OutStr: OutStream;
     begin
         // 🔍 Validate required fields
         if HRMSID = '' then
             Error('HRMS ID is required.');
         if IncrementAmount = 0 then
             Error('Increment Amount must be greater than zero.');
         if EmployeeName = '' then
             Error('Employee Name is required.');
         if Designation = '' then
             Error('Designation is required.');

         // 🔄 Create new or update existing record
         RecApp.Reset();
         RecApp.SetRange("HRMS ID", HRMSID);
         if not RecApp.FindFirst() then begin
             RecApp.Init();
             RecApp."HRMS ID" := HRMSID;
             RecApp.Insert(true);
         end;

         // ✏️ Assign values
         RecApp.Validate(Name, EmployeeName);
         RecApp.Validate(Designation, Designation);
         RecApp.Validate("Increment Amount", IncrementAmount);
         RecApp.Validate("Type of increment", IncrementType);
         RecApp.Validate("Current Station", CurrentStation);
         RecApp.Validate("Effective Date Of MACP", EffectiveDate);
         RecApp."Application file name" := ApplicationFileName;
         RecApp."Date of application upload" := DT2Date(CurrentDateTime);
         RecApp.Validate("Status", RecApp.Status::Applied);
         RecApp."IsConfirmed" := false;

         // 📎 Save PDF (if provided as Base64)
         if ApplicationFileContent <> '' then begin
             TempBlob.CreateOutStream(OutStr);
             OutStr.WriteText(ApplicationFileContent);
             TempBlob.CreateInStream(InStr);
             RecApp."Application file".CreateOutStream(OutStr);
             CopyStream(OutStr, InStr);
         end;

         if RecApp."Entry No." = 0 then
             RecApp.Insert(true)
         else
             RecApp.Modify(true);

         exit(StrSubstNo(' Increment saved successfully for HRMS ID %1 (%2 - %3). Entry No: %4.',
                         HRMSID, EmployeeName, Designation, RecApp."Entry No."));
     end;*/
    procedure SaveIncrement(HRMSID: Code[20]; EmployeeName: Text[100]; Designation: Text[100];
                            IncrementAmount: Decimal; IncrementType: Option "Annual increment","Promotional increment";
                            CurrentStation: Text[100]; EffectiveDate: Date;
                            ApplicationFileName: Text[100]; ApplicationFileContent: Text): Text

    var
        RecApp: Record "Financial Upg Application";


        TempBlob: Codeunit "Temp Blob";

        InStr: InStream;

        OutStr: OutStream;

    begin


        if HRMSID = '' then
            Error('HRMS ID is required.');

        if IncrementAmount = 0 then
            Error('Increment Amount must be greater than zero.');


        if not RecApp.Get(HRMSID) then begin

            RecApp.Init();

            RecApp."HRMS ID" := HRMSID;

            RecApp.Insert(true);

        end;

        recApp.Validate(Name, EmployeeName);
        RecApp.Validate("Increment Amount", IncrementAmount);

        RecApp.Validate("Type of increment", IncrementType);

        RecApp.Validate("Current Station", CurrentStation);
        RecApp.Validate(Designation, Designation);
        RecApp.Validate("Effective Date Of MACP", EffectiveDate);

        RecApp."Application file name" := ApplicationFileName;

        RecApp."Date of application upload" := DT2Date(CurrentDateTime);

        RecApp.Validate("Status", RecApp.Status::Applied);

        RecApp."IsConfirmed" := false;


        if ApplicationFileContent <> '' then begin

            TempBlob.CreateOutStream(OutStr);

            OutStr.WriteText(ApplicationFileContent);

            TempBlob.CreateInStream(InStr);

            RecApp."Application file".CreateOutStream(OutStr);

            CopyStream(OutStr, InStr);

        end;


        if RecApp."Entry No." = 0 then
            RecApp.Insert(true)

        else
            RecApp.Modify(true);

        exit(StrSubstNo('Increment saved successfully for HRMS ID %1 (Entry No. %2).', HRMSID, RecApp."Entry No."));

    end;





    [ServiceEnabled]
    procedure CancelIncrement(HRMSID: Code[20]): Text
    var
        RecApp: Record "Financial Upg Application";
    begin
        if not RecApp.Get(HRMSID) then
            Error('No increment found for HRMS ID %1.', HRMSID);

        RecApp.Validate("Status", RecApp.Status::Rejected);
        RecApp."IsConfirmed" := false;
        RecApp.Modify(true);

        exit(StrSubstNo(' Increment cancelled successfully for HRMS ID %1.', HRMSID));
    end;


    [ServiceEnabled]
    procedure UploadDocument(HRMSID: Code[20]; FileName: Text[100]; FileContent: Text): Text
    var
        RecApp: Record "Financial Upg Application";
        TempBlob: Codeunit "Temp Blob";
        InStr: InStream;
        OutStr: OutStream;
    begin
        if not RecApp.Get(HRMSID) then
            Error('No increment found for HRMS ID %1.', HRMSID);

        if FileContent = '' then
            Error('No file content received.');

        TempBlob.CreateOutStream(OutStr);
        OutStr.WriteText(FileContent);
        TempBlob.CreateInStream(InStr);
        RecApp."Application file".CreateOutStream(OutStr);
        CopyStream(OutStr, InStr);

        RecApp."Application file name" := FileName;
        RecApp."Date of application upload" := DT2Date(CurrentDateTime);
        RecApp.Modify(true);

        exit(StrSubstNo('📎 Document "%1" uploaded successfully for HRMS ID %2.', FileName, HRMSID));
    end;


    [ServiceEnabled]
    procedure DownloadDocument(HRMSID: Code[20]): Text
    var
        RecApp: Record "Financial Upg Application";
        TempBlob: Codeunit "Temp Blob";
        InStr: InStream;
        OutStr: OutStream;
        Content: Text;
    begin
        if not RecApp.Get(HRMSID) then
            Error('No increment found for HRMS ID %1.', HRMSID);

        RecApp.CalcFields("Application file");
        if not RecApp."Application file".HasValue then
            Error('No document available for HRMS ID %1.', HRMSID);

        RecApp."Application file".CreateInStream(InStr);
        TempBlob.CreateOutStream(OutStr);
        CopyStream(OutStr, InStr);
        TempBlob.CreateInStream(InStr);
        InStr.ReadText(Content);

        exit(Content); // Base64 content
    end;

}

