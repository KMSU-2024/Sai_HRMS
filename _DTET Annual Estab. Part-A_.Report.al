report 33065822 "DTET Annual Estab. Part-A"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './DTETAnnualEstPartA.rdl';

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
                column(Pay_Scale_GP;"Pay Scale GP")
                {
                }
                column(Pay_scale_6th_pay;"Pay scale 6th pay")
                {
                }
                column(Pay_Scale_level_7th_pay;"Pay Scale level 7th pay")
                {
                }
                column(Sanctioned_Strength;"Sanctioned Strength")
                {
                }
                column(Persons_in_Position_;"Persons in Position ")
                {
                }
                column(VacancyPosition;VacancyPosition)
                {
                }
                column(ExcessPosition;ExcessPosition)
                {
                Caption = 'Excess Post Missing';
                }
                column(Remark;Remark)
                {
                }
                trigger OnPreDataitem()var myInt: Integer;
                begin
                    "Annual Establishment Review".ChangeCompany(Company.Name);
                end;
                trigger OnAfterGetRecord()var myInt: Integer;
                begin
                    Clear(VacancyPosition);
                    Clear(ExcessPosition);
                    If "Sanctioned Strength" >= "Persons in Position " then VacancyPosition:="Sanctioned Strength" - "Persons in Position "
                    else
                        ExcessPosition:=Abs("Sanctioned Strength" - "Persons in Position ");
                end;
            }
        }
    }
    var VacancyPosition: Integer;
    ExcessPosition: Integer;
}
