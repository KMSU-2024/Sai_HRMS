page 33065976 "Financial Upg - Increment List" //ss16oct
{
    PageType = List;
    SourceTable = "Financial Upg Application";
    Caption = 'Add Increments';
    ApplicationArea = All;
    UsageCategory = Lists;
    CardPageId = "Financial Upg - Add Increment"; // opens the card when user drills down
    Editable = false;
    SaveValues = true;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                Caption = 'Increment Records'; //ss16oct

                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                } //ss16oct
                field("HRMS ID"; Rec."HRMS ID")
                {
                    ApplicationArea = All;
                } //ss16oct
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                } //ss16oct
                field(Designation; Rec.Designation)
                {
                    ApplicationArea = All;
                } //ss16oct
                field("Current Station"; Rec."Current Station")
                {
                    ApplicationArea = All;
                } //ss16oct
                field("Type of increment"; "Type of increment")//megha 3-11-25
                {
                    ApplicationArea = all;
                }
                field("Type"; Rec."Type")
                {
                    ApplicationArea = All;
                } //ss16oct
                field("Effective Date Of MACP"; Rec."Effective Date Of MACP")
                {
                    ApplicationArea = All;
                } //ss16oct
                field("Increment Amount"; Rec."Increment Amount")
                {
                    ApplicationArea = All;
                } //ss16oct
                field("Status"; Rec."Status")
                {
                    ApplicationArea = All;
                } //ss16oct
                field("IsConfirmed"; Rec."IsConfirmed")
                {
                    ApplicationArea = All;
                } //ss16oct
                field("Date of application upload"; Rec."Date of application upload")
                {
                    ApplicationArea = All;
                } //ss16oct
            }
        }
    }
    actions
    {
        area(processing)
        {
            action(OpenCard)
            {
                Caption = 'Open Increment';
                Image = EditLines;
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    PAGE.Run(PAGE::"Financial Upg - Add Increment", Rec); // open the card for this record //ss16oct
                end;
            }
            action(AddNewIncrement)
            {
                Caption = 'New Increment';
                Image = NewDocument;
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = New;

                trigger OnAction()
                var
                    NewRec: Record "Financial Upg Application";
                begin
                    Clear(NewRec);
                    PAGE.RunModal(PAGE::"Financial Upg - Add Increment", NewRec); // create new increment //ss16oct
                end;
            }
            action(ViewHistory)
            {
                Caption = 'View Confirmed History';
                Image = History;
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    HistPage: Page "Financial Upg - History";
                begin
                    HistPage.Run(); // opens the confirmed increment history //ss16oct
                end;
            }
            action(Test)
            {
                ApplicationArea = all;
                trigger OnAction()
                var
                    EmpDiaryCodeunit: Codeunit "Employee Diary Summary Mgt";
                begin
                    EmpDiaryCodeunit.LoadFinancialUpgHistData('43000069');
                end;
            }
        }
    }
    trigger OnOpenPage()
    begin
        // Default view: show all increments (Applied + Processed) //ss16oct
        // Uncomment below to filter only unconfirmed drafts if desired:
        // SetRange("IsConfirmed", false);
    end;
}
