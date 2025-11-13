report 33065806 "DTET Promotion Details Preview"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './DTETPromotionDetailsPreview.rdl';

    dataset
    {
        dataitem(Company;Company)
        {
            column(CompanyNme;Name)
            {
            }
            dataitem("Promotion History";"Employee Promotion History")
            {
                column(HRMS_ID;"HRMS ID")
                {
                }
                column(Name;Name)
                {
                }
                column(From_Designation;"From Designation")
                {
                }
                column(To_Designation;"To Designation")
                {
                }
                column(Promotion_Order_Date;"Promotion Order Date")
                {
                }
                column(Letter_NO;"Letter NO")
                {
                }
                column(Order_Issuing_Authority;"Order Issuing Authority")
                {
                }
                column(CurrDtTime;CURRENTDATETIME)
                {
                }
                column(FileUploadStatus;FileUploadStatus)
                {
                }
                trigger OnPreDataitem()var myInt: Integer;
                begin
                    "Promotion History".ChangeCompany(Company.Name);
                end;
                trigger OnAfterGetRecord()var myInt: Integer;
                begin
                    Clear(FileUploadStatus);
                    if "Promotion History"."Promotion Order File Name" <> '' then FileUploadStatus:='Available'
                    else
                        FileUploadStatus:='Not Available';
                end;
            }
        }
    }
    var myInt: Integer;
    FileUploadStatus: Text[20];
}
