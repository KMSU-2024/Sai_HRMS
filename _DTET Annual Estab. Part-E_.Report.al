report 33065825 "DTET Annual Estab. Part-E"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './DTETAnnualEstPartE.rdl';

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
