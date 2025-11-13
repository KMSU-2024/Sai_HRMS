table 33066441 TempTrainingHistory //SS07OCT c
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
        field(5; "EndDate"; Date)
        {
        }
        field(6; "Duration Of Training"; Integer)
        {
        }
        field(7; "Conducted By"; Text[100])
        {
        }
        field(8; "Training Location"; Text[100])
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
