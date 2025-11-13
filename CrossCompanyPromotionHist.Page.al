page 33065502 CrossCompanyPromotionHist //SS07OCT c
{
    PageType = ListPart;
    SourceTable = TempPromotionHistory;
    Caption = 'Promotion History (All Companies)';

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
                field("HRMS ID"; Rec."HRMS ID")
                {
                    ApplicationArea = All;
                }
                field("From Designation"; Rec."From Designation")
                {
                    ApplicationArea = All;
                }
                field("To Designation"; Rec."To Designation")
                {
                    ApplicationArea = All;
                }
                field("Promotion Order Date"; Rec."Promotion Order Date")
                {
                    ApplicationArea = All;
                }
                field("Letter No"; Rec."Letter No")
                {
                    ApplicationArea = All;
                }
                field("Order Issuing Authority"; Rec."Order Issuing Authority")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    var
        PromotionHist: Record "Employee Promot History Arch";
        CompanyRec: Record Company;
    /* procedure LoadData(HRMSID: Code[20])

     var

         LineNo: Integer;

     begin

         Rec.DeleteAll();   // clear old records

         LineNo := 1;

         if CompanyRec.FindSet() then
             repeat

                 PromotionHist.CHANGECOMPANY(CompanyRec.Name);

                 PromotionHist.SetRange("HRMS ID", HRMSID);

                 // Optional: sort by Promotion Date

                 PromotionHist.SetCurrentKey("Promotion Order Date");

                 PromotionHist.Ascending(false);

                 if PromotionHist.FindSet() then
                     repeat

                         Rec.Init();

                         Rec."Line ID" := LineNo;

                         Rec."Company Name" := CompanyRec.Name;

                         Rec."Entry No" := PromotionHist."Entry No";

                         Rec."HRMS ID" := PromotionHist."HRMS ID";

                         Rec."From Designation" := PromotionHist."From Designation";

                         Rec."To Designation" := PromotionHist."To Designation";

                         Rec."Promotion Order Date" := PromotionHist."Promotion Order Date";

                         Rec."Letter No" := PromotionHist."Letter No";

                         Rec."Order Issuing Authority" := Format(PromotionHist."Order Issuing Authority");

                         Rec.Insert();

                         LineNo += 1;

                     until PromotionHist.Next() = 0;

             until CompanyRec.Next() = 0;

         CurrPage.Update(false);

     end;*/
    procedure LoadData(HRMSID: Code[20])
    var
        LineNo: Integer;
    begin
        Rec.DeleteAll(); // 🔥 clear old data
        LineNo := 1;
        if CompanyRec.FindSet() then
            repeat
                PromotionHist.Reset();
                PromotionHist.CHANGECOMPANY(CompanyRec.Name);
                PromotionHist.SetRange("HRMS ID", HRMSID);
                if PromotionHist.FindSet() then
                    repeat
                        Rec.Init();
                        Rec."Line ID" := LineNo;
                        Rec."Company Name" := CompanyRec.Name;
                        rec.versions := PromotionHist."Version No.";
                        Rec."Entry No" := PromotionHist."Entry No";
                        Rec."HRMS ID" := PromotionHist."HRMS ID";
                        //     Rec."EndDate" := TrainingHist."EndDate";
                        Rec."From Designation" := PromotionHist."From Designation";
                        Rec."To Designation" := PromotionHist."To Designation";
                        Rec."Promotion Order Date" := PromotionHist."Promotion Order Date";
                        Rec."Letter No" := PromotionHist."Letter No";
                        //   Rec."Order Issuing Authority" := Format(PromotionHist."Order Issuing Authority");
                        Rec.Insert();
                        LineNo += 1;
                    until PromotionHist.Next() = 0;
            until CompanyRec.Next() = 0;
        CurrPage.Update(false);
    end;
}
