page 33065482 "Employee History Buffer API" //SS03NOV

{

    PageType = API;

    Caption = 'Employee History Buffer API';

    APIPublisher = 'dtet';

    APIGroup = 'employeeDiary';

    APIVersion = 'v1.0';

    EntityName = 'employeeHistory';

    EntitySetName = 'employeeHistories';

    SourceTable = "Employee History Buffer";

    ODataKeyFields = "HRMS ID", "Company Name", "No.";

    DelayedInsert = true;

    ApplicationArea = All;
    UsageCategory = Administration;

    layout

    {

        area(content)

        {

            field(CompanyName; Rec."Company Name") { Caption = 'Institue'; ApplicationArea = All; }

            field(No; Rec."No.") { Caption = 'No.'; ApplicationArea = All; }

            field(HRMSID; Rec."HRMS ID") { Caption = 'HRMS ID'; ApplicationArea = All; }

            field(FirstName; Rec."First Name") { Caption = 'First Name'; ApplicationArea = All; }

            field(EmployeeName; Rec."Employee Name") { Caption = 'Employee Name'; ApplicationArea = All; }

            field(BillGroup; Rec."Bill Group") { Caption = 'Bill Group'; ApplicationArea = All; }

            field(BillType; Rec."Bill Type") { Caption = 'Bill Type'; ApplicationArea = All; }

            field(AccountType; Rec."Account Type") { Caption = 'Account Type'; ApplicationArea = All; }

            field(DesignationAsPerHRMSSite; Rec."Designation as per HRMS Site") { Caption = 'Designation as per HRMS Site'; ApplicationArea = All; }

            field(Designation; Rec."Designation") { Caption = 'Designation'; ApplicationArea = All; }

            field(DeptTradeSection; Rec."Dept./Trade/Section") { Caption = 'Dept./Trade/Section'; ApplicationArea = All; }

            field(PostGroup; Rec."Post Group") { Caption = 'Post Group'; ApplicationArea = All; }

            field(GPFPRANNo; Rec."GPF/PRAN No") { Caption = 'GPF/PRAN No'; ApplicationArea = All; }

            field(BirthDate; Rec."Birth Date") { Caption = 'Birth Date'; ApplicationArea = All; }

            field(Gender; Rec."Gender") { Caption = 'Gender'; ApplicationArea = All; }

            field(DOSDateOfSuperannuation; Rec."D.O.S (Date of Superannuation)") { Caption = 'D.O.S (Date of Superannuation)'; ApplicationArea = All; }

            field(Category; Rec."Category") { Caption = 'Category'; ApplicationArea = All; }

            field(JoiningStation; Rec."Joining Station") { Caption = 'Joining Station'; ApplicationArea = All; }

            field(DOJService; Rec."D.O.J (Service)") { Caption = 'D.O.J (Service)'; ApplicationArea = All; }

            field(CurrentStation; Rec."Current Station") { Caption = 'Current Station'; ApplicationArea = All; }

            field(ServiceJoiningDesignation; Rec."Service Joining Designation") { Caption = 'Service Joining Designation'; ApplicationArea = All; }

            field(BaseQualification; Rec."Base Qualification") { Caption = 'Base Qualification'; ApplicationArea = All; }

            field(HomeDistAsPerHRMSSite; Rec."Home Dist as per HRMS Site") { Caption = 'Home Dist as per HRMS Site'; ApplicationArea = All; }

            field(HomeDist; Rec."Home Dist") { Caption = 'Home Dist'; ApplicationArea = All; }

            field(BasicGrPay; Rec."Basic Gr. Pay") { Caption = 'Basic Gr. Pay'; ApplicationArea = All; }

            field(EmploymentStatus; Rec."Employment Status") { Caption = 'Employment Status'; ApplicationArea = All; }

            field(DateOfIncrement; Rec."Date of increment") { Caption = 'Date of increment'; ApplicationArea = All; }

            field(Email; Rec."Email") { Caption = 'Email'; ApplicationArea = All; }

            field(EPICNo; Rec."EPIC No") { Caption = 'EPIC No'; ApplicationArea = All; }

            field(MACPStatus; Rec."MACP Status") { Caption = 'MACP Status'; ApplicationArea = All; }

            field(MobilePhoneNo; Rec."Mobile Phone No.") { Caption = 'Mobile Phone No.'; ApplicationArea = All; }

            field(PensionRemark; Rec."Pension Remark") { Caption = 'Pension Remark'; ApplicationArea = All; }

            field(Status; Rec."Status") { Caption = 'Status'; ApplicationArea = All; }

            field(SLCMEmployee; Rec."SLCM Employee") { Caption = 'SLCM Employee'; ApplicationArea = All; }

            field(DeploymentLocation; Rec."Deployment Location") { Caption = 'Deployment Location'; ApplicationArea = All; }

            field(DeploymentStartDate; Rec."Deployment Start Date") { Caption = 'Deployment Start Date'; ApplicationArea = All; }

            field(DeploymentStartDate1; Rec."Deployment Start Date") { Caption = 'Deployment Start Date1'; ApplicationArea = All; }

            field(DeploymentEndDate; Rec."Deployment End Date") { Caption = 'Deployment End Date'; ApplicationArea = All; }

            field(LastName; Rec."Last Name") { Caption = 'Last Name'; ApplicationArea = All; }

        }

    }

}

