codeunit 33066459 "HRMS Codeunit"
{
    trigger OnRun()begin
    end;
    procedure HRMSDataImportFromGovtPortal(FileName: Text[250])var EmployeeDataImport: xmlport "Employee Data Import";
    TempEmployee: Record Employee temporary;
    TempFile: File;
    begin
        TempFile.Open(FileName);
        TempFile.CreateInStream(InputStream);
        Xmlport.Import(Xmlport::"Employee Data Import", InputStream);
    end;
    procedure ExportEmployeeList(): Text[250]var GeneralLedgerSetup: Record "General Ledger Setup";
    FileName1: Text[250];
    begin
        GeneralLedgerSetup.Get();
        FileName1:=GeneralLedgerSetup."HRMS Reports Stored Path" + 'ExportEmployeeList' + Format(CreateGuid) + '.XLS';
        Report.SaveAsExcel(33065832, FileName1);
        exit(FileName1);
    end;
    procedure ExportFinancialUpgradationApplicationForm(): Text[250]var GeneralLedgerSetup: Record "General Ledger Setup";
    FileName1: Text[250];
    begin
        GeneralLedgerSetup.Get();
        FileName1:=GeneralLedgerSetup."HRMS Reports Stored Path" + 'ExportFinancialUpgradationApplicationForm' + Format(CreateGuid) + '.XLS';
        Report.SaveAsExcel(33065756, FileName1);
        exit(FileName1);
    end;
    procedure ExportPromotionDetails(): Text[250]var GeneralLedgerSetup: Record "General Ledger Setup";
    FileName1: Text[250];
    begin
        GeneralLedgerSetup.Get();
        FileName1:=GeneralLedgerSetup."HRMS Reports Stored Path" + 'ExportPromotionDetails' + Format(CreateGuid) + '.XLS';
        Report.SaveAsExcel(33065680, FileName1);
        exit(FileName1);
    end;
    procedure ExportAnnualEstablishmentPartA(): Text[250]var GeneralLedgerSetup: Record "General Ledger Setup";
    FileName1: Text[250];
    begin
        GeneralLedgerSetup.Get();
        FileName1:=GeneralLedgerSetup."HRMS Reports Stored Path" + 'ExportAnnualEstablishmentPartA' + Format(CreateGuid) + '.XLS';
        Report.SaveAsExcel(33065783, FileName1);
        exit(FileName1);
    end;
    procedure ExportAnnualEstablishmentPartC(): Text[250]var GeneralLedgerSetup: Record "General Ledger Setup";
    FileName1: Text[250];
    begin
        GeneralLedgerSetup.Get();
        FileName1:=GeneralLedgerSetup."HRMS Reports Stored Path" + 'ExportAnnualEstablishmentPartC' + Format(CreateGuid) + '.XLS';
        Report.SaveAsExcel(33065795, FileName1);
        exit(FileName1);
    end;
    procedure ExportAnnualEstablishmentPartE(): Text[250]var GeneralLedgerSetup: Record "General Ledger Setup";
    FileName1: Text[250];
    begin
        GeneralLedgerSetup.Get();
        FileName1:=GeneralLedgerSetup."HRMS Reports Stored Path" + 'ExportAnnualEstablishmentPartE' + Format(CreateGuid) + '.XLS';
        Report.SaveAsExcel(33065676, FileName1);
        exit(FileName1);
    end;
    procedure ExportTransferConsolidatedList(): Text[250]var GeneralLedgerSetup: Record "General Ledger Setup";
    FileName1: Text[250];
    begin
        GeneralLedgerSetup.Get();
        FileName1:=GeneralLedgerSetup."HRMS Reports Stored Path" + 'ExportTransferConsolidatedList' + Format(CreateGuid) + '.XLS';
        Report.SaveAsExcel(33065646, FileName1);
        exit(FileName1);
    end;
    procedure ExportStaffAchivementDetails(): Text[250]var GeneralLedgerSetup: Record "General Ledger Setup";
    FileName1: Text[250];
    begin
        GeneralLedgerSetup.Get();
        FileName1:=GeneralLedgerSetup."HRMS Reports Stored Path" + 'ExportStaffAchivementDetails' + Format(CreateGuid) + '.XLS';
        Report.SaveAsExcel(33065684, FileName1);
        exit(FileName1);
    end;
    procedure ExportDisciplinaryDetailsPreview(): Text[250]var GeneralLedgerSetup: Record "General Ledger Setup";
    FileName1: Text[250];
    begin
        GeneralLedgerSetup.Get();
        FileName1:=GeneralLedgerSetup."HRMS Reports Stored Path" + 'ExportDisciplinaryDetailsPreview' + Format(CreateGuid) + '.XLS';
        Report.SaveAsExcel(33065687, FileName1);
        exit(FileName1);
    end;
    procedure ExportEmployeeTrainingDetails(): Text[250]var GeneralLedgerSetup: Record "General Ledger Setup";
    FileName1: Text[250];
    begin
        GeneralLedgerSetup.Get();
        FileName1:=GeneralLedgerSetup."HRMS Reports Stored Path" + 'ExportEmployeeTrainingDetails' + Format(CreateGuid) + '.XLS';
        Report.SaveAsExcel(33065688, FileName1);
        exit(FileName1);
    end;
    procedure ExportAnnualIncrementDetails(): Text[250]var GeneralLedgerSetup: Record "General Ledger Setup";
    FileName1: Text[250];
    begin
        GeneralLedgerSetup.Get();
        FileName1:=GeneralLedgerSetup."HRMS Reports Stored Path" + 'ExportAnnualIncrementDetails' + Format(CreateGuid) + '.XLS';
        Report.SaveAsExcel(33065728, FileName1);
        exit(FileName1);
    end;
    procedure ExportAnnualInternalPerformance(): Text[250]var GeneralLedgerSetup: Record "General Ledger Setup";
    FileName1: Text[250];
    begin
        GeneralLedgerSetup.Get();
        FileName1:=GeneralLedgerSetup."HRMS Reports Stored Path" + 'ExportAnnualInternalPerformance' + Format(CreateGuid) + '.XLS';
        Report.SaveAsExcel(33065700, FileName1);
        exit(FileName1);
    end;
    procedure ExportCourtCaseMonitoringDetails(): Text[250]var GeneralLedgerSetup: Record "General Ledger Setup";
    FileName1: Text[250];
    begin
        GeneralLedgerSetup.Get();
        FileName1:=GeneralLedgerSetup."HRMS Reports Stored Path" + 'ExportCourtCaseMonitoringDetails' + Format(CreateGuid) + '.XLS';
        Report.SaveAsExcel(33065796, FileName1);
        exit(FileName1);
    end;
    procedure ExportRTIMonitoringDetails(): Text[250]var GeneralLedgerSetup: Record "General Ledger Setup";
    FileName1: Text[250];
    begin
        GeneralLedgerSetup.Get();
        FileName1:=GeneralLedgerSetup."HRMS Reports Stored Path" + 'ExportRTIMonitoringDetails' + Format(CreateGuid) + '.XLS';
        Report.SaveAsExcel(33065797, FileName1);
        exit(FileName1);
    end;
    procedure "Upload Employee Training History Certificate"(Entrynopar: Integer;
    filenamePar: Text[200])var EmpTrainHistRec: Record "Employee Training History";
    begin
        EmpTrainHistRec.Get(Entrynopar);
        EmpTrainHistRec."Certificate FileName":=filenamePar;
        EmpTrainHistRec.Modify();
    end;
    //megha start 31-8-25
    procedure "Upload Disciplinary Changes"(Entrynopar: Integer;
    filenamePar: Text[200])var EmpTrainHistRec: Record "Disciplinary History";
    begin
        EmpTrainHistRec.Get(Entrynopar);
        EmpTrainHistRec."Disciplinary Charges File Name":=filenamePar;
        EmpTrainHistRec.Modify();
    end;
    /*  procedure UploadDisciplinaryChargeDoc(HRMSID: code[20]; filenamePar: Text[200])
     var
         EmpTrainHistRec: Record "Disciplinary History";
     begin
         EmpTrainHistRec.Get(HRMSID);
         EmpTrainHistRec."Disciplinary Charges File Name" := filenamePar;
         EmpTrainHistRec.Modify();
     end;

  */
    procedure submitDisciplinaryCaseDetails(HRMSID: code[20];
    Name: Text[100];
    Designation: code[20];
    fileName: Text[200];
    DisciplinaryCaseLetterNo: Text[50];
    DisciplinaryCaseDate: Date;
    DisciplinaryCaseStatus: Enum "Discipinary CaseStatus";
    WhetherPlacedUnderSuspension: Boolean;
    WhetherReinstated: Boolean;
    VigilanceCasePending: Boolean)var disciplinaryHist: Record "Disciplinary History";
    disciplinaryCaseInputPage: Page "Disciplinary Case Input";
    begin
    end;
    procedure SubmitDisciplinaryCase(HRMSID: code[20];
    Name: Text[100];
    Designation: code[20];
    fileName: Text[200];
    DisciplinaryCaseLetterNo: Text[50];
    DisciplinaryCaseDate: Date;
    DisciplinaryCaseStatus: Enum "Discipinary CaseStatus";
    WhetherPlacedUnderSuspension: Boolean;
    WhetherReinstated: Boolean;
    VigilanceCasePending: Boolean)var DisciplinaryCaseInputPage: Page "Disciplinary Case Input";
    disciplinaryHist: Record "Disciplinary History";
    outs: OutStream;
    begin
        DisciplinaryHist.Init();
        DisciplinaryHist."HRMS ID":=HRMSID;
        DisciplinaryHist.Name:=Name;
        DisciplinaryHist.Designation:=Designation;
        // DisciplinaryHist."Disciplinary Charges":=DisciplinaryCharges;
        DisciplinaryHist."Disciplinary Charges File Name":=fileName; // Start Anmol renamed
        DisciplinaryHist."Disciplinary CaseLetter No":=DisciplinaryCaseLetterNo;
        DisciplinaryHist."Disciplinary CaseDate":=DisciplinaryCaseDate;
        DisciplinaryHist."Disciplinary CaseStatus":=DisciplinaryCaseStatus;
        DisciplinaryHist."WhetherPlaced under suspension":=WhetherPlacedUnderSuspension;
        DisciplinaryHist."Whether reinstated":=WhetherReinstated;
        //Start Anmol
        DisciplinaryHist.VigilanceCasePending:=VigilanceCasePending;
        /* if fileName <> '' then begin
            DisciplinaryHist."Upload Disciplinary ChargesDoc".CreateOutStream(outs);
            CopyStream(outs, ins);
        end; */
        //End Anmol
        DisciplinaryHist.Insert(true);
    end;
    procedure submitAnnualPerformanceDetails(HRMSID: code[20];
    Name: Text[100];
    Designation: code[20];
    PerformanceYear: Integer;
    PerformanceRating: Option "Submitted", "Reported", "Reviewed", "Forwarded", "Accepted";
    Department: code[20];
    AcademicYaer: Text[20];
    AcademicYear: Text[20])var AnnualPerformanceReview: Record "Annual Performance Review";
    begin
        AnnualPerformanceReview.Init();
        AnnualPerformanceReview."HRMS ID":=HRMSID;
        AnnualPerformanceReview.Name:=Name;
        AnnualPerformanceReview.Designation:=Designation;
        AnnualPerformanceReview.Department:=Department;
        AnnualPerformanceReview."Academic Year":=AcademicYaer;
        //AnnualPerformanceReview."Performance Rating" := Format(PerformanceRating);
        AnnualPerformanceReview."Performance Appraisal Review":=PerformanceRating;
        AnnualPerformanceReview.Insert(true);
    end;
    procedure DownloadDisciplinaryChargeDoc(HRMSID: code[20]): Text[200]var EmpTrainHistRec: Record "Disciplinary History";
    begin
        EmpTrainHistRec.Get(HRMSID);
        exit(EmpTrainHistRec."Disciplinary Charges File Name");
    end;
    //megha end
    procedure "Download Employee Training History Certificate"(Entrynopar: Integer): Text[200]var EmpTrainHistRec: Record "Employee Training History";
    begin
        EmpTrainHistRec.Get(Entrynopar);
        exit(EmpTrainHistRec."Certificate FileName");
    end;
    procedure "Download Room Wise Details"(Entrynopar: Code[20]): Text[200]var EmpTrainHistRec: Record "Room Wise Details";
    begin
        EmpTrainHistRec.Get(Entrynopar);
        exit(EmpTrainHistRec."Uploaded File Name ");
    end;
    procedure "Download Room Wise Details Hist"(Entrynopar: Code[20]): Text[200]var EmpTrainHistRec: Record "Room Wise Details History";
    begin
        EmpTrainHistRec.Get(Entrynopar);
        exit(EmpTrainHistRec."Uploaded File Name ");
    end;
    procedure SubmitRoomWiseDetails(EntryNo: Code[20];
    BuildingBlockName: Code[100];
    TypeOfBuilding: Option;
    RoomNo: Code[10];
    FloorNo: Integer;
    TradeDept: Code[20];
    AreaOfFlooring: Decimal;
    TypeOfFlooring: Option;
    AreaOfShortWall: Decimal;
    AreaOfLongWall: Decimal;
    AreaOfCeiling: Decimal;
    TypeOfCeiling: Option;
    NoOfWindow: Integer;
    NoOfDoor: Integer;
    TypeOfDoor: Option;
    NoOfOfficerCabinet: Integer;
    NoOfChair: Integer;
    NoOfTable: Integer;
    TypeOfTable: Option;
    NoOfDesk: Integer;
    TypeOfDesk: Option;
    AC: Integer;
    NoOfCeilingFan: Integer;
    NoOfWallFan: Integer;
    NoOfCeilingLight: Integer;
    NoOfCCTV: Integer;
    NoOfDesktop: Integer;
    NoOfPrinter: Integer;
    Sofa: Option;
    AreaOfOfficeCabinet: Decimal;
    TypeOfWindow: Option;
    TypeOfChair: Option;
    TypeOfCeilingFan: Option;
    UploadedFileName: Text[100];
    NoOfBed: Integer;
    NoOfWallCabinet: Integer;
    TypeOfBed: Option;
    TypeOfWallCabinet: Option;
    TypeOfWallFan: Option)var RoomWiseDet: Record "Room Wise Details";
    RoomWiseDetlHist: Record "Room Wise Details History";
    begin
        // Handle BLOB: Upload photo from Base64 string
        RoomWiseDet."Entry No.":=EntryNo;
        RoomWiseDet."Building/Block Name ":=BuildingBlockName;
        RoomWiseDet."Type of Building":=TypeOfBuilding;
        RoomWiseDet."Room No.":=RoomNo;
        RoomWiseDet."Floor No.":=FloorNo;
        RoomWiseDet."TRADE/DEPT":=TradeDept;
        RoomWiseDet."Area of flooring":=AreaOfFlooring;
        RoomWiseDet."Type of flooring":=TypeOfFlooring;
        RoomWiseDet."Area of Short wall":=AreaOfShortWall;
        RoomWiseDet."Area of Long wall":=AreaOfLongWall;
        RoomWiseDet."Area of Ceiling":=AreaOfCeiling;
        RoomWiseDet."Type of ceiling":=TypeOfCeiling;
        RoomWiseDet."No of Window":=NoOfWindow;
        RoomWiseDet."No of Doors":=NoOfDoor;
        RoomWiseDet."Type of door":=TypeOfDoor;
        RoomWiseDet."No of officer cabinet":=NoOfOfficerCabinet;
        RoomWiseDet."No of Chair":=NoOfChair;
        RoomWiseDet."No of Table":=NoOfTable;
        RoomWiseDet."Type of Table":=TypeOfTable;
        RoomWiseDet."No of Desk":=NoOfDesk;
        RoomWiseDet."Type of Desk":=TypeOfDesk;
        RoomWiseDet."AC":=AC;
        RoomWiseDet."No of Fan(Ceiling)":=NoOfCeilingFan;
        RoomWiseDet."No of Fan(Wall)":=NoOfWallFan;
        RoomWiseDet."No of Ceiling Light":=NoOfCeilingLight;
        RoomWiseDet."No of CCTV":=NoOfCCTV;
        RoomWiseDet."No of Desktop":=NoOfDesktop;
        RoomWiseDet."No of Printer":=NoOfPrinter;
        RoomWiseDet.Sofa:=Sofa;
        RoomWiseDet."Area of Office Cabinet":=AreaOfOfficeCabinet;
        RoomWiseDet."Type of Window":=TypeOfWindow;
        RoomWiseDet."Type of Chair":=TypeOfChair;
        RoomWiseDet."Type of Ceiling(Fan)":=TypeOfCeilingFan;
        RoomWiseDet."Uploaded File Name ":=UploadedFileName;
        RoomWiseDet."No Of Bed ":=NoOfBed;
        RoomWiseDet."No Of Wall Cabinet ":=NoOfWallCabinet;
        RoomWiseDet."Type of Bed":=TypeOfBed;
        RoomWiseDet."Type of Wall Cabinet":=TypeOfWallCabinet;
        RoomWiseDet."Type of Fan(Wall)":=TypeOfWallFan;
        // Perform Insert or Modify
        if RoomWiseDet.Get(EntryNo)then begin
            RoomWiseDet.Modify(true); // With validation
        end
        else
        begin
            RoomWiseDet.Insert(true); // With validation
        end;
        // Log to History Table
        RoomWiseDetlHist.Init();
        RoomWiseDetlHist.TransferFields(RoomWiseDet);
        RoomWiseDetlHist."Modified By":=UserId;
        RoomWiseDetlHist."Modified Date":=CurrentDateTime;
        RoomWiseDetlHist.Insert(true);
        Message('Record saved successfully for Entry No.: %1', EntryNo);
    end;
    procedure "Upload Transfer Application Employee"(SLnopar: Integer;
    HRMSIDpar: code[20];
    filenamePar: Text[200])var Emptransfer: Record "Transfer Application Employee";
    begin
        Emptransfer.Get(SLnopar, HRMSIDpar);
        Emptransfer."File Name":=filenamePar;
    end;
    procedure "Download Transfer Application Employee"(SLnopar: Integer;
    HRMSIDpar: code[20]): Text[200]var Emptransfer: Record "Transfer Application Employee";
    begin
        Emptransfer.Get(SLnopar, HRMSIDpar);
        exit(Emptransfer."File Name");
    end;
    procedure "Upload Staff Achivement"(SLnopar: Integer;
    filenamePar: Text[200])var StaffAchive: Record "Staff Achivement History";
    begin
        if StaffAchive.Get(SLnopar)then begin
            //StaffAchive."File Name" := filenamePar;//megha 25-8-25
            StaffAchive."Certificate FileName":=filenamePar; //megha 25-8-25
            StaffAchive.Modify();
        end;
    end;
    procedure "Download Staff Achivement"(SLnopar: Integer): Text[200]var StaffAchive: Record "Staff Achivement History";
    begin
        //if StaffAchive.Get(SLnopar) then exit(StaffAchive."File Name");//megha 25-8-25
        if StaffAchive.Get(SLnopar)then exit(StaffAchive."Certificate FileName"); //megha 25-8-25
    end;
    procedure "Upload Promotion Order"(ENTnopar: Integer;
    filenamePar: Text[200])var PromotionHistRec: Record "Employee Promotion History";
    begin
        PromotionHistRec.Get(ENTnopar);
        PromotionHistRec."Promotion Order File Name":=filenamePar;
        PromotionHistRec.Modify();
    end;
    procedure "Download Promotion Order"(ENTnopar: Integer): Text[200]var PromotionHistRec: Record "Employee Promotion History";
    begin
        PromotionHistRec.Get(ENTnopar);
        exit(PromotionHistRec."Promotion Order File Name");
    end;
    procedure "Upload Transfer Order"(ENTnopar: Integer;
    filenamePar: Text[200])var TransferHistRec: Record "Transfer Joining History";
    begin
        TransferHistRec.Get(ENTnopar);
        TransferHistRec."Transfer Order File Name":=filenamePar;
    end;
    procedure "Download Transfer Order"(ENTnopar: Integer): Text[200]var TransferHistRec: Record "Transfer Joining History";
    begin
        TransferHistRec.Get(ENTnopar);
        exit(TransferHistRec."Transfer Order File Name");
    end;
    procedure "Upload Financial Upgradation Application"(ENTnopar: Integer;
    HRMSIDPar: Code[20];
    filenamePar: Text[200])var FinUpAppRECRec: Record "Financial Upg Application";
    begin
        FinUpAppRECRec.Get(ENTnopar, HRMSIDPar);
        FinUpAppRECRec."Application file name":=filenamePar;
        FinUpAppRECRec.Modify();
    end;
    procedure "Download Financial Upgradation Application"(ENTnopar: Integer;
    HRMSIDPar: Code[20]): Text[200]var FinUpAppRECRec: Record "Financial Upg Application";
    begin
        FinUpAppRECRec.Get(ENTnopar, HRMSIDPar);
        exit(FinUpAppRECRec."Application file name");
    end;
    procedure ExportDTETEmployeeList(): Text[250]var GeneralLedgerSetup: Record "General Ledger Setup";
    DTETServiceMonitoring: Report "DTET Service Monitoring";
    FileName1: Text[250];
    begin
        GeneralLedgerSetup.Get();
        FileName1:=GeneralLedgerSetup."HRMS Reports Stored Path" + 'ExportDTETEmployeeList' + Format(CreateGuid) + '.XLS';
        Report.SaveAsExcel(33065830, FileName1);
        exit(FileName1);
    end;
    procedure ExportDTETTransferDetails(): Text[250]var GeneralLedgerSetup: Record "General Ledger Setup";
    DTETServiceMonitoring: Report "DTET Service Monitoring";
    FileName1: Text[250];
    begin
        GeneralLedgerSetup.Get();
        FileName1:=GeneralLedgerSetup."HRMS Reports Stored Path" + 'ExportDTETTransferDetails' + Format(CreateGuid) + '.XLS';
        Report.SaveAsExcel(33065805, FileName1);
        exit(FileName1);
    end;
    procedure ExportDTETPromotionDetails(): Text[250]var GeneralLedgerSetup: Record "General Ledger Setup";
    DTETServiceMonitoring: Report "DTET Service Monitoring";
    FileName1: Text[250];
    begin
        GeneralLedgerSetup.Get();
        FileName1:=GeneralLedgerSetup."HRMS Reports Stored Path" + 'ExportDTETPromotionDetails' + Format(CreateGuid) + '.XLS';
        Report.SaveAsExcel(33065806, FileName1);
        exit(FileName1);
    end;
    procedure ExportDTETStaffProfileDetails(): Text[250]var GeneralLedgerSetup: Record "General Ledger Setup";
    DTETServiceMonitoring: Report "DTET Service Monitoring";
    FileName1: Text[250];
    begin
        GeneralLedgerSetup.Get();
        FileName1:=GeneralLedgerSetup."HRMS Reports Stored Path" + 'ExportDTETStaffProfileDetails' + Format(CreateGuid) + '.XLS';
        Report.SaveAsExcel(33065807, FileName1);
        exit(FileName1);
    end;
    procedure ExportDTETAnnualEstablishmentPartA(): Text[250]var GeneralLedgerSetup: Record "General Ledger Setup";
    DTETServiceMonitoring: Report "DTET Service Monitoring";
    FileName1: Text[250];
    begin
        GeneralLedgerSetup.Get();
        FileName1:=GeneralLedgerSetup."HRMS Reports Stored Path" + 'ExportDTETAnnualEstaPartA' + Format(CreateGuid) + '.XLS';
        Report.SaveAsExcel(33065822, FileName1);
        exit(FileName1);
    end;
    procedure ExportDTETAnnualEstablishmentPartC(): Text[250]var GeneralLedgerSetup: Record "General Ledger Setup";
    DTETServiceMonitoring: Report "DTET Service Monitoring";
    FileName1: Text[250];
    begin
        GeneralLedgerSetup.Get();
        FileName1:=GeneralLedgerSetup."HRMS Reports Stored Path" + 'ExportDTETAnnualEstaPartC' + Format(CreateGuid) + '.XLS';
        Report.SaveAsExcel(33065823, FileName1);
        exit(FileName1);
    end;
    procedure ExportDTETAnnualEstablishmentPartE(): Text[250]var GeneralLedgerSetup: Record "General Ledger Setup";
    DTETServiceMonitoring: Report "DTET Service Monitoring";
    FileName1: Text[250];
    begin
        GeneralLedgerSetup.Get();
        FileName1:=GeneralLedgerSetup."HRMS Reports Stored Path" + 'ExportDTETAnnualEstaPartE' + Format(CreateGuid) + '.XLS';
        Report.SaveAsExcel(33065825, FileName1);
        exit(FileName1);
    end;
    procedure ExportDTETAnnualPerformanceDetails(): Text[250]var GeneralLedgerSetup: Record "General Ledger Setup";
    DTETServiceMonitoring: Report "DTET Service Monitoring";
    FileName1: Text[250];
    begin
        GeneralLedgerSetup.Get();
        FileName1:=GeneralLedgerSetup."HRMS Reports Stored Path" + 'ExportDTETAnnualPerformanceDetails' + Format(CreateGuid) + '.XLS';
        Report.SaveAsExcel(33065811, FileName1);
        exit(FileName1);
    end;
    procedure ExportDTETEmployeeTransferApplicationDetails(): Text[250]var GeneralLedgerSetup: Record "General Ledger Setup";
    DTETServiceMonitoring: Report "DTET Service Monitoring";
    FileName1: Text[250];
    begin
        GeneralLedgerSetup.Get();
        FileName1:=GeneralLedgerSetup."HRMS Reports Stored Path" + 'ExportDTETEmployeeTransferApplicationDetails' + Format(CreateGuid) + '.XLS';
        Report.SaveAsExcel(33065828, FileName1);
        exit(FileName1);
    end;
    procedure ExportDTETFinancialUpgradationDetails(): Text[250]var GeneralLedgerSetup: Record "General Ledger Setup";
    DTETServiceMonitoring: Report "DTET Service Monitoring";
    FileName1: Text[250];
    begin
        GeneralLedgerSetup.Get();
        FileName1:=GeneralLedgerSetup."HRMS Reports Stored Path" + 'ExportDTETFinancialUpgradationDetails' + Format(CreateGuid) + '.XLS';
        Report.SaveAsExcel(33065827, FileName1);
        exit(FileName1);
    end;
    procedure UpdateDesignation(HRMSId: code[20];
    Todesignation: code[20])var employee: Record Employee;
    begin
        If employee.Get(HRMSId)then begin
            employee.Designation:=Todesignation;
            employee.Modify(true);
        end;
    end;
    procedure UpdateAddEmpDetails(HRMSID: code[20])var EmpAddDtls: Record "Employee Additional Info";
    emp: Record Employee;
    begin
        EmpAddDtls.Reset();
        EmpAddDtls.SetRange("HRMS ID", HRMSID);
        if EmpAddDtls.FindLast()then begin
            if emp.get(EmpAddDtls."HRMS ID")then begin
                if EmpAddDtls."D.O.J (Service)" <> 0D then emp."D.O.J (Service)":=EmpAddDtls."D.O.J (Service)";
                if EmpAddDtls."Service Joining Designation" <> '' then emp."Service Joining Designation":=EmpAddDtls."Service Joining Designation";
                if EmpAddDtls.Designation <> '' then emp.Designation:=EmpAddDtls.Designation; //megha 21-10-25
                if EmpAddDtls."Service Joining Station" <> '' then emp."Joining Station":=EmpAddDtls."Service Joining Station";
                if EmpAddDtls."Current Station" <> '' then emp."Current Station":=EmpAddDtls."Current Station";
                if EmpAddDtls."Base Qualification" <> '' then emp."Base Qualification":=EmpAddDtls."Base Qualification";
                if EmpAddDtls."Employment Status" <> 0 then emp."Employment Status":=EmpAddDtls."Employment Status";
                if EmpAddDtls."Date of increment" <> 0D then emp."Date of increment":=EmpAddDtls."Date of increment";
                if EmpAddDtls."MACP Status" <> 0 then emp."MACP Status":=EmpAddDtls."MACP Status";
                if EmpAddDtls."Pension Remark" <> 0 then emp."Pension Remark":=EmpAddDtls."Pension Remark";
                if EmpAddDtls."Dept./Trade/Section" <> '' then emp."Dept./Trade/Section":=EmpAddDtls."Dept./Trade/Section";
                if EmpAddDtls.Designation <> '' then emp.Designation:=EmpAddDtls.Designation;
                if EmpAddDtls."Home Dist" <> '' then emp."Home Dist":=EmpAddDtls."Home Dist";
                if EmpAddDtls."Deployment Start Date" <> 0D then emp."Deployment Start Date":=EmpAddDtls."Deployment Start Date";
                if EmpAddDtls."Deployment End Date" <> 0D then emp."Deployment End Date":=EmpAddDtls."Deployment End Date";
                if EmpAddDtls."Deployment Location" <> '' then emp."Deployment Location":=EmpAddDtls."Deployment Location";
                emp.Modify(true);
            end;
        end;
    end;
    procedure UpdateAddEmpDetailsLatest(HRMSID: code[20];
    IncDate: date;
    MAPC: Option " ", "Nil", "1st", "2nd", "3rd";
    EmpStatus: Option " ", "Ad hoc", "Temporary status", "Initial appointee", "Regular")var EmpAddDtls: Record "Employee Additional Info";
    emp: Record Employee;
    begin
        EmpAddDtls.Reset();
        EmpAddDtls.SetRange("HRMS ID", HRMSID);
        if EmpAddDtls.FindLast()then begin
            if IncDate <> 0D then EmpAddDtls."Date of increment":=IncDate;
            if MAPC <> 0 then EmpAddDtls."MACP Status":=MAPC;
            if EmpStatus <> 0 then EmpAddDtls."Employment Status":=EmpStatus;
            EmpAddDtls.Modify();
            if emp.get(EmpAddDtls."HRMS ID")then begin
                if EmpAddDtls."Employment Status" <> 0 then emp."Employment Status":=EmpAddDtls."Employment Status";
                if EmpAddDtls."Date of increment" <> 0D then emp."Date of increment":=EmpAddDtls."Date of increment";
                if EmpAddDtls."MACP Status" <> 0 then emp."MACP Status":=EmpAddDtls."MACP Status";
                emp.Modify(true);
            end;
        end;
    end;
    // [EventSubscriber(ObjectType::Table, Database::"Employee Additional Info", 'OnAfterInsertEvent', '', false, false)]
    // procedure UpdateEmpDetails(var Rec: Record "Employee Additional Info"; RunTrigger: Boolean)
    // Var
    //     emp: Record Employee;
    // begin
    //     RunTrigger := true;
    //     if emp.get(Rec."HRMS ID") then begin
    //         if Rec."D.O.J (Service)" <> 0D then
    //             emp."D.O.J (Service)" := Rec."D.O.J (Service)";
    //         Message('Hi');
    //         if Rec."Service Joining Designation" <> '' then
    //             emp."Service Joining Designation" := Rec."Service Joining Designation";
    //         if Rec."Service Joining Station" <> '' then
    //             emp."Joining Station" := Rec."Service Joining Station";
    //         if Rec."Current Station" <> '' then
    //             emp."Current Station" := Rec."Current Station";
    //         if Rec."Base Qualification" <> '' then
    //             emp."Base Qualification" := Rec."Base Qualification";
    //         if Rec."Employment Status" <> 0 then
    //             emp."Employment Status" := Rec."Employment Status";
    //         if Rec."Date of increment" <> 0D then
    //             emp."Date of increment" := Rec."Date of increment";
    //         if Rec."MACP Status" <> 0 then
    //             emp."MACP Status" := Rec."MACP Status";
    //         if Rec."Pension Remark" <> 0 then
    //             emp."Pension Remark" := Rec."Pension Remark";
    //         if Rec."Dept./Trade/Section" <> '' then
    //             emp."Dept./Trade/Section" := Rec."Dept./Trade/Section";
    //         emp.Modify(true);
    //     end;
    // end;
    // [EventSubscriber(ObjectType::Table, Database::"Employee Additional Info", 'OnAfterModifyEvent', '', false, false)]
    // procedure UpdateEmpAddDetails(var Rec: Record "Employee Additional Info"; var xRec: Record "Employee Additional Info"; RunTrigger: Boolean)
    // Var
    //     Emp: Record Employee;
    // begin
    //     RunTrigger := true;
    //     if Emp.get(Rec."HRMS ID") then begin
    //         if Rec."Employment Status" <> xRec."Employment Status" then
    //             Emp."Employment Status" := Rec."Employment Status";
    //         if Rec."Date of increment" <> xRec."Date of increment" then
    //             Emp."Date of increment" := Rec."Date of increment";
    //         if Rec."MACP Status" <> xRec."MACP Status" then
    //             Emp."MACP Status" := Rec."MACP Status";
    //         Emp.Modify(true);
    //     end;
    // end;
    procedure EmployeeRelief(EntryNo: Integer)var EmployeeRec: Record Employee;
    TransJoiningHist: Record "Transfer Joining History";
    PromotedHist: Record "Employee Promotion History";
    begin
        TransJoiningHist.Reset();
        TransJoiningHist.SetRange("Entry No", EntryNo);
        if TransJoiningHist.FindFirst()then begin
            TransJoiningHist.Status:=TransJoiningHist.Status::Relieved;
            TransJoiningHist.Modify(true);
            if TransJoiningHist."Relieving Event" = TransJoiningHist."Relieving Event"::"Promotion Transfer" then begin
                PromotedHist.Init();
                PromotedHist."HRMS ID":=TransJoiningHist."HRMS ID";
                PromotedHist.Name:=TransJoiningHist.Name;
                PromotedHist."From Designation":=TransJoiningHist.Designation;
                PromotedHist."To Designation":=TransJoiningHist."To Designation";
                PromotedHist."Promotion Order Date":=TransJoiningHist."Promotion order date";
                PromotedHist."Letter NO":=TransJoiningHist."Promotion letter no"; //--promotion latter no insted of relief latter no
                PromotedHist.Insert(true);
            end;
            EmployeeRec.Reset();
            EmployeeRec.SetRange("No.", TransJoiningHist."HRMS ID");
            IF EmployeeRec.FindFirst()then begin
                EmployeeRec.Status:="Employee Status"::Inactive;
                EmployeeRec.Modify(true);
            end;
        end;
    end;
    procedure EmployeeJoin(FromStation: Text[50];
    HRMSID: Code[20])var EmployeeLocVar: Record Employee;
    EmployeeRec: Record Employee;
    EmployeeRec1: Record Employee;
    TransferHist: Record "Transfer Joining History";
    TransferHist1: Record "Transfer Joining History";
    PromotedHist: Record "Employee Promotion History";
    begin
        TransferHist.ChangeCompany(FromStation);
        TransferHist.Reset();
        TransferHist.SetRange("HRMS ID", HRMSID);
        TransferHist.SetRange(Status, TransferHist.Status::Relieved);
        if TransferHist.FindFirst()then begin
            EmployeeRec.ChangeCompany(FromStation);
            if EmployeeRec.Get(TransferHist."HRMS ID")then;
            if EmployeeRec."D.O.S" >= TransferHist."Joining Date" then begin
                TransferHist1.Init();
                TransferHist1."HRMS ID":=HRMSID;
                TransferHist1.Name:=TransferHist.Name;
                TransferHist1.Designation:=TransferHist.Designation;
                TransferHist1."From Station":=TransferHist."From Station";
                TransferHist1."To Station":=TransferHist."To Station";
                TransferHist1."Transfer Date":=TransferHist."Transfer Date";
                TransferHist1."Letter No":=TransferHist."Letter No";
                TransferHist1."Joining Event":=TransferHist."Joining Event";
                TransferHist1."Joining Date":=TransferHist."Joining Date";
                TransferHist1.Status:=TransferHist.Status::Joined;
                TransferHist1."Order Issuing Authority":=TransferHist."Order Issuing Authority";
                TransferHist1."Relief Order Date":=TransferHist."Relief Order Date";
                TransferHist1."Relief Order No.":=TransferHist."Relief Order No.";
                TransferHist1.Insert();
                EmployeeLocVar.ChangeCompany(FromStation);
                IF EmployeeLocVar.Get(HRMSID)then;
                EmployeeRec1.Init();
                EmployeeRec1.Copy(EmployeeLocVar);
                EmployeeRec1.Status:=EmployeeRec1.Status::Active;
                EmployeeRec1."Current Station":=TransferHist1."To Station"; //SK_Sk
                EmployeeRec1.Designation:=TransferHist."To Designation";
                EmployeeRec1.Insert();
            end;
        end;
    end;
    var InputStream: InStream;
}
