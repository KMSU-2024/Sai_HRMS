page 33065484 "Employee Transfer Buffer API" //SS03NOV

{

    PageType = API;
    DelayedInsert = true;

    Caption = 'Employee Transfer Buffer API';

    APIPublisher = 'dtet';

    APIGroup = 'employeeDiary';

    APIVersion = 'v1.0';

    EntityName = 'employeeTransfer';

    EntitySetName = 'employeeTransfers';

    SourceTable = "Employee Transfer Buffer";

    ODataKeyFields = "HRMS ID", "Company Name", "Entry No.";

    ApplicationArea = All;
    UsageCategory = Administration;

    layout

    {

        area(content)

        {

            field(HRMSID; Rec."HRMS ID")
            {
                Caption = 'HRMS ID';
            }

            field(CompanyName; Rec."Company Name")
            {
                Caption = 'Company Name';
            }

            field(EntryNo; Rec."Entry No.")
            {
                Caption = 'Entry No.';
            }

            field(EmployeeName; Rec."Employee Name")
            {
                Caption = 'Employee Name';
            }

            field(Designation; Rec."Designation")
            {
                Caption = 'Designation';
            }

            field(FromStation; Rec."From Station")
            {
                Caption = 'From Station';
            }

            field(ToStation; Rec."To Station")
            {
                Caption = 'To Station';
            }

            field(TransferOrderIssuingAuthority; Rec."Transfer Order Issuing Authority")
            {
                Caption = 'Transfer Order Issuing Authority';
            }

            field(RelieveDate; Rec."Relieve Date")
            {
                Caption = 'Relieve Date';
            }

        }

    }

}

