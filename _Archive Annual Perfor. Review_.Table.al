table 33065985 "Archive Annual Perfor. Review"
{
    DataClassification = ToBeClassified;
    Caption = 'Archived Annual Performance Review';

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
        field(5; "Department"; Text[30])
        {
        }
        field(6; "Academic Year"; Code[20])
        {
        }
        //Anmol start
        field(7; "Performance Rating"; Text[3])
        {
        }

        field(13; "Performance Appraisal Review"; Enum PerformanceRatingEnum)
        {
        }
        //Anmol end
        field(8; "Created By"; Code[50])
        {
        }
        field(9; "Created Date Time"; DateTime)
        {
        }
        field(10; "Modified By"; Code[50])
        {
        }
        field(11; "Modified Date Time"; DateTime)
        {
        }
        field(12; "Sl. No"; Integer)
        {
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
        archiveEmpAnnualRevieRec: Record "Archive Annual Perfor. Review";

    trigger OnInsert()
    begin
        "Created By" := UserId;
        "Created Date Time" := CurrentDateTime;
        archiveEmpAnnualRevieRec.Reset();
        if archiveEmpAnnualRevieRec.FindLast() then
            "Sl. No" := archiveEmpAnnualRevieRec."Sl. No" + 1
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
