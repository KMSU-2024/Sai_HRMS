report 33065828 "DTET Transfer Emp Application"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    Caption = ' DTET Employee Trasfer Application';
    RDLCLayout = './DTETTransferEmpApplication.rdl';

    dataset
    {
        dataitem(Company;Company)
        {
            column(CompanyName;Name)
            {
            }
            dataitem("Transfer Application Employee";"Transfer Application Employee")
            {
                // CalcFields = Designation;
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
                column(FileUploadStatus;FileUploadStatus)
                {
                }
                trigger OnPreDataitem()var myInt: Integer;
                begin
                    "Transfer Application Employee".ChangeCompany(Company.Name);
                end;
                trigger OnAfterGetRecord()var myInt: Integer;
                begin
                    Clear(FileUploadStatus);
                    if "Transfer Application Employee"."File Name" <> '' then FileUploadStatus:='Available'
                    else
                        FileUploadStatus:='Not Available';
                end;
            }
        }
    }
    var myInt: Integer;
    FileUploadStatus: Text[20];
}
