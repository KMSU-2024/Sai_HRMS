table 33065974 "archived Court Cases "
{
    DataClassification = ToBeClassified;
    Caption = 'Court Cases';

    fields
    {
        field(1;"Case No.";Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Case No.';
        }
        field(2;"Year of filing";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Name of the Court";Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(4;Place;Text[60])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Petitioner Name";Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Opposite Party Name";Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Lowest level office hierarchy";Code[20])
        {
            Caption = 'Lowest level office in the hierarchy';
            DataClassification = ToBeClassified;
        }
        field(8;"Matter Relating to";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ", "Land Building", "Criminal", "Tax", "Service matter", "Certificate matter", "Academics", "Admission", "SCTE&VT", "Other";
        }
        field(9;"Last Case Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Case Status";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Entry No";Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
        field(12;"Sl. No";Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(13;"User Id";Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(14;"Modified DateTime";DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
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
    end;
    trigger OnModify()begin
    end;
    trigger OnDelete()begin
    end;
    trigger OnRename()begin
    end;
}
