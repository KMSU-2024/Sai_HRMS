page 33065507 "Staff Ach History Arch List" //SS07OCT c
{
    PageType = List;
    SourceTable = "Staff Achievement History Arch";
    Caption = 'Staff Achievement History Archive';
    DeleteAllowed = false;
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Archive Entry No."; Rec."Archive Entry No.")
                {
                    ApplicationArea = All;
                }
                field("HRMS ID"; Rec."HRMS ID")
                {
                    ApplicationArea = All;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = All;
                }
                field(Designation; Rec.Designation)
                {
                    ApplicationArea = All;
                }
                field("Base Qualification"; Rec."Base Qualification")
                {
                    ApplicationArea = All;
                }
                field("Inservice Qua. Upgradation"; Rec."Inservice Qua. Upgradation")
                {
                    ApplicationArea = All;
                }
                field(Award; Rec.Award)
                {
                    ApplicationArea = All;
                }
                field("Award Details"; Rec."Award Details")
                {
                    ApplicationArea = All;
                }
                field("Achivement Remarks"; Rec."Achivement Remarks")
                {
                    ApplicationArea = All;
                }
                field("Academic Year"; Rec."Academic Year")
                {
                    ApplicationArea = All;
                }
                field("Version No."; Rec."Version No.")
                {
                    ApplicationArea = All;
                }
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
}
