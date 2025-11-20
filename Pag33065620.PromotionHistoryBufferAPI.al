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

    ODataKeyFields = "Entry No.";

    InsertAllowed = false;

    ModifyAllowed = false;

    DeleteAllowed = false;

    layout

    {

        area(content)

        {

            field(EntryNo; Rec."Entry No.")
            {
                Caption = 'Entry No';
            }
            field(HRMSID; Rec."HRMS ID")
            {
                Caption = 'HRMS ID';
            }
            field(CompanyName; Rec."Company Name")
            {
                Caption = 'Institue';
            }

            field(FromDesignation; Rec."From Designation")
            {
                Caption = 'From Designation';
            }
            field(ToDesignation; Rec."To Designation")
            {
                Caption = 'To Designation';
            }
            field(PromotionOrderDate; Rec."Promotion Order Date")
            {
                Caption = 'Promotion Order Date';
            }
            field(LetterNo; Rec."Letter No")
            {
                Caption = 'Letter No';
            }
            field(OrderIssuingAuthority; Rec."Order Issuing Authority")
            {
                Caption = 'Order Issuing Authority';
            }
            field(Version; Rec."Version")
            {
                Caption = 'Version';
            }
        }

    }

}

