page 33065494 "Employee Lookup List" //SS07OCT c
{
    PageType = List;
    SourceTable = "Employee History";
    Caption = 'Employee Lookup';

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Employee No."; rec."Employee No.")
                {
                    ApplicationArea = All;
                }
                field("Employment Name"; rec."Employment Name")
                {
                    ApplicationArea = All;
                }
                field("Designation"; rec.Designation)
                {
                    ApplicationArea = All;
                }
                field("Current Station"; rec."Current Station")
                {
                    ApplicationArea = All;
                }
                field("Employment Status"; rec."Employment Status")
                {
                    ApplicationArea = All;
                }
                field("Company Name"; Rec."Company Name")
                {
                }
            }
        }
    }
}
