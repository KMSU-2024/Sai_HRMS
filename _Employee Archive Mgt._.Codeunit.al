codeunit 33065490 "Employee Archive Mgt." //SS07OCT c
{
    /* procedure ArchiveEmployee(var EmployeeRec: Record Employee)
    var
        EmployeeArchive: Record "Employee History";
        LastVersion: Integer;
    begin
        if EmployeeArchive.FindLast() then
            LastVersion := EmployeeArchive."Version No."
        else
            LastVersion := 0;

        EmployeeArchive.Init();
        EmployeeArchive.Validate("Employee No.", EmployeeRec."No.");
        EmployeeArchive."Archived DateTime" := CurrentDateTime;
        EmployeeArchive."Archived By" := UserId;

        // Copy fields
        EmployeeArchive."Version No." := LastVersion + 1;
        EmployeeArchive."Bill Group" := EmployeeRec."Bill Group";
        EmployeeArchive."Bill Type" := EmployeeRec."Bill Type";
        EmployeeArchive."Account Type" := EmployeeRec."Account Type";
        EmployeeArchive."GPF/PRAN No" := EmployeeRec."GPF/PRAN No";
        EmployeeArchive."Designation" := EmployeeRec."Designation";
        EmployeeArchive."Post Group" := EmployeeRec."Post Group";
        EmployeeArchive."Category" := EmployeeRec."Category";
        EmployeeArchive."D.O.S" := EmployeeRec."D.O.S";
        EmployeeArchive."Home Dist" := EmployeeRec."Home Dist";
        EmployeeArchive."Basic Gr. Pay" := EmployeeRec."Basic Gr. Pay";
        EmployeeArchive."Pension Remark" := EmployeeRec."Pension Remark";
        EmployeeArchive."EPIC No" := EmployeeRec."EPIC No";
        EmployeeArchive."Aadhaar No" := EmployeeRec."Aadhaar No";
        EmployeeArchive."Dept./Trade/Section" := EmployeeRec."Dept./Trade/Section";
        EmployeeArchive."Joining Station" := EmployeeRec."Joining Station";
        EmployeeArchive."D.O.J (Service)" := EmployeeRec."D.O.J (Service)";
        EmployeeArchive."Current Station" := EmployeeRec."Current Station";
        EmployeeArchive."Service Joining Designation" := EmployeeRec."Service Joining Designation";
        EmployeeArchive."Base Qualification" := EmployeeRec."Base Qualification";
        EmployeeArchive."Employment Status" := EmployeeRec."Employment Status";
        EmployeeArchive."Date of increment" := EmployeeRec."Date of increment";
        EmployeeArchive."MACP Status" := EmployeeRec."MACP Status";
        EmployeeArchive."Designation as per HRMS Site" := EmployeeRec."Designation as per HRMS Site";
        EmployeeArchive."Home Dist as per HRMS Site" := EmployeeRec."Home Dist as per HRMS Site";
        EmployeeArchive."SLCM Employee" := EmployeeRec."SLCM Employee";
        EmployeeArchive."Deployment Location" := EmployeeRec."Deployment Location";
        EmployeeArchive."Deployment Date" := EmployeeRec."Deployment Date";
        EmployeeArchive."Deployment End Date" := EmployeeRec."Deployment End Date";

        EmployeeArchive.Insert(true);
    end;
 */
    procedure ArchiveEmployee(var EmployeeRec: Record Employee)
    var
        EmployeeArchive: Record "Employee History";
        LastVersion: Integer;
    begin
        EmployeeArchive.Reset();
        EmployeeArchive.SetRange("Employee No.", EmployeeRec."No."); // ✅ Filter by Employee No.
        if EmployeeArchive.FindLast() then
            LastVersion := EmployeeArchive."Version No."
        else
            LastVersion := 0;
        EmployeeArchive.Init();
        EmployeeArchive.Validate("Employee No.", EmployeeRec."No.");
        EmployeeArchive."Version No." := LastVersion + 1; // ✅ guaranteed unique per Employee
        EmployeeArchive."Archived DateTime" := CurrentDateTime;
        EmployeeArchive."Archived By" := UserId;
        // Copy fields
        EmployeeArchive."Bill Group" := EmployeeRec."Bill Group";
        EmployeeArchive."Bill Type" := EmployeeRec."Bill Type";
        EmployeeArchive."Account Type" := EmployeeRec."Account Type";
        EmployeeArchive."GPF/PRAN No" := EmployeeRec."GPF/PRAN No";
        EmployeeArchive."Designation" := EmployeeRec."Designation";
        EmployeeArchive."Post Group" := EmployeeRec."Post Group";
        EmployeeArchive."Category" := EmployeeRec."Category";
        EmployeeArchive."D.O.S" := EmployeeRec."D.O.S";
        EmployeeArchive."Home Dist" := EmployeeRec."Home Dist";
        EmployeeArchive."Basic Gr. Pay" := EmployeeRec."Basic Gr. Pay";
        EmployeeArchive."Pension Remark" := EmployeeRec."Pension Remark";
        EmployeeArchive."EPIC No" := EmployeeRec."EPIC No";
        EmployeeArchive."Aadhaar No" := EmployeeRec."Aadhaar No";
        EmployeeArchive."Dept./Trade/Section" := EmployeeRec."Dept./Trade/Section";
        EmployeeArchive."Joining Station" := EmployeeRec."Joining Station";
        EmployeeArchive."D.O.J (Service)" := EmployeeRec."D.O.J (Service)";
        EmployeeArchive."Current Station" := EmployeeRec."Current Station";
        EmployeeArchive."Service Joining Designation" := EmployeeRec."Service Joining Designation";
        EmployeeArchive."Base Qualification" := EmployeeRec."Base Qualification";
        EmployeeArchive."Employment Status" := EmployeeRec."Employment Status";
        EmployeeArchive."Date of increment" := EmployeeRec."Date of increment";
        EmployeeArchive."MACP Status" := EmployeeRec."MACP Status";
        EmployeeArchive."Designation as per HRMS Site" := EmployeeRec."Designation as per HRMS Site";
        EmployeeArchive."Home Dist as per HRMS Site" := EmployeeRec."Home Dist as per HRMS Site";
        EmployeeArchive."SLCM Employee" := EmployeeRec."SLCM Employee";
        EmployeeArchive."Deployment Location" := EmployeeRec."Deployment Location";
        EmployeeArchive."Deployment Date" := EmployeeRec."Deployment Date";
        EmployeeArchive."Employment Name" := EmployeeRec.FullName(); // New field for Employment Name
        EmployeeArchive."Birth Date" := EmployeeRec."Birth Date";
        EmployeeArchive."Mobile Phone No" := EmployeeRec."Mobile Phone No.";
        EmployeeArchive.Email := EmployeeRec."E-Mail";
        EmployeeArchive.Gender := EmployeeRec.Gender;
        EmployeeArchive."Deployment End Date" := EmployeeRec."Deployment End Date";
        EmployeeArchive."modified by" := UserId; // New field for modified by
        EmployeeArchive."modified date time" := CurrentDateTime; // New field for modified date time
        EmployeeArchive.Insert(true);
    end;

    procedure DownloadFinanceUpgUpdateIncr(HRMSID: CODE[20]) //megha 29-10-2025
    var
        FileMngCU: Codeunit "File Management";
        InStr: InStream;
        FinUpg: Record "Financial Upg Application";
        TempBlob: Codeunit "Temp Blob";
    begin
        FinUpg.Reset();
        FinUpg.SetRange("HRMS ID", HRMSID);
        if FinUpg."Application file".HasValue() then begin
            FinUpg."Application file".CreateInStream(InStr);
            FileMngCU.BLOBExport(TempBlob, 'Application_' + FinUpg."HRMS ID" + '.pdf', true);
        end
        else
            Error('No document found to download.');
    end;

    procedure DownloadDataFinanceUpgHist(SlNo: Integer) //megha 29-10-2025
    var
        InStreamVar: InStream;
        FileName: Text;
        FinUpgHist: Record "Financial Upg App history";
    begin
        FinUpgHist.Reset();
        FinUpgHist.SetRange(Sl_no, SlNo);
        FinUpgHist.CalcFields("Application file"); // ✅ ensure blob is loaded
        if FinUpgHist."Application file".HasValue then begin
            FinUpgHist."Application file".CreateInStream(InStreamVar);
            FileName := FinUpgHist."Application file name";
            if FileName = '' then FileName := 'Archived_Increment_' + Format(FinUpgHist."HRMS ID") + '.dat'; // fallback name
            DownloadFromStream(InStreamVar, '', '', '', FileName);
        end
        else
            Message('No file available for HRMS ID %1 in history.', FinUpgHist."HRMS ID");
    end;

    procedure SaveFinUpgIncr(HRMSID: Code[20]) //megha 29-10-25
    var
        FinUpgIncr: Record "Financial Upg Application";
    begin
        //FinUpgIncr.TestField("Application file"); //ss16oct - ensure document uploaded before saving
        // Rec.Validate("Date of application upload", CreateDateTime(); //ss16oct - convert Date to DateTime
        //FinUpgIncr."Date of application upload":=CreateDateTime(WorkDate(), 0T); //ss16oct
        FinUpgIncr."Date of application upload" := WorkDate(); //ss16oct//megha 18-11-25
        FinUpgIncr.Validate("Status", FinUpgIncr.Status::Applied); //ss16oct
        FinUpgIncr."IsConfirmed" := false; //ss16oct
        if FinUpgIncr."Entry No." = 0 then begin
            FinUpgIncr.Insert(true);
            Message('Saved interim increment (Entry No. %1).', FinUpgIncr."Entry No.");
        end
        else begin
            FinUpgIncr.Modify(true);
            Message('Updated interim increment (Entry No. %1).', FinUpgIncr."Entry No.");
        end;
    end;

    procedure UpdateFinUpgIncr(hrms: Code[20];
    IncrementAmount: Decimal;
    Name: Text[90];
    TypeofIncrement: Option "Annual increment","Promotional increment";
    DateofUpload: Date) //megha 29-10-25
    var
        hist: Record "Financial Upg App history";
        FinUpgUpdate: Record "Financial Upg Application";
        entrno: Integer;
        InStreamVar: InStream; //ss16oct
        OutStreamVar: OutStream; //ss16oct
    begin
        FinUpgUpdate.Reset();
        FinUpgUpdate.SetRange("HRMS ID", hrms);
        // Ensure mandatory fields exist //ss16oct
        //FinUpgUpdate.TestField("HRMS ID");
        // FinUpgUpdate.TestField("Increment Amount");//ss16oct
        //  rec.TestField("Type of increment");//ss16oct
        // Save (if not yet inserted) //ss16oct
        if FinUpgUpdate."Entry No." = 0 then begin
            // Rec.Validate("Date of application upload", WorkDate());
            // FinUpgUpdate."Date of application upload" := CreateDateTime(WorkDate(), 0T); //ss16oct
            FinUpgUpdate."Date of application upload" := WorkDate(); //ss16oct//megha 18-11-25
            FinUpgUpdate."Increment Amount" := IncrementAmount;
            FinUpgUpdate."Type of increment" := TypeofIncrement;
            FinUpgUpdate.Validate("Status", FinUpgUpdate.Status::Applied);
            FinUpgUpdate."IsConfirmed" := false;
            FinUpgUpdate.Insert(true);
        end
        else
            FinUpgUpdate.Modify(true);
        // Confirm and archive //ss16oct
        if FinUpgUpdate."Status" <> FinUpgUpdate.Status::Processed then begin
            /* ss16oct  Rec.Validate("Status", Rec.Status::Processed);

               Rec.Validate("IsConfirmed", true);

               Rec.Modify(true);*/
            // Archive snapshot into history //ss16oct
            hist.Reset();
            if hist.FindLast() then
                entrno := hist.Sl_no + 1
            else
                entrno := 1;
            hist.Init();
            //hist.TransferFields(Rec, false); // false = copy only matching fields safely
            // ✅ Manual assignments to ensure accuracy //ss16oct
            hist."IsConfirmed" := FinUpgUpdate."IsConfirmed";
            hist."User Id" := UserId();
            hist."Modified Date Time" := CurrentDateTime();
            //hist."college code" := 'DEFAULT'; // optional placeholder
            // hist."no of versions" := GetNextVersion(Rec."HRMS ID");
            hist.Sl_no := entrno;
            hist."HRMS ID" := FinUpgUpdate."HRMS ID";
            hist."Increment Amount" := FinUpgUpdate."Increment Amount";
            hist.Status := FinUpgUpdate.Status::Processed; //ss16oct
            hist."Current Station" := FinUpgUpdate."Current Station";
            hist."Application file" := FinUpgUpdate."Application file";
            hist."Application file name" := FinUpgUpdate."Application file name";
            //hist."Date of application upload" := CreateDateTime(WorkDate(), 0T); //ss16oct
            hist."Date of application upload" := WorkDate(); //ss16oct //megha 18-11-25
            hist."Effective Date Of MACP" := FinUpgUpdate."Effective Date Of MACP";
            //ss16oct start
            hist."Type of increment" := FinUpgUpdate."Type of increment";
            // ✅ Copy BLOB (Application file) to history table
            FinUpgUpdate.CalcFields("Application file");
            if FinUpgUpdate."Application file".HasValue then begin
                FinUpgUpdate."Application file".CreateInStream(InStreamVar);
                hist."Application file".CreateOutStream(OutStreamVar);
                CopyStream(OutStreamVar, InStreamVar);
            end;
            //ss16oct end
            hist."no of versions" := FinUpgUpdate.GetNextVersion(FinUpgUpdate."HRMS ID");
            hist.Insert(true);
            Message('Increment for HRMS ID %1 saved, confirmed, and archived (Entry No. %2).', FinUpgUpdate."HRMS ID", FinUpgUpdate."Entry No.");
        end
        else
            Message('This increment (Entry No. %1) is already confirmed.', FinUpgUpdate."Entry No.");
    end;

    procedure ArchiveFinUpgApp(var Rec: Record "Financial Upg Application")
    var
        ArchiveFinUpgTab: Record "Financial Upg App history";
        entrno: Integer;
    begin
        ArchiveFinUpgTab.Reset();
        if ArchiveFinUpgTab.FindLast() then
            entrno := ArchiveFinUpgTab.Sl_no + 1
        else
            entrno := 1;
        ArchiveFinUpgTab.Init();
        ArchiveFinUpgTab.TransferFields(Rec, true);
        ArchiveFinUpgTab.Sl_no := entrno;
        ArchiveFinUpgTab."HRMS ID" := Rec."HRMS ID";
        ArchiveFinUpgTab."Current Station" := Rec."Current Station";
        ArchiveFinUpgTab.Insert(true);
    end;
    /*  procedure ArchiveEmployeeHistory(var Rec: Record "Employee Training")
     var
         ArchiveEmpTrainingRec: Record "Archive Employee Training";
         InStr: InStream;
         OutStr: OutStream;
         VersionNo: Integer;
     begin
         // Find last archive only for this employee
         ArchiveEmpTrainingRec.Reset();
         ArchiveEmpTrainingRec.SetRange("HRMS ID", Rec."HRMS ID");
         if ArchiveEmpTrainingRec.FindLast() then
             VersionNo := ArchiveEmpTrainingRec.Slno + 1
         else
             VersionNo := 1;

         ArchiveEmpTrainingRec.Init();
         ArchiveEmpTrainingRec."Entry No" := 0; // let AutoIncrement handle PK
         ArchiveEmpTrainingRec.Slno := VersionNo;

         // Copy fields
         ArchiveEmpTrainingRec."HRMS ID" := Rec."HRMS ID";
         ArchiveEmpTrainingRec.Name := Rec.Name;
         ArchiveEmpTrainingRec.Designation := Rec.Designation;
         ArchiveEmpTrainingRec."Course Name" := Rec."Course Name";
         ArchiveEmpTrainingRec."Start Date" := Rec."Start Date";
         ArchiveEmpTrainingRec."End Date" := Rec."EndDate";
         ArchiveEmpTrainingRec."Duration Of Training" := Rec."Duration Of Training";
         ArchiveEmpTrainingRec."Conducted By" := Rec."Conducted By";
         ArchiveEmpTrainingRec."Training Location" := Rec."Training Location";
         ArchiveEmpTrainingRec."Created By" := Rec."Created By";
         ArchiveEmpTrainingRec."Created Date Time" := Rec."Created Date Time";
         ArchiveEmpTrainingRec."Modified By" := Rec."Modified By";
         ArchiveEmpTrainingRec."Modified Date Time" := Rec."Modified Date Time";
         ArchiveEmpTrainingRec."Certificate FileName" := Rec."Certificate FileName";
         ArchiveEmpTrainingRec."Spcified Type of training" := Rec."Spcified Type of training";

         // Copy Certificate BLOB if exists
         Rec.CalcFields(Certificate);
         if Rec.Certificate.HasValue then begin
             Rec.Certificate.CreateInStream(InStr);
             ArchiveEmpTrainingRec.Certificate.CreateOutStream(OutStr);
             CopyStream(OutStr, InStr);
         end;

         ArchiveEmpTrainingRec."Archived DateTime" := CurrentDateTime;
         ArchiveEmpTrainingRec."Archived By" := UserId;

         ArchiveEmpTrainingRec.Insert(true);

         // Optional: update version count on main record
         Rec."no of versions" := VersionNo;
         Rec.Modify(true);
     end;
  */
    procedure ArchiveEmployeeTransfer(var Rec: Record "Transfer Joining History")
    var
        ArchiveRec: Record "Archive Employee Transfer";
        VersionNo: Integer;
    begin
        // Get last version for this employee
        ArchiveRec.Reset();
        ArchiveRec.SetRange("HRMS ID", Rec."HRMS ID");
        if ArchiveRec.FindLast() then
            VersionNo := ArchiveRec.Slno + 1
        else
            VersionNo := 1;
        ArchiveRec.Init();
        ArchiveRec.Slno := VersionNo;
        // Copy fields
        ArchiveRec."HRMS ID" := Rec."HRMS ID";
        ArchiveRec.Name := Rec.Name;
        ArchiveRec.Designation := Rec.Designation;
        ArchiveRec."From Station" := Rec."From Station";
        ArchiveRec."To Station" := Rec."To Station";
        ArchiveRec."Transfer Date" := Rec."Transfer Date";
        ArchiveRec."Created By" := Rec."Created By";
        ArchiveRec."Created Date Time" := Rec."Created Date Time";
        // Audit info
        ArchiveRec."Archived DateTime" := CurrentDateTime;
        ArchiveRec."Archived By" := UserId;
        ArchiveRec.Insert(true);
        // Optional: update version no. on main record (if you have the field)
        Rec."No. of Archived Versions" := VersionNo;
        Rec.Modify(true);
    end;
}
