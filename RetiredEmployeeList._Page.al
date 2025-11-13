page 33065612 "Retired Employee Lists"
{
    ApplicationArea = All;
    Caption = 'Retired Employee List';
    PageType = List;
    SourceTable = Employee;
    SourceTableView = where(Status = const(Inactive), "Employment Status" = const(Inactive));
    UsageCategory = Lists;
    CardPageId = "Employee Custom Card";
    Editable = false;
    ModifyAllowed = false;
    DeleteAllowed = false;
    InsertAllowed = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the employee''s first name.';
                    Caption = 'Employee Name';
                }
                field("Bill Group"; Rec."Bill Group")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Bill Group field.';
                }
                field("Bill Type"; Rec."Bill Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Bill Type field.';
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Account Type field.';
                }
                field("Designation as per HRMS Site"; rec."Designation as per HRMS Site")
                {
                    ApplicationArea = All;
                }
                field(Designation; Rec.Designation)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Designation field.';
                }
                field("Dept./Trade/Section"; Rec."Dept./Trade/Section")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Dept./Trade/Section field.';
                }
                field("Post Group"; Rec."Post Group")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Post Group field.';
                }
                field("GPF/PRAN No"; Rec."GPF/PRAN No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the GPF/PRAN No field.';
                }
                field("Birth Date"; Rec."Birth Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the employee''s date of birth.';
                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the employee''s gender.';
                }
                field("D.O.S"; Rec."D.O.S")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the D.O.S (Date of Superannuation) field.';
                }
                field(Category; Rec.Category)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Category field.';
                }
                field("Joining Station"; Rec."Joining Station")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Joining Station field.';
                }
                field("D.O.J (Service)"; Rec."D.O.J (Service)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the D.O.J (Service) field.';
                }
                field("Current Station"; Rec."Current Station")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Current Station field.';
                }
                field("Service Joining Designation"; Rec."Service Joining Designation")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Service Joining Designation field.';
                }
                field("Base Qualification"; Rec."Base Qualification")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Base Qualification field.';
                }
                field("Home Dist as per HRMS Site"; "Home Dist as per HRMS Site")
                {
                    ApplicationArea = All;
                }
                field("Home Dist"; Rec."Home Dist")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Home Dist field.';
                }
                field("Basic Gr. Pay"; Rec."Basic Gr. Pay")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Basic Gr. Pay field.';
                }
                field("Employment Status"; Rec."Employment Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Employment Status field.';
                }
                field("Date of increment"; Rec."Date of increment")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Date of increment field.';
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the employee''s private email address.';
                }
                field("EPIC No"; Rec."EPIC No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the EPIC No field.';
                }
                field("MACP Status"; Rec."MACP Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the MACP Status field.';
                }
                field("Mobile Phone No."; Rec."Mobile Phone No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the employee''s private telephone number.';
                }
                field("Pension Remark"; Rec."Pension Remark")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Pension Remark field.';
                }
                field("Aadhaar No"; Rec."Aadhaar No")
                {
                    ApplicationArea = All;
                    ExtendedDatatype = Masked;
                    ToolTip = 'Specifies the value of the Aadhaar No field.';
                }
                field(Status; rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Aadhaar No field.';
                }
                field("SLCM Employee"; "SLCM Employee")
                {
                    ApplicationArea = All;
                }
                field("Deployment Location"; "Deployment Location")
                {
                    ApplicationArea = All;
                }
                field("Deployment Date"; "Deployment Date")
                {
                    ApplicationArea = All;
                }
                field("Deployment Start Date"; "Deployment Start Date")
                {
                    ApplicationArea = all;
                }
                field("Deployment End Date"; "Deployment End Date")
                {
                    ApplicationArea = all;
                }
                field("Last Name"; "Last Name")
                {
                    ApplicationArea = all;
                }
            }
        }
    }
}