table 33065869 "Designation"
{
    DataClassification = ToBeClassified;
    LookupPageId = "Designation Lists";
    DrillDownPageId = "Designation Lists";

    fields
    {
        field(1;Code;Code[20])
        {
        }
        field(2;Description;Text[50])
        {
        }
    }
    keys
    {
        key(PK;"Code")
        {
            Clustered = true;
        }
    }
    var myInt: Integer;
    trigger OnInsert()begin
    end;
    trigger OnModify()begin
    end;
    trigger OnDelete()begin
    end;
    trigger OnRename()begin
    end;
}
