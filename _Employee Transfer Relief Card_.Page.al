page 33065731 "Employee Transfer Relief Card"
{
    Caption = 'Employee Transfer Relieve Card';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Documents;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("HRMS ID"; HRMSID)
                {
                    ApplicationArea = All;
                    Caption = 'HRMS ID';
                    TableRelation = Employee."No." where("SLCM Employee" = const(false));

                    trigger onValidate()
                    var
                        Employee: Record 5200;
                    begin
                        Employee.Reset();
                        Employee.SetRange("No.", HRMSID);
                        If Employee.FindFirst() then begin
                            Name := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                            Designation := Employee.Designation;
                            FromStation := Employee."Current Station";
                        end;
                    end;
                }
                field("Employee Name"; Name)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Designation; Designation)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("From Station"; FromStation)
                {
                    ApplicationArea = All;
                    // Caption = 'From Station';
                    // TableRelation = Institute."Institute Code";
                    Editable = false;
                }
                field(ToStation; ToStation)
                {
                    ApplicationArea = All;
                    Caption = 'To Station';
                    //TableRelation = Institute."Institute Code";
                    TableRelation = Company.Name;

                    trigger OnValidate()
                    var
                    begin
                        if ToStation = FromStation then Error('From Station and To station Cannot be same.');
                    end;
                }
                field("Order Issuing Authority"; OrderIssueAuthVar)
                {
                    ApplicationArea = All;
                    Caption = 'Transfer Order Issuing Authority';
                }
                field("Relief Order No."; RelifeOrderNoVar)
                {
                    ApplicationArea = All;
                    Caption = 'Relieving Order No';

                    trigger OnValidate()
                    var
                        TransferLLLREC: Record "Transfer Joining History";
                    begin
                        TransferLLLREC.Reset();
                        TransferLLLREC.SetRange("Relief Order No.", RelifeOrderNoVar);
                        TransferLLLREC.SetRange("Relief Order Date", RelifeOrderDateVar);
                        TransferLLLREC.SetRange("HRMS ID", HRMSID);
                        if TransferLLLREC.FindFirst() then Error('This Relief no %1 and date %2 is already used for This Employee %3', RelifeOrderNoVar, RelifeOrderDateVar, TransferLLLREC."HRMS ID");
                    end;
                }
                field("Relief Order Date"; RelifeOrderDateVar)
                {
                    ApplicationArea = All;
                    Caption = 'Relieving Order Date';

                    trigger OnValidate()
                    var
                        TransferLLLREC: Record "Transfer Joining History";
                    begin
                        TransferLLLREC.Reset();
                        TransferLLLREC.SetRange("Relief Order No.", RelifeOrderNoVar);
                        TransferLLLREC.SetRange("Relief Order Date", RelifeOrderDateVar);
                        TransferLLLREC.SetRange("HRMS ID", HRMSID);
                        if TransferLLLREC.FindFirst() then Error('This Relief no %1 and date %2 is already used for This Employee %3', RelifeOrderNoVar, RelifeOrderDateVar, TransferLLLREC."HRMS ID");
                    end;
                }
                field(TransferOrderDate; TransferOrderDate)
                {
                    ApplicationArea = All;
                    Caption = 'Transfer Order Date';
                }
                field(LetterNo; LetterNo)
                {
                    ApplicationArea = All;
                    Caption = 'Transfer Letter No';

                    trigger OnValidate()
                    var
                        TransferHistLocRec: Record "Transfer Joining History";
                    begin
                        TransferHistLocRec.Reset();
                        TransferHistLocRec.SetRange("Transfer Date", TransferOrderDate);
                        TransferHistLocRec.SetRange("Letter No", LetterNo);
                        TransferHistLocRec.SetRange("HRMS ID", HRMSID);
                        if TransferHistLocRec.FindFirst() then Error('This Transfer Detailes (Letter No %1 and Transfer Order Date %2) are already Exist for Employee %3', LetterNo, TransferOrderDate, HRMSID);
                    end;
                }
                field(RelievingEvent; RelievingEvent)
                {
                    ApplicationArea = All;
                    Caption = 'Relieving Event';

                    trigger OnValidate()
                    var
                    begin
                        ReliveventBoolCheck := false;
                        if RelievingEvent = RelievingEvent::"Promotion Transfer" then ReliveventBoolCheck := true;
                    end;
                }
                field("To designation"; ToDesignNationVar)
                {
                    Editable = ReliveventBoolCheck;
                    ApplicationArea = All;
                    TableRelation = Designation.Code;
                }
                field("Promotion order Date"; PromotionOrderDate)
                {
                    Editable = ReliveventBoolCheck;
                    ApplicationArea = All;
                }
                field("Promotion letter No"; PromotionLetterNo)
                {
                    ApplicationArea = All;
                    Editable = ReliveventBoolCheck;

                    trigger OnValidate()
                    var
                        TransferHistLocRec: Record "Transfer Joining History";
                    begin
                        TransferHistLocRec.Reset();
                        TransferHistLocRec.SetRange("Promotion order date", PromotionOrderDate);
                        TransferHistLocRec.SetRange("Promotion letter no", PromotionLetterNo);
                        TransferHistLocRec.SetRange("HRMS ID", HRMSID);
                        if TransferHistLocRec.FindFirst() then Error('This Promotion Detailes (Promotion Letter No %1 and Promotion Order Date %2) are already Exist for Employee %3', PromotionLetterNo, PromotionOrderDate, HRMSID);
                    end;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            /* action("Relief")
            {
                ApplicationArea = All;
                // Promoted = true;
                // PromotedIsBig = true;
                Image = TransferOrder;

                trigger OnAction()
                var
                    PromotedHist: Record "Employee Promotion History";
                begin
                    TransferHist.Init();
                    TransferHist."HRMS ID" := HRMSID;
                    TransferHist.Name := Name;
                    TransferHist.Designation := Designation;
                    TransferHist."From Station" := FromStation;
                    TransferHist."To Station" := ToStation;
                    TransferHist."Transfer Date" := TransferOrderDate;
                    TransferHist."Letter No" := LetterNo;
                    TransferHist."Relieving Event" := RelievingEvent;
                    TransferHist.Status := TransferHist.Status::Relieved;
                    TransferHist."To Designation" := ToDesignNationVar;
                    TransferHist."Promotion order date" := PromotionOrderDate;
                    TransferHist."Promotion letter no" := PromotionLetterNo;
                    TransferHist."Relief Order Date" := RelifeOrderDateVar;
                    TransferHist."Relief Order No." := RelifeOrderNoVar;
                    TransferHist."Order Issuing Authority" := OrderIssueAuthVar;
                    if fileName <> '' then begin
                        TransferHist."Upload Transfer Order".CreateOutStream(outs);
                        CopyStream(outs, ins);
                    end;
                    TransferHist.Insert(true);
                    //-- for insert the data in promotion history if the event is promotion order__SK18/08/22
                    if RelievingEvent = RelievingEvent::"Promotion Transfer" then begin
                        PromotedHist.Reset();
                        PromotedHist.Init();
                        PromotedHist."HRMS ID" := HRMSID;
                        PromotedHist.Name := Name;
                        PromotedHist."From Designation" := Designation;
                        PromotedHist."To Designation" := ToDesignNationVar;
                        PromotedHist."Promotion Order Date" := PromotionOrderDate;
                        PromotedHist."Promotion Order" := TransferHist."Upload Transfer Order";
                        PromotedHist."Letter NO" := PromotionLetterNo; //--promotion latter no insted of relief latter no
                        PromotedHist.Insert(true);
                    end;
                    Message('Employee %1 relieved successfully', HRMSID);
                    EmployeeRec.Reset();
                    EmployeeRec.SetRange("No.", HRMSID);
                    IF EmployeeRec.FindFirst() then begin
                        EmployeeRec.Status := "Employee Status"::Inactive;
                        EmployeeRec.Modify(true);
                    end;
                    CurrPage.Close();
                end;
            }
            group("Transfer Order Document")
            {
                action("Upload Transfer Order")
                {
                    ApplicationArea = All;
                    Image = Add;

                    trigger OnAction()
                    var
                    begin
                        fileName := Filemgm.BLOBImportWithFilter(Tempblob, 'Upload File', '', 'All Files (*.*)|*.pdf*', '.pdf');
                        ins := Tempblob.CreateInStream();
                        if Tempblob.Length() > 3000000 then
                            Error('File size must be less than or equal to 3MB')
                        else
                            Message('File uploded');
                    end;
                }
                action("View Transfer Order")
                {
                    ApplicationArea = All;
                    Image = Download;

                    trigger OnAction()
                    var
                        FilemngCU: Codeunit "File Management";
                    begin
                        if Tempblob.Length() > 0 then
                            fileName := FilemngCU.BLOBExport(Tempblob, 'Transfer Order_' + HRMSID + '.pdf', true)
                        else
                            Error('Document Not found');
                    end;
                } */
            action("Relief") //SS07OCT
            {
                ApplicationArea = All;
                Caption = 'Relieve';
                // Promoted = true;
                // PromotedIsBig = true;
                Image = TransferOrder;

                trigger OnAction()
                var
                    PromotedHist: Record "Employee Promotion History";
                begin
                    //SS07OCT
                    IF HRMSID = '' THEN ERROR('Please select Employee HRMS ID');
                    IF Designation = '' THEN ERROR('Please select Employee Designation');
                    IF FromStation = '' THEN ERROR('Please select From Station');
                    IF ToStation = '' THEN ERROR('Please select To Station');
                    IF TransferOrderDate = 0D THEN ERROR('Please select Transfer Order Date');
                    IF LetterNo = '' THEN ERROR('Please enter Transfer Letter No');
                    IF RelievingEvent = RelievingEvent::" " THEN ERROR('Please select Relieving Event');
                    IF RelifeOrderNoVar = '' THEN ERROR('Please enter Relief Order No');
                    IF RelifeOrderDateVar = 0D THEN ERROR('Please select Relief Order Date'); //SS07OCT
                    TransferHist.Init();
                    TransferHist."HRMS ID" := HRMSID;
                    TransferHist.Name := Name;
                    TransferHist.Designation := Designation;
                    TransferHist."From Station" := FromStation;
                    TransferHist."To Station" := ToStation;
                    TransferHist."Transfer Date" := TransferOrderDate;
                    TransferHist."Letter No" := LetterNo;
                    TransferHist."Relieving Event" := RelievingEvent;
                    TransferHist.Status := TransferHist.Status::Relieved;
                    TransferHist."To Designation" := ToDesignNationVar;
                    TransferHist."Promotion order date" := PromotionOrderDate;
                    TransferHist."Promotion letter no" := PromotionLetterNo;
                    TransferHist."Relief Order Date" := RelifeOrderDateVar;
                    TransferHist."Relief Order No." := RelifeOrderNoVar;
                    TransferHist."Modified By" := UserId;
                    TransferHist."Modified Date Time" := CurrentDateTime;
                    TransferHist."Order Issuing Authority" := OrderIssueAuthVar;
                    TransferHist."Is Latest" := true;
                    // ✅ store uploaded file in Transfer History
                    if TempTransferDoc.HasValue then begin
                        TransferHist."Upload Transfer Order".CreateOutStream(OutS);
                        TempTransferDoc.CreateInStream(InS);
                        CopyStream(OutS, InS);
                        TransferHist."Transfer Order File Name" := UploadedFileName; // <-- store filename
                    end;
                    TransferHist.Insert(true);
                    //-- for insert the data in promotion history if the event is promotion order__SK18/08/22
                    if RelievingEvent = RelievingEvent::"Promotion Transfer" then begin
                        PromotedHist.Reset();
                        PromotedHist.Init();
                        PromotedHist."HRMS ID" := HRMSID;
                        PromotedHist.Name := Name;
                        PromotedHist."From Designation" := Designation;
                        PromotedHist."To Designation" := ToDesignNationVar;
                        PromotedHist."Promotion Order Date" := PromotionOrderDate;
                        PromotedHist."Promotion Order" := TransferHist."Upload Transfer Order";//MEGHA 14-10-25 FROMUPLOAD PROMOTION ORDERTO PROMOTION ORDER BECAUSE IT ALLREADY EXISTS
                        PromotedHist."Letter NO" := PromotionLetterNo; //--promotion latter no insted of relief latter no
                        PromotedHist.Insert(true);
                    end;
                    Message('Employee %1 relieved successfully', HRMSID);
                    EmployeeRec.Reset();
                    EmployeeRec.SetRange("No.", HRMSID);
                    IF EmployeeRec.FindFirst() then begin
                        EmployeeRec.Status := "Employee Status"::Inactive;
                        EmployeeRec.Modify(true);
                    end;
                    CurrPage.Close();
                end;
                //SS07OCT
            }
            group("Transfer Order Document")
            {
                action(UploadTransferOrder) //SS07OCT
                {
                    Caption = 'Upload Transfer Order';
                    ApplicationArea = All;
                    Image = Import;

                    trigger OnAction()
                    var
                        FileMgt: Codeunit "File Management";
                        LocalFileName: Text;
                    begin
                        // File filter + extension filter must BOTH be specified
                        LocalFileName := FileMgt.BLOBImportWithFilter(TempTransferDoc, 'Upload Transfer Order', '', 'PDF or JPG Files (*.pdf;*.jpg)|*.pdf;*.jpg', // file filter
 '.pdf;.jpg' // extension filter
                        );
                        if LocalFileName <> '' then begin
                            UploadedFileName := LocalFileName;
                            Message('File "%1" uploaded successfully.', UploadedFileName);
                        end
                        else
                            Message('No file selected.');
                    end;
                }
                action(DownloadTransferOrder1) //SS07OCT
                {
                    Caption = 'Download Transfer Order';
                    ApplicationArea = All;
                    Image = Export;

                    trigger OnAction()
                    var
                        InS: InStream;
                        FileName: Text;
                    begin
                        if TempTransferDoc.HasValue then begin
                            TempTransferDoc.CreateInStream(InS);
                            if UploadedFileName <> '' then
                                FileName := UploadedFileName
                            else
                                FileName := 'TransferOrder.pdf'; // fallback
                            DownloadFromStream(InS, '', '', '', FileName);
                        end
                        else
                            Message('No file uploaded yet.');
                    end;
                }
            }
        }
    }
    var

    var
        TempTransferDoc: Codeunit "Temp Blob"; // holds uploaded file temporarily //SS07OCT
        UploadedFileName: Text; // ✅ stores uploaded filename //SS07OCT


        HRMSID: Code[20];
        Name: Text[90];
        Designation: Code[20];
        // Start Anmol 20 Feb 2025
        // FromStation: Code[20];
        // ToStation: Code[20];
        FromStation: Code[100];
        ToStation: Code[100];
        // End Anmol 20 Feb 2025
        TransferOrderDate: Date;
        LetterNo: Code[20];
        RelievingEvent: Enum "Relieving Event";
        TransferHist: Record "Transfer Joining History";
        JoiningDate: Date;
        EmployeeRec: Record 5200;
        ReliveventBoolCheck: Boolean;
        ToDesignNationVar: Code[20];
        PromotionOrderDate: Date;
        PromotionLetterNo: Code[20];
        OrderIssueAuthVar: Option "DTE&T","SDTE";
        RelifeOrderNoVar: Code[30];
        RelifeOrderDateVar: Date;
        fileName: Text;
        Filemgm: Codeunit "File Management";
        ins: InStream;
        outs: OutStream;
        Tempblob: Codeunit "Temp Blob";
}
