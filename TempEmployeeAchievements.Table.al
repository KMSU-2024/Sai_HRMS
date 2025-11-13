table 33066437 TempEmployeeAchievements ////SS07OCT c
{
    DataClassification = ToBeClassified;
    //TableType = Temporary;

    fields
    {
        field(1; "Line ID"; Integer)
        {
        }
        field(2; "Company Name"; Text[100])
        {
        }
        field(3; "Archive Entry No."; Integer)
        {
            AutoIncrement = true;
        }
        field(4; "Entry No"; Integer)
        {
        }
        field(5; "HRMS ID"; Code[20])
        {
        }
        field(6; "Employee Name"; Text[100])
        {
        }
        field(7; Designation; Code[20])
        {
        }
        field(8; "Base Qualification"; Text[100])
        {
        }
        field(9; "Inservice Qua. Upgradation"; Boolean)
        {
        }
        field(10; Award; Boolean)
        {
        }
        field(11; "Award Details"; Text[250])
        {
        }
        field(12; "Achivement Remarks"; Text[250])
        {
        }
        field(13; "Academic Year"; Code[10])
        {
        }
        field(90; "Version No."; Integer)
        {
        }
        field(91; "Archived By"; Code[50])
        {
        }
        field(92; "Archived DateTime"; DateTime)
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
