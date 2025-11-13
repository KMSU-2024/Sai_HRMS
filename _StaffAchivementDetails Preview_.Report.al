report 33065684 "StaffAchivementDetails Preview"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './StaffAchivementDetailsPreview.rdl';
    Caption = 'Staff Achivement Details Preview';

    dataset
    {
        dataitem(Employee;Employee)
        {
            dataitem("Staff Achivement History";"Staff Achivement History")
            {
                DataItemLink = "HRMS ID"=field("No.");

                column(HRMS_ID;"HRMS ID")
                {
                }
                column(Name;Name)
                {
                }
                column(Designation;Designation)
                {
                }
                column(Base_Qualification;"Base Qualification")
                {
                }
                column(Inservice_Qua__Upgradation;"Inservice Qua. Upgradation")
                {
                }
                column(Award;Award)
                {
                }
                column(Achivement_Remarks;"Achivement Remarks")
                {
                }
                column(Academic_Year;"Academic Year")
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
