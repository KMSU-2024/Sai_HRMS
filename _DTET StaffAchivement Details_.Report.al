report 33065807 "DTET StaffAchivement Details"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './DTETStaffAchivementDetailsPreview.rdl';
    Caption = 'DTET Staff Achivement Details Preview';

    dataset
    {
        dataitem(Company;Company)
        {
            column(CompanyName;Name)
            {
            }
            dataitem("Staff Achivement History";"Staff Achivement History")
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
                column(Base_Qualification;"Base Qualification")
                {
                }
                column(Inservice_Qua__Upgradation;"Inservice Qua. Upgradation")
                {
                }
                column(Award;Award)
                {
                }
                column(Award_Details;"Award Details")
                {
                }
                column(Inservise_Qualification_Detail;"Inservise Qualification Detail")
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
                column(FileUploadStatus;FileUploadStatus)
                {
                }
                trigger OnPreDataitem()var myInt: Integer;
                begin
                    "Staff Achivement History".ChangeCompany(Company.Name);
                end;
                trigger OnAfterGetRecord()var myInt: Integer;
                begin
                    Clear(FileUploadStatus);
                    if "Staff Achivement History"."Certificate FileName" <> '' then FileUploadStatus:='Available'
                    else
                        FileUploadStatus:='Not Available';
                end;
            }
        }
    }
    var myInt: Integer;
    FileUploadStatus: Text[20];
}
