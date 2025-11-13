table 33065977 "Archived RTI monitoring"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1;"Type of Application";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ", "To PIO", "To First Appellate Authority";
        }
        field(2;"Application No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Name of the applicant";Text[60])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Date of Receipt of application";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Reply Due Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Reply Sent";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Yes, No;
        }
        field(7;"Type of Reply";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ", Rejected, "Asked to deposit dues", "Further Compliances", "Information Supplied";
        }
        field(8;"Reply Letter Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Letter No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Letter Dispatch Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(11;Remark;Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Entry No.";Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
        field(13;"Sl. No.";Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(14;"Modified by";Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(15;"Modified datetime";DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }
    keys
    {
        key(pk;"Sl. No.")
        {
            Clustered = true;
        }
    }
    var myInt: Integer;
    trigger OnInsert()begin
        "Modified by":=UserId;
        "Modified datetime":=CurrentDateTime;
    end;
    trigger OnModify()begin
    end;
    trigger OnDelete()begin
    end;
    trigger OnRename()begin
    end;
}
