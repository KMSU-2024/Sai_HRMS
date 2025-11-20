page 33065487 "Promotion History Buffer API" //SS03NOV

{

    PageType = API;

    Caption = 'Promotion History Buffer API';

    APIPublisher = 'dtet';

    APIGroup = 'employeeDiary';

    APIVersion = 'v1.0';

    EntityName = 'promotionHistory';

    EntitySetName = 'promotionHistories';

    SourceTable = "promotion History Buffer";

    ODataKeyFields = "HRMS ID";

    InsertAllowed = false;

    ModifyAllowed = false;

    DeleteAllowed = false;

    layout

    {

        area(content)

        {

            /*   field(Entry_No; Rec."Entry No.")
              {
                  Caption = 'Entry No';
                  Visible = false; 

              } *///ssnov18
            field(Institute_Name; Rec."Company Name")
            {
                Caption = 'Institute_Name';
            }
            field(HRMS_ID; Rec."HRMS ID")
            {
                Caption = 'HRMS ID';
            }
            field(Name; Name)
            {
                Caption = 'Name';
            }


            field(From_Designation; Rec."From Designation")
            {
                Caption = 'From Designation';
            }
            field(To_Designation; Rec."To Designation")
            {
                Caption = 'To Designation';
            }
            field(Promotion_Order_Date; Rec."Promotion Order Date")
            {
                Caption = 'Promotion Order Date';
            }
            field(Letter_No; Rec."Letter No")
            {
                Caption = 'Letter No';
            }
            field(Order_Issuing_Authority; Rec."Order Issuing Authority")
            {
                Caption = 'Order Issuing Authority';
            }
            /* field(Version; Rec."Version")
            {
                Caption = 'Version';
            } */ //sainov18
        }

    }

}

