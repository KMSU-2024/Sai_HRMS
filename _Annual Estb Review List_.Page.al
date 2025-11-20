page 33066398 "Annual Estb Review List"
{
    PageType = List;
    ApplicationArea = All;
    CardPageId = "Annual Estb Review Card";
    UsageCategory = Lists;
    SourceTable = "Annual Establishment Review";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Sl.No";"Sl.No")
                {
                    ApplicationArea = All;
                }
                field("Establishment Type";"Establishment Type")
                {
                    ApplicationArea = All;
                }
                field("Post Group";"Post Group")
                {
                    ApplicationArea = All;
                }
                Field("Dept./Trade/Section";"Dept./Trade/Section")
                {
                    ApplicationArea = All;
                }
                field(Designation;Designation)
                {
                    ApplicationArea = All;
                }
                field("Pay Scale GP";"Pay Scale GP")
                {
                    ApplicationArea = All;
                }
                field("Pay scale 6th pay";"Pay scale 6th pay")
                {
                    ApplicationArea = All;
                }
                field("Sanctioned Strength";"Sanctioned Strength")
                {
                    ApplicationArea = All;
                }
                field("Persons in Position ";"Persons in Position ")
                {
                    ApplicationArea = All;
                }
                field("Vacancy Position ";"Vacancy Position ")
                {
                    ApplicationArea = All;
                }
                FIELD("Excess Post";"Excess Post")
                {
                    ApplicationArea = All;
                }
                field("Academic Year";"Academic Year")
                {
                    ApplicationArea = All;
                }
                Field(Remark;Remark)
                {
                    ApplicationArea = All;
                }
                field("Institution Name";"Institution Name")
                {
                    ApplicationArea = All;
                }
                field("Employee Catagory";"Employee Catagory")
                {
                    ApplicationArea = All;
                }
                field("Pay Scale level 7th pay";"Pay Scale level 7th pay")
                {
                    ApplicationArea = All;
                }
            }
        }
        area(Factboxes)
        {
        }
    }
    actions
    {
        area(Processing)
        {
            action("View History") //megha 9-10-25
            {
                ApplicationArea = all;
                RunObject = page "Annual Estb History";
                RunPageLink = "Sl.No"=field("Sl.No");
            }
        }
    }
}
