page 33066032 "Sanctioned Post History"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Sanctioned Post History";
    //Editable = false;
    DeleteAllowed = FALSE;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = ALL;
                    Editable = false;
                }
                field("Sanctioned Post No."; Rec."Sanctioned Post No.")
                {
                    ApplicationArea = ALL;
                    Editable = false;
                }
                field("Department/Trade/Section"; Rec."Department/Trade/Section")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field(Designation; Rec.Designation)
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Approval No."; Rec."Approval No.")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Old Sanctioned Strength"; Rec."Old Sanctioned Strength")
                {
                    ApplicationArea = ALL;
                    Editable = false;
                }
                field("New Sanctioned Strength"; Rec."New Sanctioned Strength")
                {
                    ApplicationArea = ALL;
                    Editable = false;
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = ALL;
                    Editable = false;
                }
                field("Modified By"; Rec."Modified By")
                {
                    ApplicationArea = ALL;
                    Editable = false;
                }
                field("Modified On"; Rec."Modified On")
                {
                    ApplicationArea = ALL;
                    Editable = false;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(DocAttachPurOrd)
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                Image = Attach;
                ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

                trigger OnAction()
                var
                    DocumentAttachmentDetails: Page "Document Attachment Details";
                    DocumentAttRec: Record "Document Attachment";
                    RecRef: RecordRef;
                    SanctionedVsVacant: Record "Sanctioned Post History";
                begin
                    RecRef.GetTable(Rec); // Converts the current Rec (record) into a RecordRef.
                    DocumentAttachmentDetails.OpenForRecRef(RecRef); // Opens the attachment page linked to this RecRef.
                    DocumentAttachmentDetails.RunModal(); // Displays the page modally to user to add/view attachments.
                    CurrPage.Update();
                end;
            }
        }
    }
    var
        myInt: Integer;
}
