report 33065827 "DTET Financial Upg Application"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    Caption = 'DTET Financial Upgradation Application';
    RDLCLayout = './DTETFinancialUpgApplication.rdl';

    dataset
    {
        dataitem(Company;Company)
        {
            column(CompanyName;Name)
            {
            }
            dataitem("Financial Upg Application";"Financial Upg Application")
            {
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
                column(Status;Status)
                {
                }
                column(FileUploadStatus;FileUploadStatus)
                {
                }
                trigger OnPredataitem()var myInt: Integer;
                begin
                    "Financial Upg Application".ChangeCompany(Company.Name);
                end;
                trigger OnAfterGetRecord()var myInt: Integer;
                begin
                    Clear(FileUploadStatus);
                    if "Financial Upg Application"."Application file name" <> '' then FileUploadStatus:='Available'
                    else
                        FileUploadStatus:='Not Available';
                end;
            }
        }
    }
    var myInt: Integer;
    FileUploadStatus: Text[20];
}
