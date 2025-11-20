page 33065483 "Employee Achievements API" //SS17nov

{

    PageType = API;

    DelayedInsert = true;

    Caption = 'Employee Achievements Buffer API';

    APIPublisher = 'dtet';

    APIGroup = 'employeeDiary';

    APIVersion = 'v1.0';

    EntityName = 'employeeAchievement';

    EntitySetName = 'employeeAchievements';

    SourceTable = "Employee Achievements Buffer";

    // ODataKeyFields = "HRMS ID", "Company Name", "Entry No.";
    ODataKeyFields = "Version No.", "Company Name", "HRMS ID";


    ApplicationArea = All;
    UsageCategory = Administration;

    layout

    {
        area(content)

        {

            /* 
                        field(Entry_No; Rec."Entry No.")
                        {
                            Caption = 'Entry No.';
                        } */ //ssnov18



            field(Institute_Name; Rec."Company Name")
            {
                Caption = 'Institute Name';
            }
            field(HRMS_ID; Rec."HRMS ID")
            {
                Caption = 'HRMS ID';
            }


            field(Employee_Name; Rec."Employee Name")
            {
                Caption = 'Employee Name';
            }

            field(Designation; Rec."Designation")
            {
                Caption = 'Designation';
            }

            field(Award; Rec."Award")
            {
                Caption = 'Award';
            }

            field(Award_Details; Rec."Award Details")
            {
                Caption = 'Award Details';
            }

            field(Achievement_Remarks; Rec."Achievement Remarks")
            {
                Caption = 'Achievement Remarks';
            }

            field(Academic_Year; Rec."Academic Year")
            {
                Caption = 'Academic Year';
            }

            field(Base_Qualification; Rec."Base Qualification")
            {
                Caption = 'Base Qualification';
            }

            field(Create_DateTime; Rec."Archived DateTime")
            {
                Caption = 'Create DateTime';
            }

        }
    }

}



