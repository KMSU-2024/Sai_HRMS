report 33065646 "Transfer Deatils"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './TransferDetailsPreview.rdl';
    Caption = 'Transfer Details Preview';

    dataset
    {
        dataitem(Employee;Employee)
        {
            dataitem("TransferJoiningHistory";"Transfer Joining History")
            {
                DataItemLink = "HRMS ID"=field("No.");
                DataItemTableView = where(Status=filter(Relieved));

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
