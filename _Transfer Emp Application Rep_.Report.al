report 33065762 "Transfer Emp Application Rep"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './Transfer Emp Application.rdl';

    dataset
    {
        dataitem(DataItemName;"Transfer Application Employee")
        {
            CalcFields = Designation;

            column(HRMS_ID;"HRMS ID")
            {
            }
            column(Employee_Name;"Employee Name")
            {
            }
            column(Current_Station;"Current Station")
            {
            }
            column(Designation;Designation)
            {
            }
            column(Date_of_transfer_application;"Date of transfer application")
            {
            }
            column(Ground;Ground)
            {
            }
            column(First_Preference;"First Preference")
            {
            }
            column(Second_Preference;"Second Preference")
            {
            }
            column(Third_Preference;"Third Preference")
            {
            }
        }
    }
    var myInt: Integer;
}
