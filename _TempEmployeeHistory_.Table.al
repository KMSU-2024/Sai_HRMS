
table 33066434 "Employee History Buffer" //SS03NOV

{

    Caption = 'Employee History Buffer';

    DataClassification = ToBeClassified;

    fields

    {

        field(1; "HRMS ID"; Code[20]) { Caption = 'HRMS ID'; }

        field(2; "Company Name"; Text[100]) { Caption = 'Company Name'; }

        field(3; "No."; Code[20]) { Caption = 'Employee No.'; }

        field(4; "First Name"; Text[100]) { Caption = 'First Name'; }

        field(5; "Designation"; Text[100]) { Caption = 'Designation'; }

        field(6; "Employment Status"; Text[50]) { Caption = 'Employment Status'; }

        field(7; "Current Station"; Text[100]) { Caption = 'Current Station'; }

        field(8; "Deployment Location"; Text[100]) { Caption = 'Deployment Location'; }

        field(9; "Employee Name"; Text[100]) { Caption = 'Employee Name'; }

        field(10; "Bill Group"; Text[50]) { Caption = 'Bill Group'; }

        field(11; "Bill Type"; Text[50]) { Caption = 'Bill Type'; }

        field(12; "Account Type"; Text[50]) { Caption = 'Account Type'; }

        field(13; "Designation as per HRMS Site"; Text[100]) { Caption = 'Designation (HRMS Site)'; }

        field(14; "Dept./Trade/Section"; Text[100]) { Caption = 'Department / Trade / Section'; }

        field(15; "Post Group"; Text[50]) { Caption = 'Post Group'; }

        field(16; "GPF/PRAN No"; Text[30]) { Caption = 'GPF/PRAN No'; }

        field(17; "Birth Date"; Date) { Caption = 'Birth Date'; }

        field(18; "Gender"; Option)

        {

            Caption = 'Gender';

            OptionMembers = Male,Female,Other;

        }

        field(19; "D.O.S (Date of Superannuation)"; Date) { Caption = 'Date of Superannuation'; }

        field(20; "Category"; Text[50]) { Caption = 'Category'; }

        field(21; "Joining Station"; Text[100]) { Caption = 'Joining Station'; }

        field(22; "D.O.J (Service)"; Date) { Caption = 'Date of Joining'; }

        field(23; "Service Joining Designation"; Text[100]) { Caption = 'Service Joining Designation'; }

        field(24; "Base Qualification"; Text[100]) { Caption = 'Base Qualification'; }

        field(25; "Home Dist as per HRMS Site"; Text[100]) { Caption = 'Home District (HRMS)'; }

        field(26; "Home Dist"; Text[100]) { Caption = 'Home District'; }

        field(27; "Basic Gr. Pay"; Decimal) { Caption = 'Basic Grade Pay'; }

        field(28; "Date of increment"; Date) { Caption = 'Date of Increment'; }

        field(29; "Email"; Text[100]) { Caption = 'Email'; }

        field(30; "EPIC No"; Text[50]) { Caption = 'EPIC No'; }

        field(31; "MACP Status"; Text[50]) { Caption = 'MACP Status'; }

        field(32; "Mobile Phone No."; Text[20]) { Caption = 'Mobile Phone No.'; }

        field(33; "Pension Remark"; Text[250]) { Caption = 'Pension Remark'; }

        field(34; "Status"; Text[50]) { Caption = 'Status'; }

        field(35; "SLCM Employee"; Boolean) { Caption = 'SLCM Employee'; }

        field(36; "Deployment Start Date"; Date) { Caption = 'Deployment Start Date'; }

        field(37; "Deployment End Date"; Date) { Caption = 'Deployment End Date'; }

        field(38; "Last Name"; Text[50]) { Caption = 'Last Name'; }
        field(39; "Entry No"; Integer)
        {

        }
        field(40; "Archive Date Time"; DateTime)
        {

        }

    }

    keys

    {

        key(PK; "HRMS ID", "Company Name", "No.") { Clustered = true; }
        key(EntryNoKey; "Archive Date Time")
        {
        }

    }

}

