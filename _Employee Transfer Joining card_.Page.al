page 33065732 "Employee Transfer Joining card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Documents;
    Caption = 'Employee Transfer Joining card';

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(HRMSID; HRMSID)
                {
                    ApplicationArea = All;
                    Caption = 'HRMS ID';

                    //TableRelation = Employee."No.";
                    trigger onValidate()
                    var
                        Employee: Record 5200;
                        TransferHistLLLrec: Record "Transfer Joining History";
                    begin
                        /*Employee.Reset();
                            Employee.SetRange("No.", HRMSID);
                            If Employee.FindFirst() then begin
                                Name := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                                Designation := Employee.Designation;
                                //BKS_CodeCommented_08092022*/
                        /*if Employee.Status = Employee.Status::Inactive then begin
                                TransferHistLLLrec.Reset();
                                TransferHistLLLrec.SetRange("HRMS ID", HRMSID);
                                // TransferHistLLLrec.SetRange("Relieving Event", TransferHistLLLrec."Relieving Event"::"Promotion Transfer");
                                TransferHistLLLrec.SetRange(Status, TransferHistLLLrec.Status::Relieved);
                                if TransferHistLLLrec.FindFirst() then begin
                                    FromStation := TransferHistLLLrec."From Station";
                                    ToStation := TransferHistLLLrec."To Station";
                                    LetterNo := TransferHistLLLrec."Letter No";
                                    TransferOrderDate := TransferHistLLLrec."Transfer Date";
                                    OrderIssueAuthVar := TransferHistLLLrec."Order Issuing Authority";
                                    RelifeOrderDateVar := TransferHistLLLrec."Relief Order Date";
                                    RelifeOrderNoVar := TransferHistLLLrec."Relief Order No.";
                                    if TransferHistLLLrec."Relieving Event" = TransferHistLLLrec."Relieving Event"::"Promotion Transfer" then begin
                                        Todesignation := TransferHistLLLrec."To Designation";
                                        PromotionOredrDateVar := TransferHistLLLrec."Promotion order date";
                                        TodesignationBoolVar := true;

                                    end;


                                end;

                            end;*/
                        //BKS_CodeCommented_08092022
                        //end;
                    end;
                }
                field(FromStation; FromStation)
                {
                    ApplicationArea = All;
                    Caption = 'From Station';
                    //Editable = false;    //BKS_CodeCommented_08092022
                    TableRelation = Company.Name;

                    trigger OnValidate()
                    var
                        TransferHistLLLrec: Record "Transfer Joining History";
                    begin
                        TransferHistLLLrec.ChangeCompany(FromStation);
                        TransferHistLLLrec.SetRange("HRMS ID", HRMSID);
                        TransferHistLLLrec.SetRange(Status, TransferHistLLLrec.Status::Relieved);
                        if TransferHistLLLrec.FindLast() then begin
                            Name := TransferHistLLLrec.Name;
                            Designation := TransferHistLLLrec.Designation;
                            ToStation := TransferHistLLLrec."To Station";
                            LetterNo := TransferHistLLLrec."Letter No";
                            TransferOrderDate := TransferHistLLLrec."Transfer Date";
                            OrderIssueAuthVar := TransferHistLLLrec."Order Issuing Authority";
                            RelifeOrderDateVar := TransferHistLLLrec."Relief Order Date";
                            RelifeOrderNoVar := TransferHistLLLrec."Relief Order No.";
                            if TransferHistLLLrec."Relieving Event" = TransferHistLLLrec."Relieving Event"::"Promotion Transfer" then begin
                                Todesignation := TransferHistLLLrec."To Designation";
                                PromotionOredrDateVar := TransferHistLLLrec."Promotion order date";
                                TodesignationBoolVar := true;
                            end;
                        end
                        else
                            Error('In company %1 relieve record is not there for employee %2', FromStation, HRMSID);
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
                field(ToStation; ToStation)
                {
                    Editable = false;
                    ApplicationArea = All;
                    Caption = 'To Station';
                    //TableRelation = Institute."Institute Code";    //BKS_CodeCommented_08092022
                }
                field(TransferOrderDate; TransferOrderDate)
                {
                    Editable = false;
                    ApplicationArea = All;
                    Caption = 'Transfer Order Date';
                }
                field(LetterNo; LetterNo)
                {
                    Editable = false;
                    ApplicationArea = All;
                    Caption = 'Letter No';
                }
                field(JoiningDate; JoiningDate)
                {
                    ApplicationArea = All;
                    Caption = 'Joining Date';
                }
                field(JoiningEvent; JoiningEvent)
                {
                    ApplicationArea = All;
                    Caption = 'Joining Event';
                }
                field("Order Issuing Authority"; OrderIssueAuthVar)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Relief Order No."; RelifeOrderNoVar)
                {
                    ApplicationArea = All;
                    Caption = 'Relieving Order No';
                    Editable = false;
                }
                field("Relief Order Date"; RelifeOrderDateVar)
                {
                    ApplicationArea = All;
                    Caption = 'Relieving Order Date';
                    Editable = false;
                }
                field("Promotion To Designation"; Todesignation)
                {
                    Editable = false;
                    Enabled = TodesignationBoolVar;
                    ApplicationArea = All;
                    Caption = 'Promotion To Designation';
                }
                field("Promotion  Order Date"; PromotionOredrDateVar)
                {
                    ApplicationArea = All;
                    Editable = false;
                    Enabled = TodesignationBoolVar;
                    Caption = 'Promotion Order Date';
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            /* action("Join")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    EmployeeLocVar: Record 5200;
                    EmployeeRec1: Record 5200;
                begin
                    EmployeeRec.ChangeCompany(FromStation);
                    if EmployeeRec.Get(HRMSID) then;
                    TransferHist1.ChangeCompany(FromStation);
                    TransferHist1.Reset();
                    TransferHist1.SetRange("HRMS ID", HRMSID);
                    TransferHist1.SetRange("Letter No", LetterNo);
                    TransferHist1.SetRange(Status, TransferHist1.Status::Relieved);
                    IF TransferHist1.FindFirst() then begin
                        if TransferHist1."Relieving Event" = TransferHist1."Relieving Event"::"Promotion Transfer" then begin
                            PromotedHist.ChangeCompany(FromStation);
                            PromotedHist.Reset();
                            PromotedHist.Init();
                            PromotedHist."HRMS ID" := HRMSID;
                            PromotedHist.Name := Name;
                            PromotedHist."From Designation" := Designation;
                            PromotedHist."To Designation" := Todesignation;
                            PromotedHist."Promotion Order Date" := PromotionOredrDateVar;
                            PromotedHist."Letter NO" := LetterNo;
                            // EmployeeRec.ChangeCompany(FromStation);
                            // EmployeeLocVar.Get(HRMSID);
                            // EmployeeLocVar.Designation := Todesignation;
                            // EmployeeLocVar.Modify(true);
                            PromotedHist.Insert(true);
                        end;
                        if EmployeeRec."D.O.S" >= JoiningDate then begin
                            TransferHist.Init();
                            TransferHist."HRMS ID" := HRMSID;
                            TransferHist.Name := Name;
                            TransferHist.Designation := Designation;
                            TransferHist."From Station" := FromStation;
                            TransferHist."To Station" := ToStation;
                            TransferHist."Transfer Date" := TransferOrderDate;
                            TransferHist."Letter No" := LetterNo;
                            TransferHist."Joining Event" := JoiningEvent;
                            TransferHist."Joining Date" := JoiningDate;
                            TransferHist.Status := TransferHist.Status::Joined;
                            TransferHist."Order Issuing Authority" := OrderIssueAuthVar;
                            TransferHist."Relief Order Date" := RelifeOrderDateVar;
                            TransferHist."Relief Order No." := RelifeOrderNoVar;
                            TransferHist.Insert;
                            /*EmployeeRec.Reset();
                            EmployeeRec.SetRange("No.", HRMSID);
                            IF EmployeeRec.FindFirst() then begin
                                EmployeeRec.Status := "Employee Status"::Active;
                                EmployeeRec.Modify;
                            end;//block comment end
                            EmployeeLocVar.ChangeCompany(FromStation);
                            IF EmployeeLocVar.Get(HRMSID) then;
                            EmployeeRec1.Init();
                            EmployeeRec1.Copy(EmployeeLocVar);
                            EmployeeRec1.Status := EmployeeRec1.Status::Active;
                            EmployeeRec1."Current Station" := CompanyName; //SK_Sk
                            EmployeeRec1.Designation := Todesignation;
                            EmployeeRec1.Insert();
                            Message('Joining of employee %1 done  successfully', HRMSID);
                        end
                        else
                            Error('User Can not joined. Because DOS crossed.The joining date greater than DOS.Please contact relieving institute.');
                        // end else
                        //Error('No relieved records there for this employee %1', HRMSID);
                        CurrPage.Close();
                    end;
                end;
            } */
            action("Join") //SS07OCT
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    EmployeeLocVar: Record 5200;
                    EmployeeRec: Record 5200;
                    EmployeeRec1: Record 5200;
                    TransferHist: Record "Transfer Joining History";
                    TransferHist1: Record "Transfer Joining History";
                    PromotedHist: Record "Employee Promotion History";
                    // Financial
                    FinacialLocvar: Record "Financial Upg Application";
                    Financialrec: Record "Financial Upg Application";
                    // Promotion History
                    emppromhistLocvar: Record "Employee Promotion History";
                    emppromhistrec: Record "Employee Promotion History";
                    // Staff Achievement (Live + Archive)
                    staffachvLocvar: Record "Staff Achivement History";
                    staffachvrec: Record "Staff Achivement History";
                    staffachhist: Record "Staff Achievement History Arch";
                    staffachhistTarget: Record "Staff Achievement History Arch";
                    // Training
                    employeeTrainLocalvar: Record "Employee Training";
                    employeeTrainrec: Record "Employee Training";
                    // Employee General History
                    // employeehistory: Record "Employee History";
                    //  employeehistoryTarget: Record "Employee History";
                    // Streams
                    InStr: InStream;
                    OutStr: OutStream;
                    // Counters
                    EmployeeCount: Integer;
                    Appriasalcount: Integer;
                    FinCount: Integer;
                    PromCount: Integer;
                    TrainCount: Integer;
                    AchCount: Integer;
                    HistCount: Integer;
                    ApprisalLocVar: record "Annual Performance Review";
                    ApprisalRec1: record "Annual Performance Review";
                begin
                    // --- Validate Relieved Transfer
                    EmployeeRec.ChangeCompany(FromStation);
                    if not EmployeeRec.Get(HRMSID) then exit;
                    TransferHist1.ChangeCompany(FromStation);
                    TransferHist1.SetRange("HRMS ID", HRMSID);
                    TransferHist1.SetRange("Letter No", LetterNo);
                    TransferHist1.SetRange(Status, TransferHist1.Status::Relieved);
                    if not TransferHist1.FindFirst() then exit;
                    // --- Promotion Transfer case
                    if TransferHist1."Relieving Event" = TransferHist1."Relieving Event"::"Promotion Transfer" then begin
                        PromotedHist.ChangeCompany(ToStation);
                        PromotedHist.Init();
                        PromotedHist."HRMS ID" := HRMSID;
                        PromotedHist.Name := Name;
                        PromotedHist."From Designation" := Designation;
                        PromotedHist."To Designation" := ToDesignation;
                        PromotedHist."Promotion Order Date" := PromotionOredrDateVar;
                        PromotedHist."Letter NO" := LetterNo;
                        PromotedHist.Insert(true);
                        LogTransfer(HRMSID, 'Promotion Transfer', 1, 'Inserted promotion transfer event');
                    end;
                    // --- Insert Transfer Hist in target
                    if EmployeeRec."D.O.S" >= JoiningDate then begin
                        TransferHist.Init();
                        TransferHist."HRMS ID" := HRMSID;
                        TransferHist.Name := Name;
                        TransferHist.Designation := Designation;
                        TransferHist."From Station" := FromStation;
                        TransferHist."To Station" := ToStation;
                        TransferHist."Transfer Date" := TransferOrderDate;
                        TransferHist."Letter No" := LetterNo;
                        TransferHist."Joining Event" := JoiningEvent;
                        TransferHist."Joining Date" := JoiningDate;
                        TransferHist."Modified By" := UserId;
                        TransferHist."Modified Date Time" := CurrentDateTime;
                        TransferHist.Status := TransferHist.Status::Joined;
                        TransferHist."Order Issuing Authority" := OrderIssueAuthVar;
                        TransferHist."Relief Order Date" := RelifeOrderDateVar;
                        TransferHist."Relief Order No." := RelifeOrderNoVar;
                        TransferHist.MarkLatestTransfer(HRMSID);
                        TransferHist.Insert(true);
                        LogTransfer(HRMSID, 'Transfer History', 1, 'Joined at ' + ToStation);
                    end;
                    // --- Employee Master Data update in Target
                    EmployeeCount := 0;
                    EmployeeLocVar.ChangeCompany(FromStation);
                    if EmployeeLocVar.Get(HRMSID) then begin
                        EmployeeRec1.ChangeCompany(ToStation);
                        if EmployeeRec1.Get(EmployeeLocVar."No.") then begin
                            EmployeeRec1.Status := EmployeeRec1.Status::Active;
                            EmployeeRec1."Current Station" := CompanyName;
                            EmployeeRec1.Designation := Designation;
                            EmployeeRec1.Modify(true);
                        end
                        else begin
                            EmployeeRec1.Init();
                            EmployeeRec1.TransferFields(EmployeeLocVar);
                            EmployeeRec1."Designation Code" := EmployeeLocVar."Designation Code";
                            EmployeeRec1.Status := EmployeeRec1.Status::Active;
                            if JoiningEvent = JoiningEvent::"Promotion & Transfer" then
                                EmployeeRec1.Designation := Todesignation
                            else if JoiningEvent = JoiningEvent::"Routine Transfer" then EmployeeRec1.Designation := Designation;
                            EmployeeRec1."Current Station" := ToStation;
                            // EmployeeRec1."Joining Station" := CompanyName;
                            EmployeeRec1.Insert(true);
                        end;
                        EmployeeCount := 1;
                    end;
                    LogTransfer(HRMSID, 'Employee Master Data', EmployeeCount, 'Transferred employee master record to ' + ToStation);
                    // --- Employee Master Data update in Target
                    Appriasalcount := 0;
                    ApprisalLocVar.ChangeCompany(FromStation);
                    if ApprisalLocVar.Get(HRMSID) then begin
                        ApprisalRec1.ChangeCompany(ToStation);
                        if ApprisalRec1.Get(ApprisalLocVar."HRMS ID") then begin
                            //  ApprisalRec1.Status := ApprisalRec1.Status::Active;
                            // ApprisalRec1."Current Station" := CompanyName;
                            ApprisalRec1.Designation := Designation;
                            ApprisalRec1.Modify(true);
                        end
                        else begin
                            ApprisalRec1.Init();
                            ApprisalRec1.TransferFields(ApprisalLocVar);
                            // EmployeeRec1."Designation Code" := ApprisalLocVar."Designation Code";
                            /*     /EmployeeRec1.Status := EmployeeRec1.Status::Active;
                                if JoiningEvent = JoiningEvent::"Promotion & Transfer" then
                                    EmployeeRec1.Designation := Todesignation else if
                                                                  JoiningEvent = JoiningEvent::"Routine Transfer" then
                                                                                  EmployeeRec1.Designation := Designation;
                                ApprisalRec1."Current Station" := ToStation;
     */
                            ApprisalRec1.Insert(true);
                        end;
                        Appriasalcount := 1;
                    end;
                    // LogTransfer(HRMSID, 'Employee Master Data', EmployeeCount, 'Transferred employee master record to ' + ToStation);
                    // --- Copy Financial Applications
                    FinCount := 0;
                    FinacialLocvar.ChangeCompany(FromStation);
                    FinacialLocvar.SetRange("HRMS ID", HRMSID);
                    if FinacialLocvar.FindSet() then
                        repeat
                            Financialrec.ChangeCompany(ToStation);
                            Financialrec.Init();
                            Financialrec.TransferFields(FinacialLocvar, false);
                            Financialrec."Entry No." := GetNextFinAppEntryNo(ToStation);
                            Financialrec."HRMS ID" := HRMSID;
                            Financialrec.Name := Name;
                            Financialrec.Designation := ToDesignation;
                            if FinacialLocvar."Application file".HasValue then begin
                                FinacialLocvar."Application file".CreateInStream(InStr);
                                Financialrec."Application file".CreateOutStream(OutStr);
                                CopyStream(OutStr, InStr);
                            end;
                            Financialrec."Application file name" := FinacialLocvar."Application file name";
                            Financialrec.Insert(true);
                            FinCount += 1;
                        until FinacialLocvar.Next() = 0;
                    LogTransfer(HRMSID, 'Financial Upg Application', FinCount, 'Copied from ' + FromStation + ' to ' + ToStation);
                    // --- Copy Promotion History
                    PromCount := 0;
                    emppromhistLocvar.ChangeCompany(FromStation);
                    emppromhistLocvar.SetRange("HRMS ID", HRMSID);
                    if emppromhistLocvar.FindSet() then
                        repeat
                            emppromhistrec.ChangeCompany(ToStation);
                            emppromhistrec.Init();
                            emppromhistrec.TransferFields(emppromhistLocvar, false);
                            if emppromhistLocvar."Promotion Order".HasValue then begin//megha 14-10-25 changed from upload promotion order field to promotion order
                                emppromhistLocvar."Promotion Order".CreateInStream(InStr);//megha 14-10-25 changed from upload promotion order field to promotion order
                                emppromhistrec."Promotion Order".CreateOutStream(OutStr);//megha 14-10-25 changed from upload promotion order field to promotion order
                                CopyStream(OutStr, InStr);
                            end;
                            emppromhistrec."Entry No" := GetNextPromotionEntryNo(ToStation);
                            emppromhistrec."To Designation" := ToDesignation;
                            emppromhistrec.Insert(true);
                            PromCount += 1;
                        until emppromhistLocvar.Next() = 0;
                    LogTransfer(HRMSID, 'Promotion History', PromCount, 'Copied from ' + FromStation + ' to ' + ToStation);
                    // --- Copy Staff Achievement (live + archive)
                    AchCount := 0;
                    staffachvLocvar.ChangeCompany(FromStation);
                    staffachvLocvar.SetRange("HRMS ID", HRMSID);
                    if staffachvLocvar.FindSet() then
                        repeat
                            staffachvrec.ChangeCompany(ToStation);
                            staffachvrec.Init();
                            staffachvrec.TransferFields(staffachvLocvar, false);
                            staffachvrec.Designation := ToDesignation;
                            staffachvrec."Entry No" := 0;
                            staffachvrec.Insert(true);
                            AchCount += 1;
                        until staffachvLocvar.Next() = 0;
                    /*  staffachhist.ChangeCompany(FromStation);

                      staffachhist.SetRange("HRMS ID", HRMSID);

                      if staffachhist.FindSet() then
                          repeat

                              staffachhistTarget.ChangeCompany(ToStation);

                              staffachhistTarget.Init();

                              staffachhistTarget.TransferFields(staffachhist, false);

                              staffachhistTarget."Archive Entry No." := 0;

                              staffachhistTarget."Version No." := GetNextStaffAchHistVersion(HRMSID, ToStation);

                              staffachhistTarget."Archived By" := UserId;

                              staffachhistTarget."Archived DateTime" := CurrentDateTime;

                              staffachhistTarget.Insert(true);

                              AchCount += 1;

                          until staffachhist.Next() = 0;

                      LogTransfer(HRMSID, 'Staff Achievements (Live + Archive)', AchCount, 'Copied from ' + FromStation + ' to ' + ToStation);*/
                    // --- Copy Training
                    TrainCount := 0;
                    employeeTrainLocalvar.ChangeCompany(FromStation);
                    employeeTrainLocalvar.SetRange("HRMS ID", HRMSID);
                    if employeeTrainLocalvar.FindSet() then
                        repeat
                            employeeTrainrec.ChangeCompany(ToStation);
                            employeeTrainrec.Init();
                            employeeTrainrec.TransferFields(employeeTrainLocalvar, false);
                            employeeTrainrec.Designation := ToDesignation;
                            employeeTrainrec."Modified By" := UserId;
                            employeeTrainrec."Modified Date Time" := CurrentDateTime;
                            employeeTrainrec.Insert(true);
                            TrainCount += 1;
                        until employeeTrainLocalvar.Next() = 0;
                    LogTransfer(HRMSID, 'Training History', TrainCount, 'Copied from ' + FromStation + ' to ' + ToStation);
                    // --- Copy Employee History
                    ///  HistCount := 0; 


                    ///employeehistory.ChangeCompany(FromStation); 


                    ///employeehistory.SetRange("Employee No.", HRMSID); 


                    ///if employeehistory.FindSet() then 

                    ///repeat 


                    ///employeehistoryTarget.ChangeCompany(ToStation); 


                    ///employeehistoryTarget.Init(); 


                    ///employeehistoryTarget.TransferFields(employeehistory, false); 

                    ///employeehistoryTarget."Employee No." := employeehistory."Employee No."; 

                    ///// employeehistoryTarget."Employee No.":= 



                    ///employeehistoryTarget."Version No." := GetNextVersion(employeehistory."Employee No."); 


                    ///employeehistoryTarget."modified by" := UserId; 


                    ///employeehistoryTarget."modified date time" := CurrentDateTime; 


                    ///employeehistoryTarget.Insert(true); 


                    ///HistCount += 1; 


                    ///until employeehistory.Next() = 0; 
                    /// // LogTransfer(HRMSID, 'Employee History', HistCount, 'Copied from ' + FromStation + ' to ' + ToStation);
                    Message('Joining of employee %1 done successfully. History also transferred.', HRMSID);
                end;
            }
            action("Join1")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedIsBig = true;
                Visible = false;

                trigger OnAction()
                var
                    EmployeeLocVar: Record 5200;
                    EmployeeRec1: Record 5200;
                    employeehistory: Record "Employee History";
                    //  employeehistoryTarget: Record "Employee History";
                    Finacailupg: record "Financial Upg App history";
                    FinhistoryTarget: Record "Financial Upg App history";
                    promtionhist: record "Employee Promot History Arch";
                    promtionhisttarget: record "Employee Promot History Arch";
                    emptrainList: Record "Employee Training History";
                    emptrainListTarget: Record "Employee Training History";
                    staffAchList: Record "Staff Achievement History Arch";
                    staffAchTarget: Record "Staff Achievement History Arch";
                    finan: Record "Financial Upg Application";
                    InStr: InStream;
                    OutStr: OutStream;
                    staffachhist: Record "Staff Achievement History Arch";
                    //staffachhistTarget: Record "Staff Achievement History Arch";
                    emppromhistLocvar: Record "Employee Promotion History";
                    emppromhistrec: Record "Employee Promotion History";
                    staffachvrec: record "Staff Achivement History";
                    staffachvLocvar: record "Staff Achivement History";
                    FinacialLocvar: Record "Financial Upg Application";
                    employeeTrainLocalvar: Record "Employee Training";
                    employeeTrainrec: Record "Employee Training";
                    Financialrec: Record "Financial Upg Application";
                    employeeTrain: Record "Employee Training";
                    Employeetraiinghistory: Record "Employee Training History";
                begin
                    EmployeeRec.ChangeCompany(FromStation);
                    if EmployeeRec.Get(HRMSID) then;
                    TransferHist1.ChangeCompany(FromStation);
                    TransferHist1.Reset();
                    TransferHist1.SetRange("HRMS ID", HRMSID);
                    TransferHist1.SetRange("Letter No", LetterNo);
                    TransferHist1.SetRange(Status, TransferHist1.Status::Relieved);
                    if TransferHist1.FindFirst() then begin
                        // --- Promotion Case
                        if TransferHist1."Relieving Event" = TransferHist1."Relieving Event"::"Promotion Transfer" then begin
                            PromotedHist.ChangeCompany(FromStation);
                            PromotedHist.Init();
                            PromotedHist."HRMS ID" := HRMSID;
                            PromotedHist.Name := Name;
                            PromotedHist."From Designation" := Designation;
                            PromotedHist."To Designation" := Todesignation;
                            PromotedHist."Promotion Order Date" := PromotionOredrDateVar;
                            PromotedHist."Letter NO" := LetterNo;
                            PromotedHist.Insert(true);
                            //promtionhist.Delete(); //remove from soource company
                        end;
                        // --- Validate Joining
                        if EmployeeRec."D.O.S" >= JoiningDate then begin
                            TransferHist.Init();
                            TransferHist."HRMS ID" := HRMSID;
                            TransferHist.Name := Name;
                            TransferHist.Designation := Designation;
                            TransferHist."From Station" := FromStation;
                            TransferHist."To Station" := ToStation;
                            TransferHist."Transfer Date" := TransferOrderDate;
                            TransferHist."Letter No" := LetterNo;
                            TransferHist."Joining Event" := JoiningEvent;
                            TransferHist."Modified By" := UserId;
                            TransferHist1."Modified Date Time" := CurrentDateTime;
                            TransferHist."Joining Date" := JoiningDate;
                            TransferHist.Status := TransferHist.Status::Joined;
                            TransferHist."Order Issuing Authority" := OrderIssueAuthVar;
                            TransferHist."Relief Order Date" := RelifeOrderDateVar;
                            TransferHist."Relief Order No." := RelifeOrderNoVar;
                            TransferHist.MarkLatestTransfer(HRMSID);
                            TransferHist.Insert(true); //29-09-2025
                            //  TransferHist1.Delete();
                            // --- Employee record update in target company
                            EmployeeLocVar.ChangeCompany(FromStation);
                            if EmployeeLocVar.Get(HRMSID) then begin
                                EmployeeRec1.ChangeCompany(ToStation); // switch context to target
                                if EmployeeRec1.Get(EmployeeLocVar."No.") then begin
                                    // Already exists → update
                                    EmployeeRec1.Status := EmployeeRec1.Status::Active;
                                    EmployeeRec1."Current Station" := CompanyName;
                                    EmployeeRec1.Designation := Designation;
                                    EmployeeRec1.Modify(true);
                                end
                                else begin
                                    // Not found → insert new
                                    EmployeeRec1.Init();
                                    EmployeeRec1.TransferFields(EmployeeLocVar);
                                    EmployeeRec1.Designation := Designation;
                                    EmployeeRec1."Designation Code" := EmployeeLocVar."Designation Code";
                                    EmployeeRec1.Status := EmployeeRec1.Status::Active;
                                    EmployeeRec1.Insert(true);
                                end;
                                //EmployeeLocVar.Delete();
                            end;
                            // --- 🔹 Copy Financial Upg Application from FromStation → ToStation
                            FinacialLocvar.ChangeCompany(FromStation);
                            FinacialLocvar.SetRange("HRMS ID", HRMSID);
                            if FinacialLocvar.FindSet() then
                                repeat
                                    Financialrec.ChangeCompany(ToStation);
                                    Financialrec.Init();
                                    // Copy all fields except PK
                                    Financialrec.TransferFields(FinacialLocvar, false);
                                    // Assign new Entry No. if needed
                                    Financialrec."Entry No." := GetNextFinAppEntryNo(ToStation);
                                    // ✅ Ensure HRMS ID and key fields are copied
                                    Financialrec."HRMS ID" := HRMSID;
                                    Financialrec.Name := Name;
                                    Financialrec.Designation := ToDesignation;
                                    // ✅ Copy file if exists
                                    if FinacialLocvar."Application file".HasValue then begin
                                        FinacialLocvar."Application file".CreateInStream(InStr);
                                        Financialrec."Application file".CreateOutStream(OutStr);
                                        CopyStream(OutStr, InStr);
                                    end;
                                    // ✅ Copy file name for display in list
                                    Financialrec."Application file name" := FinacialLocvar."Application file name";
                                    Financialrec.Insert(true);
                                //   FinacialLocvar.Delete();
                                until FinacialLocvar.Next() = 0;
                            // --- 🔹 Copy Employee Promotion History from FromStation → ToStation
                            emppromhistLocvar.ChangeCompany(FromStation);
                            emppromhistLocvar.SetRange("HRMS ID", HRMSID);
                            if emppromhistLocvar.FindSet() then
                                repeat
                                    emppromhistrec.ChangeCompany(ToStation);
                                    emppromhistrec.Init();
                                    // Copy fields except PK
                                    emppromhistrec.TransferFields(emppromhistLocvar, false);
                                    // ✅ Copy file if exists
                                    if emppromhistLocvar."Promotion Order".HasValue then begin //megha 14-10-25 changed from upload promotion order field to promotion order
                                        emppromhistLocvar."Promotion Order".CreateInStream(InStr);//megha 14-10-25 changed from upload promotion order field to promotion order
                                        emppromhistLocvar."Promotion Order".CreateOutStream(OutStr);//megha 14-10-25 changed from upload promotion order field to promotion order
                                        CopyStream(OutStr, InStr);
                                    end;
                                    // ✅ Copy file name for display in list
                                    emppromhistrec."Promotion Order" := emppromhistLocvar."Promotion Order";//megha 14-10-25 changed from upload promotion order field to promotion order
                                    // Assign fresh Entry No. or Version No.
                                    emppromhistrec."Entry No" := GetNextPromotionEntryNo(ToStation);
                                    // Update designation if needed
                                    emppromhistrec."To Designation" := ToDesignation;
                                    emppromhistrec.Insert(true);
                                //emppromhistLocvar.Delete();
                                until emppromhistLocvar.Next() = 0;
                            emppromhistLocvar.ChangeCompany(FromStation);
                            if FinacialLocvar.Get(HRMSID) then begin
                                Financialrec.ChangeCompany(ToStation); // switch context to target
                                if Financialrec.Get(FinacialLocvar."HRMS ID") then begin
                                    Financialrec."Current Station" := CompanyName;
                                    Financialrec.Designation := ToDesignation;
                                    Financialrec.Modify(true);
                                end
                                else begin
                                    Financialrec.Init();
                                    Financialrec.TransferFields(FinacialLocvar);
                                    Financialrec.Designation := Designation;
                                    Financialrec.Insert(true);
                                    //  emppromhistLocvar.Delete();
                                end;
                            end;
                            staffachvLocvar.ChangeCompany(FromStation);
                            staffachvLocvar.SetRange("HRMS ID", HRMSID);
                            if staffachvLocvar.Get(HRMSID) then begin
                                staffachvrec.ChangeCompany(ToStation); // switch context to target
                                if staffachvrec.Get(staffachvLocvar."HRMS ID") then begin
                                    staffachvrec.Designation := ToDesignation;
                                    staffachvrec.Modify(true);
                                end
                                else begin
                                    // Not found → insert new
                                    staffachvrec.Init();
                                    staffachvrec.TransferFields(staffachvLocvar);
                                    staffachvrec.Insert(true);
                                    //  staffachvLocvar.Delete();
                                end;
                            end;
                            // --- 🔹 Copy Employee Training from FromStation → ToStation
                            employeeTrainLocalvar.ChangeCompany(FromStation);
                            employeeTrainLocalvar.SetRange("HRMS ID", HRMSID);
                            if employeeTrainLocalvar.Get(HRMSID) then begin
                                employeeTrainrec.ChangeCompany(ToStation); // switch context to target
                                if employeeTrainrec.Get(employeeTrainLocalvar."HRMS ID") then begin
                                    employeeTrainrec.Designation := ToDesignation;
                                    employeeTrainrec.Modify(true);
                                end
                                else begin
                                    // Not found → insert new
                                    employeeTrainrec.Init();
                                    employeeTrainrec.TransferFields(employeeTrainLocalvar);
                                    employeeTrainrec.Insert(true);
                                    //  employeeTrainLocalvar.Delete();
                                end;
                            end;
                            //---staff achievement history copy from fromstation to tostation
                            /*  staffachhist.ChangeCompany(FromStation);
                              staffachhist.SetRange("HRMS ID", HRMSID);
                              if staffachhist.FindSet() then
                                  repeat
                                      staffachhistTarget.ChangeCompany(ToStation);
                                      staffachhistTarget.Init();
                                      // Copy fields
                                      staffachhistTarget.TransferFields(staffachhist, false);

                                      // Assign new version number (PK = Employee No + Version No)
                                      staffachhistTarget."Archive Entry No." := 0;


                                      staffachhistTarget."Version No." := GetNextStaffAchHistVersion(HRMSID, ToStation);
                                      // Update audit
                                      staffachhistTarget."Archived By" := UserId;
                                      staffachhistTarget."Archived DateTime" := CurrentDateTime;
                                      staffachhistTarget.Insert(true);
                                  //  staffachhist.Delete();
                                  until staffachhist.Next() = 0;*/
                            // --- 🔹 Copy Employee History from FromStation → ToStation
                            /*   employeehistory.ChangeCompany(FromStation);

                               employeehistory.SetRange("Employee No.", HRMSID);

                               if employeehistory.FindSet() then
                                   repeat

                                       employeehistoryTarget.ChangeCompany(ToStation);

                                       employeehistoryTarget.Init();

                                       // Copy fields

                                       employeehistoryTarget.TransferFields(employeehistory);

                                       // Assign new version number (PK = Employee No + Version No)

                                       employeehistoryTarget."Version No." := employeehistoryTarget.GetNextVersion(HRMSID);

                                       // Update audit

                                       employeehistoryTarget."modified by" := UserId;

                                       employeehistoryTarget."modified date time" := CurrentDateTime;

                                       employeehistoryTarget.Insert(true);
                                   //     employeehistory.Delete();

                                   until employeehistory.Next() = 0;*/
                            // --- 🔹 Copy Financial Upg History from FromStation → ToStation
                            /*     Finacailupg.ChangeCompany(FromStation);
                                 Finacailupg.SetRange("HRMS ID", HRMSID);

                                 if Finacailupg.FindSet() then
                                     repeat
                                         FinhistoryTarget.ChangeCompany(ToStation);
                                         FinhistoryTarget.Init();

                                         // Copy fields but exclude PK (Sl_no)
                                         FinhistoryTarget.TransferFields(Finacailupg, false);


                                         Finacailupg.CalcFields("Application file");
                                         if Finacailupg."Application file".HasValue then begin
                                             Finacailupg."Application file".CreateInStream(InStr);
                                             FinhistoryTarget."Application file".CreateOutStream(OutStr);
                                             CopyStream(OutStr, InStr);

                                             FinhistoryTarget."Application file name" := Finacailupg."Application file name";
                                         end else
                                             FinhistoryTarget."Application file name" := '';

                                         // ✅ Assign new Sl_no
                                         FinhistoryTarget."Sl_no" := GetNextSlNo();
                                         // Handle BLOB



                                         // Update audit fields
                                         FinhistoryTarget."User Id" := UserId;
                                         FinhistoryTarget."modified date time" := CurrentDateTime;
                                         FinhistoryTarget.Insert(true);
                                         Finacailupg.Delete();
                                     until Finacailupg.Next() = 0;


                                 // -------------------------
                                 // Helper function for new Sl_no

                                 promtionhist.ChangeCompany(FromStation);
                                 promtionhist.SetRange("HRMS ID", HRMSID);
                                 if promtionhist.FindSet() then
                                     repeat
                                         promtionhisttarget.ChangeCompany(ToStation);
                                         promtionhisttarget.Init();

                                         promtionhisttarget.TransferFields(promtionhist, false);

                                         // Generate a new unique PK

                                         promtionhisttarget."Archive Entry No." := GetNextPromHistEntryNo(ToStation, HRMSID);

                                         // Handle BLOB

                                         promtionhist.CalcFields("Upload Promotion Order");

                                         if promtionhist."Upload Promotion Order".HasValue then begin

                                             promtionhist."Upload Promotion Order".CreateInStream(InStr);

                                             promtionhisttarget."Upload Promotion Order".CreateOutStream(OutStr);

                                             CopyStream(OutStr, InStr);

                                             promtionhisttarget."Promotion Order File Name" := promtionhist."Promotion Order File Name";

                                         end else
                                             promtionhisttarget."Promotion Order File Name" := '';

                                         promtionhisttarget."Version No." := promtionhisttarget.GetNextVersion(HRMSID);

                                         promtionhisttarget."modified date time" := CurrentDateTime;

                                         promtionhisttarget.Insert(true);
                                         promtionhist.Delete();

                                     until promtionhist.Next() = 0;
                                 emptrainList.ChangeCompany(FromStation);
                                 emptrainList.SetRange("HRMS ID", HRMSID);
                                 if emptrainList.FindSet() then begin
                                     repeat
                                         emptrainListTarget.ChangeCompany(ToStation);
                                         emptrainListTarget.Init();

                                         emptrainListTarget.TransferFields(emptrainList, false);

                                         // Generate a new unique PK

                                         emptrainListTarget."Entry No" := 0;

                                         emptrainListTarget.slno := GetNextSlNo1();

                                         emptrainList.CalcFields(Certificate);

                                         if emptrainList.Certificate.HasValue then begin

                                             emptrainList.Certificate.CreateInStream(InStr);

                                             emptrainListTarget.Certificate.CreateOutStream(OutStr);

                                             CopyStream(OutStr, InStr);

                                             emptrainListTarget."Certificate FileName" := emptrainList."Certificate FileName";

                                         end else
                                             emptrainListTarget."Certificate FileName" := '';

                                         emptrainListTarget."modified date time" := CurrentDateTime;

                                         emptrainListTarget.Insert(true);
                                         emptrainList.Delete();
                                     until emptrainList.Next() = 0; // 29-09-2025 commented


                            /*   emptrainList.ChangeCompany(FromStation);
                               emptrainList.SetRange("HRMS ID", HRMSID);
                               if emptrainList.FindSet() then begin
                                   repeat
                                       emptrainListTarget.ChangeCompany(ToStation);
                                       emptrainListTarget.Init();

                                       emptrainListTarget.TransferFields(emptrainList, false);

                                       // Generate a new unique PK

                                       emptrainListTarget."Entry No" := 0;

                                       emptrainListTarget.slno := GetNextSlNo1();

                                       emptrainList.CalcFields(Certificate);

                                       if emptrainList.Certificate.HasValue then begin

                                           emptrainList.Certificate.CreateInStream(InStr);

                                           emptrainListTarget.Certificate.CreateOutStream(OutStr);

                                           CopyStream(OutStr, InStr);

                                           emptrainListTarget."Certificate FileName" := emptrainList."Certificate FileName";

                                       end else
                                           emptrainListTarget."Certificate FileName" := '';

                                       emptrainListTarget."modified date time" := CurrentDateTime;

                                       emptrainListTarget.Insert(true);
                                   until emptrainList.Next() = 0;

                               end;*/
                            /*   staffachhist.ChangeCompany(FromStation);
                               staffachhist.SetRange("HRMS ID", HRMSID);
                               if staffachhist.FindSet() then begin
                                   repeat
                                       staffachhistTarget.ChangeCompany(ToStation);
                                       staffachhistTarget.Init();

                                       staffachhistTarget.TransferFields(staffachhist, false);

                                       // Generate a new unique PK

                                       staffachhistTarget."Entry No" := 0;

                                       staffachhistTarget."Archive Entry No." := GetNextSlNo2();

                                       staffachhistTarget.Insert(true);
                                   until staffachhist.Next() = 0;
                               end;*/
                            Message('Joining of employee %1 done successfully. History also transferred.', HRMSID);
                        end
                        else
                            Error('Cannot join: Joining date is greater than D.O.S for employee %1. Please contact relieving institute.', HRMSID);
                        CurrPage.Close();
                    end
                    else
                        Error('No relieved record exists for employee %1 in %2.', HRMSID, FromStation);
                end;
                // end;
            }
        }
    }
    trigger OnOpenPage()
    begin
        OrderIssueAuthVar := OrderIssueAuthVar::" ";
    end;

    var
        HRMSID: Code[20];
        Name: Text[90];
        Designation: Code[20];
        //Anmol 20 Feb 2025
        // FromStation: Text[50];
        FromStation: Text[100];
        // ToStation: Text[50];
        ToStation: Text[100];
        TransferOrderDate: Date;
        LetterNo: Code[20];
        JoiningEvent: Enum "Joining Event";
        TransferHist: Record "Transfer Joining History";
        TransferHist1: Record "Transfer Joining History";
        JoiningDate: Date;
        EmployeeRec: Record 5200;
        PromotedHist: Record "Employee Promotion History";
        Todesignation: Code[20];
        TodesignationBoolVar: Boolean;
        PromotionOredrDateVar: Date;
        OrderIssueAuthVar: Option "DTE&T","SDTE"," ";
        RelifeOrderNoVar: Code[30];
        RelifeOrderDateVar: Date;
        RelievingEvent: Text[100];
    //SS07OCT start
    local procedure GetNextSlNo(): Integer
    var
        TempHist: Record "Financial Upg App history";
    begin
        TempHist.ChangeCompany(ToStation); // make sure we look at target company
        if TempHist.FindLast() then
            exit(TempHist."Sl_no" + 1)
        else
            exit(1);
    end;

    local procedure GetNextStaffAchHistVersion(HRMSID: Code[20];
    TargetCompany: Text[100]): Integer
    var
        StaffAchHist: Record "Staff Achievement History Arch";
    begin
        StaffAchHist.ChangeCompany(TargetCompany);
        StaffAchHist.SetRange("HRMS ID", HRMSID);
        if StaffAchHist.FindLast() then
            exit(StaffAchHist."Version No." + 1)
        else
            exit(1);
    end;

    local procedure GetNextPromotionEntryNo(TargetCompany: Text): Integer
    var
        TempRec: Record "Employee Promotion History";
    begin
        TempRec.ChangeCompany(TargetCompany);
        if TempRec.FindLast() then
            exit(TempRec."Entry No" + 1)
        else
            exit(1);
    end;

    local procedure GetNextFinAppEntryNo(TargetCompany: Text): Integer
    var
        TempRec: Record "Financial Upg Application";
    begin
        TempRec.ChangeCompany(TargetCompany);
        if TempRec.FindLast() then
            exit(TempRec."Entry No." + 1)
        else
            exit(1);
    end;

    local procedure GetNextPromHistEntryNo(TargetCompany: Text;
    HRMSID: Code[20]): Integer
    var
        RecPromHist: Record "Employee Promot History Arch";
    begin
        RecPromHist.ChangeCompany(TargetCompany);
        if RecPromHist.FindLast() then
            exit(RecPromHist."Archive Entry No." + 1)
        else
            exit(1);
    end;

    local procedure GetNextSlNo1(): Integer
    var
        TempHist: Record "Employee Training History";
    begin
        TempHist.ChangeCompany(ToStation); // make sure we look at target company
        if TempHist.FindLast() then
            exit(TempHist.slno + 1)
        else
            exit(1);
    end;

    local procedure GetNextSlNo2(): Integer
    var
        TempHist: Record "Staff Achievement History Arch";
    begin
        TempHist.ChangeCompany(ToStation); // make sure we look at target company
        if TempHist.FindLast() then
            exit(TempHist."Archive Entry No." + 1)
        else
            exit(1);
    end;

    local procedure GetNextVersion(EmployeeNo: Code[20]): Integer
    var
        EmployeeHistoryRec: Record "Employee History";
    begin
        EmployeeHistoryRec.SetRange("Employee No.", EmployeeNo);
        if EmployeeHistoryRec.FindLast() then
            exit(EmployeeHistoryRec."Version No." + 1)
        else
            exit(1);
    end;
    // --- Logging Helper
    local procedure LogTransfer(HRMSID: Code[20];
    TableName: Text[100];
    Count: Integer;
    Msg: Text[250])
    var
        Log: Record "Transfer Log";
    begin
        Log.Init();
        Log."HRMS ID" := HRMSID;
        Log."Table Name" := TableName;
        Log."Record Count" := Count;
        Log."Message" := Msg;
        Log."Inserted At" := CurrentDateTime;
        Log."Inserted By" := UserId;
        Log.Insert();
    end;
    //SS07OCT end
}
