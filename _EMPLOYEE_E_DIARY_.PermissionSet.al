/* permissionset 131007 "EMPLOYEE_E_DIARY" //SS07OCT c
{
    Assignable = true;
    Caption = 'Employee Electronic Diary Access';
    Permissions = // Employee Master & related
    tabledata Employee = RIMD,
        tabledata "Employee History" = R,
    //  tabledata "Employee Transfer History" = R,
        tabledata "Financial Upg Application" = RIM,
        tabledata "Employee Promotion History" = RIM,
        tabledata "Employee Training" = RIM,
        tabledata "Staff Achivement History" = RIM,
        tabledata "Staff Achievement History Arch" = R,
    // Pages (must use X = Execute)
        page "Employee Electronic Diary List" = X,
        page "Employee Diary Summary FactBox" = X;
    //  page "Promotion History List Part" = X,
    // page "Emp Promotion History Part" = X,
    //  page "Training History List Part" = X,
    // page "Ach History Arch List part" = X;
}
 */