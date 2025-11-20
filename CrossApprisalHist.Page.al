//page 33065499 CrossApprisalHist //SS07OCT c
page 33065499 "CrossApprisalHist" //SS03NOV

{

    PageType = ListPart;

    SourceTable = "Employee Appraisal Buffer";

    Caption = 'Appraisal History (All Companies)';

    layout

    {

        area(content)

        {

            repeater(Group)

            {

                field("Company Name"; Rec."Company Name") { ApplicationArea = All; }

                field("HRMS ID"; Rec."HRMS ID") { ApplicationArea = All; }

                field("Employee Name"; Rec."Employee Name") { ApplicationArea = All; }

                field("Designation"; Rec."Designation") { ApplicationArea = All; }

                field("Department"; Rec."Department") { ApplicationArea = All; }

                field("Academic Year"; Rec."Academic Year") { ApplicationArea = All; }

                field("Performance Appraisal Review"; Rec."Performance Appraisal Review") { ApplicationArea = All; }

                field("Modified By"; Rec."Modified By") { ApplicationArea = All; }

                field("Modified Date Time"; Rec."Modified Date Time") { ApplicationArea = All; }

            }

        }

    }

    var

        AppraisalMgt: Codeunit "Training Buffer Mgt";

    procedure LoadData(HRMSID: Code[20])

    begin

        AppraisalMgt.LoadAppraisalAcrossCompanies(HRMSID);

        CurrPage.Update(false);

    end;

}

