table 33066439 TempFinancialUpgHistory //SS07OCT c
{
    DataClassification = ToBeClassified;
    TableType = Temporary;

    fields
    {
        field(1; "Line ID"; Integer)
        {
        }
        field(2; "Company Name"; Text[100])
        {
        }
        field(3; "Entry No"; Integer)
        {
        }
        field(4; "Application File Name"; Text[100])
        {
        }
        field(5; "Current Station"; Text[50])
        {
        }
        field(6; "Status"; Option)
        {
            OptionMembers = Applied,Objected,Processed,Rejected;
        }
        field(7; "Sl_no"; Integer)
        {
        }
        field(8; "Effective Date Of MACP"; Date)
        {
        }
        field(9; "No of Versions"; Integer)
        {
        }
        field(10; "HRMS Id"; Code[30])
        {
        }
        field(11; "Modified Date Time"; DateTime)
        {
        }
    }
    keys
    {
        key(PK; "Line ID")
        {
            Clustered = true;
        }
    }
}
