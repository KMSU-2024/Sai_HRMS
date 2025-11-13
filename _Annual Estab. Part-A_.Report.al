report 33065783 "Annual Estab. Part-A"
{
    Caption = 'Annual Establishment Part - A Report';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './Santosh Bhai/Today/Annual Estab. Part-A.rdl';

    dataset
    {
        dataitem(DataItemName;"Annual Establishment Review")
        {
            column(Institution_Name;CompanyNameVar)
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
    trigger OnPreReport()begin
        CompanyNameVar:=CompanyName;
    end;
    var VacancyPosition: Integer;
    ExcessPosition: Integer;
    CompanyNameVar: Text;
}
