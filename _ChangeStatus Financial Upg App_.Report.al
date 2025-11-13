report 33065746 "ChangeStatus Financial Upg App"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    ProcessingOnly = true;
    Caption = 'Change Status Financial Upgrade Application';

    dataset
    {
        dataitem("Financial Upg Application";"Financial Upg Application")
        {
            trigger OnAfterGetRecord()var myInt: Integer;
            begin
                "Financial Upg Application".Status:=Status;
                "Financial Upg Application".Modify;
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    field(Status;Status)
                    {
                    }
                }
            }
        }
        actions
        {
            area(processing)
            {
                action(ActionName)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    var Status: Option Submitted, Processed, Rejected;
}
