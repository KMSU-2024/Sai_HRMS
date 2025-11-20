page 33065506 "Employee Training List" //SS07OCT c
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Employee Training";
    CardPageId = "Employee Training Input";
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Entry No";rec."Entry No")
                {
                    ApplicationArea = All;
                }
                field("HRMS ID";rec."HRMS ID")
                {
                    ApplicationArea = All;
                }
                field("Employee Name";rec.Name)
                {
                    ApplicationArea = All;
                }
                field(Designation;rec.Designation)
                {
                    ApplicationArea = All;
                }
                field("Type Of Training";rec."Type Of Training")
                {
                    ApplicationArea = All;
                }
                field("Traing Course Title";rec."Course Name")
                {
                    ApplicationArea = All;
                }
                field("Training Starting Date";rec."Start Date")
                {
                    ApplicationArea = All;
                }
                field("Training Ending Date";rec.EndDate)
                {
                    ApplicationArea = All;
                }
                field("Duration Of Training";rec."Duration Of Training")
                {
                    ApplicationArea = All;
                }
                field("Conducted By";rec."Conducted By")
                {
                    ApplicationArea = All;
                }
                field("Training Location";rec."Training Location")
                {
                    ApplicationArea = All;
                }
            }
        }
        area(Factboxes)
        {
        }
    }
    actions
    {
        area(Processing)
        {
            action("Training History") //SS07OCT
            {
                ApplicationArea = all;
                Image = History;

                trigger OnAction()var EmpTraining: Record "Employee Training History";
                hrmsid: Code[20];
                begin
                    // Get current HRMS ID from the page record
                    hrmsid:=Rec."HRMS ID";
                    // Filter Employee Training History by HRMS ID
                    EmpTraining.Reset();
                    EmpTraining.SetRange("HRMS ID", hrmsid);
                    // Open the filtered Employee Training History List page
                    PAGE.Run(PAGE::"Employee Training History List", EmpTraining);
                end;
            }
        }
    }
}
