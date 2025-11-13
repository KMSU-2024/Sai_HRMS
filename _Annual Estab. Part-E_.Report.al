report 33065676 "Annual Estab. Part-E"
{
    Caption = 'Annual Establishment Part -E Report';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './Santosh Bhai/Today/Annual Estab. Part-E.rdl';

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
