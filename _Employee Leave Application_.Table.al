table 33065986 "Employee Leave Application"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No"; Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(2; "HRMS ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee."No.";

            trigger OnValidate()
            var
                EMPREC: Record Employee;
            begin
                EMPREC.Get("HRMS ID");
                "Employee Name" := EMPREC."First Name";
                Designation := EMPREC.Designation;
            end;
        }
        field(3; "Employee Name"; Text[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(4; Designation; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Leave From Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Leave To Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Type of Leave"; Option)
        {
            DataClassification = ToBeClassified;
            // Start Anmol 17 Jan 2025 Add Paternity and CL
            //OptionMembers = "EL","HPL","EOL","Medical Leave","Maternity Leave","Study Leave","Paternity","CL",Other;
            OptionMembers = "EL","HPL","EOL","CL","Paternity Leave","Medical Leave","Maternity Leave","Study Leave",Other;
            //OptionMembers = "EL", "HPL", "EOL", "Medical Leave", "Maternity Leave", "Study Leave", Other;
        }
        field(12; "Upload Document"; Blob)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Created By"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Created DateTime"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Modified By"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Modified DateTime"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(13; Status; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "Pending","Forwarded to Govt.","Sanctioned","Declined";
        }
        // Start Anmol 17 Jan 2025
        field(14; "Reason for Decline"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Entry No")
        {
            Clustered = true;
        }
    }
    var
        EmpLeaveAppRec: Record "Employee Leave Application";

    trigger OnInsert()
    begin
        "Created By" := UserId;
        "Created DateTime" := CurrentDateTime;
        EmpLeaveAppRec.Reset();
        if EmpLeaveAppRec.FindLast() then
            "Entry No" := EmpLeaveAppRec."Entry No" + 1
        else
            "Entry No" := 1;
    end;

    trigger OnModify()
    begin
        "Modified By" := UserId;
        "Modified DateTime" := CurrentDateTime;
    end;

    trigger OnDelete()
    begin
    end;

    trigger OnRename()
    begin
    end;
}
