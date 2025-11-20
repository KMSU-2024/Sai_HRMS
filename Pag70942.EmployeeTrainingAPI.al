page 33065486 "Employee Training API"

{

    PageType = API;

    SourceTable = "Training History Buffer";

    APIPublisher = 'dtet';

    APIGroup = 'employee';

    APIVersion = 'v1.0';

    EntityName = 'employeeTraining';

    EntitySetName = 'employeeTrainings';

    Caption = 'Employee Training API';

    DelayedInsert = true;

    layout

    {

        area(content)

        {

            repeater(Group)
            {

                field(EntryNo; Rec."Entry No.") { Caption = 'Entry No.'; }

                field(HRMSID; Rec."HRMS ID") { Caption = 'HRMS ID'; }

                field(CompanyName; Rec."Company Name") { Caption = 'Institue Name'; }

                field(EndDate; Rec."End Date") { Caption = 'End Date'; }

                field(DurationOfTraining; Rec."Duration Of Training") { Caption = 'Duration Of Training'; }

                field(ConductedBy; Rec."Conducted By") { Caption = 'Conducted By'; }

                field(TrainingLocation; Rec."Training Location") { Caption = 'Training Location'; }

            }

        }

    }

}


