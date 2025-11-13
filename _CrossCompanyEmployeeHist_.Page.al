page 33065491 "CrossCompanyEmployeeHist" //SS07OCT c
{
    PageType = ListPart;
    SourceTable = TempEmployeeHistory;
    Caption = 'Employee History (All Companies)';

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Company Name"; Rec."Company Name")
                {
                    ApplicationArea = All;
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field("HRMS ID"; Rec."HRMS ID")
                {
                    ApplicationArea = All;
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = All;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = All;
                }
                field("Bill Group"; Rec."Bill Group")
                {
                    ApplicationArea = All;
                }
                field("Bill Type"; Rec."Bill Type")
                {
                    ApplicationArea = All;
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = All;
                }
                field("Designation as per HRMS Site"; Rec."Designation as per HRMS Site")
                {
                    ApplicationArea = All;
                }
                field("Designation"; Rec."Designation")
                {
                    ApplicationArea = All;
                }
                field("Dept./Trade/Section"; Rec."Dept./Trade/Section")
                {
                    ApplicationArea = All;
                }
                field("Post Group"; Rec."Post Group")
                {
                    ApplicationArea = All;
                }
                field("GPF/PRAN No"; Rec."GPF/PRAN No")
                {
                    ApplicationArea = All;
                }
                field("Birth Date"; Rec."Birth Date")
                {
                    ApplicationArea = All;
                }
                field("Gender"; Rec."Gender")
                {
                    ApplicationArea = All;
                }
                field("D.O.S (Date of Superannuation)"; Rec."D.O.S (Date of Superannuation)")
                {
                    ApplicationArea = All;
                }
                field("Category"; Rec."Category")
                {
                    ApplicationArea = All;
                }
                field("Joining Station"; Rec."Joining Station")
                {
                    ApplicationArea = All;
                }
                field("D.O.J (Service)"; Rec."D.O.J (Service)")
                {
                    ApplicationArea = All;
                }
                field("Current Station"; Rec."Current Station")
                {
                    ApplicationArea = All;
                }
                field("Service Joining Designation"; Rec."Service Joining Designation")
                {
                    ApplicationArea = All;
                }
                field("Base Qualification"; Rec."Base Qualification")
                {
                    ApplicationArea = All;
                }
                field("Home Dist as per HRMS Site"; Rec."Home Dist as per HRMS Site")
                {
                    ApplicationArea = All;
                }
                field("Home Dist"; Rec."Home Dist")
                {
                    ApplicationArea = All;
                }
                field("Basic Gr. Pay"; Rec."Basic Gr. Pay")
                {
                    ApplicationArea = All;
                }
                field("Employment Status"; Rec."Employment Status")
                {
                    ApplicationArea = All;
                }
                field("Date of increment"; Rec."Date of increment")
                {
                    ApplicationArea = All;
                }
                field("Email"; Rec."Email")
                {
                    ApplicationArea = All;
                }
                field("EPIC No"; Rec."EPIC No")
                {
                    ApplicationArea = All;
                }
                field("MACP Status"; Rec."MACP Status")
                {
                    ApplicationArea = All;
                }
                field("Mobile Phone No."; Rec."Mobile Phone No.")
                {
                    ApplicationArea = All;
                }
                field("Pension Remark"; Rec."Pension Remark")
                {
                    ApplicationArea = All;
                }
                field("Status"; Rec."Status")
                {
                    ApplicationArea = All;
                }
                field("SLCM Employee"; Rec."SLCM Employee")
                {
                    ApplicationArea = All;
                }
                field("Deployment Location"; Rec."Deployment Location")
                {
                    ApplicationArea = All;
                }
                field("Deployment Start Date"; Rec."Deployment Start Date")
                {
                    ApplicationArea = All;
                }
                field("Deployment Start Date1"; Rec."Deployment Start Date1")
                {
                    ApplicationArea = All;
                }
                field("Deployment End Date"; Rec."Deployment End Date")
                {
                    ApplicationArea = All;
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    var
        Emp: Record "Employee History"; // or your HRMS Employee source table
        CompanyRec: Record Company;

    procedure LoadData(HRMSID: Code[20])
    var
        LineNo: Integer;
    begin
        Rec.DeleteAll();
        LineNo := 1;
        if CompanyRec.FindSet() then
            repeat
                Emp.CHANGECOMPANY(CompanyRec.Name);
                Emp.SetRange("Employee No.", HRMSID);
                if Emp.FindSet() then
                    repeat
                        Rec.Init();
                        Rec."Line ID" := LineNo;
                        Rec."Company Name" := CompanyRec.Name;
                        Rec."No." := Emp."Employee No.";
                        Rec."HRMS ID" := Emp."Employee No.";
                        //   Rec."First Name" := Emp."First Name";
                        Rec."Employee Name" := Emp."Employment Name";
                        Rec."Bill Group" := Emp."Bill Group";
                        Rec."Bill Type" := Emp."Bill Type";
                        Rec."Account Type" := Format(Emp."Account Type");
                        Rec."Designation as per HRMS Site" := Emp."Designation as per HRMS Site";
                        Rec."Designation" := Emp."Designation";
                        Rec."Dept./Trade/Section" := Emp."Dept./Trade/Section";
                        Rec."Post Group" := Format(Emp."Post Group");
                        Rec."GPF/PRAN No" := Emp."GPF/PRAN No";
                        Rec."Birth Date" := Emp."Birth Date";
                        Rec."Gender" := Emp."Gender";
                        //  Rec."D.O.S (Date of Superannuation)" := Emp."D.O.S (Date of Superannuation)";
                        Rec."Category" := Format(Emp."Category");
                        Rec."Joining Station" := Emp."Joining Station";
                        Rec."D.O.J (Service)" := Emp."D.O.J (Service)";
                        Rec."Current Station" := Emp."Current Station";
                        Rec."Service Joining Designation" := Emp."Service Joining Designation";
                        Rec."Base Qualification" := Emp."Base Qualification";
                        Rec."Home Dist as per HRMS Site" := Emp."Home Dist as per HRMS Site";
                        Rec."Home Dist" := Emp."Home Dist";
                        Rec."Basic Gr. Pay" := Emp."Basic Gr. Pay";
                        Rec."Employment Status" := Format(Emp."Employment Status");
                        Rec."Date of increment" := Emp."Date of increment";
                        // Rec."Email" := Emp."Email";
                        Rec."EPIC No" := Emp."EPIC No";
                        Rec."MACP Status" := Format(Emp."MACP Status");
                        Rec."Mobile Phone No." := Emp."Mobile Phone No";
                        Rec."Pension Remark" := format(Emp."Pension Remark");
                        //  Rec."Status" := Format(Emp."Status");
                        Rec."SLCM Employee" := Emp."SLCM Employee";
                        Rec."Deployment Location" := Emp."Deployment Location";
                        //  Rec."Deployment Start Date" := Emp."Deployment Start Date";
                        //Rec."Deployment Start Date1" := format(Emp."Deployment Start Date1");
                        Rec."Deployment End Date" := Emp."Deployment End Date";
                        // Rec."Last Name" := Emp."Last Name";
                        Rec.Insert();
                        LineNo += 1;
                    until Emp.Next() = 0;
            until CompanyRec.Next() = 0;
        CurrPage.Update(false);
    end;
}
