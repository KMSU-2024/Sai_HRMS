codeunit 33065543 "Financial Upg API Mgt"

{

    Subtype = Normal;

    // Caption = 'Financial Upg API Management';

    [ServiceEnabled]

    procedure SaveAndConfirmIncrement(HRMSID: Code[20]; IncrementAmount: Decimal; IncrementType: Option "Annual increment","Promotional increment";
EffectiveDate: Date; CurrentStation: Text[50]; ApplicationFileName: Text[100]; ApplicationFileContent: Text): Text

    var

        RecApp: Record "Financial Upg Application";

        Hist: Record "Financial Upg App history";

        InStr: InStream;

        OutStr: OutStream;

        TempBlob: Codeunit "Temp Blob";

        EntryNo: Integer;

        VersionNo: Integer;

    begin


        if HRMSID = '' then
            Error('HRMS ID is required.');

        if IncrementAmount = 0 then
            Error('Increment Amount cannot be zero.');


        RecApp.Init();

        RecApp."HRMS ID" := HRMSID;

        RecApp."Increment Amount" := IncrementAmount;

        RecApp."Type of increment" := IncrementType;

        RecApp."Effective Date Of MACP" := EffectiveDate;

        RecApp."Current Station" := CurrentStation;

        RecApp."Application file name" := ApplicationFileName;

        RecApp."Date of application upload" := DT2Date(CurrentDateTime);

        RecApp.Validate("Status", RecApp.Status::Applied);

        RecApp."IsConfirmed" := false;

        RecApp.Insert(true);


        if ApplicationFileContent <> '' then begin

            TempBlob.CreateOutStream(OutStr);

            OutStr.WriteText(ApplicationFileContent);

            TempBlob.CreateInStream(InStr);

            RecApp."Application file".CreateOutStream(OutStr);

            CopyStream(OutStr, InStr);

            RecApp.Modify(true);

        end;


        Hist.Reset();

        if Hist.FindLast() then
            EntryNo := Hist.Sl_no + 1

        else
            EntryNo := 1;

        VersionNo := GetNextVersion(HRMSID);

        Hist.Init();

        Hist.Sl_no := EntryNo;

        Hist."HRMS ID" := HRMSID;

        Hist."Increment Amount" := IncrementAmount;

        Hist.Status := Hist.Status::Processed;

        Hist."Current Station" := CurrentStation;

        Hist."Application file name" := ApplicationFileName;

        Hist."Date of application upload" := DT2Date(CurrentDateTime);

        Hist."Effective Date Of MACP" := EffectiveDate;

        Hist."Type of increment" := IncrementType;

        Hist."no of versions" := VersionNo;

        Hist."User Id" := UserId();

        Hist."Modified Date Time" := CurrentDateTime;


        RecApp.CalcFields("Application file");

        if RecApp."Application file".HasValue then begin

            RecApp."Application file".CreateInStream(InStr);

            Hist."Application file".CreateOutStream(OutStr);

            CopyStream(OutStr, InStr);

        end;

        Hist.Insert(true);

        exit(StrSubstNo('Increment saved and confirmed successfully for HRMS ID %1 (Version %2).', HRMSID, VersionNo));

    end;

    [ServiceEnabled]

    procedure CancelIncrement(HRMSID: Code[20]): Text

    var

        RecApp: Record "Financial Upg Application";

    begin

        if not RecApp.Get(HRMSID) then
            Error('Increment record not found for HRMS ID %1.', HRMSID);

        RecApp.Validate("Status", RecApp.Status::Rejected);

        RecApp."IsConfirmed" := false;

        RecApp.Modify(true);

        exit(StrSubstNo('Increment cancelled successfully for HRMS ID %1.', HRMSID));

    end;

    local procedure GetNextVersion(HRMSID: Code[20]): Integer

    var

        EmpArchive: Record "Financial Upg App history";

    begin

        EmpArchive.Reset();

        EmpArchive.SetRange("HRMS ID", HRMSID);

        if EmpArchive.FindLast() then
            exit(EmpArchive."no of versions" + 1)

        else
            exit(1);

    end;

}

