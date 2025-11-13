page 33065503 CrossCompanyTrainingHist //SS07OCT c
{
    PageType = ListPart;
    SourceTable = TempTrainingHistory;
    Caption = 'Training History (All Companies)';

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
                field("EndDate"; Rec."EndDate")
                {
                    ApplicationArea = All;
                }
                field("Duration Of Training"; Rec."Duration Of Training")
                {
                    ApplicationArea = All;
                }
                field("Conducted By"; Rec."Conducted By")
                {
                    ApplicationArea = All;
                }
                field("Training Location"; Rec."Training Location")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    var
        TrainingHist: Record "Employee Training History";
        CompanyRec: Record Company;

    procedure LoadData(HRMSID: Code[20])
    var
        LineNo: Integer;
    begin
        Rec.DeleteAll(); // 🔥 clear old data
        LineNo := 1;
        if CompanyRec.FindSet() then
            repeat
                TrainingHist.CHANGECOMPANY(CompanyRec.Name);
                TrainingHist.SetRange("HRMS ID", HRMSID);
                if TrainingHist.FindSet() then
                    repeat
                        Rec.Init();
                        Rec."Line ID" := LineNo;
                        Rec."Company Name" := CompanyRec.Name;
                        Rec."Entry No" := TrainingHist."Entry No";
                        Rec."HRMS ID" := TrainingHist."HRMS ID";
                        Rec."EndDate" := TrainingHist."EndDate";
                        Rec."Duration Of Training" := TrainingHist."Duration Of Training";
                        Rec."Conducted By" := TrainingHist."Conducted By";
                        Rec."Training Location" := TrainingHist."Training Location";
                        Rec.Insert();
                        LineNo += 1;
                    until TrainingHist.Next() = 0;
            until CompanyRec.Next() = 0;
        CurrPage.Update(false);
    end;
}
