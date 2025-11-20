codeunit 33065468 "Training Buffer Mgt"//SS03NOV

{


    Subtype = Normal;



    procedure LoadTrainingAcrossCompanies1(HRMSID: Code[20])

    var

        CompanyRec: Record Company;

        TrainingHist: Record "Employee Training History";

        Buffer: Record "Training History Buffer";

        NextEntryNo: Integer;

    begin

        if HRMSID = '' then
            exit;


        Buffer.Reset();

        //   Buffer.SetRange("HRMS ID", HRMSID);

        // if not Buffer.IsEmpty() then
        if Buffer.FindSet() then
            Buffer.DeleteAll(true);

        NextEntryNo := 1;


        if CompanyRec.FindSet() then
            repeat

                TrainingHist.ChangeCompany(CompanyRec.Name);

                TrainingHist.Reset();


                TrainingHist.SetRange("HRMS ID", HRMSID);


                if TrainingHist.FindSet() then begin

                    repeat

                        Buffer.Init();

                        Buffer."Entry No." := NextEntryNo;

                        Buffer."HRMS ID" := TrainingHist."HRMS ID";

                        Buffer."Company Name" := CompanyRec.Name;

                        Buffer."End Date" := TrainingHist."EndDate";

                        Buffer."Duration Of Training" := TrainingHist."Duration Of Training";

                        Buffer."Conducted By" := TrainingHist."Conducted By";

                        Buffer."Training Location" := TrainingHist."Training Location";

                        Buffer.Insert();

                        NextEntryNo += 1;

                    until TrainingHist.Next() = 0;

                end;

            until CompanyRec.Next() = 0;

    end;



    procedure LoadPromotionAcrossCompanies(HRMSID: Code[20])
    var
        CompanyRec: Record Company;
        PromoHist: Record "Employee Promotion History";
        Buffer: Record "Promotion History Buffer";
        NextEntryNo: Integer;
    begin
        /* if HRMSID = '' then
             exit;

         Buffer.Reset();
         if Buffer.FindSet() then
             Buffer.DeleteAll();

         if CompanyRec.FindSet() then
             repeat
                 PromoHist.ChangeCompany(CompanyRec.Name);
                 PromoHist.Reset();
                 PromoHist.SetRange("HRMS ID", HRMSID);

                 if PromoHist.FindSet() then begin
                     NextEntryNo := 1;
                     repeat
                         Buffer.Init();
                         Buffer."HRMS ID" := PromoHist."HRMS ID";
                         Buffer."Company Name" := CompanyRec.Name;
                         Buffer."Entry No." := NextEntryNo;
                         Buffer."From Designation" := PromoHist."From Designation";
                         Buffer."To Designation" := PromoHist."To Designation";
                         Buffer."Promotion Order Date" := PromoHist."Promotion Order Date";
                         Buffer."Letter No" := PromoHist."Letter No";
                         Buffer."Order Issuing Authority" := Format(PromoHist."Order Issuing Authority");
                         // Buffer."Version" := PromoHist."Version";
                         Buffer.Insert(true);
                         NextEntryNo += 1;
                     until PromoHist.Next() = 0;
                 end;
             until CompanyRec.Next() = 0;

         Commit(); // optional, ensures clean caching
         */

        if HRMSID = '' then
            exit;


        Buffer.Reset();

        //   Buffer.SetRange("HRMS ID", HRMSID);

        // if not Buffer.IsEmpty() then
        if Buffer.FindSet() then
            Buffer.DeleteAll(true);

        NextEntryNo := 1;


        if CompanyRec.FindSet() then
            repeat

                PromoHist.ChangeCompany(CompanyRec.Name);

                PromoHist.Reset();


                PromoHist.SetRange("HRMS ID", HRMSID);


                if PromoHist.FindSet() then begin

                    repeat

                        Buffer.Init();
                        Buffer."HRMS ID" := PromoHist."HRMS ID";
                        Buffer."Company Name" := CompanyRec.Name;
                        Buffer."Entry No." := NextEntryNo;
                        Buffer."From Designation" := PromoHist."From Designation";
                        Buffer."To Designation" := PromoHist."To Designation";
                        Buffer."Promotion Order Date" := PromoHist."Promotion Order Date";
                        Buffer."Letter No" := PromoHist."Letter No";
                        Buffer."Order Issuing Authority" := Format(PromoHist."Order Issuing Authority");
                        // Buffer."Version" := PromoHist."Version";
                        Buffer.Insert(true);
                        NextEntryNo += 1;
                    until PromoHist.Next() = 0;

                end;

            until CompanyRec.Next() = 0;

    end;

    procedure LoadEmployeeHistoryAcrossCompanies(HRMSID: Code[20])

    var

        CompanyRec: Record Company;

        EmployeeRec: Record Employee;

        Buffer: Record "Employee History Buffer";

    begin

        /*  if HRMSID = '' then
             exit;

         Buffer.Reset();
         if Buffer.FindSet() then
             Buffer.DeleteAll();

         if CompanyRec.FindSet() then
             repeat

                 EmployeeRec.ChangeCompany(CompanyRec.Name);

                 EmployeeRec.Reset();

                 EmployeeRec.SetRange("No.", HRMSID);

                 if EmployeeRec.FindSet() then
                     repeat

                         Buffer.Init();

                         Buffer."HRMS ID" := EmployeeRec."No.";

                         Buffer."Company Name" := CompanyRec.Name;

                         Buffer."No." := EmployeeRec."No.";

                         Buffer."First Name" := EmployeeRec."First Name";

                         Buffer."Designation" := EmployeeRec."Designation";

                         Buffer."Employment Status" := Format(EmployeeRec."Employment Status");

                         Buffer."Current Station" := EmployeeRec."Current Station";

                         Buffer."Deployment Location" := EmployeeRec."Deployment Location";

                         Buffer."Bill Group" := EmployeeRec."Bill Group";

                         Buffer."Base Qualification" := EmployeeRec."Base Qualification";

                         Buffer."Gender" := EmployeeRec."Gender";

                         Buffer."Email" := EmployeeRec."E-Mail";

                         Buffer."Mobile Phone No." := EmployeeRec."Mobile Phone No.";

                         Buffer.Insert(true);

                     until EmployeeRec.Next() = 0;

             until CompanyRec.Next() = 0;
  */
        if HRMSID = '' then
            exit;


        Buffer.Reset();

        //   Buffer.SetRange("HRMS ID", HRMSID);

        // if not Buffer.IsEmpty() then
        if Buffer.FindSet() then
            Buffer.DeleteAll(true);

        // NextEntryNo := 1;


        if CompanyRec.FindSet() then
            repeat

                EmployeeRec.ChangeCompany(CompanyRec.Name);

                EmployeeRec.Reset();


                EmployeeRec.SetRange("No.", HRMSID);


                if EmployeeRec.FindSet() then begin

                    repeat
                        Buffer.Init();

                        Buffer."HRMS ID" := EmployeeRec."No.";

                        Buffer."Company Name" := CompanyRec.Name;

                        Buffer."No." := EmployeeRec."No.";

                        Buffer."First Name" := EmployeeRec."First Name";

                        Buffer."Designation" := EmployeeRec."Designation";

                        Buffer."Employment Status" := Format(EmployeeRec."Employment Status");

                        Buffer."Current Station" := EmployeeRec."Current Station";

                        Buffer."Deployment Location" := EmployeeRec."Deployment Location";

                        Buffer."Bill Group" := EmployeeRec."Bill Group";

                        Buffer."Base Qualification" := EmployeeRec."Base Qualification";

                        Buffer."Gender" := EmployeeRec."Gender";

                        Buffer."Email" := EmployeeRec."E-Mail";

                        Buffer."Mobile Phone No." := EmployeeRec."Mobile Phone No.";

                        Buffer.Insert(true);
                    until EmployeeRec.Next() = 0;



                end;

            until CompanyRec.Next() = 0;

    end;

    procedure LoadAchievementsAcrossCompanies(HRMSID: Code[20])

    var

        CompanyRec: Record Company;

        //AchRec: Record "Staff Achievement History Arch";
        AchRec: Record "Staff Achivement History";

        Buffer: Record "Employee Achievements Buffer";

        NextEntryNo: Integer;

    begin

        /*  if HRMSID = '' then
             exit;


         Buffer.Reset();
         if Buffer.FindSet() then
             Buffer.DeleteAll();


         if CompanyRec.FindSet() then
             repeat

                 AchRec.ChangeCompany(CompanyRec.Name);

                 AchRec.Reset();

                 AchRec.SetRange("HRMS ID", HRMSID);

                 if AchRec.FindSet() then begin

                     NextEntryNo := 1;

                     repeat

                         Buffer.Init();

                         Buffer."HRMS ID" := AchRec."HRMS ID";

                         Buffer."Company Name" := CompanyRec.Name;

                         Buffer."Entry No." := NextEntryNo;

                         Buffer."Archive Entry No." := AchRec."Archive Entry No.";

                         Buffer."Employee Name" := AchRec."Employee Name";

                         Buffer."Designation" := AchRec."Designation";

                         Buffer."Base Qualification" := AchRec."Base Qualification";

                         Buffer."Inservice Qua. Upgradation" := AchRec."Inservice Qua. Upgradation";

                         Buffer."Award" := AchRec."Award";

                         Buffer."Award Details" := AchRec."Award Details";

                         Buffer."Achievement Remarks" := AchRec."Achivement Remarks";

                         Buffer."Academic Year" := AchRec."Academic Year";

                         Buffer."Version No." := AchRec."Version No.";

                         Buffer."Archived By" := AchRec."Archived By";

                         Buffer."Archived DateTime" := AchRec."Archived DateTime";

                         Buffer.Insert(true);

                         NextEntryNo += 1;

                     until AchRec.Next() = 0;

                 end;

             until CompanyRec.Next() = 0;

         Commit();
  */
        if HRMSID = '' then
            exit;


        Buffer.Reset();


        if Buffer.FindSet() then
            Buffer.DeleteAll(true);



        if CompanyRec.FindSet() then
            repeat

                AchRec.ChangeCompany(CompanyRec.Name);

                AchRec.Reset();


                AchRec.SetRange("HRMS ID", HRMSID);


                if AchRec.FindSet() then begin
                    NextEntryNo := 1;


                    repeat
                        Buffer.Init();

                        Buffer."HRMS ID" := AchRec."HRMS ID";

                        Buffer."Company Name" := CompanyRec.Name;

                        Buffer."Entry No." := NextEntryNo;

                        Buffer."Archive Entry No." := AchRec."Entry No";

                        Buffer."Employee Name" := AchRec.Name;

                        Buffer."Designation" := AchRec."Designation";

                        Buffer."Base Qualification" := AchRec."Base Qualification";

                        Buffer."Inservice Qua. Upgradation" := AchRec."Inservice Qua. Upgradation";

                        Buffer."Award" := AchRec."Award";

                        Buffer."Award Details" := AchRec."Award Details";

                        Buffer."Achievement Remarks" := AchRec."Achivement Remarks";

                        Buffer."Academic Year" := AchRec."Academic Year";

                        // Buffer."Version No." := AchRec."Version No.";

                        Buffer."Archived By" := AchRec."Modified By";

                        Buffer."Archived DateTime" := AchRec."Modified Date Time";

                        Buffer.Insert(true);

                        NextEntryNo += 1;

                    until AchRec.Next() = 0;


                end;

            until CompanyRec.Next() = 0;

    end;

    procedure LoadTransferAcrossCompanies(HRMSID: Code[20])

    var

        CompanyRec: Record Company;

        TransferRec: Record "Transfer Joining History";

        Buffer: Record "Employee Transfer Buffer";

        NextEntryNo: Integer;

    begin

        /*   if HRMSID = '' then
              exit;

          Buffer.Reset();
          if Buffer.FindSet() then
              Buffer.DeleteAll();


          if CompanyRec.FindSet() then
              repeat

                  TransferRec.ChangeCompany(CompanyRec.Name);

                  TransferRec.Reset();

                  TransferRec.SetRange("HRMS ID", HRMSID);

                  if TransferRec.FindSet() then begin

                      NextEntryNo := 1;

                      repeat

                          Buffer.Init();

                          Buffer."HRMS ID" := TransferRec."HRMS ID";

                          Buffer."Company Name" := CompanyRec.Name;

                          Buffer."Entry No." := NextEntryNo;

                          Buffer."Employee Name" := TransferRec."Name";

                          Buffer."Designation" := TransferRec."Designation";

                          Buffer."From Station" := TransferRec."From Station";

                          Buffer."To Station" := TransferRec."To Station";

                          //  Buffer."Transfer Order Issuing Authority" := TransferRec."Transfer Order Issuing Authority";

                          //Buffer."Relieve Date" := TransferRec."Relieve Date";

                          Buffer.Insert(true);

                          NextEntryNo += 1;

                      until TransferRec.Next() = 0;

                  end;

              until CompanyRec.Next() = 0;

          Commit();
   */
        if HRMSID = '' then
            exit;


        Buffer.Reset();


        if Buffer.FindSet() then
            Buffer.DeleteAll(true);



        if CompanyRec.FindSet() then
            repeat

                TransferRec.ChangeCompany(CompanyRec.Name);

                TransferRec.Reset();


                TransferRec.SetRange("HRMS ID", HRMSID);


                if TransferRec.FindSet() then begin

                    repeat
                        Buffer.Init();

                        Buffer."HRMS ID" := TransferRec."HRMS ID";

                        Buffer."Company Name" := CompanyRec.Name;

                        Buffer."Entry No." := NextEntryNo;

                        Buffer."Employee Name" := TransferRec."Name";

                        Buffer."Designation" := TransferRec."Designation";

                        Buffer."From Station" := TransferRec."From Station";

                        Buffer."To Station" := TransferRec."To Station";

                        //  Buffer."Transfer Order Issuing Authority" := TransferRec."Transfer Order Issuing Authority";

                        //Buffer."Relieve Date" := TransferRec."Relieve Date";

                        Buffer.Insert(true);

                        NextEntryNo += 1;

                    until TransferRec.Next() = 0;


                end;

            until CompanyRec.Next() = 0;

    end;

    /* 
        procedure LoadFinancialUpgAcrossCompanies(HRMSID: Code[30])

        var

            CompanyRec: Record Company;

            FinUpgRec: Record "Financial Upg App history";

            Buffer: Record "Employee Financial Upg Buffer";

            NextEntryNo: Integer;


         */
    procedure LoadFinancialUpgAcrossCompanies(HRMSID: Code[30])

    var

        /*CompanyRec: Record Company;

        FinUpgRec: Record "Financial Upg App history";

        Buffer: Record "Employee Financial Upg Buffer";

        NextEntryNo: Integer;*/
        CompanyRec: Record Company;

        FinUpgRec: Record "Financial Upg App history";

        Buffer: Record "Employee Financial Upg Buffer";
    begin
        if HRMSID = '' then
            exit;


        Buffer.Reset();

        //   Buffer.SetRange("HRMS ID", HRMSID);

        // if not Buffer.IsEmpty() then
        if Buffer.FindSet() then
            Buffer.DeleteAll(true);

        // NextEntryNo := 1;


        if CompanyRec.FindSet() then
            repeat

                FinUpgRec.ChangeCompany(CompanyRec.Name);

                FinUpgRec.Reset();


                FinUpgRec.SetRange("HRMS ID", HRMSID);


                if FinUpgRec.FindSet() then begin

                    repeat
                        Buffer.Init();

                        Buffer."HRMS ID" := FinUpgRec."HRMS ID";
                        Buffer."Company Name" := CompanyRec.Name;
                        Buffer."Entry No." := FinUpgRec."Entry No.";
                        Buffer."Application File Name" := FinUpgRec."Application File Name";
                        Buffer."Current Station" := FinUpgRec."Current Station";
                        Buffer."Status" := FinUpgRec."Status";
                        Buffer."Effective Date Of MACP" := FinUpgRec."Effective Date Of MACP";
                        Buffer."No of Versions" := FinUpgRec."No of Versions";
                        Buffer."Current Station" := FinUpgRec."Current Station";
                        Buffer."Modified Date Time" := FinUpgRec."Modified Date Time";
                        Buffer.Insert(true);

                    until FinUpgRec.Next() = 0;

                end;

            until CompanyRec.Next() = 0;

    end;


    procedure LoadAppraisalAcrossCompanies(HRMSID: Code[20])

    var

        CompanyRec: Record Company;

        AppraisalRec: Record "Annual Performance Reviewhis";


        Buffer: Record "Employee Appraisal Buffer";

        NextEntryNo: Integer;

    begin

        /*   if HRMSID = '' then
              exit;



          Buffer.Reset();
          if Buffer.FindSet() then
              Buffer.DeleteAll();


          if CompanyRec.FindSet() then
              repeat

                  AppraisalRec.ChangeCompany(CompanyRec.Name);

                  AppraisalRec.Reset();

                  AppraisalRec.SetRange("HRMS ID", HRMSID);

                  if AppraisalRec.FindSet() then begin

                      NextEntryNo := 1;

                      repeat

                          Buffer.Init();

                          Buffer."HRMS ID" := AppraisalRec."HRMS ID";

                          Buffer."Company Name" := CompanyRec.Name;

                          Buffer."Entry No." := NextEntryNo;

                          Buffer."Employee Name" := AppraisalRec.Name;

                          Buffer."Designation" := AppraisalRec.Designation;

                          Buffer."Department" := AppraisalRec.Department;

                          Buffer."Academic Year" := AppraisalRec."Academic Year";

                          Buffer."Performance Appraisal Review" := AppraisalRec."Performance Appraisal Review";

                          Buffer."Modified By" := AppraisalRec."Modified By";

                          Buffer."Modified Date Time" := AppraisalRec."Modified Date Time";

                          Buffer.Insert(true);

                          NextEntryNo += 1;

                      until AppraisalRec.Next() = 0;

                  end;

              until CompanyRec.Next() = 0;

          Commit();
   */
        if HRMSID = '' then
            exit;


        Buffer.Reset();


        if Buffer.FindSet() then
            Buffer.DeleteAll(true);



        if CompanyRec.FindSet() then
            repeat

                AppraisalRec.ChangeCompany(CompanyRec.Name);

                AppraisalRec.Reset();


                AppraisalRec.SetRange("HRMS ID", HRMSID);


                if AppraisalRec.FindSet() then begin

                    repeat

                        Buffer.Init();

                        Buffer."HRMS ID" := AppraisalRec."HRMS ID";

                        Buffer."Company Name" := CompanyRec.Name;

                        Buffer."Entry No." := NextEntryNo;

                        Buffer."Employee Name" := AppraisalRec.Name;

                        Buffer."Designation" := AppraisalRec.Designation;

                        Buffer."Department" := AppraisalRec.Department;

                        Buffer."Academic Year" := AppraisalRec."Academic Year";

                        Buffer."Performance Appraisal Review" := AppraisalRec."Performance Appraisal Review";

                        Buffer."Modified By" := AppraisalRec."Modified By";

                        Buffer."Modified Date Time" := AppraisalRec."Modified Date Time";

                        Buffer.Insert(true);

                        NextEntryNo += 1;

                    until AppraisalRec.Next() = 0;
                end;
            until CompanyRec.Next() = 0;

    end;


}

