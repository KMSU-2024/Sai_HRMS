report 33065795 "Annual Estab. Part-C"
{
    Caption = 'Annual Establishment Part - C Report';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './Santosh Bhai/Today/Annual Estab. Part-C.rdl';

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
            column(Designation;Designation)
            {
            }
            column(Dept__Trade_Section;"Dept./Trade/Section")
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
        }
    }
    trigger OnPreReport()begin
        CompanyNameVar:=CompanyName;
    end;
    var myInt: Integer;
    CompanyNameVar: Text;
}
