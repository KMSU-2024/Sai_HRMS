report 33065833 REP_DTED_Employee_leave
{
    ApplicationArea = All;
    Caption = 'REP_DTED_Employee_leave';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './LeaveModule/REP_DTED_Employee_leave.rdl';

    dataset
    {
        dataitem(Company;Company)
        {
            column(CompanyNmae;Name)
            {
            }
            dataitem("Employee Leave Application";"Employee Leave Application")
            {
                column(HRMS_ID;"HRMS ID")
                {
                }
                column(Employee_Name;"Employee Name")
                {
                }
                column(Designation;Designation)
                {
                }
                column(Leave_From_Date;"Leave From Date")
                {
                }
                column(Leave_To_Date;"Leave To Date")
                {
                }
                column(Type_of_Leave;"Type of Leave")
                {
                }
                column(Status;Status)
                {
                }
                column(ApplicationDocument;ApplicationDocument)
                {
                }
                trigger OnpreDataItem()var myInt: Integer;
                begin
                    "Employee Leave Application".ChangeCompany(Company.Name);
                end;
                trigger OnAfterGetRecord()var myInt: Integer;
                begin
                    Clear(ApplicationDocument);
                    "Employee Leave Application".CalcFields("Upload Document");
                    if "Employee Leave Application"."Upload Document".HasValue then ApplicationDocument:='Available'
                    else
                        ApplicationDocument:='Not Available';
                end;
            }
        }
    }
    var ApplicationDocument: Text[20];
}
