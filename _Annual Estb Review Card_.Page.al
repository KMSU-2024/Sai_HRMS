page 33065751 "Annual Estb Review Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Annual Establishment Review";

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Sl.No"; "Sl.No")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Establishment Type"; "Establishment Type")
                {
                    ApplicationArea = All;
                    Editable = EditNow;
                }
                field("Post Group"; "Post Group")
                {
                    ApplicationArea = All;
                    Editable = EditNow;
                }
                Field("Dept./Trade/Section"; "Dept./Trade/Section")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Designation; Designation)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Pay Scale GP"; "Pay Scale GP")
                {
                    ApplicationArea = All;
                    Editable = EditNow;
                }
                field("Pay scale 6th pay"; "Pay scale 6th pay")
                {
                    ApplicationArea = All;
                    Editable = EditNow;
                }
                field("Sanctioned Strength"; "Sanctioned Strength")
                {
                    ApplicationArea = All;
                    Editable = false;

                }
                field("Persons in Position "; "Persons in Position ")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Vacancy Position "; "Vacancy Position ")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                FIELD("Excess Post"; "Excess Post")
                {
                    ApplicationArea = All;
                    Editable = EditNow;
                }
                field("Academic Year"; "Academic Year")
                {
                    ApplicationArea = All;
                    Editable = EditNow;
                }
                Field(Remark; Remark)
                {
                    ApplicationArea = All;
                    Editable = EditNow;
                }
                field("Institution Name"; "Institution Name")
                {
                    ApplicationArea = All;
                    Editable = EditNow;
                }
                field("Employee Catagory"; "Employee Catagory")
                {
                    ApplicationArea = All;
                    Editable = EditNow;
                }
                field("Pay Scale level 7th pay"; "Pay Scale level 7th pay")
                {
                    ApplicationArea = All;
                    Editable = EditNow;
                }
            }
        }
        area(Factboxes)
        {
        }
    }
    actions
    {
        area(Processing)//megha start 9-10-25
        {
            action(Update)
            {
                ApplicationArea = All;

                trigger OnAction();
                begin
                    EditNow := true;
                end;
            }
            action("View History")
            {
                ApplicationArea = all;
                RunObject = page "Annual Estb History";
                RunPageLink = "Sl.No" = field("Sl.No");
            }
        }//megha 9-10-25 end
    }
    trigger OnOpenPage()
    begin
        EditNow := false;
    end;

    var
        EditNow: Boolean;
}
