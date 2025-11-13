page 33065501 CrossCompanyFinancialUpgHist //SS07OCT c
{
    PageType = ListPart;
    SourceTable = TempFinancialUpgHistory;
    Caption = 'Financial Upgradation History (All Companies)';

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Company Name"; Rec."Company Name")
                {
                    ApplicationArea = All;
                }
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = All;
                }
                field("Application File Name"; Rec."Application File Name")
                {
                    ApplicationArea = All;
                }
                field("Current Station"; Rec."Current Station")
                {
                    ApplicationArea = All;
                }
                field("Status"; Rec."Status")
                {
                    ApplicationArea = All;
                }
                field("Sl_no"; Rec."Sl_no")
                {
                    ApplicationArea = All;
                }
                field("Effective Date Of MACP"; Rec."Effective Date Of MACP")
                {
                    ApplicationArea = All;
                }
                field("No of Versions"; Rec."No of Versions")
                {
                    ApplicationArea = All;
                }
                field("User Id"; Rec."HRMS Id")
                {
                    ApplicationArea = All;
                }
                field("Modified Date Time"; Rec."Modified Date Time")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    var
        FinUpgHist: Record "Financial Upg App history";
        CompanyRec: Record Company;

    procedure GetRecord(): Record TempFinancialUpgHistory //megha 29-10-25
    begin
        exit(Rec);
    end;

    procedure LoadData(HRMSID: Code[20])
    var
        LineNo: Integer;
    begin
        Rec.DeleteAll();
        LineNo := 1;
        if CompanyRec.FindSet() then
            repeat
                FinUpgHist.CHANGECOMPANY(CompanyRec.Name);
                FinUpgHist.SetRange("HRMS ID", HRMSID); // 🔑 Filtering by HRMSID/UserId
                if FinUpgHist.FindSet() then
                    repeat
                        Rec.Init();
                        Rec."Line ID" := LineNo;
                        Rec."Company Name" := CompanyRec.Name;
                        Rec."Entry No" := FinUpgHist."Entry No.";
                        Rec."Application File Name" := FinUpgHist."Application file name";
                        Rec."Current Station" := FinUpgHist."Current Station";
                        Rec."Status" := FinUpgHist."Status";
                        Rec."Sl_no" := FinUpgHist."Sl_no";
                        Rec."Effective Date Of MACP" := FinUpgHist."Effective Date Of MACP";
                        Rec."No of Versions" := FinUpgHist."no of versions";
                        Rec."HRMS Id" := FinUpgHist."User Id";
                        Rec."Modified Date Time" := FinUpgHist."Modified Date Time";
                        Rec.Insert();
                        LineNo += 1;
                    until FinUpgHist.Next() = 0;
            until CompanyRec.Next() = 0;
        CurrPage.Update(false);
    end;
}
