//page 33065504 CrossCompanyTransferHist //SS07OCT c
page 33065504 "CrossCompanyTransferHist" //SS03NOV

{

    PageType = ListPart;

    SourceTable = "Employee Transfer Buffer";

    Caption = 'Transfer History (All Companies)';

    layout

    {

        area(content)

        {

            repeater(Group)

            {

                field("Company Name"; Rec."Company Name") { Caption = 'Institue'; ApplicationArea = All; }

                field("HRMS ID"; Rec."HRMS ID") { ApplicationArea = All; }

                field("Employee Name"; Rec."Employee Name") { ApplicationArea = All; }

                field("Designation"; Rec."Designation") { ApplicationArea = All; }

                field("From Station"; Rec."From Station") { ApplicationArea = All; }

                field("To Station"; Rec."To Station") { ApplicationArea = All; }

                field("Transfer Order Issuing Authority"; Rec."Transfer Order Issuing Authority") { ApplicationArea = All; }

                field("Relieve Date"; Rec."Relieve Date") { ApplicationArea = All; }

            }

        }

    }

    var

        TransferMgt: Codeunit "Training Buffer Mgt";

    procedure LoadData(HRMSID: Code[20])

    begin

        TransferMgt.LoadTransferAcrossCompanies(HRMSID);

        CurrPage.Update(false);

    end;

}

