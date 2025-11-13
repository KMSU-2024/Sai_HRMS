table 33065984 "Archive Employee Training Hist"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1;"Entry No";Integer)
        {
            AutoIncrement = true;
        }
        field(2;"HRMS ID";Code[20])
        {
        }
        field(3;Name;Text[90])
        {
        }
        field(4;"Designation";Code[20])
        {
        }
        field(5;"Type Of Training";Enum "Type Of Training")
        {
        }
        field(6;"Course Name";Text[30])
        {
        }
        field(7;"Start Date";Date)
        {
        }
        field(8;"EndDate";Date)
        {
        }
        field(9;"Duration Of Training";Integer)
        {
        }
        field(10;"Conducted By";Text[30])
        {
        }
        field(11;"Training Location";Text[30])
        {
        }
        field(12;"Created By";Code[50])
        {
        }
        field(13;"Created Date Time";DateTime)
        {
        }
        field(14;"Modified By";Code[50])
        {
        }
        field(15;"Modified Date Time";DateTime)
        {
        }
        field(16;"Certificate FileName";Text[100])
        {
        }
        field(17;"Certificate";Blob)
        {
        }
        field(50000;"Sl. No";Integer)
        {
        }
    }
    keys
    {
        key(PK;"Sl. No")
        {
            Clustered = true;
        }
    }
    var ArchiveEmpTrainingRec: Record "Archive Employee Training Hist";
    trigger OnInsert()begin
        "Created By":=UserId;
        "Created Date Time":=CurrentDateTime;
        ArchiveEmpTrainingRec.Reset();
        if ArchiveEmpTrainingRec.FindLast()then "Sl. No":=ArchiveEmpTrainingRec."Sl. No" + 1
        else
            "Sl. No":=1;
    end;
    trigger OnModify()begin
        "Modified By":=UserId;
        "Modified Date Time":=CurrentDateTime;
    end;
    trigger OnDelete()begin
    end;
    trigger OnRename()begin
    end;
}
