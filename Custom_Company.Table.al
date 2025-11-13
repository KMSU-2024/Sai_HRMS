table 33065987 Custom_Company
{
    Caption = 'Custom_Company';
    DataClassification = ToBeClassified;
    DataPerCompany = false;

    fields
    {
        field(1;"Type";Option)
        {
            Caption = 'Type';
            DataClassification = ToBeClassified;
            OptionMembers = Polytechnics, ITI;
        }
        field(2;Name;Text[30])
        {
            Caption = 'Name';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK;"Type", Name)
        {
            Clustered = true;
        }
    }
}
