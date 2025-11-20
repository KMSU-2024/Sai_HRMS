page 33065740 "Promotion History Card"
{
    PageType = Card;
    // ApplicationArea = All;
    UsageCategory = History;
    SourceTable = "Employee Promotion History";
    //Editable = false;
    Caption = 'Employee promotion History card';

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("Entry No";rec."Entry No")
                {
                    ApplicationArea = All;
                }
                field("HRMS ID";rec."HRMS ID")
                {
                    ApplicationArea = All;
                }
                field("Employee Name";rec.Name)
                {
                    ApplicationArea = All;
                }
                field("From Designation";rec."From Designation")
                {
                    ApplicationArea = All;
                }
                field("To Designation";rec."To Designation")
                {
                    ApplicationArea = All;
                }
                field("Promotion Order Date";rec."Promotion Order Date")
                {
                    ApplicationArea = All;
                }
                field("Letter NO";rec."Letter NO")
                {
                    ApplicationArea = All;
                }
                field("Order Issuing Authority";rec."Order Issuing Authority")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Submit Promotion1") //SS07OCT
            {
                Caption = 'Submit';
                ApplicationArea = All;
                Image = Approve;

                trigger OnAction()var PromoHistArchive: Record "Employee Promot History Arch";
                PROMTOIONARCH: Record "Employee Promot History Arch";
                OldDesignation: Code[50];
                LastVersion: Integer;
                InS: InStream;
                OutS: OutStream;
                employee: Record Employee;
                begin
                    // Validate required fields before saving
                    if Rec."To Designation" = '' then Error('Please fill "Promoted To" before submitting.');
                    if Rec."Promotion Order Date" = 0D then Error('Please fill "Promotion Order Date" before submitting.');
                    if Rec."Letter NO" = '' then Error('Please fill "Letter NO" before submitting.');
                    if Format(Rec."Order Issuing Authority") = '' then Error('Please fill "Order Issuing Authority" before submitting.');
                    // Store old designation before overwrite
                    OldDesignation:=Rec."From Designation";
                    // Find last version for history
                    PromoHistArchive.Reset();
                    PromoHistArchive.SetRange("HRMS ID", Rec."HRMS ID");
                    if PromoHistArchive.FindLast()then LastVersion:=PromoHistArchive."Version No."
                    else
                        LastVersion:=0;
                    // Insert into history table
                    Clear(PromoHistArchive);
                    PromoHistArchive.Init();
                    PromoHistArchive."HRMS ID":=Rec."HRMS ID";
                    PromoHistArchive.Name:=Rec.Name;
                    PromoHistArchive."Entry No":=Rec."Entry No";
                    PromoHistArchive."From Designation":=Rec."From Designation";
                    PROMTOIONARCH.Reset();
                    PROMTOIONARCH.SetRange("HRMS ID", PromoHistArchive."HRMS ID");
                    if PROMTOIONARCH.FindLast()then rec."From Designation":=PROMTOIONARCH."To Designation"
                    else
                        rec."From Designation":=OldDesignation;
                    PromoHistArchive."From Designation":=Rec."From Designation";
                    PromoHistArchive."To Designation":=Rec."To Designation"; // ✅ new one
                    PromoHistArchive."Promotion Order Date":=Rec."Promotion Order Date";
                    PromoHistArchive."Letter NO":=Rec."Letter NO";
                    PromoHistArchive."Version No.":=LastVersion + 1;
                    PromoHistArchive."Modified By":=UserId;
                    PromoHistArchive."Modified Date Time":=CurrentDateTime;
                    Rec.CalcFields("Promotion Order"); //MEGHA 14-10-25 Changed from upload promotion order to promotion order because it already exists
                    if Rec."Promotion Order".HasValue then begin //MEGHA 14-10-25 Changed from upload promotion order to promotion order because it already exists
                        Rec."Promotion Order".CreateInStream(InS); //MEGHA 14-10-25 Changed from upload promotion order to promotion order because it already exists
                        PromoHistArchive."Upload Promotion Order".CreateOutStream(OutS);
                        CopyStream(OutS, InS);
                    end;
                    PromoHistArchive.Insert(true);
                    if employee.Get(rec."HRMS ID")then begin
                        employee.Designation:=rec."To Designation";
                        employee.Modify(true);
                    end;
                    // 🔹 Update main record (Card Page should now reflect latest state)
                    //  Rec."From Designation" := Rec."To Designation";
                    rec."Modified By":=UserId;
                    rec."Modified Date Time":=CurrentDateTime;
                    Rec.Modify(true);
                    Message('Promotion submitted. Old: %1 → New: %2', OldDesignation, Rec."To Designation");
                end;
            }
            action(UploadDocument) //SS07OCT
            {
                ApplicationArea = All;
                Image = Attach;
                Caption = 'Upload Document';
                ToolTip = 'Upload a PDF document (max 3MB).';

                trigger OnAction()var InStr: InStream;
                OutStr: OutStream;
                begin
                    // Clear previous document
                    if Rec."Promotion Order".HasValue()then Clear(Rec."Promotion Order"); //MEGHA 14-10-25 Changed from upload promotion order to promotion order because it already exists
                    Clear(FileName);
                    Clear(TempBlob);
                    // Upload PDF file
                    if UploadIntoStream('Upload File', '', 'PDF Files (*.pdf)|*.pdf', FileName, InStr)then begin
                        TempBlob.CreateOutStream(OutStr);
                        CopyStream(OutStr, InStr);
                        if TempBlob.Length() > 3000000 then Error('File size must be less than or equal to 3MB.');
                        Rec."Promotion Order".CreateOutStream(OutStr); //MEGHA 14-10-25 Changed from upload promotion order to promotion order because it already exists
                        TempBlob.CreateInStream(InStr);
                        CopyStream(OutStr, InStr);
                        Rec."Promotion Order File Name":=FileName;
                        Rec.Modify();
                        Message('Document %1 uploaded successfully.', FileName);
                    end;
                // No message if user cancels (Back)
                end;
            }
            action(DownloadDocument) //SS07OCT
            {
                ApplicationArea = All;
                Image = Download;
                Caption = 'Download Document';
                ToolTip = 'Download the uploaded document.';

                trigger OnAction()var FileMngCU: Codeunit "File Management";
                InStr: InStream;
                begin
                    if Rec."Promotion Order".HasValue()then begin //MEGHA 14-10-25 Changed from upload promotion order to promotion order because it already exists
                        Rec."Promotion Order".CreateInStream(InStr); //MEGHA 14-10-25 Changed from upload promotion order to promotion order because it already exists
                        FileMngCU.BLOBExport(TempBlob, 'Application_' + Rec."HRMS ID" + '.pdf', true);
                    end
                    else
                        Error('No document found to download.');
                end;
            }
        // action(ActionName)
        // {
        //     ApplicationArea = All;
        //     trigger OnAction()
        //     begin
        //     end;
        // }
        }
    }
    //sai start
    local procedure HasCriticalChanges(): Boolean var OriginalRec: Record "Employee Promotion History";
    begin
        if not OriginalRec.Get(Rec."Entry No")then exit(false); // No record to compare, probably new
        // Compare only key fields
        if Rec."To Designation" <> OriginalRec."To Designation" then exit(true);
        if Rec."Promotion Order Date" <> OriginalRec."Promotion Order Date" then exit(true);
        if Rec."Letter NO" <> OriginalRec."Letter NO" then exit(true);
        if Rec."Order Issuing Authority" <> OriginalRec."Order Issuing Authority" then exit(true);
        exit(false); // No key field changed
    end;
    trigger OnOpenPage()var LoadedRec: Record "Employee Promotion History"; //SS07OCT
    begin
        if Rec."HRMS ID" <> '' then iseditable:=false
        else if Rec."HRMS ID" = '' then iseditable:=true;
        // Save original values before clearing
        OriginalToDesignation:=Rec."To Designation";
        OriginalPromotionOrderDate:=Rec."Promotion Order Date";
        OriginalLetterNo:=Rec."Letter NO";
        OriginalOrderIssuingAuthority:=FORMAT(Rec."Order Issuing Authority");
        // Clear fields for fresh input (UI only, not DB until saved)
        if rec."HRMS ID" <> '' then begin
            Rec."To Designation":='';
            Rec."Promotion Order Date":=0D;
            Rec."Letter NO":='';
            Rec."Order Issuing Authority":=Rec."Order Issuing Authority"::" ";
            Rec."From Designation":=OriginalToDesignation;
            rec.Modify();
        end;
    end;
    trigger OnClosePage() //SS07OCT
    begin
        // If user leaves all promotion fields blank → restore old values
        if(Rec."To Designation" = '')then Rec."To Designation":=OriginalToDesignation;
        if(Rec."Promotion Order Date" = 0D)then Rec."Promotion Order Date":=OriginalPromotionOrderDate;
        if(Rec."Letter NO" = '')then Rec."Letter NO":=OriginalLetterNo;
        if(Rec."Order Issuing Authority" = Rec."Order Issuing Authority"::" ")then EVALUATE(Rec."Order Issuing Authority", OriginalOrderIssuingAuthority);
        Rec.Modify(); // Write old values back to DB
    end;
    trigger OnAfterGetCurrRecord() //SS07OCT
    var myInt: Integer;
    emp: Record Employee;
    begin
        if Rec."HRMS ID" <> '' then begin
            if emp.Get(rec."HRMS ID")then rec."From Designation":=emp.Designation;
        end;
    end;
    //sai end
    var //SS07OCT
 myInt: Integer;
    iseditable: Boolean;
    promotedtovar: code[50];
    promoteddatevar: Date;
    letterno: Code[10];
    promotionorderissue: Text;
    OriginalToDesignation: Code[50];
    OriginalPromotionOrderDate: Date;
    OriginalLetterNo: Code[50];
    OriginalOrderIssuingAuthority: Code[50];
    FileName: Text;
    TempBlob: Codeunit "Temp Blob";
}
