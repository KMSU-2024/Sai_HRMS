page 33065742 "Staff Achivement History Card"
{
    PageType = Card;
    // ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Staff Achivement History";

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
                field("Base Qualification";"Base Qualification")
                {
                    ApplicationArea = All;
                }
                field("Inservice Qualification. Upgradation";"Inservice Qua. Upgradation")
                {
                    ApplicationArea = All;
                }
                field(Award;Award)
                {
                    ApplicationArea = All;
                }
                field("Achivement Remarks";"Achivement Remarks")
                {
                    ApplicationArea = All;
                }
                field("Academic Year";"Academic Year")
                {
                    ApplicationArea = All;
                }
                field("Award Details";"Award Details")
                {
                    ApplicationArea = all;
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
