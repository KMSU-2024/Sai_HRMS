table 33066441 "Training History Buffer" //SS03NOV

{

    Caption = 'Training History Buffer';

    DataClassification = ToBeClassified;
 
    fields

    {

        field(1; "Entry No."; Integer)

        {

            Caption = 'Entry No.';

            AutoIncrement = true;

        }

        field(2; "HRMS ID"; Code[20])

        {

            Caption = 'HRMS ID';

        }

        field(3; "Company Name"; Text[100])

        {

            Caption = 'Company Name';

        }

        field(4; "End Date"; Date)

        {

            Caption = 'End Date';

        }

        field(5; "Duration Of Training"; Integer)

        {

            Caption = 'Duration Of Training';

        }

        field(6; "Conducted By"; Text[100])

        {

            Caption = 'Conducted By';

        }

        field(7; "Training Location"; Text[100])

        {

            Caption = 'Training Location';

        }

    }
 
    keys

    {

        key(PK; "Entry No.", "HRMS ID") { Clustered = true; }

    }

}

 
