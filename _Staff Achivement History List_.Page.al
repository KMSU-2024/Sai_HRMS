page 33065743 "Staff Achivement History List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Staff Achivement History";
    Caption = 'Employee Profile & Award Achievement History List';
    /* SS07OCT (g) Prevent deletion of records
    //Editable = false;
    //  InsertAllowed = false;
    //ModifyAllowed = false;*/
    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Entry No"; rec."Entry No")
                { //ApplicationArea = All; 
                }
                field("HRMS ID"; rec."HRMS ID")
                {
                    ApplicationArea = All;
                }
                field("Employee Name"; rec.Name)
                {
                    ApplicationArea = All;
                }
                field(Designation; rec.Designation)
                {
                    ApplicationArea = All;
                }
                field("Base Qualification"; rec."Base Qualification")
                {
                    ApplicationArea = All;
                }
                field("Inservice Qualification. Upgradation"; rec."Inservice Qua. Upgradation")
                {
                    ApplicationArea = All;
                }
                field("In-service Qualification Details"; rec."Inservise Qualification Detail")
                {
                    ApplicationArea = All;
                }
                field(Award; rec.Award)
                {
                    ApplicationArea = All;
                }
                field("Award Details"; rec."Award Details")
                {
                    ApplicationArea = All;
                }
                field("Achivement Remarks"; rec."Achivement Remarks")
                {
                    ApplicationArea = All;
                }
                field("Academic Year"; rec."Academic Year")
                {
                    ApplicationArea = All;
                }
                // SS07OCT (f) Modified fields
                field("Modified By"; Rec."Modified By")
                {
                    ApplicationArea = All;
                }
                field("Modified DateTime"; Rec."Modified Date Time")
                {
                    ApplicationArea = All;
                }
                //SS07OCT
            }
        }
        area(Factboxes)
        {
        }
    }
    actions
    {
        area(Processing)
        {
            // (b) Update Action → open Employee Profile & Award Achievement Card
            action("Update Achievement") //SS07OCT
            {
                Caption = 'Update';
                ApplicationArea = All;
                Image = EditLines;
                RunObject = page "Staff Achivement History Card"; // Page 70548
                RunPageLink = "Entry No" = field("Entry No");
            }
            // (a + e) Achievement History Action → open detailed Achievement History Card
            action(ViewHistory) //SS07OCT
            {
                Caption = 'View Achievement History';
                ApplicationArea = All;
                Image = History;
                RunObject = page "Staff Ach History Arch List";
                RunPageLink = "HRMS ID" = field("HRMS ID");
            }
        }
    }
}

