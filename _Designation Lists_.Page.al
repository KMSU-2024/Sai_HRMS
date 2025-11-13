page 33065727 "Designation Lists"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Designation;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(Code;rec.Code)
                {
                    Caption = 'Designation Code';
                    ApplicationArea = All;
                }
                field(Description;rec.Description)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
