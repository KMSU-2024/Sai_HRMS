pageextension 33066132 SalesReceivableSetup extends "Sales & Receivables Setup"
{
    layout
    {
        addafter("Price List Nos.")
        {
            field("Sanctioned Post No.";Rec."Sanctioned Post No.")
            {
                ApplicationArea = all;
            }
        }
    }
    var myInt: Integer;
}
