report 33065796 "Court Case Monitoring"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './Santosh Bhai/Today/Court Case Monitoring.rdl';

    dataset
    {
        dataitem(DataItemName;"Court Cases")
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
        }
    }
}
