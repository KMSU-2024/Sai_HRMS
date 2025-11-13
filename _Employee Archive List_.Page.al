page 33065492 "Employee Archive List" //SS07OCT c
{
    PageType = List;
    SourceTable = "Employee History";
    Caption = 'Employee history List';
    UsageCategory = Lists;
    ApplicationArea = All;
    Editable = false;
    DeleteAllowed = false;

    // SourceTableView= where("Employee No." = field("Employee No."));
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Employee No."; Rec."Employee No.")
                {
                    ApplicationArea = All;
                }
                field("Employment Name"; Rec."Employment Name")
                {
                    ApplicationArea = All;
                }
                field("Version No."; rec."Version No.")
                {
                    ApplicationArea = All;
                }
                field("Archived DateTime"; rec."Archived DateTime")
                {
                    ApplicationArea = All;
                }
                /*   field(Name; rec.Name)
                  {
                      ApplicationArea = All;
                  }
                  field(Position; rec.Position)
                  {
                      ApplicationArea = All;
                  } */
                field("Aadhaar No"; Rec."Aadhaar No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Aadhaar No field.', Comment = '%';
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Account Type field.', Comment = '%';
                }
                field("Archived By"; Rec."Archived By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Archived By field.', Comment = '%';
                }
                field("Base Qualification"; Rec."Base Qualification")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Base Qualification field.', Comment = '%';
                }
                field("Basic Gr. Pay"; Rec."Basic Gr. Pay")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Basic Gr. Pay field.', Comment = '%';
                }
                field("Bill Group"; Rec."Bill Group")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Bill Group field.', Comment = '%';
                }
                field("Bill Type"; Rec."Bill Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Bill Type field.', Comment = '%';
                }
                field(Category; Rec.Category)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Category field.', Comment = '%';
                }
                field("Current Station"; Rec."Current Station")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Current Station field.', Comment = '%';
                }
                field("D.O.J (Service)"; Rec."D.O.J (Service)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the D.O.J (Service) field.', Comment = '%';
                }
                field("D.O.S"; Rec."D.O.S")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the D.O.S field.', Comment = '%';
                }
                field("Date of increment"; Rec."Date of increment")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Date of increment field.', Comment = '%';
                }
                field("Deployment Date"; Rec."Deployment Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Deployment Date field.', Comment = '%';
                }
                field("Deployment End Date"; Rec."Deployment End Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Deployment End Date field.', Comment = '%';
                }
                field("Deployment Location"; Rec."Deployment Location")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Deployment Location field.', Comment = '%';
                }
                field("Dept./Trade/Section"; Rec."Dept./Trade/Section")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Dept./Trade/Section field.', Comment = '%';
                }
                field(Designation; Rec.Designation)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Designation field.', Comment = '%';
                }
                field("Designation as per HRMS Site"; Rec."Designation as per HRMS Site")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Designation as per HRMS Site field.', Comment = '%';
                }
                field("EPIC No"; Rec."EPIC No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the EPIC No field.', Comment = '%';
                }
                field("Employment Status"; Rec."Employment Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Employment Status field.', Comment = '%';
                }
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Entry No. field.', Comment = '%';
                }
                field("GPF/PRAN No"; Rec."GPF/PRAN No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the GPF/PRAN No field.', Comment = '%';
                }
                field("Home Dist"; Rec."Home Dist")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Home Dist field.', Comment = '%';
                }
                field("Home Dist as per HRMS Site"; Rec."Home Dist as per HRMS Site")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Home Dist as per HRMS Site field.', Comment = '%';
                }
                field("Joining Station"; Rec."Joining Station")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Joining Station field.', Comment = '%';
                }
                field("MACP Status"; Rec."MACP Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the MACP Status field.', Comment = '%';
                }
                field("Pension Remark"; Rec."Pension Remark")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Pension Remark field.', Comment = '%';
                }
                field("Post Group"; Rec."Post Group")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Post Group field.', Comment = '%';
                }
                field("SLCM Employee"; Rec."SLCM Employee")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the SLCM Employee field.', Comment = '%';
                }
                field("Service Joining Designation"; Rec."Service Joining Designation")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Service Joining Designation field.', Comment = '%';
                }
                field("modified by"; Rec."modified by")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the modified by field.', Comment = '%';
                }
                field("modified date time"; Rec."modified date time")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the modified date time field.', Comment = '%';
                }
                field("Mobile Phone No"; Rec."Mobile Phone No")
                {
                    ApplicationArea = ALL;
                }
                field("Birth Date"; Rec."Birth Date")
                {
                    ApplicationArea = ALL;
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = all;
                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = all;
                }
            }
        }
    }
    actions
    {
        area(processing)
        {
            /*     action(ViewEmployee)
                    {
                        Caption = 'View Employee';
                        ApplicationArea = All;
                        Image = View;
                        trigger OnAction()
                        var
                            EmployeeRec: Record Employee;
                        begin
                            if EmployeeRec.Get(Rec."Employee No.") then
                                Page.Run(Page::"Employee Card", EmployeeRec);
                        end;
                    } */
        }
    }
}
