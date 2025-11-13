page 33066447 "Financial Upg Application"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Lists;
    /* // SourceTable = "Financial Upg Application";
    Caption = 'Financial Upgradation Application Form';

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("HRMS ID"; HRMSID)
                {
                    ApplicationArea = All;
                    TableRelation = Employee."No." where("SLCM Employee" = const(false));

                    /* trigger OnValidate()
                    var
                        EmpVar: Record Employee;
                    begin
                        if EmpVar.Get(HRMSID) then begin
                            EmpNameVar := EmpVar."First Name";
                            DesigngVar := EmpVar.Designation;
                            DatAppUpdate := Today;
                            currstation := EmpVar."Current Station";
                        end;
                    end; //BLOCK COMMENT END
    trigger OnValidate() //SS07OCT
    var
        EmpVar: Record Employee;
        FinUpgr: Record "Financial Upg Application";
    begin

        if EmpVar.Get(rec."HRMS ID") then begin
            REC.Name := EmpVar."First Name";
            Rec.Designation := EmpVar.Designation;
            // DatAppUpdate := Today;
            FinUpgr.Reset();
            FinUpgr.SetRange("HRMS ID", HRMSID);
            if FinUpgr.FindLast() then
                typevar := FinUpgr.Type
            else
                typevar := FinUpgr.type::" ";
            REC."Current Station" := EmpVar."Current Station";
        end;
    end;
}
                field("Employee Name"; EmpNameVar)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Designation; DesigngVar)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Date of application upload(Current Date)"; DatAppUpdate)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                //Anmol
                field("Effective Date Of MACP"; EffectiveDateMACP)
                {
                    ApplicationArea = All;
                }
                field("Type"; typevar)
                {
                    ApplicationArea = All;
                }
                field("Current Station"; currstation)
                {
                    ApplicationArea = All;
                    Editable = false;
                }

            }
        }
    } */
    SourceTable = "Financial Upg Application";
    Caption = 'Financial Upgradation Application Form';

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("HRMS ID"; Rec."HRMS ID")
                {
                    ApplicationArea = All;
                    TableRelation = Employee."No." where("SLCM Employee" = const(false));

                    trigger OnValidate()
                    var
                        EmpVar: Record Employee;
                        FinUpgr: Record "Financial Upg Application";
                    begin
                        //SS07OCT
                        if EmpVar.Get(rec."HRMS ID") then begin
                            REC.Name := EmpVar."First Name";
                            Rec.Designation := EmpVar.Designation;
                            // DatAppUpdate := Today;
                            FinUpgr.Reset();
                            FinUpgr.SetRange("HRMS ID", HRMSID);
                            if FinUpgr.FindLast() then
                                typevar := FinUpgr.Type
                            else
                                typevar := FinUpgr.type::" ";
                            REC."Current Station" := EmpVar."Current Station";
                        end;
                    end;
                }
                field("Employee Name"; rec.Name)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Designation; rec.Designation)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Date of application upload(Current Date)"; Rec."Date of application upload")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                //Anmol start
                field("Effective Date Of MACP"; Rec."Effective Date Of MACP")
                {
                    ApplicationArea = all;
                }
                //Anmol end
                field("Type"; rec.Type)
                {
                    ApplicationArea = All;
                    Editable = Updatebtn;
                }
                field("Current Station"; rec."Current Station")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {

            /*  action("Upload Aplication")
             {
                 ApplicationArea = All;
                 Image = Add;

                 trigger OnAction()
                 var
                     filePath: Text;
                     txt: Text;
                     flname: Text;
                 begin
                     fileName := Filemgm.BLOBImportWithFilter(Tempblob, 'Upload File', '', 'All Files (*.*)|*.pdf*', '.pdf');
                     ins := Tempblob.CreateInStream();
                     if Tempblob.Length() > 3000000 then
                         Error('File size must be less than or equal to 3MB')
                     else
                         Message('File uploded');
                 end;
             }
             action("Download Document")
             {
                 ApplicationArea = All;
                 Image = Download;

                 trigger OnAction()
                 var
                     FilemngCU: Codeunit "File Management";
                 begin
                     if Tempblob.Length() > 0 then
                         fileName := FilemngCU.BLOBExport(Tempblob, 'Application_' + HRMSID + '.pdf', true)
                     else
                         Error('Document Not found');
                 end;
             }
             action("Apply")
             {
                 ApplicationArea = All;
                 Promoted = true;
                 Image = Save;

                 trigger OnAction()
                 var
                     FinanceUpgradRecLVar: Record "Financial Upg Application";
                 begin
                     if Confirm('Do you want to submit the current Document ?', false) then begin
                         FinanceUpgradRecLVar.Reset();
                         FinanceUpgradRecLVar.Init();
                         FinanceUpgradRecLVar.Validate("HRMS ID", HRMSID);
                         FinanceUpgradRecLVar."Date of application upload" := DatAppUpdate;
                         FinanceUpgradRecLVar.Type := typevar;
                         FinanceUpgradRecLVar."Current Station" := currstation;
                         FinanceUpgradRecLVar."Application file name" := fileName;
                         if fileName <> '' then begin
                             FinanceUpgradRecLVar."Application file".CreateOutStream(outs);
                             CopyStream(outs, ins);
                         end;
                         FinanceUpgradRecLVar.Insert(true);
                         Message('Document Submit.');
                         CurrPage.Close();
                     end;
                 end;
             } */
            action(update1) //SS07OCT
            {
                Caption = 'Submit';

                trigger OnAction()
                var
                    HistoryRec: Record "Financial Upg App history";
                    InStr: InStream;
                    OutStr: OutStream;
                begin
                    if Rec.IsEmpty then Error('No record to submit.');
                    HistoryRec.Init();
                    HistoryRec."Entry No." := 0; // AutoIncrement
                    HistoryRec."HRMS ID" := Rec."HRMS ID";
                    HistoryRec.Name := Rec.Name;
                    HistoryRec.Designation := Rec.Designation;
                    HistoryRec."Current Station" := Rec."Current Station";
                    HistoryRec."Date of application upload" := CreateDateTime(WorkDate(), 0T);
                    HistoryRec.Type := Rec.Type;
                    HistoryRec."Application file name" := Rec."Application file name";
                    HistoryRec."Effective Date Of MACP" := Rec."Effective Date Of MACP";
                    HistoryRec."Modified Date Time" := CurrentDateTime;
                    HistoryRec."User Id" := UserId;
                    HistoryRec."Sl_no" := GetNextSlNo();
                    // Copy blob via stream
                    Rec.CalcFields("Application file");
                    if Rec."Application file".HasValue then begin
                        Rec."Application file".CreateInStream(InS);
                        HistoryRec."Application file".CreateOutStream(OutS);
                        CopyStream(OutS, InS);
                    end;
                    HistoryRec.Insert(true);
                    Rec.Modify(true);
                    Message('Record submitted for HRMS ID: %1', Rec."HRMS ID");
                end;
            }
            action(UploadDocument) //SS07OCT
            {
                ApplicationArea = All;
                Image = Attach;
                Caption = 'Upload Document';
                ToolTip = 'Upload a PDF document (max 3MB).';

                trigger OnAction()
                var
                    InStr: InStream;
                    OutStr: OutStream;
                begin
                    // Clear previous document
                    if Rec."Application file".HasValue() then Clear(Rec."Application file");
                    Clear(FileName);
                    Clear(TempBlob);
                    // Upload PDF file
                    if UploadIntoStream('Upload File', '', 'PDF Files (*.pdf)|*.pdf', FileName, InStr) then begin
                        TempBlob.CreateOutStream(OutStr);
                        CopyStream(OutStr, InStr);
                        if TempBlob.Length() > 3000000 then Error('File size must be less than or equal to 3MB.');
                        Rec."Application file".CreateOutStream(OutStr);
                        TempBlob.CreateInStream(InStr);
                        CopyStream(OutStr, InStr);
                        Rec."Application file Name" := FileName;
                        Rec."Date of application upload" := CreateDateTime(WorkDate(), 0T); //SS07OCT
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

                trigger OnAction()
                var
                    FileMngCU: Codeunit "File Management";
                    InStr: InStream;
                begin
                    if Rec."Application file".HasValue() then begin
                        Rec."Application file".CreateInStream(InStr);
                        FileMngCU.BLOBExport(TempBlob, 'Application_' + Rec."HRMS ID" + '.pdf', true);
                    end
                    else
                        Error('No document found to download.');
                end;
            }
        }
    }
    var
        fileName: Text;
        Filemgm: Codeunit "File Management";
        Tempblob: Codeunit "Temp Blob";
        EffectiveDateMACP: Date;
        ins: InStream;
        outs: OutStream;
        HRMSID: code[20];
        EmpNameVar: text[50];
        DatAppUpdate: Date;
        typevar: Option " ",MACP,RACP;
        DesigngVar: Code[20];
        currstation: Text[50];
        Updatebtn: Boolean;//SS07OCT

    local procedure GetNextSlNo(): Integer //SS07OCT
    var
        TempHist: Record "Financial Upg App history";
    begin
        //   TempHist.ChangeCompany(ToStation);  // make sure we look at target company
        if TempHist.FindLast() then
            exit(TempHist."Sl_no" + 1)
        else
            exit(1);
    end;

    trigger OnAfterGetRecord() //SS07OCT
    var
        EMp: Record Employee;
    begin
        if EMp.get(HRMSID) then DesigngVar := EMp.Designation;
    end;

    trigger OnNewRecord(BelowxRec: Boolean) //SS07OCT
    var
        myInt: Integer;
    begin
        Updatebtn := true;
    end;
}
