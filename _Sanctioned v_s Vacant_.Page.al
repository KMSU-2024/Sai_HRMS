page 33066136 "Sanctioned v/s Vacant"
{
    PageType = Card;
    SourceTable = "Sanctioned v/s Vacant";
    Caption = 'Sanctioned Post';
    DeleteAllowed = false;
    Editable = true;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("Sanctioned Post No."; Rec."Sanctioned Post No.")
                {
                    ToolTip = 'Specifies the value of the Sanctioned Post No. field.';
                    Editable = false;
                }
                field("Department/Trade/Section"; Rec."Department/Trade/Section")
                {
                    ToolTip = 'Specifies the value of the Department/Trade/Section field.';
                    Editable = EditBolean;
                }
                field(Designation; Rec.Designation)
                {
                    ToolTip = 'Specifies the value of the Designation field.';
                    Editable = EditBolean;
                }
                field("Sactioned Strength"; Rec."Sactioned Strength")
                {
                    ToolTip = 'Specifies the value of the Sactioned Strength field.';
                    Editable = UpdateMode;
                }
                field("Approval No."; Rec."Approval No.")
                {
                    ToolTip = 'Specifies the value of the Approval No. field.';
                    Editable = UpdateMode;
                }
                field("Financial Year"; Rec."Financial Year")
                {
                    ToolTip = 'Specifies the value of the Financial Year field.';
                    Editable = UpdateMode;
                }
                field(Remarks; Rec.Remarks)
                {
                    ToolTip = 'Specifies the value of the Remarks field.';
                    Editable = UpdateMode;
                }
            }
        }
        area(Factboxes)
        {
            part("Attached Documents"; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = CONST(50121), "No." = FIELD("Sanctioned Post No.");
            }
            systempart(Control1900383207; Links)
            {
                ApplicationArea = RecordLinks;
            }
            systempart(Control1905767507; Notes)
            {
                ApplicationArea = Notes;
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Update)
            {
                ApplicationArea = All;
                Caption = 'Update';
                Image = Edit;
                ToolTip = 'Allows editing of Approval No., Financial Year, Remarks, Department/Trade/Section, Designation, and Sanctioned Strength for submitted records.';
                trigger OnAction()
                var
                    DocumentAttachment: Record "Document Attachment";



                begin
                    isUpdateMode := true;
                    UpdateMode := true;

                    ATtachB := true;
                    Rec.submit := false;


                    // Delete attachments linked to the current record
                    DocumentAttachment.SetRange("Table ID", Database::"Sanctioned v/s Vacant");
                    DocumentAttachment.SetRange("No.", Rec."Sanctioned Post No.");
                    if DocumentAttachment.FindSet() then begin
                        repeat
                            DocumentAttachment.Delete();
                        until DocumentAttachment.Next() = 0;


                        Rec.Modify();
                        CurrPage.Update(true);
                        Message('You can now edit Approval No., Financial Year, Remarks, Department/Trade/Section, Designation, and Sanctioned Strength.');

                        // Existing logic
                        isUpdateMode := true;
                        UpdateMode := true;
                        ATtachB := true;
                        Rec.submit := false;

                        // Delete attachments linked to the current record
                        DocumentAttachment.SetRange("Table ID", Database::"Sanctioned v/s Vacant");
                        DocumentAttachment.SetRange("No.", Rec."Sanctioned Post No.");
                        if DocumentAttachment.FindSet() then begin
                            repeat
                                DocumentAttachment.Delete();
                            until DocumentAttachment.Next() = 0;
                        end;

                        Rec.Modify();

                    end;
                END;
            }

            action(Attachments)
            {
                Promoted = true;
                PromotedOnly = true;
                PromotedCategory = Process;
                Image = Attach;
                ApplicationArea = All;
                Enabled = ATtachB;
                ToolTip = 'Add a file as an attachment.';
                trigger OnAction()
                var
                    DocumentAttachment: Record "Document Attachment";
                    DocumentAttachmentDetails: Page "Document Attachment Details";
                    RecRef: RecordRef;
                begin
                    RecRef.GetTable(Rec);
                    DocumentAttachmentDetails.OpenForRecRef(RecRef);
                    DocumentAttachmentDetails.RunModal();
                end;
            }

            action(SubmitToHistory)
            {
                ApplicationArea = All;
                Caption = 'Submit';
                Image = SendTo;
                ToolTip = 'Submits the record to the Sanctioned Post History table.';
                trigger OnAction()
                var
                    SanctionedHistory: Record "Sanctioned Post History";
                    SanctionedVsVacant: Record "Sanctioned v/s Vacant";
                    DocumentAttachment: Record "Document Attachment";
                    AnnualEst: Record "Annual Establishment Review";
                    emp: Record Employee;
                begin
                    isUpdateMode := false;

                    Rec.TestField("Approval No.");
                    Rec.TestField("Department/Trade/Section");
                    Rec.TestField(Designation);
                    Rec.TestField("Sactioned Strength");
                    Rec.TestField("Financial Year");
                    Rec.TestField(Remarks);
                    //megha 19-9-25 start 
                    // 🔁 New logic to update Annual Establishment
                    AnnualEst.Reset();
                    AnnualEst.SetRange("Dept./Trade/Section", Rec."Department/Trade/Section");
                    AnnualEst.SetRange(Designation, Rec.Designation);

                    if AnnualEst.FindFirst() then begin
                        if (Rec.Designation <> '') and (rEC."Department/Trade/Section" <> '') then begin
                            emp.SetRange(Designation, Rec.Designation);
                            emp.SetRange("Dept./Trade/Section", Rec."Department/Trade/Section");
                            Rec."Person in Position" := emp.Count();
                            rec."Vacant Positions" := Rec."Sactioned Strength" - Rec."Person in Position";
                            Rec.Modify(TRUE);
                        end;
                        AnnualEst."Sanctioned Strength" := Rec."Sactioned Strength";
                        AnnualEst."Persons in Position " := Rec."Person in Position";
                        AnnualEst."Vacancy Position " := Rec."Sactioned Strength" - Rec."Person in Position";
                        AnnualEst.Modify(true);
                    end else begin
                        Message('No matching Annual Establishment record found for Department %1 and Designation %2.',
                          Rec."Department/Trade/Section", Rec.Designation);
                    end;



                    //megha 19-9-25 end


                    if (Rec."Department/Trade/Section" <> '') and (Rec.Designation <> '') then begin
                        SanctionedVsVacant.SetRange("Department/Trade/Section", Rec."Department/Trade/Section");
                        SanctionedVsVacant.SetRange(Designation, Rec.Designation);
                        SanctionedVsVacant.SetFilter("Sanctioned Post No.", '<>%1', Rec."Sanctioned Post No.");
                        if SanctionedVsVacant.FindFirst() then
                            Error('The combination already exists in Sanctioned v/s Vacant.');

                        SanctionedHistory.SetRange("Department/Trade/Section", Rec."Department/Trade/Section");
                        SanctionedHistory.SetRange(Designation, Rec.Designation);
                        SanctionedHistory.SetFilter("Sanctioned Post No.", '<>%1', Rec."Sanctioned Post No.");
                        if SanctionedHistory.FindFirst() then
                            Error('The combination already exists in Sanctioned Post History.');
                    end;

                    SanctionedHistory.SetRange("Approval No.", Rec."Approval No.");
                    if SanctionedHistory.FindFirst() then
                        Error('Approval No. already exists in Sanctioned Post History.');

                    SanctionedVsVacant.SetRange("Approval No.", Rec."Approval No.");
                    SanctionedVsVacant.SetFilter("Sanctioned Post No.", '<>%1', Rec."Sanctioned Post No.");
                    if SanctionedVsVacant.FindFirst() then
                        Error('Approval No. already exists in Sanctioned v/s Vacant.');

                    SanctionedHistory.SetRange("Sanctioned Post No.", Rec."Sanctioned Post No.");
                    if SanctionedHistory.FindLast() then
                        if SanctionedHistory."New Sanctioned Strength" = Rec."Sactioned Strength" then
                            Error('This sanctioned strength has not been updated.');

                    DocumentAttachment.SetRange("Table ID", Database::"Sanctioned v/s Vacant");
                    DocumentAttachment.SetRange("No.", Rec."Sanctioned Post No.");
                    if not DocumentAttachment.FindFirst() then
                        Error('Attachment is mandatory before submitting.');

                    SanctionedHistory.Init();
                    SanctionedHistory."Sanctioned Post No." := REC."Sanctioned Post No.";
                    SanctionedHistory."Approval No." := REC."Approval No.";
                    SanctionedHistory.Designation := REC.Designation;
                    SanctionedHistory."Department/Trade/Section" := REC."Department/Trade/Section";
                    SanctionedHistory."Entry No." := Rec."Approval No.";
                    SanctionedHistory."Old Sanctioned Strength" := GetLastStrength();
                    SanctionedHistory."New Sanctioned Strength" := Rec."Sactioned Strength";
                    SanctionedHistory."Modified By" := UserId;
                    SanctionedHistory."Modified On" := CurrentDateTime;
                    SanctionedHistory.Insert(true);

                    AttachMent.CopyAttachments(Rec);
                    Rec.submit := true;
                    UpdateMode := false;
                    EditBolean := false;
                    ATtachB := false;
                    Rec.Modify();
                    Message('Record submitted successfully.');
                end;
            }

            action(SanctionedPostHistory)
            {
                ApplicationArea = All;
                Caption = 'Sanctioned Post History';
                Image = History;
                ToolTip = 'View the history of sanctioned post changes.';
                trigger OnAction()
                var
                    SanctionedHistoryList: Record "Sanctioned Post History";
                begin
                    SanctionedHistoryList.SetRange("Sanctioned Post No.", Rec."Sanctioned Post No.");
                    Page.RunModal(Page::"Sanctioned Post History", SanctionedHistoryList);
                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
    begin
        IsNewRecord := true;
        ATtachB := true;
        EditBolean := true;
        UpdateMode := true;
        Rec.submit := false;

        /* if Rec."Sanctioned Post No." = '' then
            Rec."Sanctioned Post No." := NoSeriesMgt.GetNextNo('SANCTIONED', WorkDate(), true); */
        //CurrPage.Update();
    end;

    trigger OnOpenPage()
    begin
        xFinancialYear := REC."Financial Year";
        //OriginalRec := Rec;
        //IsNewRecord := (Rec.IsTemporary) or (Rec."Sanctioned Post No." = '');
        IsNewRecord := false;
    end;



    // ... (other parts of the page remain the same) ...

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    var
        ConfirmResult: Boolean;
        ChangesMade: Boolean;
    begin
        RevertChanges := false; // Reset the flag
        ChangesMade :=
            (Rec."Department/Trade/Section" <> OriginalRec."Department/Trade/Section") or
            (Rec.Designation <> OriginalRec.Designation) or
            (Rec."Sactioned Strength" <> OriginalRec."Sactioned Strength") or
            (Rec."Approval No." <> OriginalRec."Approval No.") or
            (Rec."Financial Year" <> OriginalRec."Financial Year") or
            (Rec.Remarks <> OriginalRec.Remarks);

        // Check if changes were made OR if it's a new record (implying potential unsaved work)
        // Also, only prompt if the record is not already submitted.
        if (ChangesMade or IsNewRecord) and not Rec.submit then begin
            // Ask if the user wants to DISCARD the changes/new record.
            // The phrasing is crucial: "Yes" means DISCARD, "No" means CONTINUE EDITING.
            ConfirmResult := Confirm('You have unsaved changes or a new record. Do you want to DISCARD them and close the page?', false); // Default 'No' is safer

            if ConfirmResult and ChangesMade and not IsNewRecord then begin
                // User chose YES -> Discard changes/record
                RevertChanges := true;
                if (Rec."XSactioned Strength" <> 0) then
                    rec."Sactioned Strength" := Rec."XSactioned Strength";
                if rec."XApproval No." <> '' then
                    Rec."Approval No." := rec."XApproval No.";
                if rec.xRemarks <> '' then
                    rec.Remarks := rec.xRemarks;
                if XFinancialYear <> '' then
                    rec."Financial Year" := XFinancialYear;

                rec.Modify(TRUE);
                exit(true); // Allow the page to close, OnClosePage will handle the revert/delete

            end
            else if ConfirmResult and IsNewRecord then
                rec.Delete()
            else begin

                exit(false); // Cancel the page close
            end;
        end;
        // If no changes were made on an existing record, or the record is submitted, allow closing
        exit(true);
    end;

    /*  trigger OnClosePage()
     begin
         if RevertChanges then begin
             if IsNewRecord then begin
                 // For a new record, discarding means deleting it if it exists in the database.
                 // Use the current record's key value (the one assigned in OnNewRecord).
                 // It's safer to attempt Get using the current Rec's key, not necessarily OriginalRec's.
                 if Rec.Get(Rec."Sanctioned Post No.") then begin
                     // If Get succeeds, the record exists in the DB, delete it.
                     Rec.Delete(true);
                 end;
                 // If Get fails, it likely means it was never inserted or was rolled back,
                 // so effectively it's already "discarded".
             end else begin
                 // For an existing record, revert its fields to the original state

                 //Rec := OriginalRec; // Copy the original data back
                 Rec.Modify(true);  // Save the reverted state
             end;
         end;

         // If RevertChanges is false, no action needed.
     end;
  */
    // ... (other parts of the page remain the same) ...

    local procedure ChangesExist(): Boolean
    begin
        exit(
            (Rec."Department/Trade/Section" <> OriginalRec."Department/Trade/Section") or
            (Rec.Designation <> OriginalRec.Designation) or
            (Rec."Sactioned Strength" <> OriginalRec."Sactioned Strength") or
            (Rec."Approval No." <> OriginalRec."Approval No.") or
            (Rec."Financial Year" <> OriginalRec."Financial Year") or
            (Rec.Remarks <> OriginalRec.Remarks)
        );
    end;




    local procedure GetLastStrength(): Integer
    var
        SanctionedHistory: Record "Sanctioned Post History";
    begin
        SanctionedHistory.SetRange("Sanctioned Post No.", Rec."Sanctioned Post No.");
        if SanctionedHistory.FindLast() then
            exit(SanctionedHistory."New Sanctioned Strength");
        exit(0);
    end;

    local procedure HasHistoryRecord(): Boolean
    var
        SanctionedHistory: Record "Sanctioned Post History";
    begin
        SanctionedHistory.SetRange("Sanctioned Post No.", Rec."Sanctioned Post No.");
        exit(SanctionedHistory.FindLast());
    end;

    var
        ATtachB: Boolean;
        EditBolean: Boolean;
        AttachMent: Codeunit AttachmentsCodeunit;
        UpdateMode: Boolean;
        OriginalRec: Record "Sanctioned v/s Vacant";
        IsNewRecord: Boolean;
        isUpdateMode: Boolean;

        DiscardChangesRequested: Boolean;

        RevertChanges: Boolean;
        UserChoseToDiscard: Boolean;
        xFinancialYear: Code[20];


}
