page 33065730 "Dep/trades/Section Lists"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "List of all Dep/trades/Section";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Entry No";rec."Entry No")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Type";rec."Type")
                {
                    ApplicationArea = All;
                }
                field("Departments/Trades/Section";rec."Departments/Trades/Section")
                {
                    ApplicationArea = All;
                }
                field("Gen. Prod. Posting Group";"Gen. Prod. Posting Group")
                {
                    ApplicationArea = All;
                }
                field("User ID";"User ID")
                {
                    ApplicationArea = All;
                }
                field(Location;Location)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    var myInt: Integer;
}
