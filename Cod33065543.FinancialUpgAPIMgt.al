codeunit 33065543 "Financial Upg API Mgt"

{

    Subtype = Normal;

    // Caption = 'Financial Upg API Management';

    [ServiceEnabled]


    procedure ConfirmIncrement(HRMSID: Code[20]): Text //ssnov18

    var

        RecApp: Record "Financial Upg Application";

        Hist: Record "Financial Upg App history";

        EmpRec: Record Employee;

        InS: InStream;

        OutS: OutStream;

        CompanyRec: Record Company;

        NewSlNo: Integer;
        NewVersionNo: Integer;//ssnov20

    begin


        if CompanyRec.FindSet() then
            repeat

                RecApp.ChangeCompany(CompanyRec.Name);

                RecApp.Reset();

                RecApp.SetRange("HRMS ID", HRMSID);

                RecApp.SetRange("IsConfirmed", false);

                if RecApp.FindFirst() then begin


                    RecApp.Validate(Status, RecApp.Status::Processed);

                    RecApp."IsConfirmed" := true;

                    RecApp."Date of application upload" := Today();

                    RecApp.Modify(true);


                    EmpRec.ChangeCompany(CompanyRec.Name);

                    EmpRec.SetRange("No.", HRMSID);

                    if EmpRec.FindFirst() then begin

                        EmpRec.Validate("Basic Gr. Pay",

                            EmpRec."Basic Gr. Pay" + RecApp."Increment Amount");

                        EmpRec.Modify(true);

                    end;


                    Hist.ChangeCompany(CompanyRec.Name);

                    Hist.Reset();

                    if Hist.FindLast() then
                        NewSlNo := Hist.Sl_no + 1
                    else
                        NewSlNo := 1;

                    Hist.Reset();//ssnov20
                    Hist.SetRange("HRMS ID", RecApp."HRMS ID");
                    if Hist.FindLast() then
                        NewVersionNo := Hist."no of versions" + 1
                    else
                        NewVersionNo := 1;

                    Hist.Init();

                    Hist.Sl_no := NewSlNo;
                    Hist."no of versions" := NewVersionNo;//ssnov20

                    Hist."HRMS ID" := RecApp."HRMS ID";

                    Hist.Name := RecApp.Name;

                    Hist."Increment Amount" := RecApp."Increment Amount";

                    Hist.Status := Hist.Status::Processed;

                    Hist."Current Station" := RecApp."Current Station";

                    Hist."Effective Date Of MACP" := RecApp."Effective Date Of MACP";

                    Hist."Type of increment" := GetIncrementTypeText(RecApp);

                    Hist."Application file name" := RecApp."Application file name";

                    Hist."Date of application upload" := Today();

                    RecApp.CalcFields("Application file");

                    if RecApp."Application file".HasValue then begin

                        RecApp."Application file".CreateInStream(InS);

                        Hist."Application file".CreateOutStream(OutS);

                        CopyStream(OutS, InS);

                    end;

                    Hist.Insert(true);

                    exit(StrSubstNo('Increment confirmed successfully in company %1.', CompanyRec.Name));

                end;

            until CompanyRec.Next() = 0;

        Error('No pending increment found for HRMS ID %1 in ANY company.', HRMSID);

    end;




    /* [ServiceEnabled]

    procedure SaveAndConfirmIncrement(

    HRMSID: Code[20];

    IncrementAmount: Decimal;

    IncrementType: Option "Annual increment","Promotional increment";

    EffectiveDate: Date;

    CurrentStation: Text[50];

    ApplicationFileName: Text[100];

    ApplicationFileContent: Text;

    Name: Text[100];

    status: Option Applied,Objected,Processed,Rejected

): Text

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

        RecApp.Name := Name;

        RecApp."HRMS ID" := HRMSID;

        RecApp."Increment Amount" := IncrementAmount;

        RecApp."Type of increment" := IncrementType;

        RecApp."Effective Date Of MACP" := EffectiveDate;

        RecApp."Current Station" := CurrentStation;

        RecApp."Application file name" := ApplicationFileName;

        RecApp."Date of application upload" := DT2Date(CurrentDateTime);


        RecApp.Validate("Status", status);

        RecApp."IsConfirmed" := (status = status::Processed);

        RecApp.Insert(true);


        if ApplicationFileContent <> '' then begin

            TempBlob.CreateOutStream(OutStr);

            OutStr.WriteText(ApplicationFileContent);

            TempBlob.CreateInStream(InStr);

            RecApp."Application file".CreateOutStream(OutStr);

            CopyStream(OutStr, InStr);

            RecApp.Modify(true);

        end;

        // Archive creation

        Hist.Reset();

        if Hist.FindLast() then
            EntryNo := Hist.Sl_no + 1

        else
            EntryNo := 1;

        VersionNo := GetNextVersion(HRMSID);

        Hist.Init();

        Hist.Sl_no := EntryNo;

        Hist."HRMS ID" := HRMSID;

        Hist.Name := Name;

        Hist."Increment Amount" := IncrementAmount;

        Hist.Status := status; // ✅ mirror same status to history

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

        exit(StrSubstNo(

            'Increment %3 for HRMS ID %1 saved successfully (Version %2).',

            HRMSID, VersionNo,

            Format(status)

        ));

    end;


 */// LASTEST VERSION OF THE PROCEDURE TO SAVE AND CONFIRM INCREMENT

    /*procedure SaveAndConfirmIncrement(HRMSID: Code[20]; IncrementAmount: Decimal; IncrementType: Option "Annual increment","Promotional increment";
EffectiveDate: Date; CurrentStation: Text[50]; ApplicationFileName: Text[100]; ApplicationFileContent: Text; Name: text[100]; status: Option Applied,Objected,Processed,Rejected): Text

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
        RecApp.Name := Name;
        RecApp."HRMS ID" := HRMSID;

        RecApp."Increment Amount" := IncrementAmount;

        RecApp."Type of increment" := IncrementType;

        RecApp."Effective Date Of MACP" := EffectiveDate;

        RecApp."Current Station" := CurrentStation;

        RecApp."Application file name" := ApplicationFileName;

        RecApp."Date of application upload" := DT2Date(CurrentDateTime);

        RecApp.Validate("Status", status::Processed);

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
        Hist.Name := Name;

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

    end;*/

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

    local procedure GetIncrementTypeText(RecApp: Record "Financial Upg Application"): Text
    begin
        case RecApp."Type of increment" of
            RecApp."Type of increment"::"Annual increment":
                exit('Annual increment');

            RecApp."Type of increment"::"Promotional increment":
                exit('Promotional increment');
            else
                exit('Unknown');
        end;
    end;

}

