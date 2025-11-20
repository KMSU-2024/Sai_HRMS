table 33065976 "Archived Employee Add Info"
{
    DataClassification = ToBeClassified;
    Caption = 'Archived Employee Add Info';

    fields
    {
        field(1;"HRMS ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee."No." where("SLCM Employee"=const(false));
        }
        field(2;"Employee Name";Text[90])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(3;"D.O.J (Service)";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Service Joining Designation";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Service Joining Station";Code[52])
        {
            DataClassification = ToBeClassified;
            TableRelation = Institute."Institute Code";
        }
        field(6;"Current Station";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Institute."Institute Code";
        }
        field(7;"Base Qualification";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Employment Status";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ", "Ad hoc", "Temporary status", "Initial appointee", "Regular";
        }
        field(9;"Date of increment";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(10;"MACP Status";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ", "Nil", "1st", "2nd", "3rd";
            NotBlank = true;
        }
        field(11;"Pension Remark";Option)
        {
            DataClassification = ToBeClassified;
            // Start Anmol 17 Jan 2025
            // OptionMembers = " ", "Regular", "NPS";
            OptionMembers = " ", "GPF", "NPS";
        }
        field(12;"Dept./Trade/Section";Text[60])
        {
            DataClassification = ToBeClassified;
            TableRelation = "List of all Dep/trades/Section"."Departments/Trades/Section";
        }
        field(13;"Entry No";Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
        field(14;"Created By";Code[50])
        {
        }
        field(15;"Created Date Time";DateTime)
        {
        }
        field(16;"Modified By";Code[50])
        {
            Editable = false;
        }
        field(17;"Modified Date Time";DateTime)
        {
            Editable = false;
        }
        field(18;"Sl. No";Integer)
        {
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
