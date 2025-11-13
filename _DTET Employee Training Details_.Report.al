report 33065747 "DTET Employee Training Details"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './DTETEmployeeTrainingDetailsPreview.rdl';

    dataset
    {
        dataitem(Company;Company)
        {
            column(CompanyName;Name)
            {
            }
            dataitem("Employee Training History";"Employee Training History")
            {
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
                column(FileUploadStatus;FileUploadStatus)
                {
                }
                trigger OnPreDataItem()var myInt: Integer;
                begin
                    "Employee Training History".ChangeCompany(Company.Name);
                end;
                trigger OnAfterGetRecord()var myInt: Integer;
                begin
                    Clear(FileUploadStatus);
                    if "Employee Training History"."Certificate FileName" <> '' then FileUploadStatus:='Available'
                    else
                        FileUploadStatus:='Not Available';
                end;
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
    FileUploadStatus: Text[20];
}
