table 33066437 "Employee Achievements Buffer" //SS03NOV

{

    Caption = 'Employee Achievements Buffer';

    DataClassification = ToBeClassified;

    fields

    {

        field(1; "HRMS ID"; Code[20]) { Caption = 'HRMS ID'; }

        field(2; "Company Name"; Text[100]) { Caption = 'Company Name'; }

        field(3; "Archive Entry No."; Integer) { Caption = 'Archive Entry No.'; }

        field(4; "Entry No."; Integer) { Caption = 'Entry No.'; }

        field(5; "Employee Name"; Text[100]) { Caption = 'Employee Name'; }

        field(6; "Designation"; Code[20]) { Caption = 'Designation'; }

        field(7; "Base Qualification"; Text[100]) { Caption = 'Base Qualification'; }

        field(8; "Inservice Qua. Upgradation"; Boolean) { Caption = 'Inservice Qualification Upgradation'; }

        field(9; "Award"; Boolean) { Caption = 'Award'; }

        field(10; "Award Details"; Text[250]) { Caption = 'Award Details'; }

        field(11; "Achievement Remarks"; Text[250]) { Caption = 'Achievement Remarks'; }

        field(12; "Academic Year"; Code[10]) { Caption = 'Academic Year'; }

        field(13; "Version No."; Integer) { Caption = 'Version No.'; }

        field(14; "Archived By"; Code[50]) { Caption = 'Archived By'; }

        field(15; "Archived DateTime"; DateTime) { Caption = 'Archived DateTime'; }

    }

    keys

    {

        key(PK; "HRMS ID", "Company Name", "Entry No.") { Clustered = true; }

    }

}

