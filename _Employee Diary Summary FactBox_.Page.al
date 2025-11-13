page 33065505 "Employee Diary Summary FactBox"
{
    PageType = CardPart;
    SourceTable = "Employee Diary Summary";
    Caption = 'Employee Summary';

    layout
    {
        area(content)
        {
            group(Summary)
            {
                field("Total Employees";rec."Total Employees")
                {
                    ApplicationArea = All;
                }
                field("Active Employees";rec."Active Employees")
                {
                    ApplicationArea = All;
                }
                field("Inactive Employees";rec."Inactive Employees")
                {
                    ApplicationArea = All;
                }
                field("Last Updated";Rec."Last Updated")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    procedure RefreshCounts(StationCode: Code[100])var Summary: Record "Employee Diary Summary";
    SummaryMgt: Codeunit "Employee Diary Summary Mgt";
    begin
        if not Summary.Get(StationCode)then begin
            SummaryMgt.RecalculateSummary(StationCode);
            Summary.Get(StationCode);
        end;
        CurrPage.Update(false);
    end;
}
