table 33065981 "Arch Staff Achivement History"
{
    DataClassification = ToBeClassified;
    Caption = 'Archived Staff Achivement History';

    fields
    {
        field(1;"Entry No";Integer)
        {
            AutoIncrement = true;
        }
        field(2;"HRMS ID";Code[20])
        {
        }
        field(3;"Name";Text[90])
        {
        }
        field(4;"Designation";Code[20])
        {
        }
        field(5;"Base Qualification";Text[50])
        {
        }
        field(6;"Inservice Qua. Upgradation";Boolean)
        {
        }
        field(7;"Award";Boolean)
        {
        }
        field(8;"Achivement Remarks";Text[250])
        {
        }
        field(9;"Academic Year";Code[20])
        {
        }
        field(10;"Created By";Code[50])
        {
        }
        field(11;"Created Date Time";DateTime)
        {
        }
        field(12;"Modified By";Code[50])
        {
        }
        field(13;"Modified Date Time";DateTime)
        {
        }
        field(14;"Certificate FileName";Text[100])
        {
        }
        field(15;"Certificate";Blob)
        {
        }
        field(16;"Award Details";Text[250])
        {
        }
        field(17;"Inservise Qualification Detail";Text[250])
        {
        }
        field(18;"Sl. No";integer)
        {
        }
        field(19;"File Name";Text[200])
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK;"Sl. No")
        {
            Clustered = true;
        }
    }
    var myInt: Integer;
    ArchEmpAchivementRec: Record "Arch Staff Achivement History";
    trigger OnInsert()begin
        "Created By":=UserId;
        "Created Date Time":=CurrentDateTime;
        ArchEmpAchivementRec.Reset();
        if ArchEmpAchivementRec.FindLast()then "Sl. No":=ArchEmpAchivementRec."Sl. No" + 1
        else
            "Sl. No":=1;
    end;
    trigger OnModify()begin
    end;
    trigger OnDelete()begin
    end;
    trigger OnRename()begin
    end;
}
