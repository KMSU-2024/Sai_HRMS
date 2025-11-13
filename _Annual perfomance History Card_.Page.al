page 33065722 "Annual perfomance History Card"
{
    //ApplicationArea = All;
    Caption = 'Annual Internal perfomance review History Card';
    PageType = Card;
    SourceTable = "Annual Performance Review";

    //UsageCategory = History;
    //ModifyAllowed = false;
    //InsertAllowed = false;
    //DeleteAllowed = false;
    layout
    {
        area(content)
        {
            group(General)
            {
                field("HRMS ID"; Rec."HRMS ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the HRMS ID field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field(Designation; Rec.Designation)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Designation field.';
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field("Academic Year"; Rec."Academic Year")
                {
                    // Caption = 'Financial Year';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Academic Year field.';
                }
                // Start Anmol 27 jan 25
                // field("Performance Rating";Rec."Performance Rating")
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Specifies the value of the Performance Rating field.';
                // }
                field("Performance Appraisal Review"; Rec."Performance Appraisal Review")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Performance Rating field.';
                }
                // end anmol 27 jan 25
            }
        }
    }
}
