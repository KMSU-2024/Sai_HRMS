tableextension 33066137 SalesReceivableSetupExt extends "Sales & Receivables Setup"
{
    fields
    {
        field(50100; "Sanctioned Post No."; Code[20])
        {
            TableRelation = "No. Series";
        }
    }
    keys
    {
        // Add changes to keys here
    }
    fieldgroups
    {
        // Add changes to field groups here
    }
    var
        myInt: Integer;
}
