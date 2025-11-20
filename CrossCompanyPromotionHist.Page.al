page 33065502 CrossCompanyPromotionHist //SS07OCT c

{

    PageType = ListPart;

    SourceTable = "Promotion History Buffer";

    Caption = 'Promotion History (All Companies)';

    layout

    {

        area(content)

        {

            repeater(Group)

            {

                field("Company Name"; Rec."Company Name") { ApplicationArea = All; }

                field("HRMS ID"; Rec."HRMS ID") { ApplicationArea = All; }

                field("From Designation"; Rec."From Designation") { ApplicationArea = All; }

                field("To Designation"; Rec."To Designation") { ApplicationArea = All; }

                field("Promotion Order Date"; Rec."Promotion Order Date") { ApplicationArea = All; }

                field("Letter No"; Rec."Letter No") { ApplicationArea = All; }

                field("Order Issuing Authority"; Rec."Order Issuing Authority") { ApplicationArea = All; }

            }

        }

    }

    var

        PromoMgt: Codeunit "Training Buffer Mgt";

    procedure LoadData(HRMSID: Code[20])

    begin

        PromoMgt.LoadPromotionAcrossCompanies(HRMSID);

        CurrPage.Update(false);

    end;

}

