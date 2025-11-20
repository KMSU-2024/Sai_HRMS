table 33066446 "Staff Achievement History Arch" //SS07OCT c
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1;"Archive Entry No.";Integer)
        {
            AutoIncrement = true;
        }
        field(2;"Entry No";Integer)
        {
        }
        field(3;"HRMS ID";Code[20])
        {
        }
        field(4;"Employee Name";Text[100])
        {
        }
        field(5;Designation;Code[20])
        {
        }
        field(6;"Base Qualification";Text[100])
        {
        }
        field(7;"Inservice Qua. Upgradation";Boolean)
        {
        }
        field(8;Award;Boolean)
        {
        }
        field(9;"Award Details";Text[250])
        {
        }
        field(10;"Achivement Remarks";Text[250])
        {
        }
        field(11;"Academic Year";Code[10])
        {
        }
        field(90;"Version No.";Integer)
        {
        }
        field(91;"Archived By";Code[50])
        {
        }
        field(92;"Archived DateTime";DateTime)
        {
        }
    }
    keys
    {
        key(PK;"Archive Entry No.")
        {
            Clustered = true;
        }
    }
}
