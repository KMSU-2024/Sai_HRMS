page 33065485 "Employee Financial Upg  API" //SS03NOV

{

    PageType = API;
    DelayedInsert = true;

    Caption = 'Employee Financial Upgradation Buffer API';

    APIPublisher = 'dtet';

    APIGroup = 'employeeDiary';

    APIVersion = 'v1.0';

    EntityName = 'employeeFinancialUpg';

    EntitySetName = 'employeeFinancialUpgs';

    SourceTable = "Employee Financial Upg Buffer";

    ODataKeyFields = "HRMS ID", "Company Name", "Entry No.";

    ApplicationArea = All;
    UsageCategory = Administration;

    layout

    {

        area(content)

        {
            field(EntryNo; Rec."Entry No.")
            {
                Caption = 'Entry No.';
            }
            field(NoOfVersions; Rec."No of Versions")
            {
                Caption = 'No of Versions';
            }

            field(HRMSID; Rec."HRMS ID")
            {
                Caption = 'HRMS ID';
            }

            field(CompanyName; Rec."Company Name")
            {
                Caption = 'Institute';
            }



            field(ApplicationFileName; Rec."Application File Name")
            {
                Caption = 'Application File Name';
            }

            field(CurrentStation; Rec."Current Station")
            {
                Caption = 'Current Station';
            }

            field(Status; Rec."Status")
            {
                Caption = 'Status';
            }

            field(EffectiveDateOfMACP; Rec."Effective Date Of MACP")
            {
                Caption = 'Effective Date Of MACP';
            }



            field(ModifiedDateTime; Rec."Modified Date Time")
            {
                Caption = 'Modified Date Time';
            }

        }

    }

}

