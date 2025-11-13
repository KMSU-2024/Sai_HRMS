table 33066444 "Employee Diary Summary"
{
    Caption = 'Employee Diary Summary';
    DataClassification = ToBeClassified;

    fields
    {
        field(1;"Current Station";Code[100])
        {
            Caption = 'Current Station';
        }
        field(2;"Total Employees";Integer)
        {
            Caption = 'Total Employees';
        }
        field(3;"Active Employees";Integer)
        {
            Caption = 'Active Employees';
        }
        field(4;"Inactive Employees";Integer)
        {
            Caption = 'Inactive Employees';
        }
        field(5;"Last Updated";DateTime)
        {
            Caption = 'Last Updated';
            Editable = false;
        }
    }
    keys
    {
        key(PK;"Current Station")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()begin
        "Last Updated":=CurrentDateTime;
    end;
    trigger OnModify()begin
        "Last Updated":=CurrentDateTime;
    end;
}
