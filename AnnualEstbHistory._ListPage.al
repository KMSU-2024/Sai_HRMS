page 33065796 "Annual Estb History" //created megha 9-10-25
{
    PageType = List;
    Caption = 'Annual Establishment Review History';
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Annual Estab Review History";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Entry No"; "Entry No")
                {
                    ApplicationArea = all;
                }

                field("Sl.No"; "Sl.No")
                {
                    ApplicationArea = All;
                }
                field("Establishment Type"; "Establishment Type")
                {
                    ApplicationArea = All;
                }
                field("Post Group"; "Post Group")
                {
                    ApplicationArea = All;
                }
                Field("Dept./Trade/Section"; "Dept./Trade/Section")
                {
                    ApplicationArea = All;
                }
                field(Designation; Designation)
                {
                    ApplicationArea = All;
                }
                field("Pay Scale GP"; "Pay Scale GP")
                {
                    ApplicationArea = All;
                }
                field("Pay scale 6th pay"; "Pay scale 6th pay")
                {
                    ApplicationArea = All;
                }
                field("Sanctioned Strength"; "Sanctioned Strength")
                {
                    ApplicationArea = All;
                }
                field("Persons in Position "; "Persons in Position ")
                {
                    ApplicationArea = All;
                }
                field("Vacancy Position "; "Vacancy Position ")
                {
                    ApplicationArea = All;
                }
                FIELD("Excess Post"; "Excess Post")
                {
                    ApplicationArea = All;
                }
                field("Academic Year"; "Academic Year")
                {
                    ApplicationArea = All;
                }
                Field(Remark; Remark)
                {
                    ApplicationArea = All;
                }
                field("Institution Name"; "Institution Name")
                {
                    ApplicationArea = All;
                }
                field("Employee Catagory"; "Employee Catagory")
                {
                    ApplicationArea = All;
                }
                field("Pay Scale level 7th pay"; "Pay Scale level 7th pay")
                {
                    ApplicationArea = All;
                }
                field("Modified DateTime"; "Modified DateTime")
                {
                    ApplicationArea = all;
                }
                field("User Id "; "User Id ")
                {
                    ApplicationArea = all;
                }
            }
        }

    }
    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction();
                begin
                end;
            }
        }
    }
}
