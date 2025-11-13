page 33065504 CrossCompanyTransferHist //SS07OCT c
{
    PageType = ListPart;
    SourceTable = TempEmployeeTransferHistory;
    Caption = 'Transfer History (All Companies)';

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
                field("Name"; Rec."Name")
                {
                    ApplicationArea = All;
                }
                field("Designation"; Rec."Designation")
                {
                    ApplicationArea = All;
                }
                field("From Station"; Rec."From Station")
                {
                    ApplicationArea = All;
                }
                field("To Station"; Rec."To Station")
                {
                    ApplicationArea = All;
                }
                field("Transfer Order Issuing Authority"; Rec."Transfer Order Issuing Authority")
                {
                    ApplicationArea = All;
                }
                field("Relieve Date"; Rec."Relieve Date")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    var
        TransferHist: Record "Transfer Joining History"; // your original table
        CompanyRec: Record Company;

    procedure LoadData(HRMSID: Code[20])
    var
        LineNo: Integer;
    begin
        Rec.DeleteAll();
        LineNo := 1;
        if CompanyRec.FindSet() then
            repeat
                TransferHist.CHANGECOMPANY(CompanyRec.Name);
                TransferHist.SetRange("HRMS ID", HRMSID);
                if TransferHist.FindSet() then
                    repeat
                        Rec.Init();
                        Rec."Line ID" := LineNo;
                        Rec."Company Name" := CompanyRec.Name;
                        Rec."Entry No" := TransferHist."Entry No";
                        Rec."HRMS ID" := TransferHist."HRMS ID";
                        Rec."Name" := TransferHist."Name";
                        Rec."Designation" := TransferHist."Designation";
                        Rec."From Station" := TransferHist."From Station";
                        Rec."To Station" := TransferHist."To Station";
                        Rec."Transfer Order Issuing Authority" := Format(TransferHist."Order Issuing Authority");
                        Rec."Relieve Date" := TransferHist."Relief Order Date";
                        Rec.Insert();
                        LineNo += 1;
                    until TransferHist.Next() = 0;
            until CompanyRec.Next() = 0;
        CurrPage.Update(false);
    end;
}
