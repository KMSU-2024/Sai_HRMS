page 33066425 "Annual perfomance History List"
{
    ApplicationArea = All;

    // Start anmol 288 jan 25 new Caption added
    //Caption = 'Annual Internal perfomance review History List';
    PageType = List;
    SourceTable = "Annual Performance Review";
    UsageCategory = History;
    /*  ModifyAllowed = false;
     InsertAllowed = false;
     DeleteAllowed = false; */ //MEGHA 19-11-25

    layout
    {
        area(content)
        {
            repeater(General)
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
                // field("Performance Rating"; Rec."Performance Rating")
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Specifies the value of the Performance Rating field.';
                // }
                // Added below fields
                field("Performance Appraisal Review"; Rec."Performance Appraisal Review")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    actions //SS07OCT
    {
        area(Processing)
        {
            action(ViewHistory)
            {
                Caption = 'View History';
                ApplicationArea = All;
                Image = History;
                RunObject = page "Annual Performance History";
                RunPageLink = "HRMS ID" = field("HRMS ID");
            }
        }
    }
}
