page 33065723 "Court Case Card"
{
    //ApplicationArea = All;
    Caption = 'Court Case Card';
    PageType = Card;
    SourceTable = "Court Cases";

    //UsageCategory = History;
    //InsertAllowed = false;
    //DeleteAllowed = false;
    //ModifyAllowed = false;
    layout
    {
        area(content)
        {
            group(General)
            {
                field("Entry No";Rec."Entry No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Entry No field.';
                }
                field("Case No.";Rec."Case No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Case No. field.';
                }
                field("Year of filing";Rec."Year of filing")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Year of filing field.';
                }
                field("Name of the Court";Rec."Name of the Court")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Name of the Court field.';
                }
                field(Place;Rec.Place)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Place field.';
                }
                field("Petitioner Name";Rec."Petitioner Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Petitioner Name field.';
                }
                field("Opposite Party Name";Rec."Opposite Party Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Opposite Party Name field.';
                }
                field("Matter Relating to";Rec."Matter Relating to")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Matter Relating to field.';
                }
                field("Lowest level office In The hierarchy(Relating To This Case)";Rec."Lowest level office hierarchy")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Lowest level office in the hierarchy field.';
                }
                field("Last Case Date";Rec."Last Case Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Last Case Date field.';
                }
                field("Case Status";Rec."Case Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Case Status field.';
                }
            }
        }
    }
}
