table 33066433 "Employee Promot History Arch" //SS07OCT c
{
    DataClassification = ToBeClassified;

    fields
    {
        field(50000; "Archive Entry No."; Integer)
        {
            AutoIncrement = true;
        }
        field(1; "Entry No"; Integer)
        {
        }
        field(2; "HRMS ID"; Code[20])
        {
        }
        field(3; "Name"; Text[100])
        {
        }
        field(4; "From Designation"; Code[20])
        {
        }
        field(5; "To Designation"; Code[20])
        {
        }
        field(6; "Promotion Order Date"; Date)
        {
        }
        field(7; "Letter No"; Code[20])
        {
        }
        field(9; "Version No."; Integer)
        {
        }
        field(10; "Archived By"; Code[50])
        {
        }
        field(11; "Archived DateTime"; DateTime)
        {
        }
        field(13; "Modified By"; Code[50])
        {
            Editable = false;
        }
        field(14; "Modified Date Time"; DateTime)
        {
            Editable = false;
        }
        field(15; "Upload Promotion Order"; Blob)
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Promotion Order File Name"; Text[200])
        {
            Editable = false;
        }
        field(50100; "Company Name"; Text[100])
        {
            Caption = 'Company Name';
            Editable = false;
        }
    }
    keys
    {
        key(PK; "Archive Entry No.")
        {
            Clustered = true;
        }
    }
    procedure GetNextVersion(EmployeeNo: Code[20]): Integer
    var
        EmpArchive: Record "Employee promot history Arch";
    begin
        EmpArchive.Reset();
        EmpArchive.SetRange("HRMS ID", EmployeeNo);
        if EmpArchive.FindLast() then
            exit(EmpArchive."Version No." + 1)
        else
            exit(1);
    end;
}
