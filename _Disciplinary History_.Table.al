table 33065864 "Disciplinary History"
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
        // Start Anmol
        field(5;"Disciplinary Charges";Text[50])
        {
        }
        field(18;"Disciplinary Charges File Name";Text[100])
        {
        }
        field(16;"Upload Disciplinary ChargesDoc";Blob)
        {
            DataClassification = ToBeClassified;
        }
        // End Anmol
        field(6;"Disciplinary CaseLetter No";Code[20])
        {
        }
        field(7;"Disciplinary CaseDate";Date)
        {
        }
        field(8;"Disciplinary CaseStatus";Enum "Discipinary CaseStatus")
        {
        }
        field(9;"WhetherPlaced under suspension";Boolean)
        {
        }
        field(10;"Whether reinstated";Boolean)
        {
        }
        field(11;"Created By";Code[50])
        {
        }
        field(12;"Created Date Time";DateTime)
        {
        }
        field(13;"Modified By";Code[50])
        {
        }
        field(14;"Modified Date Time";DateTime)
        {
        }
        // Start Anmol 27 jan 25
        field(15;"Sl. No";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(17;VigilanceCasePending;Boolean)
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
    ArchiveEmployeeDisplaneRec: Record "Archived Disciplinary History";
    trigger OnInsert()begin
        "Created By":=UserId;
        "Created Date Time":=CurrentDateTime;
        ArchiveEmployeeDisplaneRec.Reset();
        ArchiveEmployeeDisplaneRec.Init();
        ArchiveEmployeeDisplaneRec.TransferFields(Rec);
        ArchiveEmployeeDisplaneRec.Insert(true);
    end;
    trigger OnModify()begin
        "Modified By":=UserId;
        "Modified Date Time":=CurrentDateTime;
        ArchiveEmployeeDisplaneRec.Reset();
        ArchiveEmployeeDisplaneRec.Init();
        ArchiveEmployeeDisplaneRec.TransferFields(Rec);
        ArchiveEmployeeDisplaneRec.Insert(true);
    end;
    trigger OnDelete()begin
        ArchiveEmployeeDisplaneRec.Reset();
        ArchiveEmployeeDisplaneRec.Init();
        ArchiveEmployeeDisplaneRec.TransferFields(Rec);
        ArchiveEmployeeDisplaneRec.Insert(true);
    end;
    trigger OnRename()begin
        ArchiveEmployeeDisplaneRec.Reset();
        ArchiveEmployeeDisplaneRec.Init();
        ArchiveEmployeeDisplaneRec.TransferFields(Rec);
        ArchiveEmployeeDisplaneRec.Insert(true);
    end;
}
