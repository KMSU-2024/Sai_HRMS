report 33066159 "Sanctioned v/s Vacant"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = "SanctionedvsVacant.rdl";
    PreviewMode = Normal;

    dataset
    {
        dataitem(DataItemName;"Annual Establishment Review")
        {
            column(CompanyNameVar;CompanyNameVar)
            {
            }
            column(Designation;Designation)
            {
            }
            column(Dept__Trade_Section;"Dept./Trade/Section")
            {
            }
            column(Sanctioned_Strength;"Sanctioned Strength")
            {
            }
            column(Persons_in_Position_;"Persons in Position ")
            {
            }
            column(Vacancy_Position_;"Vacancy Position ")
            {
            }
            trigger OnAfterGetRecord()var myInt: Integer;
            begin
                If "Sanctioned Strength" >= "Persons in Position " then "Vacancy Position ":="Sanctioned Strength" - "Persons in Position " end;
        }
    }
    rendering
    {
        layout("SanctionedvsVacant.rdl")
        {
            Type = RDLC;
            LayoutFile = 'SanctionedvsVacant.rdl';
        }
    }
    trigger OnPreReport()begin
        CompanyNameVar:=CompanyName;
    end;
    var CompanyNameVar: Text[50];
}
