table 33066440 TempPromotionHistory //SS07OCT c
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
        field(5; "From Designation"; Text[100])
        {
        }
        field(6; "To Designation"; Text[100])
        {
        }
        field(7; "Promotion Order Date"; Date)
        {
        }
        field(8; "Letter No"; Code[50])
        {
        }
        field(9; "Order Issuing Authority"; Text[100])
        {
        }
        field(10; versions; Integer)
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
