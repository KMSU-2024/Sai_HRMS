page 33065493 "Employee Electronic Diary List" //SS07OCT c
{
    PageType = List;
    SourceTable = Employee;
    SourceTableView = where(Status = const(Active), "SLCM Employee" = const(false));
    // SourceTableTemporary=true;
    UsageCategory = Lists;
    ApplicationArea = all;
    Caption = 'Employee Electronic Diary';

    layout
    {
        area(content)
        {
            group(Filters)
            {
                /*  field(HRMSIdFilter; HRMSIdFilter)

                  {

                      Caption = 'HRMS ID Filter';

                      ApplicationArea = All;

                      trigger OnValidate()

                      begin

                          // ApplySearch();
                          LoadEmployeesAcrossCompanies();


                          CurrPage.Update(false);

                      end;

                  }*/
                field("HRMS ID Filter"; HRMSIDFilter)
                {
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin
                        if HRMSIDFilter <> '' then CurrPage.SetSelectionFilter(Rec);
                        // Apply filter on the source table
                        Rec.SetFilter("No.", HRMSIDFilter);
                        CurrPage.Update(false);
                    end;
                }
                field(EmployeeNameFilter; EmployeeNameFilter)
                {
                    Caption = 'Employee Name Filter';
                    ApplicationArea = All;

                    trigger OnLookup(var Text: Text): Boolean
                    var
                        EmpHist: Record "Employee History";
                    begin
                        EmpHist.Reset();
                        if EmployeeNameFilter <> '' then EmpHist.SetFilter("Employment Name", '%1*', EmployeeNameFilter);
                        if Page.RunModal(Page::"Employee Lookup List", EmpHist) = Action::LookupOK then begin
                            EmployeeNameFilter := EmpHist."Employment Name";
                            ApplySearch();
                            CurrPage.Update(false);
                        end;
                        exit(true);
                    end;

                    trigger OnValidate()
                    begin
                        ApplySearch();
                        CurrPage.Update(false);
                    end;
                }
            }
            repeater(Group)
            {
                field("Employee No."; rec."No.")
                {
                    ApplicationArea = All;
                }
                field("Employment Name"; rec."First Name")
                {
                    ApplicationArea = All;
                }
                field("Designation"; rec.Designation)
                {
                    ApplicationArea = All;
                }
                field("Employment Status"; rec."Employment Status")
                {
                    ApplicationArea = All;
                }
                field("Current Station"; rec."Current Station")
                {
                    ApplicationArea = All;
                }
                field("Deployment Location"; rec."Deployment Location")
                {
                    ApplicationArea = All;
                }
            }
        }
        area(factboxes)
        {
            /* part(employeehis; "Employee History List part")
             {
                 SubPageLink = "Employee No." = field("No.");

             }

             part(EmployeeSummary; "Employee Diary Summary FactBox")

             {

                 SubPageLink = "Current Station" = field("Current Station");

                 ApplicationArea = All;

             }
             part(EMpPromotion; "Promotion History List Part")
             {
                 Caption = 'Employee Promotion';
                 SubPageLink = "HRMS ID" = field("No.");
             }
             part(PromotionHistory; "Emp Promotion History Part")

             {

                 Caption = 'Promotion History';

                 SubPageLink = "HRMS ID" = field("No.");


             }
             part(TrainingList; "Training History List part")
             {
                 Caption = 'Training History';
                 SubPageLink = "HRMS ID" = field("No.");

             }
             part(archivehistory; "Ach History Arch List part")
             {
                 Caption = 'Achivement History';
                 SubPageLink = "HRMS ID" = field("No.");


             }*/
            part(CrossTrainingHist; CrossCompanyTrainingHist)
            {
                //SubPageLink = "HRMS ID" = field("No.");
            }
            part(CrossPromtHist; CrossCompanyPromotionHist)
            {
                //  SubPageLink = "HRMS ID" = field("No.");
            }
            part(CrossCompanyEmployeeHist; CrossCompanyEmployeeHist)
            {
            }
            part(CrossCompanyAchievements; CrossCompanyAchievements)
            {
            }
            part(CrossCompanyTransferHist; CrossCompanyTransferHist)
            {
            }
            part(CrossCompanyFinancialUpgHist; CrossCompanyFinancialUpgHist)
            {
                //  SubPageLink = "HRMS Id" = field("No.");
            }
            part(CrossApprisalHist; CrossApprisalHist)
            {
            }
        }
    }
    actions
    {
        area(processing)
        {
            action(ShowInactiveAction)
            {
                Caption = 'Show Inactive Employees';
                Visible = not ShowInactive;

                trigger OnAction()
                begin
                    ShowInactive := true;
                    ApplyFilters();
                    CurrPage.Update(false);
                end;
            }
            action(HideInactiveAction)
            {
                Caption = 'Hide Inactive Employees';
                Visible = ShowInactive;

                trigger OnAction()
                begin
                    ShowInactive := false;
                    ApplyFilters();
                    CurrPage.Update(false);
                end;
            }
            action(RefreshCounts)
            {
                ApplicationArea = All;
                Caption = 'Refresh Counts';
                Image = Refresh;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    SummaryMgt: Codeunit "Employee Diary Summary Mgt";
                begin
                    SummaryMgt.RecalculateSummary(UserSetup."Global Dimension 1 Code");
                    //   CurrPage.EmployeeSummary.PAGE.RefreshCounts(UserSetup."Global Dimension 1 Code");
                end;
            }
        }
    }
    /*megha 30-10-25  local procedure LoadEmployeesAcrossCompanies()
     var
         CompanyList: Record Company;
         EmployeeSrc: Record Employee;
         TempEmployee: Record Employee temporary; // use a temporary buffer
     begin
         Clear(Rec);
         Clear(TempEmployee);
         if CompanyList.FindSet() then
             repeat
                 EmployeeSrc.ChangeCompany(CompanyList.Name);
                 EmployeeSrc.SetRange("No.", HRMSIdFilter);
                 if EmployeeSrc.FindSet() then
                     repeat
                         TempEmployee.Init();
                         TempEmployee.TransferFields(EmployeeSrc, true);
                         // Make it unique by appending company name to No.
                         TempEmployee."No." := Format(EmployeeSrc."No.") + '-' + CopyStr(CompanyList.Name, 1, 10);
                         TempEmployee.Insert();
                     until EmployeeSrc.Next() = 0;
             until CompanyList.Next() = 0;
         // Copy the result set back into Rec so the page displays it
         Rec := TempEmployee;
     end; */
    local procedure LoadEmployeesAcrossCompanies()
    var
        CompanyList: Record Company;
        EmployeeSrc: Record Employee;
        EmployeeTarget: Record Employee;
    begin

        Clear(EmployeeTarget);

        if CompanyList.FindSet() then
            repeat
                EmployeeSrc.ChangeCompany(CompanyList.Name);
                EmployeeSrc.SetRange("No.", HRMSIdFilter);

                if EmployeeSrc.FindSet() then
                    repeat
                        EmployeeTarget.Init();
                        EmployeeTarget.TransferFields(EmployeeSrc, true);
                        EmployeeTarget."No." := Format(EmployeeSrc."No.") + '-' + CopyStr(CompanyList.Name, 1, 10);
                        EmployeeTarget.Insert();
                    until EmployeeSrc.Next() = 0;
            until CompanyList.Next() = 0;
    end;


    trigger OnAfterGetRecord()
    var
        CrossHistPage: Page CrossCompanyTrainingHist;
    begin
        if Rec."No." <> '' then CurrPage.CrossTrainingHist.Page.LoadData(rec."No."); //2
        CurrPage.CrossPromtHist.Page.LoadData(rec."No."); //3
        CurrPage.CrossCompanyEmployeeHist.Page.LoadData(rec."No."); //1
        CurrPage.CrossCompanyAchievements.Page.LoadData(rec."No."); //4
        CurrPage.CrossCompanyTransferHist.Page.LoadData(rec."No."); //5;
        CurrPage.CrossCompanyFinancialUpgHist.Page.LoadData(Rec."No.");
        CurrPage.CrossApprisalHist.Page.LoadData(Rec."No.");
    end;

    var
        UserSetup: Record "User Setup";
        HRMSIdFilter: Code[20];
        EmployeeNameFilter: Text[100];
        ShowInactive: Boolean;
    //   trigger OnOpenPage()
    //  begin
    //if UserSetup.Get(UserId) then
    //  ApplyFilters();
    //  LoadEmployeesAcrossCompanies();
    // CurrPage.EmployeeSummary.PAGE.RefreshCounts(UserSetup."Global Dimension 1 Code");
    // end;
    /*  local procedure HasPermission(PermissionSetCode: Code[50]): Boolean

      var

          PermissionSet: Record "Permission Set";

          UserPermission: Record "Access Control";

      begin

          if PermissionSet.Get(PermissionSetCode) then begin

              UserPermission.SetRange("User Security ID", UserSecurityId());

              UserPermission.SetRange("Role ID", PermissionSetCode);

              UserPermission.SetFilter("Company Name", '%1|%2', CompanyName, ''); // current or global

              if UserPermission.FindFirst() then
                  exit(true);

          end;

          exit(false);

      end;*/
    local procedure HasPermission(PermissionSetCode: Code[50]): Boolean
    var
        PermissionSet: Record "Permission Set";
        UserPermission: Record "Access Control";
    begin
        // Check if permission set exists
        if PermissionSet.Get(PermissionSetCode) then begin
            // Look for user with this permission set assigned globally (Company = '')
            UserPermission.SetRange("User Security ID", UserSecurityId());
            UserPermission.SetRange("Role ID", PermissionSetCode);
            UserPermission.SetRange("Company Name", ''); // only global
            if UserPermission.FindFirst() then exit(true);
        end;
        exit(false);
    end;

    trigger OnOpenPage() //SS08OCT
    var
        PermissionSetLbl: Label 'EMPLOYEE_E_DIARY', Locked = true;
    begin
        UserSetup.Get(UserId);
        IF UserSetup."E-Dairy" = false then begin
            Error('Access Denied! You do not have permission to view Employee Electronic Diary in %1 company. Please contact your administrator.', CompanyName);
            CurrPage.Close();
        end;
        // Special rule: DTET company always allowed
        /*   if CompanyName = 'DTE&T, Odisha' then begin
                   //  ApplyFilters();


                   LoadEmployeesAcrossCompanies();

               end else begin

                   // In other companies, enforce permission check

                   if not HasPermission(PermissionSetLbl) then
                       Error(

                         'Access Denied! You do not have permission to view Employee Electronic Diary in %1 company. Please contact your administrator.',

                         CompanyName) else
                       ApplyFilters();

                   LoadEmployeesAcrossCompanies();


               end;


               // Refresh summary counts if available

               if UserSetup.Get(UserId) then
                   LoadEmployeesAcrossCompanies();


               // CurrPage.EmployeeSummary.PAGE.RefreshCounts(UserSetup."Global Dimension 1 Code");
               if HRMSIDFilter <> '' then
                   Rec.SetFilter("No.", HRMSIDFilter);
                   */
    end;

    local procedure ApplyFilters()
    begin
        if CompanyName = 'DTE&T_Odisha' then exit; // DTET company - no filters
        rec.SetRange("Current Station", UserSetup."Global Dimension 1 Code");
        if not ShowInactive then rec.SetRange("Employment Status", rec."Employment Status"::Regular);
    end;

    local procedure ApplySearch()
    var
        EmpRec: Record Employee;
    begin
        // HRMS ID filter
        if HRMSIdFilter <> '' then begin
            EmpRec.Reset();
            EmpRec.SetRange("No.", HRMSIdFilter);
            if not EmpRec.FindFirst() then begin
                Error('No employee found with HRMS ID %1.', HRMSIdFilter);
            end;
            ClearSourceTableView();
            // If record exists, apply filter
            Rec.SetRange("No.", HRMSIdFilter);
            // Remove SourceTableView filter (so it shows even inactive employee)
            Rec.SetRange(Status);
        end
        else begin
            Rec.SetRange("No.");
        end;
        // Employee Name filter (contains search, case-insensitive)
        if EmployeeNameFilter <> '' then
            Rec.SetFilter("First Name", EmployeeNameFilter)
        else
            Rec.SetRange("First Name");
    end;

    local procedure ClearSourceTableView()
    begin
        // Remove the filters applied by SourceTableView
        Rec.SetRange(Status); // Clears Status filter (Active only)
        Rec.SetRange("SLCM Employee"); // Clears SLCM Employee filter
    end;
}
