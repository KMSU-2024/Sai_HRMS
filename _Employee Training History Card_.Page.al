page 33065746 "Employee Training History Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Employee Training History";

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("Entry No";"Entry No")
                {
                    ApplicationArea = All;
                }
                field("HRMS ID";"HRMS ID")
                {
                    ApplicationArea = All;
                }
                field("Employee Name";Name)
                {
                    ApplicationArea = All;
                }
                field(Designation;Designation)
                {
                    ApplicationArea = All;
                }
                field("Type Of Training";"Type Of Training")
                {
                    ApplicationArea = All;
                }
                field("Traing Course Title";"Course Name")
                {
                    ApplicationArea = All;
                }
                field("Training Starting Date";"Start Date")
                {
                    ApplicationArea = All;
                }
                field("Training Ending Date";EndDate)
                {
                    ApplicationArea = All;
                }
                field("Duration Of Training";"Duration Of Training")
                {
                    ApplicationArea = All;
                }
                field("Conducted By";"Conducted By")
                {
                    ApplicationArea = All;
                }
                field("Training Location";"Training Location")
                {
                    ApplicationArea = All;
                }
                field("Spcified Type of training";"Spcified Type of training")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()begin
                end;
            }
        }
    }
    var myInt: Integer;
}
