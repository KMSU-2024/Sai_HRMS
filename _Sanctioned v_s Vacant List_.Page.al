page 33066135 "Sanctioned v/s Vacant List"
{
    PageType = List;
    CardPageId = "Sanctioned v/s Vacant";
    ApplicationArea = All;
    Editable = TRUE;
    Caption = 'Sactioned Post List';
    UsageCategory = Administration;
    SourceTable = "Sanctioned v/s Vacant";
    DeleteAllowed = TRUE;
    InsertAllowed = TRUE;
    RefreshOnActivate = true;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Sanctioned Post No.";Rec."Sanctioned Post No.")
                {
                    ApplicationArea = all;
                }
                field("Department/Trade/Section";Rec."Department/Trade/Section")
                {
                    ApplicationArea = ALL;
                }
                field(Designation;Rec.Designation)
                {
                    ApplicationArea = ALL;
                }
                field("Approval No.";Rec."Approval No.")
                {
                    ApplicationArea = ALL;
                }
                field("Sactioned Strength";Rec."Sactioned Strength")
                {
                    ApplicationArea = all;
                }
                field(Remarks;Rec.Remarks)
                {
                    ApplicationArea = all;
                }
                field("File Name";"File Name")
                {
                    ApplicationArea = all;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                trigger OnAction()begin
                end;
            }
        }
    }
    trigger OnOpenPage()var myInt: Integer;
    begin
    //  Clear(Rec);
    end;
    /* trigger OnOpenPage()
    var
        curec: Record "Sanctioned v/s Vacant";
    begin
        if curec.Get(Rec."Sanctioned Post No.") then begin

            if (curec."Department/Trade/Section" = '') and
                       (curec.Designation = '') and
                       (curec."Sactioned Strength" = 0) and
                       (curec."Approval No." = '') and
                       (curec."Financial Year" = '') and (curec."Uploaded Document" = true) then

                // if not submit and (Rec."Sanctioned Post No." <> '') and IsEmpty then begin
                Rec.Delete();

        end;
    end;
 */
    var myInt: Integer;
}
