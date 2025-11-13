page 33065499 CrossApprisalHist //SS07OCT c
{
    PageType = ListPart;
    SourceTable = TempApprisalHistory;
    Caption = 'Apprisal History (All Companies)';

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
                //field("Entry No"; Rec."Entry No") { ApplicationArea = All; }
                field("HRMS ID"; Rec."HRMS ID")
                {
                }
                field(Department; Rec.Department)
                {
                }
                field(Designation; Rec.Designation)
                {
                }
                field("Performance Appraisal Review"; Rec."Performance Appraisal Review")
                {
                }
                field("Modified By"; Rec."Modified By")
                {
                }
                field("Modified Date Time"; Rec."Modified Date Time")
                {
                }
            }
        }
    }
    var
        Apprisalhist: Record "Annual Performance Reviewhis";
        CompanyRec: Record Company;

    procedure LoadData(HRMSID: Code[20])
    var
        LineNo: Integer;
    begin
        Rec.DeleteAll();
        LineNo := 1;
        if CompanyRec.FindSet() then
            repeat
                Apprisalhist.CHANGECOMPANY(CompanyRec.Name);
                Apprisalhist.SetRange("HRMS ID", HRMSID); // 🔑 Filtering by HRMSID/UserId
                if Apprisalhist.FindSet() then
                    repeat
                        Rec.Init();
                        Rec."Line ID" := LineNo;
                        Rec."Company Name" := CompanyRec.Name;
                        Rec."HRMS Id" := Apprisalhist."HRMS ID";
                        //          Rec."Entry No" := Apprisalhist."Entry No.";
                        Rec.Department := Apprisalhist.Department;
                        Rec.Designation := Apprisalhist.Designation;
                        Rec."Academic Year" := Apprisalhist."Academic Year";
                        /*   Rec."Sl_no" := Apprisalhist."Sl_no";

                          Rec."Effective Date Of MACP" := Apprisalhist."Effective Date Of MACP";

                          Rec."No of Versions" := Apprisalhist."no of versions"; */
                        rec."Modified By" := Apprisalhist."Modified By";
                        Rec."Modified Date Time" := Apprisalhist."Modified Date Time";
                        Rec.Insert();
                        LineNo += 1;
                    until Apprisalhist.Next() = 0;
            until CompanyRec.Next() = 0;
        CurrPage.Update(false);
    end;
}
