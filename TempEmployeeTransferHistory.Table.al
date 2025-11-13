table 33066438 TempEmployeeTransferHistory //SS07OCT c
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
        field(4; "HRMS ID"; Code[20])
        {
        }
        field(5; "Name"; Text[100])
        {
        }
        field(6; "Designation"; Text[100])
        {
        }
        field(7; "From Station"; Text[100])
        {
        }
        field(8; "To Station"; Text[100])
        {
        }
        field(9; "Transfer Order Issuing Authority"; Text[100])
        {
        }
        field(10; "Relieve Date"; Date)
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
