table 33065979 "Archived Trans Joining History"
{
    DataClassification = ToBeClassified;
    Caption = 'Archived Transfer Joining History';

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
        field(4; "Designation"; Code[20])
        {
            Caption = 'From Designation';
        }
        // Start Anmol 20 Feb 2025
        // field(5;"From Station";Code[20])
        // {
        // }
        // field(6;"To Station";Code[20])
        // {
        // }
        field(5; "From Station"; Code[100])
        {
        }
        field(6; "To Station"; Code[100])
        {
        }
        // End Anmol 20 Feb 2025
        field(7; "Transfer Date"; Date)
        {
        }
        field(8; "Letter No"; Code[20])
        {
        }
        field(9; "Relieving Event"; Enum "Relieving Event")
        {
        }
        field(10; "Joining Event"; Enum "Joining Event")
        {
        }
        field(11; "Joining Date"; Date)
        {
        }
        field(12; "Status"; Option)
        {
            OptionMembers = Relieved,Joined;
        }
        field(13; "Created By"; Code[50])
        {
        }
        field(14; "Created Date Time"; DateTime)
        {
        }
        field(15; "Modified By"; Code[50])
        {
        }
        field(16; "Modified Date Time"; DateTime)
        {
        }
        field(17; "To Designation"; Code[20])
        {
            TableRelation = Designation;
        }
        field(18; "Promotion order date"; Date)
        {
        }
        field(19; "Promotion letter no"; Code[20])
        {
        }
        field(20; "Order Issuing Authority"; Option)
        {
            OptionMembers = "DTE&T","SDTE";
        }
        field(21; "Relief Order No."; Code[30])
        {
        }
        field(22; "Relief Order Date"; Date)
        {
        }
        field(50000; "Sl. No"; Integer)
        {
            Editable = false;
        }
        field(23; "Upload Transfer Order"; Blob)
        {
            DataClassification = ToBeClassified;
        }
        field(24; "Transfer Order File Name"; Text[200])
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key("PK"; "Sl. No")
        {
            Clustered = true;
        }
    }
    var
        myInt: Integer;
        ArchiveTransferJoinRec: Record "Archived Trans Joining History";

    trigger OnInsert()
    begin
        "Created By" := UserId;
        "Created Date Time" := CurrentDateTime;
        ArchiveTransferJoinRec.Reset();
        if ArchiveTransferJoinRec.FindLast() then
            "Sl. No" := ArchiveTransferJoinRec."Sl. No" + 1
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
