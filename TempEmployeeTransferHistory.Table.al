table 33066438 "Employee Transfer Buffer" //SS03NOV

{

    Caption = 'Employee Transfer Buffer';

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

        field(4; "Employee Name"; Text[100])

        {

            Caption = 'Employee Name';

        }

        field(5; "Designation"; Text[100])

        {

            Caption = 'Designation';

        }

        field(6; "From Station"; Text[100])

        {

            Caption = 'From Station';

        }

        field(7; "To Station"; Text[100])

        {

            Caption = 'To Station';

        }

        field(8; "Transfer Order Issuing Authority"; Text[100])

        {

            Caption = 'Transfer Order Issuing Authority';

        }
        field(10; "Relief Order No."; Code[30])
        {
        }

        field(9; "Relieve Date"; Date)

        {

            Caption = 'Relieve Date';

        }
        field(11; "Joining Date"; Date)
        {
        }
        field(18; "Promotion order date"; Date)
        {
        }
        field(19; "Promotion letter no"; Code[20])
        {
        }
        field(20; "Transfer Date"; Date)
        {
        }
        field(21; "Letter No"; Code[20])
        {
        }

        field(22; "To Designation"; Code[20])
        {
            TableRelation = Designation;
        }

        field(23; "Relieving Event"; Text[100])
        {
        }
        field(25; status; Text[100])
        {

        }
    }

    keys

    {

        key(PK; "HRMS ID", "Company Name", "Entry No.") { Clustered = true; }

    }

}

