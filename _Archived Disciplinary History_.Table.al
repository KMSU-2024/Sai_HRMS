table 33065982 "Archived Disciplinary History"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No"; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "HRMS ID"; Code[20])
        {
        }
        field(3; Name; Text[90])
        {
        }
        field(4; "Designation"; Code[20])
        {
        }
        field(5; "Disciplinary Charges"; Text[50])
        {
        }
        field(6; "Disciplinary CaseLetter No"; Code[20])
        {
        }
        field(7; "Disciplinary CaseDate"; Date)
        {
        }
        field(8; "Disciplinary CaseStatus"; Enum "Discipinary CaseStatus")
        {
        }
        field(9; "WhetherPlaced under suspension"; Boolean)
        {
        }
        field(10; "Whether reinstated"; Boolean)
        {
        }
        field(11; "Created By"; Code[50])
        {
        }
        field(12; "Created Date Time"; DateTime)
        {
        }
        field(13; "Modified By"; Code[50])
        {
        }
        field(14; "Modified Date Time"; DateTime)
        {
        }
        field(15; "Sl. No"; Integer)
        {
        }
        //Start Anmol  28 jan 25 filed added
        field(17; VigilanceCasePending; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Sl. No")
        {
            Clustered = true;
        }
    }
    var
        archiveDiscpRec: Record "Archived Disciplinary History";

    trigger OnInsert()
    begin
        "Created By" := UserId;
        "Created Date Time" := CurrentDateTime;
        archiveDiscpRec.Reset();
        if archiveDiscpRec.FindLast() then
            "Sl. No" := archiveDiscpRec."Sl. No" + 1
        else
            "Sl. No" := 1;
    end;

    trigger OnModify()
    begin
        "Modified By" := UserId;
        "Modified Date Time" := CurrentDateTime;
    end;

    trigger OnDelete()
    begin
    end;

    trigger OnRename()
    begin
    end;
}
