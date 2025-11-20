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

    ODataKeyFields = "HRMS ID", "Company Name";

    ApplicationArea = All;
    UsageCategory = Administration;

    layout

    {

        area(content)

        {
           /*  field(Entry_No; Rec."Entry No.")
            {
                Caption = 'Entry No.';//ssnov18
            }
 */                field(Institute_Name; Rec."Company Name")
            {
                Caption = 'Institute_Name';
            }
           

            field(HRMS_ID; Rec."HRMS ID")
            {
                Caption = 'HRMS ID';
            }

        



            field(Application_FileName; Rec."Application File Name")
            {
                Caption = 'Application File Name';
            }

            field(Current_Station; Rec."Current Station")
            {
                Caption = 'Current Station';
            }

            field(Status; Rec."Status")
            {
                Caption = 'Status';
            }

            field(Effective_Date_Of_MACP; Rec."Effective Date Of MACP")
            {
                Caption = 'Effective Date Of MACP';
            }



            field(Modified_Date_Time; Rec."Modified Date Time")
            {
                Caption = 'Modified Date Time';
            }

        }

    }

}

