report 33065821 "DTET RTI Monitoring"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './DTETRTIMonitoring.rdl';

    dataset
    {
        dataitem(Company;Company)
        {
            column(CompanyName;Name)
            {
            }
            dataitem("RTI monitoring";"RTI monitoring")
            {
                column(Type_of_Application;"Type of Application")
                {
                }
                column(Application_No_;"Application No.")
                {
                }
                column(Name_of_the_applicant;"Name of the applicant")
                {
                }
                column(Date_of_Receipt_of_application;"Date of Receipt of application")
                {
                }
                column(Reply_Due_Date;"Reply Due Date")
                {
                }
                column(Reply_Sent;"Reply Sent")
                {
                }
                column(Type_of_Reply;"Type of Reply")
                {
                }
                column(Reply_Letter_Date;"Reply Letter Date")
                {
                }
                column(Letter_No_;"Letter No.")
                {
                }
                column(Letter_Dispatch_Date;"Letter Dispatch Date")
                {
                }
                column(Remark;Remark)
                {
                }
                trigger OnPreDataitem()var myInt: Integer;
                begin
                    "RTI monitoring".ChangeCompany(Company.Name);
                end;
            }
        }
    }
    var myInt: Integer;
}
