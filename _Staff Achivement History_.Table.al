table 33065863 "Staff Achivement History"
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
        field(19;"File Name";Text[200])
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK;"Entry No")
        {
            Clustered = true;
        }
    }
    var myInt: Integer;
    ArchEmpAchivementRec: Record "Arch Staff Achivement History";
/* SS07OCT trigger OnInsert()begin
         "Created By":=UserId;
         "Created Date Time":=CurrentDateTime;
         ArchEmpAchivementRec.Reset();
         ArchEmpAchivementRec.Init();
         ArchEmpAchivementRec.TransferFields(Rec);
         ArchEmpAchivementRec.Insert(true);
     end;
     trigger OnModify()begin
         "Modified By":=UserId;
         "Modified Date Time":=CurrentDateTime;
         ArchEmpAchivementRec.Reset();
         ArchEmpAchivementRec.Init();
         ArchEmpAchivementRec.TransferFields(Rec);
         ArchEmpAchivementRec.Insert(true);
     end;
     trigger OnDelete()begin
         ArchEmpAchivementRec.Reset();
         ArchEmpAchivementRec.Init();
         ArchEmpAchivementRec.TransferFields(Rec);
         ArchEmpAchivementRec.Insert(true);
     end;
     trigger OnRename()begin
         ArchEmpAchivementRec.Reset();
         ArchEmpAchivementRec.Init();
         ArchEmpAchivementRec.TransferFields(Rec);
         ArchEmpAchivementRec.Insert(true);
     end; SS07OCT */
}
