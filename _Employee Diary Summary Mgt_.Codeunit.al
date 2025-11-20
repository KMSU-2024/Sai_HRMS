//codeunit 33065489 "Employee Diary Summary Mgt"
codeunit 33065489 "Employee Diary Summary Mgt"

{

    procedure RecalculateSummary(StationCode: Code[100])

    var

        EmpHist: Record "Employee History";

        Summary: Record "Employee Diary Summary";

    begin

        // Count total employees

        EmpHist.Reset();

        EmpHist.SetRange("Current Station", StationCode);

        Summary.Init();

        Summary."Current Station" := StationCode;

        Summary."Total Employees" := EmpHist.Count();

        // Count active employees (Regular, Active, Ad hoc, Temporary status, Initial appointee)

        EmpHist.SetRange("Current Station", StationCode);

        EmpHist.SetFilter("Employment Status", '%1|%2|%3|%4',

            EmpHist."Employment Status"::Regular,


            EmpHist."Employment Status"::"Ad hoc",

            EmpHist."Employment Status"::"Temporary status",

            EmpHist."Employment Status"::"Initial appointee");

        Summary."Active Employees" := EmpHist.Count();

        // Count inactive employees (Inactive only)

        EmpHist.SetRange("Current Station", StationCode);

        EmpHist.SetRange("Employment Status", EmpHist."Employment Status"::Inactive);

        Summary."Inactive Employees" := EmpHist.Count();

        if not Summary.Insert(true) then
            Summary.Modify(true);

    end;



    procedure RecalculateAllStations()

    var

        EmpHist: Record "Employee History";

    begin

        EmpHist.Reset();

        EmpHist.SetCurrentKey("Current Station");

        if EmpHist.FindSet() then
            repeat

                RecalculateSummary(EmpHist."Current Station");

            until EmpHist.Next() = 0;

    end;




    /* {
        procedure RecalculateSummary(StationCode: Code[100])var EmpHist: Record "Employee History";
        Summary: Record "Employee Diary Summary";
        begin
            // Count total employees
            EmpHist.Reset();
            EmpHist.SetRange("Current Station", StationCode);
            Summary.Init();
            Summary."Current Station":=StationCode;
            Summary."Total Employees":=EmpHist.Count();
            // Count active employees (Regular, Active, Ad hoc, Temporary status, Initial appointee)
            EmpHist.SetRange("Current Station", StationCode);
            EmpHist.SetFilter("Employment Status", '%1|%2|%3|%4', EmpHist."Employment Status"::Regular, EmpHist."Employment Status"::"Ad hoc", EmpHist."Employment Status"::"Temporary status", EmpHist."Employment Status"::"Initial appointee");
            Summary."Active Employees":=EmpHist.Count();
            // Count inactive employees (Inactive only)
            EmpHist.SetRange("Current Station", StationCode);
            EmpHist.SetRange("Employment Status", EmpHist."Employment Status"::Inactive);
            Summary."Inactive Employees":=EmpHist.Count();
            if not Summary.Insert(true)then Summary.Modify(true);
        end;
        local procedure LoadEmployeesAcrossCompanies(HRMS: Code[20])var CompanyList: Record Company;
        EmpHist: Record "Employee History";
        EmployeeSrc: Record Employee;
        TempEmployee: Record Employee temporary; // use a temporary buffer
        begin
            Clear(EmpHist);
            Clear(TempEmployee);
            EmpHist.Reset();
            EmpHist.SetRange("Employee No.", HRMS);
            if CompanyList.FindSet()then repeat EmployeeSrc.ChangeCompany(CompanyList.Name);
                    EmployeeSrc.SetRange("No.", HRMS);
                    if EmployeeSrc.FindSet()then repeat TempEmployee.Init();
                            TempEmployee.TransferFields(EmployeeSrc, true);
                            // Make it unique by appending company name to No.
                            TempEmployee."No.":=Format(EmployeeSrc."No.") + '-' + CopyStr(CompanyList.Name, 1, 10);
                            TempEmployee.Insert();
                        until EmployeeSrc.Next() = 0;
                until CompanyList.Next() = 0;
        // Copy the result set back into Rec so the page displays it
        //megha 30-10-25 EmpHist := TempEmployee;
        end;
        procedure RecalculateAllStations()var EmpHist: Record "Employee History";
        begin
            EmpHist.Reset();
            EmpHist.SetCurrentKey("Current Station");
            if EmpHist.FindSet()then repeat RecalculateSummary(EmpHist."Current Station");
                until EmpHist.Next() = 0;
        end;
        procedure LoadEmpHistData(HRMSID: Code[20])var Emp: Record "Employee History"; // or your HRMS Employee source table
        CompanyRec: Record Company;
        LineNo: Integer;
        EmpHist: Record TempEmployeeHistory;
        begin
            EmpHist.DeleteAll();
            LineNo:=1;
            if CompanyRec.FindSet()then repeat Emp.CHANGECOMPANY(CompanyRec.Name);
                    Emp.SetRange("Employee No.", HRMSID);
                    if Emp.FindSet()then repeat EmpHist.Init();
                            EmpHist."Line ID":=LineNo;
                            EmpHist."Company Name":=CompanyRec.Name;
                            EmpHist."No.":=Emp."Employee No.";
                            EmpHist."HRMS ID":=Emp."Employee No.";
                            //   EmpHist."First Name" := Emp."First Name";
                            EmpHist."Employee Name":=Emp."Employment Name";
                            EmpHist."Bill Group":=Emp."Bill Group";
                            EmpHist."Bill Type":=Emp."Bill Type";
                            EmpHist."Account Type":=Format(Emp."Account Type");
                            EmpHist."Designation as per HRMS Site":=Emp."Designation as per HRMS Site";
                            EmpHist."Designation":=Emp."Designation";
                            EmpHist."Dept./Trade/Section":=Emp."Dept./Trade/Section";
                            EmpHist."Post Group":=Format(Emp."Post Group");
                            EmpHist."GPF/PRAN No":=Emp."GPF/PRAN No";
                            EmpHist."Birth Date":=Emp."Birth Date";
                            EmpHist."Gender":=Emp."Gender";
                            //  EmpHist."D.O.S (Date of Superannuation)" := Emp."D.O.S (Date of Superannuation)";
                            EmpHist."Category":=Format(Emp."Category");
                            EmpHist."Joining Station":=Emp."Joining Station";
                            EmpHist."D.O.J (Service)":=Emp."D.O.J (Service)";
                            EmpHist."Current Station":=Emp."Current Station";
                            EmpHist."Service Joining Designation":=Emp."Service Joining Designation";
                            EmpHist."Base Qualification":=Emp."Base Qualification";
                            EmpHist."Home Dist as per HRMS Site":=Emp."Home Dist as per HRMS Site";
                            EmpHist."Home Dist":=Emp."Home Dist";
                            EmpHist."Basic Gr. Pay":=Emp."Basic Gr. Pay";
                            EmpHist."Employment Status":=Format(Emp."Employment Status");
                            EmpHist."Date of increment":=Emp."Date of increment";
                            // EmpHist."Email" := Emp."Email";
                            EmpHist."EPIC No":=Emp."EPIC No";
                            EmpHist."MACP Status":=Format(Emp."MACP Status");
                            EmpHist."Mobile Phone No.":=Emp."Mobile Phone No";
                            EmpHist."Pension Remark":=format(Emp."Pension Remark");
                            //  EmpHist."Status" := Format(Emp."Status");
                            EmpHist."SLCM Employee":=Emp."SLCM Employee";
                            EmpHist."Deployment Location":=Emp."Deployment Location";
                            //  EmpHist."Deployment Start Date" := Emp."Deployment Start Date";
                            //EmpHist."Deployment Start Date1" := format(Emp."Deployment Start Date1");
                            EmpHist."Deployment End Date":=Emp."Deployment End Date";
                            // EmpHist."Last Name" := Emp."Last Name";
                            EmpHist.Insert(true);
                            LineNo+=1;
                        until Emp.Next() = 0;
                until CompanyRec.Next() = 0;
        end;
        procedure LoadFinancialUpgHistData(HRMSID: Code[20])var LineNo: Integer;
        FinUpgHist: Record "Financial Upg App history";
        CompanyRec: Record Company;
        FinUpgHistTemp: Record TempFinancialUpgHistory;
        CrossCompany: Page CrossCompanyFinancialUpgHist;
        begin
            FinUpgHistTemp.DeleteAll();
            LineNo:=1;
            if CompanyRec.FindSet()then repeat FinUpgHist.CHANGECOMPANY(CompanyRec.Name);
                    FinUpgHist.SetRange("HRMS ID", HRMSID); // 🔑 Filtering by HRMSID/UserId
                    if FinUpgHist.FindSet()then repeat FinUpgHistTemp.Init();
                            FinUpgHistTemp."HRMS ID":=HRMSID;
                            FinUpgHistTemp."Line ID":=LineNo;
                            FinUpgHistTemp."Company Name":=CompanyRec.Name;
                            FinUpgHistTemp."Entry No":=FinUpgHist."Entry No.";
                            FinUpgHistTemp."Application File Name":=FinUpgHist."Application file name";
                            FinUpgHistTemp."Current Station":=FinUpgHist."Current Station";
                            FinUpgHistTemp."Status":=FinUpgHist."Status";
                            FinUpgHistTemp."Sl_no":=FinUpgHist."Sl_no";
                            FinUpgHistTemp."Effective Date Of MACP":=FinUpgHist."Effective Date Of MACP";
                            FinUpgHistTemp."No of Versions":=FinUpgHist."no of versions";
                            //FinUpgHistTemp."HRMS Id" := FinUpgHist."User Id";
                            FinUpgHistTemp."Modified Date Time":=FinUpgHist."Modified Date Time";
                            FinUpgHistTemp.Insert(true);
                            LineNo+=1;
                        until FinUpgHist.Next() = 0;
                    CrossCompany.SetRecord(FinUpgHist);
                    CrossCompany.Run();
                until CompanyRec.Next() = 0;
            IF FinUpgHistTemp.FindLast()THEN Message('Count of Records %1', LineNo);
            Commit();
        end;
        [ServiceEnabled]
        procedure GetFinancialUpgHist(HRMSID: Code[20]): Record TempFinancialUpgHistory //megha 29-10-25
     var HistPage: Page CrossCompanyFinancialUpgHist;
        TempRec: Record TempFinancialUpgHistory;
        begin
            HistPage.LoadData(HRMSID);
            TempRec.Copy(HistPage.GetRecord());
            exit(TempRec);
        end;
    }
     */
    //megha 15-11-25
    procedure CountPersoninPosition(Designation: Code[20]; Department: Text[70]; compName: Text[30]): Integer
    var
        EmployeeRec: Record Employee;
        AnnualEstablishment: Record "Annual Establishment Review";
        CompanyList: Record Company;
    begin
        if compName <> '' then begin
            EmployeeRec.CHANGECOMPANY(compName);
            EmployeeRec.SetRange(Designation, Designation);
            EmployeeRec.SetRange("Dept./Trade/Section", Department);
            //EmployeeRec.SetRange("Post Group", empgroup);
            EmployeeRec.SetRange(Status, EmployeeRec.Status::Active);
            EmployeeRec.SetRange("SLCM Employee", false);
        end
        else begin
            if CompanyList.FindSet() then
                repeat
                    EmployeeRec.CHANGECOMPANY(CompanyList.Name);
                    EmployeeRec.SetRange(Designation, Designation);
                    EmployeeRec.SetRange("Dept./Trade/Section", Department);
                    //EmployeeRec.SetRange("Post Group", empgroup);
                    EmployeeRec.SetRange(Status, EmployeeRec.Status::Active);
                    EmployeeRec.SetRange("SLCM Employee", false);
                    Message('Count of Employees in %1: %2', CompanyList.Name, EmployeeRec.Count());
                until CompanyList.Next() = 0;
        end;
        //EmployeeRec.SetRange("Financial Year", FinancialYear);
        // EmployeeRec.SetRange("Employee Catagory", EmployeeCategory);
        Message('Count of Employees %1', EmployeeRec.Count());
        exit(EmployeeRec.Count());
    end;
}