table 33066443 "Archive Employee Transfer"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1;"Entry No";Integer)
        {
            DataClassification = SystemMetadata;
            AutoIncrement = true;
        }
        field(2;"Slno";Integer)
        {
        }
        field(3;"HRMS ID";Code[20])
        {
        }
        field(4;"Name";Text[100])
        {
        }
        field(5;"Designation";Text[100])
        {
        }
        field(6;"From Station";Code[30])
        {
        }
        field(7;"To Station";Code[30])
        {
        }
        field(8;"Transfer Date";Date)
        {
        }
        field(9;"Created Date Time";DateTime)
        {
        }
        field(10;"Created By";Code[50])
        {
        }
        field(11;"Archived DateTime";DateTime)
        {
        }
        field(12;"Archived By";Code[50])
        {
        }
    }
    keys
    {
        key(PK;"Entry No")
        {
            Clustered = true;
        }
    }
}
