table 33065973 "Financial Upg App history"
{
    DataClassification = ToBeClassified;
    Caption = 'Archieved Financial Upg Appplication';
    LookupPageId = "Financial Upg Application"; //ss16oct
    DrillDownPageId = "Financial Upg Application"; //ss16oct

    fields
    {
        field(1;"HRMS ID";Code[20])
        {
            Caption = 'HRMS ID';
            DataClassification = ToBeClassified;
            TableRelation = Employee."No.";

            trigger OnValidate()var EmplRec: Record Employee;
            begin
                if EmplRec.Get("HRMS ID")then if EmplRec."Middle Name" <> '' then Name:=EmplRec."First Name" + ' ' + EmplRec."Middle Name" + ' ' + EmplRec."Last Name"
                    else
                        Name:=EmplRec."First Name" + ' ' + EmplRec."Last Name";
                Designation:=EmplRec.Designation;
            end;
        }
        field(2;Name;Text[90])
        {
            Caption = 'Employee Name';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(3;Designation;Code[20])
        {
        }
        field(4;"Date of application upload";Date)
        {
            Caption = 'Date of application upload';
            DataClassification = ToBeClassified;
        }
        field(5;"Type";Option)
        {
            Caption = 'Type';
            DataClassification = ToBeClassified;
            OptionMembers = " ", MACP, RACP;
        }
        field(6;"Application file";Blob)
        {
            Caption = 'Application file';
            DataClassification = ToBeClassified;
        }
        field(7;"Application file name";Text[100])
        {
            Caption = 'Application file Name';
            DataClassification = ToBeClassified;
        }
        field(8;"Current Station";Text[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Institute."Institute Code";
        }
        field(9;"Entry No.";Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
        field(12;"User Id";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Modified Date Time";DateTime)
        {
            DataClassification = ToBeClassified;
        }
        // Start Anmol 29 jan 25
        field(14;"Effective Date Of MACP";Date)
        {
            DataClassification = ToBeClassified;
        }
        //SS07OCT START
        field(15;"no of versions";Integer)
        {
            Caption = 'No of Versions';
        }
        field(16;"college code";code[20])
        {
        }
        //SS07OCT end
        field(10;"Status";Option)
        {
            OptionMembers = Applied, Objected, Processed, Rejected;
        }
        // Start Anmol 
        field(11;"Sl_no";Integer)
        {
            DataClassification = ToBeClassified;
        // AutoIncrement = true;
        }
        //ss16oct start
        field(17;"Isconfirmed";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(18;"Increment Amount";Decimal)
        {
            Caption = 'Increment Amount';
            DataClassification = ToBeClassified;
            DecimalPlaces = 2: 2;
        }
        field(22;"Type of increment";Option)
        {
            OptionMembers = "Annual increment", "Promotional increment";
        } //ss16oct end
    }
    keys
    {
        key(pk;Sl_no)
        {
            Clustered = true;
        }
    }
    var myInt: Integer;
    trigger OnInsert()begin
        "Modified Date Time":=CurrentDateTime;
        "User Id":=UserId;
    end;
    trigger OnModify()begin
    end;
    trigger OnDelete()begin
    end;
    trigger OnRename()begin
    end;
}
