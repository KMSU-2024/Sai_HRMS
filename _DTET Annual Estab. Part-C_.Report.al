report 33065823 "DTET Annual Estab. Part-C"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './DTETAnnualEstPartC.rdl';

    dataset
    {
        dataitem(Company;Company)
        {
            column(CompanyName;Name)
            {
            }
            dataitem("Annual Establishment Review";"Annual Establishment Review")
            {
                column(Institution_Name;"Institution Name")
                {
                }
                column(Academic_Year;"Academic Year")
                {
                Caption = 'Financial Year';
                }
                column(Employee_Catagory;"Employee Catagory")
                {
                }
                column(Dept__Trade_Section;"Dept./Trade/Section")
                {
                }
                column(Designation;Designation)
                {
                }
                column(Pay_Scale_level_7th_pay;"Pay Scale level 7th pay")
                {
                }
                column(Persons_in_Position_;"Persons in Position ")
                {
                }
                column(Remark;Remark)
                {
                }
                trigger OnPreDataitem()var myInt: Integer;
                begin
                    "Annual Establishment Review".ChangeCompany(Company.Name);
                end;
            }
        }
    }
    var myInt: Integer;
}
