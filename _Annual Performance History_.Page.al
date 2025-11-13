page 33065490 "Annual Performance History" //SS07OCT c
{
    ApplicationArea = All;
    PageType = List;
    SourceTable = "Annual Performance Reviewhis";
    UsageCategory = History;
    ModifyAllowed = false;
    InsertAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("HRMS ID"; Rec."HRMS ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the HRMS ID.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                }
                field(Designation; Rec.Designation)
                {
                    ApplicationArea = All;
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = All;
                }
                field("Academic Year"; Rec."Academic Year")
                {
                    ApplicationArea = All;
                }
                field("Performance Appraisal Review"; Rec."Performance Appraisal Review")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
