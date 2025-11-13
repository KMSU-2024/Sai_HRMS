report 33065680 "Promotion Details Preview"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './PromotionDetailsPreview.rdl';
    Caption = 'Promotion Details Preview';

    dataset
    {
        dataitem(Employee;Employee)
        {
            dataitem("Promotion History";"Employee Promotion History")
            {
                DataItemLink = "HRMS ID"=field("No.");

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
                column(CurrDtTime;CURRENTDATETIME)
                {
                }
            }
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
                action(ActionName)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    var myInt: Integer;
}
