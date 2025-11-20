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

    ODataKeyFields = "HRMS ID", "Company Name";

    ApplicationArea = All;
    UsageCategory = Administration;

    layout

    {
        area(content)

        {
            /*  field(Entry_No; Rec."Entry No.")
             {
                 Caption = 'Entry No.';
             } */ //ssnov18


            field(Institute_Name; Rec."Company Name")
            {
                Caption = 'Institute_Name';
            }
            field(HRMSID; Rec."HRMS ID")
            {
                Caption = 'HRMS ID';
            }

            field(Employee_Name; Rec."Employee Name")
            {
                Caption = 'Name';
            }
            field(Designation; Rec."Designation")
            {
                Caption = 'Designation';
            }
            field(Department; Rec."Department")
            {
                Caption = 'Department';
            }
            field(Academic_Year; Rec."Academic Year")
            {
                Caption = 'Academic Year';
            }
            field(Performance_Appraisal_Review; Rec."Performance Appraisal Review")
            {
                Caption = 'Performance Appraisal Review';
            }
            field(Modified_By; Rec."Modified By")
            {
                Caption = 'Modified By';
            }
            field(ModifiedDate_Time; Rec."Modified Date Time")
            {
                Caption = 'Modified Date Time';
                ApplicationArea = All;
            }

        }
    }

}



