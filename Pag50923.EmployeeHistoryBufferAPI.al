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
    SourceTableView = sorting("Archive Date Time") order(ascending);

    DelayedInsert = true;

    ApplicationArea = All;
    UsageCategory = Administration;

    layout

    {

        area(content)

        {


            field(Institute_Name; Rec."Company Name") { Caption = 'Institute Name'; ApplicationArea = All; }

            field(No; Rec."No.") { Caption = 'No.'; ApplicationArea = All; }

            field(HRMS_ID; Rec."HRMS ID") { Caption = 'HRMS ID'; ApplicationArea = All; }

            field(First_Name; Rec."First Name") { Caption = 'First Name'; ApplicationArea = All; }

            field(Employee_Name; Rec."Employee Name") { Caption = 'Employee Name'; ApplicationArea = All; }

            field(Bill_Group; Rec."Bill Group") { Caption = 'Bill Group'; ApplicationArea = All; }

            field(Bill_Type; Rec."Bill Type") { Caption = 'Bill Type'; ApplicationArea = All; }

            field(Account_Type; Rec."Account Type") { Caption = 'Account Type'; ApplicationArea = All; }

            field(Designation_AsPer_HRMS_Site; Rec."Designation as per HRMS Site") { Caption = 'Designation as per HRMS Site'; ApplicationArea = All; }

            field(Designation; Rec."Designation") { Caption = 'Designation'; ApplicationArea = All; }

            field(Dept_Trade_Section; Rec."Dept./Trade/Section") { Caption = 'Dept./Trade/Section'; ApplicationArea = All; }

            field(Post_Group; Rec."Post Group") { Caption = 'Post Group'; ApplicationArea = All; }

            field(GPF_PRAN_No; Rec."GPF/PRAN No") { Caption = 'GPF/PRAN No'; ApplicationArea = All; }

            field(Birth_Date; Rec."Birth Date") { Caption = 'Birth Date'; ApplicationArea = All; }

            field(Gender; Rec."Gender") { Caption = 'Gender'; ApplicationArea = All; }

            field(DOS_Date_Of_Superannuation; Rec."D.O.S (Date of Superannuation)") { Caption = 'D.O.S (Date of Superannuation)'; ApplicationArea = All; }

            field(Category; Rec."Category") { Caption = 'Category'; ApplicationArea = All; }

            field(Joining_Station; Rec."Joining Station") { Caption = 'Joining Station'; ApplicationArea = All; }

            field(DOJ_Service; Rec."D.O.J (Service)") { Caption = 'D.O.J (Service)'; ApplicationArea = All; }

            field(Current_Station; Rec."Current Station") { Caption = 'Current Station'; ApplicationArea = All; }

            field(Service_Joining_Designation; Rec."Service Joining Designation") { Caption = 'Service Joining Designation'; ApplicationArea = All; }

            field(Base_Qualification; Rec."Base Qualification") { Caption = 'Base Qualification'; ApplicationArea = All; }

            field(Home_Dist_As_Per_HRMS_Site; Rec."Home Dist as per HRMS Site") { Caption = 'Home Dist as per HRMS Site'; ApplicationArea = All; }

            field(Home_Dist; Rec."Home Dist") { Caption = 'Home Dist'; ApplicationArea = All; }

            field(Basic_GrPay; Rec."Basic Gr. Pay") { Caption = 'Basic Gr. Pay'; ApplicationArea = All; }

            field(Employment_Status; Rec."Employment Status") { Caption = 'Employment Status'; ApplicationArea = All; }

            field(Date_Of_Increment; Rec."Date of increment") { Caption = 'Date of increment'; ApplicationArea = All; }

            field(Email; Rec."Email") { Caption = 'Email'; ApplicationArea = All; }

            field(EPIC_No; Rec."EPIC No") { Caption = 'EPIC No'; ApplicationArea = All; }

            field(MACP_Status; Rec."MACP Status") { Caption = 'MACP Status'; ApplicationArea = All; }

            field(Mobile_PhoneNo; Rec."Mobile Phone No.") { Caption = 'Mobile Phone No.'; ApplicationArea = All; }

            field(Pension_Remark; Rec."Pension Remark") { Caption = 'Pension Remark'; ApplicationArea = All; }

            field(Status; Rec."Status") { Caption = 'Status'; ApplicationArea = All; }

            field(SLCM_Employee; Rec."SLCM Employee") { Caption = 'SLCM Employee'; ApplicationArea = All; }

            field(Deployment_Location; Rec."Deployment Location") { Caption = 'Deployment Location'; ApplicationArea = All; }

            field(Deployment_Start_Date; Rec."Deployment Start Date") { Caption = 'Deployment Start Date'; ApplicationArea = All; }


            field(Deployment_End_Date; Rec."Deployment End Date") { Caption = 'Deployment End Date'; ApplicationArea = All; }

            field(Last_Name; Rec."Last Name") { Caption = 'Last Name'; ApplicationArea = All; }

        }

    }

}

