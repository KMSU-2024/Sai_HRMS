page 33065620 "Employee Apprisal API" //SS03NOV

{

    PageType = API;

    DelayedInsert = true;

    Caption = 'Employee Apprisal Buffer API';

    APIPublisher = 'dtet';

    APIGroup = 'employeeDiary';

    APIVersion = 'v1.0';

    EntityName = 'employeeApprisal';

    EntitySetName = 'employeeApprisals';

    SourceTable = "Employee Appraisal Buffer";

    ODataKeyFields = "HRMS ID", "Company Name", "Entry No.";

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

            field(CompanyName; Rec."Company Name")
            {
                Caption = 'Institue';
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
            field(Department; Rec."Department")
            {
                Caption = 'Department';
            }
            field(AcademicYear; Rec."Academic Year")
            {
                Caption = 'Academic Year';
            }
            field(PerformanceAppraisalReview; Rec."Performance Appraisal Review")
            {
                Caption = 'Performance Appraisal Review';
            }
            field(ModifiedBy; Rec."Modified By")
            {
                Caption = 'Modified By';
            }
            field(ModifiedDateTime; Rec."Modified Date Time")
            {
                Caption = 'Modified Date Time';
                ApplicationArea = All;
            }

        }
    }

}



