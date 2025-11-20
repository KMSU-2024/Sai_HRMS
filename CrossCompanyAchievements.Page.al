page 33065500 "CrossCompanyAchievements" //SS03NOV

{

    PageType = ListPart;

    SourceTable = "Employee Achievements Buffer";

    Caption = 'Achievements History (All Companies)';

    layout

    {

        area(content)

        {

            repeater(Group)

            {

                field("Company Name"; Rec."Company Name") { ApplicationArea = All; }
                field("Archive Entry No."; Rec."Archive Entry No.") { ApplicationArea = All; }
                field("HRMS ID"; Rec."HRMS ID") { ApplicationArea = All; }
                field("Employee Name"; Rec."Employee Name") { ApplicationArea = All; }
                field(Designation; Rec.Designation) { ApplicationArea = All; }
                field("Base Qualification"; Rec."Base Qualification") { ApplicationArea = All; }
                field("Inservice Qua. Upgradation"; Rec."Inservice Qua. Upgradation") { ApplicationArea = All; }
                field(Award; Rec.Award) { ApplicationArea = All; }
                field("Award Details"; Rec."Award Details") { ApplicationArea = All; }
                // field("Achivement Remarks"; Rec."Achivement Remarks") { ApplicationArea = All; }
                field("Academic Year"; Rec."Academic Year") { ApplicationArea = All; }
                field("Version No."; Rec."Version No.") { ApplicationArea = All; }
                field("Archived By"; Rec."Archived By")
                {
                    Caption = 'Modified By';
                    ApplicationArea = All;
                }
                field("Archived DateTime"; Rec."Archived DateTime")
                {
                    Caption = 'modified Date & Time';
                    ApplicationArea = All;
                }



            }

        }

    }

    var

        AchBufferMgt: Codeunit "Training Buffer Mgt";

    procedure LoadData(HRMSID: Code[20])

    begin

        AchBufferMgt.LoadAchievementsAcrossCompanies(HRMSID);

        CurrPage.Update(false);

    end;

}


/* page 70553 CrossCompanyAchievements//SS07OCT

{

    PageType = ListPart;

    SourceTable = TempEmployeeAchievements;

    Caption = 'Achievements (All Companies)';

    layout

    {

        area(content)

        {

            repeater(Group)

            {

                field("Company Name"; Rec."Company Name") { ApplicationArea = All; }
                field("Archive Entry No."; Rec."Archive Entry No.") { ApplicationArea = All; }
                field("HRMS ID"; Rec."HRMS ID") { ApplicationArea = All; }
                field("Employee Name"; Rec."Employee Name") { ApplicationArea = All; }
                field(Designation; Rec.Designation) { ApplicationArea = All; }
                field("Base Qualification"; Rec."Base Qualification") { ApplicationArea = All; }
                field("Inservice Qua. Upgradation"; Rec."Inservice Qua. Upgradation") { ApplicationArea = All; }
                field(Award; Rec.Award) { ApplicationArea = All; }
                field("Award Details"; Rec."Award Details") { ApplicationArea = All; }
                field("Achivement Remarks"; Rec."Achivement Remarks") { ApplicationArea = All; }
                field("Academic Year"; Rec."Academic Year") { ApplicationArea = All; }
                field("Version No."; Rec."Version No.") { ApplicationArea = All; }
                field("Archived By"; Rec."Archived By")
                {
                    Caption = 'Modified By';
                    ApplicationArea = All;
                }
                field("Archived DateTime"; Rec."Archived DateTime")
                {
                    Caption = 'modified Date & Time';
                    ApplicationArea = All;
                }



            }

        }

    }

    var

        Achievements: Record "Staff Achievement History Arch"; // your base table name

        CompanyRec: Record Company;

    procedure LoadData(HRMSID: Code[20])

    var

        LineNo: Integer;

    begin

        Rec.DeleteAll();

        LineNo := 1;

        if CompanyRec.FindSet() then
            repeat

                Achievements.CHANGECOMPANY(CompanyRec.Name);

                Achievements.SetRange("HRMS ID", HRMSID);

                if Achievements.FindSet() then
                    repeat

                        Rec.Init();
                        Rec."Line ID" := LineNo;
                        Rec."Company Name" := CompanyRec.Name;
                        Rec."Archive Entry No." := Achievements."Archive Entry No.";
                        Rec."HRMS ID" := Achievements."HRMS ID";
                        Rec."Employee Name" := Achievements."Employee Name";
                        Rec."Designation" := Achievements."Designation";
                        Rec."Base Qualification" := Achievements."Base Qualification";
                        Rec."Inservice Qua. Upgradation" := Achievements."Inservice Qua. Upgradation";
                        Rec."Award" := Achievements."Award";
                        Rec."Award Details" := Achievements."Award Details";
                        // Rec."Achievement Remarks" := Achievements."Achievement Remarks";
                        Rec."Academic Year" := Achievements."Academic Year";
                        Rec."Version No." := Achievements."Version No.";
                        Rec."Archived By" := Achievements."Archived By";
                        Rec."Archived DateTime" := Achievements."Archived DateTime";

                        Rec.Insert();

                        LineNo += 1;

                    until Achievements.Next() = 0;

            until CompanyRec.Next() = 0;

        CurrPage.Update(false);

    end;

}

 */
