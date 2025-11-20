page 33065501 CrossCompanyFinancialUpgHist //SS07OCT c
//page 70556 "CrossCompanyFinancialUpgHist" //SS03NOV

{

    PageType = ListPart;

    SourceTable = "Employee Financial Upg Buffer";

    Caption = 'Financial Upgradation (All Companies)';

    layout

    {

        area(content)

        {

            repeater(Group)

            {
                field("Entry No.";"Entry No.") { ApplicationArea = All; }
                field("No of Versions"; Rec."No of Versions") { ApplicationArea = All; }


                field("Company Name"; Rec."Company Name") { ApplicationArea = All; Caption='Institute' ;}

                field("HRMS ID"; Rec."HRMS ID") { ApplicationArea = All; }

                field("Application File Name"; Rec."Application File Name") { ApplicationArea = All; }

                field("Current Station"; Rec."Current Station") { ApplicationArea = All; }

                field("Status"; Rec."Status") { ApplicationArea = All; }

                field("Effective Date Of MACP"; Rec."Effective Date Of MACP") { ApplicationArea = All; }


                field("Modified Date Time"; Rec."Modified Date Time") { ApplicationArea = All; }

            }

        }

    }

    var

        FinUpgMgt: Codeunit "Training Buffer Mgt";

    procedure LoadData(HRMSID: Code[30])

    begin

        FinUpgMgt.LoadFinancialUpgAcrossCompanies(HRMSID);

        CurrPage.Update(false);

    end;

}

