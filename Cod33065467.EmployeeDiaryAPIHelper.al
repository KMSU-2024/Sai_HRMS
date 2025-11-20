codeunit 33065467 "EmployeeDiary API Helper"

{

    [ServiceEnabled]

    procedure LoadFullDiary(HRMSID: Code[20])

    var

        DiaryMgt: Codeunit "Training Buffer Mgt";

    begin

        if HRMSID = '' then
            Error('HRMS ID cannot be blank.');


        DiaryMgt.LoadTrainingAcrossCompanies1(HRMSID);

        DiaryMgt.LoadPromotionAcrossCompanies(HRMSID);
        DiaryMgt.LoadEmployeeHistoryAcrossCompanies(HRMSID);


        DiaryMgt.LoadAchievementsAcrossCompanies(HRMSID);

        DiaryMgt.LoadTransferAcrossCompanies(HRMSID);

        DiaryMgt.LoadFinancialUpgAcrossCompanies(HRMSID);

        DiaryMgt.LoadAppraisalAcrossCompanies(HRMSID);

        Message('Employee diary data loaded successfully for HRMS ID %1.', HRMSID);

    end;

}

