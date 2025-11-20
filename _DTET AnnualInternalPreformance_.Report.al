report 33065811 "DTET AnnualInternalPreformance"
{
    caption = 'DTET Annual Internal Preformance';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './DTETAnnualInternalPreformancePreview.rdl';

    dataset
    {
        dataitem(Company;Company)
        {
            column(CompanyName;Name)
            {
            }
            dataitem("Annual Performance Review";"Annual Performance Review")
            {
                column(HRMS_ID;"HRMS ID")
                {
                }
                column(Name;Name)
                {
                }
                column(Designation;Designation)
                {
                }
                column(Department;Department)
                {
                }
                column(Academic_Year;"Academic Year")
                {
                }
                // Start Anmol 27 jan 25
                // column(Performance_Rating;"Performance Rating")
                // {
                // }
                column(Performance_Appraisal_Review;"Performance Appraisal Review")
                {
                }
                // End Anmol 27 jan 25
                trigger onpreDataItem()begin
                    "Annual Performance Review".ChangeCompany(Company.Name);
                    "Annual Performance Review".SetRange("Academic Year", AcademicYear);
                end;
            }
            trigger OnPreDataitem()begin
            //If AcademicYear = '' then
            //Error('Please Provide Academic Year for which you want to generate Annaul Performance');
            end;
        }
    }
    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                group(General)
                {
                    field(AcademicYear;AcademicYear)
                    {
                        Caption = 'Academic Year';
                        TableRelation = "Financial Year";
                        ApplicationArea = All;
                    }
                }
            }
        }
    }
    var AcademicYear: Code[20];
}
