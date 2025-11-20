table 33065969 "Transfer Application Employee"
{
    DataClassification = ToBeClassified;
    Caption = 'Transfer application';

    fields
    {
        field(1;"Sl. No";Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
        field(2;"HRMS ID";Code[20])
        {
            Caption = 'HRMS ID';
            DataClassification = ToBeClassified;
            TableRelation = Employee."No." where("SLCM Employee"=const(false));

            trigger OnValidate()var EmplRec: Record Employee;
            begin
                if EmplRec.Get("HRMS ID")then if EmplRec."Middle Name" <> '' then "Employee Name":=EmplRec."First Name" + ' ' + EmplRec."Middle Name" + ' ' + EmplRec."Last Name"
                    else
                        "Employee Name":=EmplRec."First Name" + ' ' + EmplRec."Last Name";
                Designation:=EmplRec.Designation;
            end;
        }
        field(3;"Employee Name";Text[90])
        {
            Caption = 'Employee Name';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(4;Designation;Code[20])
        {
        }
        field(5;"Date of transfer application";Date)
        {
            Caption = 'Date of transfer application';
            DataClassification = ToBeClassified;
        }
        field(6;Ground;Option)
        {
            Caption = 'Ground';
            DataClassification = ToBeClassified;
            OptionMembers = " ", "Medical Ground - Self", "Medical ground - Dependents", "Child Education", "Other";
        }
        field(7;"First Preference";Code[20])
        {
            Caption = 'First Preference';
            DataClassification = ToBeClassified;
            TableRelation = District.Code;
        }
        field(8;"Second Preference";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = District.Code;
        }
        field(9;"Third Preference";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = District.Code;
        }
        field(10;"Upload Document";Blob)
        {
            DataClassification = ToBeClassified;
        }
        field(11;"File Name";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        // Start Anmol 20 Feb 2025
        // field(12;"Current Station";Code[20])
        // {
        //     DataClassification = ToBeClassified;
        // }
        field(12;"Current Station";Code[100])
        {
            DataClassification = ToBeClassified;
        }
        // End Anmol20 Feb 2025
        field(13;"Status";Option)
        {
            OptionMembers = Submitted, Processed, Rejected;
        }
        field(14;"Reason for rejection";Text[250])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()var myInt: Integer;
            begin
                TestField(Status, Status::Rejected);
            end;
        }
    }
    keys
    {
        key(pk;"Sl. No", "HRMS ID")
        {
            Clustered = true;
        }
    }
    var EntNo: Integer;
    ArchiveTrabsferAppRec: Record "Archived Transfer App Employee";
    trigger OnInsert()begin
        ArchiveTrabsferAppRec.Reset();
        ArchiveTrabsferAppRec.Init();
        ArchiveTrabsferAppRec.TransferFields(Rec);
        ArchiveTrabsferAppRec.Insert(true)end;
    trigger OnModify()begin
        ArchiveTrabsferAppRec.Reset();
        ArchiveTrabsferAppRec.Init();
        ArchiveTrabsferAppRec.TransferFields(Rec);
        ArchiveTrabsferAppRec.Insert(true)end;
    trigger OnDelete()begin
        ArchiveTrabsferAppRec.Reset();
        ArchiveTrabsferAppRec.Init();
        ArchiveTrabsferAppRec.TransferFields(Rec);
        ArchiveTrabsferAppRec.Insert(true)end;
    trigger OnRename()begin
        ArchiveTrabsferAppRec.Reset();
        ArchiveTrabsferAppRec.Init();
        ArchiveTrabsferAppRec.TransferFields(Rec);
        ArchiveTrabsferAppRec.Insert(true)end;
}
