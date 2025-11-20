page 33065503 CrossCompanyTrainingHist //SS07OCT c
{
    PageType = ListPart;
    SourceTable = "Training History Buffer";
    Caption = 'Training History (All Companies)';

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Company Name"; Rec."Company Name") { ApplicationArea = All; }
                field("HRMS ID"; Rec."HRMS ID") { ApplicationArea = All; }
                field("End Date"; Rec."End Date") { ApplicationArea = All; }
                field("Duration Of Training"; Rec."Duration Of Training") { ApplicationArea = All; }
                field("Conducted By"; Rec."Conducted By") { ApplicationArea = All; }
                field("Training Location"; Rec."Training Location") { ApplicationArea = All; }
            }
        }
    }

    var
        TrainingMgt: Codeunit "Training Buffer Mgt";

    procedure LoadData(HRMSID: Code[20])
    begin
        TrainingMgt.LoadTrainingAcrossCompanies1(HRMSID);
        CurrPage.Update(false);
    end;
}