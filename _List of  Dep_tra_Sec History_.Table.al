table 33065975 "List of  Dep/tra/Sec History"
{
    DataClassification = ToBeClassified;
    // LookupPageId = 50204;
    Caption = 'List of all Dep/trades/Section History';

    fields
    {
        field(1;"Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ", "Departments", "Trades", "Section";
        }
        field(2;"Departments/Trades/Section";Text[60])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Entry No";Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
        field(4;"Created By";Code[50])
        {
        }
        field(5;"Created Date Time";DateTime)
        {
        }
        field(6;"Modified By";Code[50])
        {
            Editable = false;
        }
        field(7;"Modified Date Time";DateTime)
        {
            Editable = false;
        }
        field(8;"Sl. No";Integer)
        {
            Editable = false;
        }
        field(9;"Gen. Prod. Posting Group";Code[20])
        {
            TableRelation = "Gen. Product Posting Group";
        }
    }
    keys
    {
        key(pk;"Sl. No")
        {
            Clustered = true;
        }
    }
    var myInt: Integer;
    trigger OnInsert()begin
        "Created By":=UserId;
        "Created Date Time":=CurrentDateTime;
    end;
    trigger OnModify()begin
    end;
    trigger OnDelete()begin
    end;
    trigger OnRename()begin
    end;
}
