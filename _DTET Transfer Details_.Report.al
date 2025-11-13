report 33065805 "DTET Transfer Details"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './DTETTransferDetailsPreview.rdl';

    dataset
    {
        dataitem(Company;Company)
        {
            column(CompanyNmae;Name)
            {
            }
            dataitem("TransferJoiningHistory";"Transfer Joining History")
            {
                // DataItemTableView = where(Status = filter(Relieved));
                column(HRMS_ID;"HRMS ID")
                {
                }
                column(Name;Name)
                {
                }
                column(Designation;Designation)
                {
                }
                column(From_Station;"From Station")
                {
                }
                column(To_Station;"To Station")
                {
                }
                column(Transfer_Date;("Transfer Date"))
                {
                }
                column(Letter_No;"Letter No")
                {
                }
                column(Status;Status)
                {
                }
                column(Order_Issuing_Authority;"Order Issuing Authority")
                {
                }
                column(Relief_Order_Date;"Relief Order Date")
                {
                }
                column(Relief_Order_No_;"Relief Order No.")
                {
                }
                column(CurrDtTime;CURRENTDATETIME)
                {
                }
                column(FileUploadStatus;FileUploadStatus)
                {
                }
                trigger OnpreDataItem()var myInt: Integer;
                begin
                    TransferJoiningHistory.ChangeCompany(Company.Name);
                end;
                trigger OnAfterGetRecord()var myInt: Integer;
                begin
                    Clear(FileUploadStatus);
                    if TransferJoiningHistory."Transfer Order File Name" <> '' then FileUploadStatus:='Available'
                    else
                        FileUploadStatus:='Not Available';
                end;
            }
        }
    }
    var myInt: Integer;
    FileUploadStatus: text[20];
}
