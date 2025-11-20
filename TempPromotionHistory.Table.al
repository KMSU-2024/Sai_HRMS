table 33066440 "Promotion History Buffer" //SS17nov
{
    Caption = 'Promotion History Buffer';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "HRMS ID"; Code[20])
        {
            Caption = 'HRMS ID';
        }
        field(2; "Company Name"; Text[100])
        {
            Caption = 'Company Name';
        }
        field(3; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
        field(4; "From Designation"; Text[100])
        {
            Caption = 'From Designation';
        }
        field(5; "To Designation"; Text[100])
        {
            Caption = 'To Designation';
        }
        field(6; "Promotion Order Date"; Date)
        {
            Caption = 'Promotion Order Date';
        }
        field(7; "Letter No"; Code[50])
        {
            Caption = 'Letter No.';
        }
        field(8; "Order Issuing Authority"; Text[100])
        {
            Caption = 'Order Issuing Authority';
        }
        field(9; "Version"; Integer)
        {
            Caption = 'Version';
        }
        field(10; Name; Text[100])
        {
            Caption = 'Name';
        }
    }

    keys
    {
        key(PK; "HRMS ID", "Company Name", "Entry No.") { Clustered = true; }
    }
}