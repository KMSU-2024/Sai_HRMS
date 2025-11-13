table 33065972 "Annual Estab Review History"
{
    DataClassification = ToBeClassified;
    caption = 'Annual Establishment Review History';

    fields
    {
        field(1;"Sl.No";Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
        field(2;"Establishment Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ", "Part – A (Regular Establishment)", "Part – C (Non-regular Establishment)", "Part – E (Outsourced/ on contract)";
        }
        field(3;"Post Group";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ", A, C, E;
        }
        field(4;"Dept./Trade/Section";Text[60])
        {
            DataClassification = ToBeClassified;
            TableRelation = "List of all Dep/trades/Section"."Departments/Trades/Section";
        }
        field(5;Designation;Code[20])
        {
            DataClassification = ToBeClassified;
        // OptionMembers = " ",Principal,"Senior Lecturer",Lecturer,ATO,"TO","Training Superintendent","Section Officer","Assistant Section Officer"," Laboratory Assistant","Librarian","Junior Assistant";
        }
        field(6;"Pay Scale GP";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Pay scale 6th pay";text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Pay Scale level 7th pay";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Sanctioned Strength";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Persons in Position ";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Vacancy Position ";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Excess Post";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Academic Year";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Remark";Text[100])
        {
            Caption = 'Remark if any';
            DataClassification = ToBeClassified;
        }
        field(15;"Institution Name";Text[90])
        {
            DataClassification = ToBeClassified;

            trigger OnLookup()var instituderec: Record Institute;
            begin
                instituderec.reset;
                if instituderec.FindSet()then;
                IF PAGE.RUNMODAL(PAGE::"Institute Lists", instituderec) = ACTION::LookupOK THEN rec."Institution Name":=instituderec."Institute Name";
            end;
        }
        field(16;"Employee Catagory";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "Group A", "Group B", "Group C", "Group D";
        }
        field(17;"Entry No";Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(18;"User Id ";Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(19;"Modified DateTime";DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }
    keys
    {
        key(pk;"Entry No")
        {
            Clustered = true;
        }
    }
    var myInt: Integer;
    trigger OnInsert()begin
        "Modified DateTime":=CurrentDateTime;
        "User Id ":=UserId;
    end;
    trigger OnModify()begin
    end;
    trigger OnDelete()begin
    end;
    trigger OnRename()begin
    end;
}
