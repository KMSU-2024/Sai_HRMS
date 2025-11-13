page 33066444 Custom_Companies
{
    ApplicationArea = All;
    Caption = 'Custom_Companies';
    PageType = List;
    SourceTable = Custom_Company;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Type";Rec."Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field(Name;Rec.Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Name field.';
                }
            }
        }
    }
}
