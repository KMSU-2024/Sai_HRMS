page 33065483 "Employee Achievements API" //SS03NOV

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
    ODataKeyFields = "Entry No.", "Version No.", "Company Name", "HRMS ID";


    ApplicationArea = All;
    UsageCategory = Administration;

    layout

    {
        area(content)

        {


            field(EntryNo; Rec."Entry No.")
            {
                Caption = 'Entry No.';
            }

            field(VersionNo; Rec."Version No.")
            {
                Caption = 'Version No.';
            }


            field(CompanyName; Rec."Company Name")
            {
                Caption = 'institute';
            }
            field(HRMSID; Rec."HRMS ID")
            {
                Caption = 'HRMS ID';
            }


            field(EmployeeName; Rec."Employee Name")
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

            field(AwardDetails; Rec."Award Details")
            {
                Caption = 'Award Details';
            }

            field(AchievementRemarks; Rec."Achievement Remarks")
            {
                Caption = 'Achievement Remarks';
            }

            field(AcademicYear; Rec."Academic Year")
            {
                Caption = 'Academic Year';
            }

            field(BaseQualification; Rec."Base Qualification")
            {
                Caption = 'Base Qualification';
            }

            field(ArchivedDateTime; Rec."Archived DateTime")
            {
                Caption = 'Create DateTime';
            }

        }
    }

}



