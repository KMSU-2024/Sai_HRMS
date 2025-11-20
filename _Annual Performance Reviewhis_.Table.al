table 33066432 "Annual Performance Reviewhis" //SS07OCT c
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "HRMS ID"; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(2; Name; Text[90])
        {
            DataClassification = CustomerContent;
        }
        field(3; Designation; Text[30])
        {
            DataClassification = CustomerContent;
        }
        field(4; Department; Text[30])
        {
            DataClassification = CustomerContent;
        }
        field(5; "Academic Year"; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = "Academic Year".Code;
        }
        field(6; "Performance Appraisal Review"; Enum PerformanceRatingEnum)
        {
            DataClassification = CustomerContent;
        }
        field(7; "Modified By"; Code[50])
        {
            DataClassification = SystemMetadata;
        }
        field(8; "Modified Date Time"; DateTime)
        {
            DataClassification = SystemMetadata;
        }
    }
    keys
    {
        key(PK; "HRMS ID", "Academic Year")
        {
            Clustered = true;
        } // Unique per employee & year
    }
}
