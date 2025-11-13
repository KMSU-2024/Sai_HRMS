report 33065688 "Employee Training Details"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './EmployeeTrainingDetailsPreview.rdl';
    Caption = 'Employee Training Details Preview';

    dataset
    {
        dataitem(Employee;Employee)
        {
            dataitem("Employee Training History";"Employee Training History")
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
                column(Type_Of_Training;"Type Of Training")
                {
                }
                column(Course_Name;"Course Name")
                {
                }
                column(Start_Date;"Start Date")
                {
                }
                column(EndDate;EndDate)
                {
                }
                column(Duration_Of_Training;"Duration Of Training")
                {
                }
                column(Conducted_By;"Conducted By")
                {
                }
                column(Training_Location;"Training Location")
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
