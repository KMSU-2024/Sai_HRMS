table 33066439 "Employee Financial Upg Buffer" //SS03NOV

{

    Caption = 'Employee Financial Upgradation Buffer';

    DataClassification = ToBeClassified;

    fields

    {

        field(1; "HRMS ID"; Code[30])

        {

            Caption = 'HRMS ID';

        }

        field(2; "Company Name"; Text[100])

        {

            Caption = 'Institute';

        }

        field(3; "Entry No."; Integer)

        {

            Caption = 'Entry No.';

        }

        field(4; "Application File Name"; Text[100])

        {

            Caption = 'Application File Name';

        }

        field(5; "Current Station"; Text[50])

        {

            Caption = 'Current Station';

        }

        field(6; "Status"; Option)

        {

            Caption = 'Status';

            OptionMembers = Applied,Objected,Processed,Rejected;

        }

        field(7; "Sl No."; Integer)

        {

            Caption = 'Serial No.';

        }

        field(8; "Effective Date Of MACP"; Date)

        {

            Caption = 'Effective Date Of MACP';

        }

        field(9; "No of Versions"; Integer)

        {

            Caption = 'No. of Versions';

        }

        field(10; "Modified Date Time"; DateTime)

        {

            Caption = 'Modified Date Time';

        }

    }

    keys

    {

        key(PK; "HRMS ID", "Company Name", "Entry No.") { Clustered = true; }

    }

}

