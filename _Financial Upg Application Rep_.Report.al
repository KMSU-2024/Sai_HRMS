report 33065756 "Financial Upg Application Rep"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './Financial Upg Application.rdl';

    dataset
    {
        dataitem(DataItemName;"Financial Upg Application")
        {
            // CalcFields = Designation;
            column(HRMS_ID;"HRMS ID")
            {
            }
            column(Name;"Name")
            {
            }
            column(Date_of_application_upload;"Date of application upload")
            {
            }
            column(Designation;Designation)
            {
            }
            column("Type";"Type")
            {
            }
            column(Current_Station;"Current Station")
            {
            }
        }
    }
    var myInt: Integer;
}
