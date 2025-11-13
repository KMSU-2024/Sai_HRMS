page 33066449 "Employee Card New"
{
    PageType = Card;
    //ApplicationArea = All;
    //UsageCategory = Documents;
    SourceTable = Employee;
    SourceTableView = where("SLCM Employee"=const(false));
    Caption = 'Employee custom Card';

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("No.";rec."No.")
                {
                    Caption = 'HRMS Id';
                    ApplicationArea = All;
                }
                field("First Name";rec."First Name")
                {
                    ApplicationArea = All;
                    Caption = 'Employee Name';
                }
                //--SKS_271222
                field("Designation as per HRMS Site";rec."Designation as per HRMS Site")
                {
                    ApplicationArea = All;
                }
                field("Home Dist as per HRMS Site";rec."Home Dist as per HRMS Site")
                {
                    ApplicationArea = All;
                }
                field("Bill Group";rec."Bill Group")
                {
                    ApplicationArea = All;
                }
                field("Account Type";rec."Account Type")
                {
                    ApplicationArea = All;
                }
                field("GPF/PRAN No";rec."GPF/PRAN No")
                {
                    ApplicationArea = All;
                }
                field("Bill Type";rec."Bill Type")
                {
                    ApplicationArea = All;
                }
                field("Dept./Trade/Section";rec."Dept./Trade/Section")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Post Group";rec."Post Group")
                {
                    ApplicationArea = All;
                }
                field("Birth Date";rec."Birth Date")
                {
                    Caption = 'D.O.B';
                    AutoFormatExpression = '<Closing><Day,2><Month,2><Year>';
                    AutoFormatType = 6;
                    ApplicationArea = All;
                }
                field(Gender;rec.Gender)
                {
                    ApplicationArea = All;
                }
                field("D.O.S";rec."D.O.S")
                {
                    ApplicationArea = All;
                    AutoFormatExpression = '<Closing><Day,2><Month,2><Year>';
                    AutoFormatType = 6;
                }
                field(Category;rec.Category)
                {
                    ApplicationArea = All;
                }
                field("Joining Station";rec."Joining Station")
                {
                    ApplicationArea = All;
                    Editable = false;
                    Caption = 'Service Joining Station';
                    TableRelation = Institute."Institute Code";
                }
                field("D.O.J (Service)";rec."D.O.J (Service)")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Current Station";rec."Current Station")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Joining Designation";rec."Service Joining Designation")
                {
                    Caption = 'Joining Designation';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Base Qualification";rec."Base Qualification")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                // field("Home Dist"; rec."Home Dist")
                // {
                //     ApplicationArea = All;
                // }
                field("Basic Gr. Pay";rec."Basic Gr. Pay")
                {
                    ApplicationArea = All;
                    DecimalPlaces = 0;
                }
                field("Employment Status";rec."Employment Status")
                {
                    ApplicationArea = All;
                //Editable = false;
                }
                field("Date of increment";rec."Date of increment")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("E-Mail";rec."E-Mail")
                {
                    ApplicationArea = All;
                }
                field("MACP Status";rec."MACP Status")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("EPIC No";rec."EPIC No")
                {
                    ApplicationArea = All;
                }
                field("Mobile No.";rec."Mobile Phone No.")
                {
                    ApplicationArea = All;

                    trigger onvalidate()var myInt: Integer;
                    begin
                        If StrLen(rec."Mobile Phone No.") > 10 then Error('You Cannot enter more than 10 number.');
                    end;
                }
                field("Pension Remark";rec."Pension Remark")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Aadhaar No";rec."Aadhaar No")
                {
                    ApplicationArea = All;
                    ExtendedDatatype = Masked;
                }
                field("SLCM Employee";"SLCM Employee")
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
            action("Additional employee Details")
            {
                ApplicationArea = All;
                Image = ExternalDocument;

                trigger OnAction()var EmpAddiInfopage: page "Additional employee details";
                begin
                    EmpAddiInfopage.PageRun(Rec."No.");
                end;
            }
            action("Update Additional Employee  Details")
            {
                ApplicationArea = All;
                Image = AddContacts;

                trigger OnAction()var EmpExtaddPage: Page "Employee Extra Information";
                begin
                    EmpExtaddPage.PageRun(rec."No.");
                end;
            }
        }
    }
    var myInt: Integer;
}
