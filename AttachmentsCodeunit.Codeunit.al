codeunit 33065928 AttachmentsCodeunit //creating attachments and copying attachments
{
    trigger OnRun()begin
    end;
    [EventSubscriber(ObjectType::Page, Page::"Document Attachment Factbox", 'OnBeforeDrillDown', '', false, false)]
    local procedure OnBeforeDrillDown(DocumentAttachment: Record "Document Attachment";
    var RecRef: RecordRef)var GenJrnlLine: Record "Gen. Journal Line";
    PostedGenJnlLine: Record "Posted Gen. Journal Line";
    sanctionedPost: Record "Sanctioned v/s Vacant";
    PurchRcptHeader: Record "Purch. Rcpt. Header";
    begin
        case DocumentAttachment."Table ID" of DATABASE::"Sanctioned v/s Vacant": begin
            RecRef.Open(DATABASE::"Sanctioned v/s Vacant");
            if sanctionedPost.Get(DocumentAttachment."No.")then RecRef.GetTable(sanctionedPost);
        end;
        DATABASE::"Sanctioned Post History": begin
            RecRef.Open(DATABASE::"Sanctioned Post History");
            if sanctionedPost.Get(DocumentAttachment."No.")then RecRef.GetTable(sanctionedPost);
        end;
        end;
    end;
    [EventSubscriber(ObjectType::Page, Page::"Document Attachment Details", 'OnAfterOpenForRecRef', '', false, false)]
    local procedure OnAfterOpenForRecRef(var DocumentAttachment: Record "Document Attachment";
    var RecRef: RecordRef;
    var FlowFieldsEditable: Boolean);
    var FieldRef: FieldRef;
    RecNo: Code[20];
    LineNo: Integer;
    begin
        case RecRef.Number of DATABASE::"Sanctioned v/s Vacant": begin
            FieldRef:=RecRef.Field(1);
            RecNo:=FieldRef.Value;
            DocumentAttachment.SetRange("No.", RecNo);
            FieldRef:=RecRef.Field(4);
            LineNo:=FieldRef.Value;
            DocumentAttachment.SetRange("Line No.", LineNo);
            FlowFieldsEditable:=false;
        end;
        DATABASE::"Sanctioned Post History": begin
            DocumentAttachment.SetRange("No.", RecRef.Field(2).Value);
            DocumentAttachment.setRange("Line No.", RecRef.Field(4).Value);
            DocumentAttachment.SetRange("Table ID", Database::"Sanctioned Post History");
            FlowFieldsEditable:=false;
        end;
        end;
    end;
    [EventSubscriber(ObjectType::Table, Database::"Document Attachment", 'OnAfterInitFieldsFromRecRef', '', false, false)]
    local procedure OnAfterInitFieldsFromRecRef(var DocumentAttachment: Record "Document Attachment";
    var RecRef: RecordRef)var FieldRef: FieldRef;
    RecNo: Code[20];
    LineNo: Integer;
    GenJrnlLine: code[20];
    begin
        case RecRef.Number of DATABASE::"Sanctioned v/s Vacant": begin
            FieldRef:=RecRef.Field(1);
            RecNo:=FieldRef.Value;
            DocumentAttachment.Validate("No.", RecNo);
            FieldRef:=RecRef.Field(4);
            LineNo:=FieldRef.Value;
            DocumentAttachment.Validate("Line No.", LineNo);
        end;
        DATABASE::"Sanctioned Post History": begin
            FieldRef:=RecRef.Field(1);
            RecNo:=FieldRef.Value;
            DocumentAttachment.SetRange("No.", RecRef.Field(2).Value);
            DocumentAttachment.setRange("Line No.", RecRef.Field(4).Value);
            DocumentAttachment.SetRange("Table ID", Database::"Sanctioned Post History");
        end;
        end;
    end;
    procedure CopyAttachments(OrderConfirmation: Record "Sanctioned v/s Vacant")var DocumentAttachment: Record "Document Attachment";
    PostedOrderConfirmation: Record "Sanctioned Post History";
    NewDocumentAttachment: Record "Document Attachment";
    DCID: Integer;
    begin
        // Find the corresponding posted order
        PostedOrderConfirmation.SetRange("Sanctioned Post No.", OrderConfirmation."Sanctioned Post No.");
        if not PostedOrderConfirmation.FindFirst()then Error('Posted Order for %1 not found.', OrderConfirmation."Sanctioned Post No.");
        // Get next ID for attachments
        DocumentAttachment.Reset();
        DocumentAttachment.SetRange("Table ID", Database::"Sanctioned Post History");
        if DocumentAttachment.FindLast()then DCID:=DocumentAttachment.ID + 1
        else
            DCID:=1;
        // Copy attachments
        DocumentAttachment.Reset();
        DocumentAttachment.SetRange("Table ID", Database::"Sanctioned v/s Vacant");
        DocumentAttachment.SetRange("No.", OrderConfirmation."Sanctioned Post No.");
        DocumentAttachment.SetRange("Line No.", OrderConfirmation."Sactioned Strength");
        if DocumentAttachment.FindSet()then begin
            repeat NewDocumentAttachment.Init();
                NewDocumentAttachment.TransferFields(DocumentAttachment);
                NewDocumentAttachment."Table ID":=Database::"Sanctioned Post History";
                NewDocumentAttachment."No.":=PostedOrderConfirmation."Sanctioned Post No.";
                NewDocumentAttachment.ID:=DCID;
                NewDocumentAttachment.Insert(true);
                DCID:=DCID + 1;
            until DocumentAttachment.Next() = 0;
        end;
    end;
    procedure ViewHistorySanctionedPost(SancPostNo: Code[20]) //megha 30-10-25
    var SanctionedHistoryList: Record "Sanctioned Post History";
    begin
        SanctionedHistoryList.SetRange("Sanctioned Post No.", SancPostNo);
        Page.RunModal(Page::"Sanctioned Post History", SanctionedHistoryList);
    end;
    procedure SubmitHistorySanctionPost(No: Code[20];
    ApprovalNo: Code[20];
    FinYear: Code[20];
    Remarks: Text[60];
    SanctionStrength: Integer) //megha 30-10-25
    var SanctionedHistory: Record "Sanctioned Post History";
    SanctionedVsVacant: Record "Sanctioned v/s Vacant";
    DocumentAttachment: Record "Document Attachment";
    AnnualEst: Record "Annual Establishment Review";
    emp: Record Employee;
    SanctPost: Record "Sanctioned v/s Vacant";
    begin
        SanctPost.Reset();
        SanctPost.SetRange("Sanctioned Post No.", No);
        SanctPost.Validate("Approval No.", ApprovalNo);
        SanctPost.Validate("Financial Year", FinYear);
        SanctPost.Validate(Remarks, Remarks);
        SanctPost.Validate("Sactioned Strength", SanctionStrength);
        SanctPost.modify();
        // 🔁 New logic to update Annual Establishment
        AnnualEst.Reset();
        AnnualEst.SetRange("Dept./Trade/Section", SanctPost."Department/Trade/Section");
        AnnualEst.SetRange(Designation, SanctPost.Designation);
        if AnnualEst.FindFirst()then begin
            if(SanctPost.Designation <> '') and (SanctPost."Department/Trade/Section" <> '')then begin
                emp.SetRange(Designation, SanctPost.Designation);
                emp.SetRange("Dept./Trade/Section", SanctPost."Department/Trade/Section");
                SanctPost."Person in Position":=emp.Count();
                SanctPost."Vacant Positions":=SanctPost."Sactioned Strength" - SanctPost."Person in Position";
                SanctPost.Modify(TRUE);
            end;
            AnnualEst."Sanctioned Strength":=SanctPost."Sactioned Strength";
            AnnualEst."Persons in Position ":=SanctPost."Person in Position";
            AnnualEst."Vacancy Position ":=SanctPost."Sactioned Strength" - SanctPost."Person in Position";
            AnnualEst.Modify(true);
        end
        else
        begin
            Message('No matching Annual Establishment record found for Department %1 and Designation %2.', SanctPost."Department/Trade/Section", SanctPost.Designation);
        end;
        //megha 19-9-25 end
        if(SanctPost."Department/Trade/Section" <> '') and (SanctPost.Designation <> '')then begin
            SanctionedVsVacant.SetRange("Department/Trade/Section", SanctPost."Department/Trade/Section");
            SanctionedVsVacant.SetRange(Designation, SanctPost.Designation);
            SanctionedVsVacant.SetFilter("Sanctioned Post No.", '<>%1', SanctPost."Sanctioned Post No.");
            if SanctionedVsVacant.FindFirst()then Error('The combination already exists in Sanctioned v/s Vacant.');
            SanctionedHistory.SetRange("Department/Trade/Section", SanctPost."Department/Trade/Section");
            SanctionedHistory.SetRange(Designation, SanctPost.Designation);
            SanctionedHistory.SetFilter("Sanctioned Post No.", '<>%1', SanctPost."Sanctioned Post No.");
            if SanctionedHistory.FindFirst()then Error('The combination already exists in Sanctioned Post History.');
        end;
        SanctionedHistory.SetRange("Approval No.", SanctPost."Approval No.");
        if SanctionedHistory.FindFirst()then Error('Approval No. already exists in Sanctioned Post History.');
        SanctionedVsVacant.SetRange("Approval No.", SanctPost."Approval No.");
        SanctionedVsVacant.SetFilter("Sanctioned Post No.", '<>%1', SanctPost."Sanctioned Post No.");
        if SanctionedVsVacant.FindFirst()then Error('Approval No. already exists in Sanctioned v/s Vacant.');
        SanctionedHistory.SetRange("Sanctioned Post No.", SanctPost."Sanctioned Post No.");
        if SanctionedHistory.FindLast()then if SanctionedHistory."New Sanctioned Strength" = SanctPost."Sactioned Strength" then Error('This sanctioned strength has not been updated.');
        DocumentAttachment.SetRange("Table ID", Database::"Sanctioned v/s Vacant");
        DocumentAttachment.SetRange("No.", SanctPost."Sanctioned Post No.");
        if not DocumentAttachment.FindFirst()then Error('Attachment is mandatory before submitting.');
        SanctionedHistory.Init();
        SanctionedHistory."Sanctioned Post No.":=SanctPost."Sanctioned Post No.";
        SanctionedHistory."Approval No.":=SanctPost."Approval No.";
        SanctionedHistory.Designation:=SanctPost.Designation;
        SanctionedHistory."Department/Trade/Section":=SanctPost."Department/Trade/Section";
        SanctionedHistory."Entry No.":=SanctPost."Approval No.";
        SanctionedHistory."Old Sanctioned Strength":=GetLastStrength();
        SanctionedHistory."New Sanctioned Strength":=SanctPost."Sactioned Strength";
        SanctionedHistory."Modified By":=UserId;
        SanctionedHistory."Modified On":=CurrentDateTime;
        SanctionedHistory.Insert(true);
        CopyAttachments(SanctPost);
        SanctPost.submit:=true;
        SanctPost.Modify();
        Message('Record submitted successfully.');
    end;
    local procedure GetLastStrength(): Integer //megha 30-10-25
 var SanctionedHistory: Record "Sanctioned Post History";
    SanctPost: Record "Sanctioned v/s Vacant";
    begin
        SanctionedHistory.SetRange("Sanctioned Post No.", SanctPost."Sanctioned Post No.");
        if SanctionedHistory.FindLast()then exit(SanctionedHistory."New Sanctioned Strength");
        exit(0);
    end;
    //var
    //pg: Page 60525;
    procedure UpdateSanctPost(No: Code[20])var DocumentAttachment: Record "Document Attachment";
    sanctPost: Record "Sanctioned v/s Vacant";
    begin
        sanctPost.Reset();
        sanctPost.submit:=false;
        // Delete attachments linked to the current record
        DocumentAttachment.SetRange("Table ID", Database::"Sanctioned v/s Vacant");
        DocumentAttachment.SetRange("No.", sanctPost."Sanctioned Post No.");
        if DocumentAttachment.FindSet()then begin
            repeat DocumentAttachment.Delete();
            until DocumentAttachment.Next() = 0;
            sanctPost.Modify();
            Message('You can now edit Approval No., Financial Year, Remarks, Department/Trade/Section, Designation, and Sanctioned Strength.');
        /*  // Existing logic

             sanctPost.submit := false;

             // Delete attachments linked to the current record
             DocumentAttachment.SetRange("Table ID", Database::"Sanctioned v/s Vacant");
             DocumentAttachment.SetRange("No.", sanctPost."Sanctioned Post No.");
             if DocumentAttachment.FindSet() then begin
                 repeat
                     DocumentAttachment.Delete();
                 until DocumentAttachment.Next() = 0;
             end;

             sanctPost.Modify(); */
        end;
    END;
}
