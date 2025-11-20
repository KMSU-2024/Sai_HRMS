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

    ODataKeyFields = "HRMS ID", "Company Name";

    ApplicationArea = All;
    UsageCategory = Administration;

    layout

    {

        area(content)

        {
           /*  field(Entry_No; Rec."Entry No.")
            {
                Caption = 'Entry_No.';
            } *///sai
            field(Institute_Name; Rec."Company Name")
            {
                Caption = 'Institute_Name';
            }

            field(HRMS_ID; Rec."HRMS ID")
            {
                Caption = 'HRMS ID';
            }

            field(Employee_Name; Rec."Employee Name")
            {
                Caption = 'Employee Name';
            }

            field(Designation; Rec."Designation")
            {
                Caption = 'Designation';
            }

            field(From_Station; Rec."From Station")
            {
                Caption = 'From Station';
            }

            field(To_Station; Rec."To Station")
            {
                Caption = 'To Station';
            }

            field(Transfer_Order_Issuing_Authority; Rec."Transfer Order Issuing Authority")
            {
                Caption = 'Transfer Order Issuing Authority';
            }

            field(Relieve_Date; Rec."Relieve Date")
            {
                Caption = 'Relieve Date';
            }
            field("Relief_Order_No"; "Relief Order No.")
            {
                ApplicationArea = all;
            }
            field("Letter_No"; "Letter No")
            {

            }

            field("Promotion_letter_no"; "Promotion letter no")
            {
                ApplicationArea = all;
            }
            field("Promotion_order_date"; "Promotion order date")
            {
                ApplicationArea = all;
            }
            field("Joining_Date"; "Joining Date")
            {
                ApplicationArea = all;
            }
            field("Relieving_Event"; "Relieving Event")
            {
                ApplicationArea = all;
            }
            field("To_Designation"; "To Designation")
            {
                ApplicationArea = all;
            }
            field(status; status)
            {
                ApplicationArea = all;

            }


        }

    }

}

