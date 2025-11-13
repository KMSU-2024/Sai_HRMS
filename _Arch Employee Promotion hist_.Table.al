table 33065980 "Arch Employee Promotion hist"
{
    DataClassification = ToBeClassified;
    Caption = 'Archived Employee Promotion History';

    fields
    {
        field(1; "Entry No"; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "HRMS ID"; Code[20])
        {
        }
        field(3; "Name"; Text[90])
        {
        }
        // Start Anmol 20 Feb 2025
        // field(4;"From Designation";Code[20])
        // {
        // }
        // field(5;"To Designation";Code[20])
        // {
        //     Caption = 'Promoted To';
        // }
        field(4; "From Designation"; Code[100])
        {
        }
        field(5; "To Designation"; Code[100])
        {
            Caption = 'Promoted To';
        }
        // End Anmol 20 Feb 2025
        field(6; "Promotion Order Date"; Date)
        {
        }
        field(7; "Letter NO"; Code[20])
        {
        }
        field(8; "Created By"; Code[50])
        {
        }
        field(9; "Created Date Time"; DateTime)
        {
        }
        field(10; "Modified By"; Code[50])
        {
            Editable = false;
        }
        field(11; "Modified Date Time"; DateTime)
        {
            Editable = false;
        }
        field(50000; "Sl. No"; Integer)
        {
            Editable = false;
        }
        field(13; "Promotion Oredr"; Blob)
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Promotion Order File Name"; Text[200])
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
        myInt: Integer;
        ArcEmpPromotionHistRec: Record "Arch Employee Promotion hist";

    trigger OnInsert()
    begin
        "Created By" := UserId;
        "Created Date Time" := CurrentDateTime;
        ArcEmpPromotionHistRec.Reset();
        if ArcEmpPromotionHistRec.FindLast() then
            "Sl. No" := ArcEmpPromotionHistRec."Sl. No" + 1
        else
            "Sl. No" := 1;
    end;

    trigger OnModify()
    begin
    end;

    trigger OnDelete()
    begin
    end;

    trigger OnRename()
    begin
    end;
}
