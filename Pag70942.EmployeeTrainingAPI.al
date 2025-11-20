page 33065486 "Employee Training API" //SS17nov

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

                // field("Entry_No"; Rec."Entry No.") { Caption = 'Entry No.'; } //ssnov18

                field(Institute_Name; Rec."Company Name") { Caption = 'Institute_Name'; }


                field(HRMS_ID; Rec."HRMS ID") { Caption = 'HRMS ID'; }
                field(Name; Name) { Caption = 'Name'; }
                field("Start_Date"; "Start Date")
                { Caption = 'Start Date'; }
                field(End_Date; Rec."End Date") { Caption = 'End Date'; }

                field(DurationOf_Training; Rec."Duration Of Training") { Caption = 'Duration Of Training'; }

                field(Conducted_By; Rec."Conducted By") { Caption = 'Conducted By'; }

                field(Training_Location; Rec."Training Location") { Caption = 'Training Location'; }

            }

        }

    }

}


