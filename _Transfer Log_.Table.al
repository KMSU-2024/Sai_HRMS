table 33066435 "Transfer Log" //SS07OCT c
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "HRMS ID"; Code[20])
        {
        }
        field(3; "Table Name"; Text[100])
        {
        }
        field(4; "Record Count"; Integer)
        {
        }
        field(5; "Message"; Text[250])
        {
        }
        field(6; "Inserted At"; DateTime)
        {
        }
        field(7; "Inserted By"; Code[50])
        {
        }
    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
}
