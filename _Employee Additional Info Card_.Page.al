page 33065749 "Employee Additional Info Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Employee Additional Info";

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("Entry No";rec."Entry No")
                {
                    ApplicationArea = All;
                }
                field("HRMS ID";rec."HRMS ID")
                {
                    ApplicationArea = All;
                }
                field("Employee Name";rec."Employee Name")
                {
                    ApplicationArea = All;
                }
                field("D.O.J (Service)";rec."D.O.J (Service)")
                {
                    ApplicationArea = All;
                }
                field("Service Joining Designation";rec."Service Joining Designation")
                {
                    ApplicationArea = All;
                }
                field("Service Joining Station";rec."Service Joining Station")
                {
                    ApplicationArea = All;
                    Caption = 'Service Joining Stataion';
                }
                field("Current Station";rec."Current Station")
                {
                    ApplicationArea = All;
                }
                field("Base Qualification";rec."Base Qualification")
                {
                    ApplicationArea = All;
                }
                field("Employment Status";rec."Employment Status")
                {
                    ApplicationArea = All;
                }
                field("Date of increment";rec."Date of increment")
                {
                    ApplicationArea = All;
                }
                field("MACP Status";rec."MACP Status")
                {
                    ApplicationArea = All;
                }
                field("Pension Remark";rec."Pension Remark")
                {
                    ApplicationArea = All;
                }
                field("Dept./Trade/Section";rec."Dept./Trade/Section")
                {
                    ApplicationArea = All;
                }
                field(Designation;Designation)
                {
                    ApplicationArea = All;
                }
                field("Home Dist";"Home Dist")
                {
                    ApplicationArea = All;
                }
                field("Deployment Start Date";Rec."Deployment Start Date")
                {
                    ApplicationArea = All;
                }
                field("Deployment End Date";"Deployment End Date")
                {
                    ApplicationArea = All;
                }
                field("Deployment Location";"Deployment Location")
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
