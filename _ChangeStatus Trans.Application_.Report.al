report 33065734 "ChangeStatus Trans.Application"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    ProcessingOnly = true;
    Caption = 'Change Status Transfer Application';

    dataset
    {
        dataitem("Transfer Application Employee";"Transfer Application Employee")
        {
            trigger OnAfterGetRecord()var myInt: Integer;
            begin
                "Transfer Application Employee".Status:=Status;
                "Transfer Application Employee".Modify;
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
