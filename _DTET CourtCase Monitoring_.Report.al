report 33065820 "DTET CourtCase Monitoring"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './DTETCourtCaseMonitoring.rdl';

    dataset
    {
        dataitem(Company;Company)
        {
            column(CompanyName;Name)
            {
            }
            dataitem("Court Cases";"Court Cases")
            {
                column(Case_No_;"Case No.")
                {
                }
                column(Year_of_filing;"Year of filing")
                {
                }
                column(Name_of_the_Court;"Name of the Court")
                {
                }
                column(Place;Place)
                {
                }
                column(Petitioner_Name;"Petitioner Name")
                {
                }
                column(Opposite_Party_Name;"Opposite Party Name")
                {
                }
                column(Lowest_level_office_hierarchy;"Lowest level office hierarchy")
                {
                }
                column(Matter_Relating_to;"Matter Relating to")
                {
                }
                column(Last_Case_Date;"Last Case Date")
                {
                }
                column(Case_Status;"Case Status")
                {
                }
                trigger OnPreDataitem()var myInt: Integer;
                begin
                    "Court Cases".ChangeCompany(Company.Name);
                end;
            }
        }
    }
    var myInt: Integer;
}
