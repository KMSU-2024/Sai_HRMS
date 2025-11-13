report 33065830 "DTET Employee Custom List"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './DTETEmployeeCustomList.rdl';

    dataset
    {
        dataitem(Company;Company)
        {
            column(CompanyName;Name)
            {
            }
            dataitem(Employee;Employee)
            {
                column(No;"No.")
                {
                }
                column(FirstName;"First Name")
                {
                Caption = 'Employee Name';
                }
                column(BillGroup;"Bill Group")
                {
                }
                column(BillType;"Bill Type")
                {
                }
                column(BirthDate;"Birth Date")
                {
                }
                column(AccountType;"Account Type")
                {
                }
                column(Designation;Designation)
                {
                }
                column(DeptTradeSection;"Dept./Trade/Section")
                {
                }
                column(PostGroup;"Post Group")
                {
                }
                column(GPFPRANNo;"GPF/PRAN No")
                {
                }
                column(Gender;Gender)
                {
                }
                column(DOS;"D.O.S")
                {
                }
                column(Category;Category)
                {
                }
                column(JoiningStation;"Joining Station")
                {
                }
                column(DOJService;"D.O.J (Service)")
                {
                }
                column(CurrentStation;"Current Station")
                {
                }
                column(ServiceJoiningDesignation;"Service Joining Designation")
                {
                }
                column(BaseQualification;"Base Qualification")
                {
                }
                column(BasicGrPay;"Basic Gr. Pay")
                {
                }
                column(HomeDist;"Home Dist")
                {
                }
                column(EmploymentStatus;"Employment Status")
                {
                }
                column(Dateofincrement;"Date of increment")
                {
                }
                column(EMail;"E-Mail")
                {
                }
                column(EPICNo;"EPIC No")
                {
                }
                column(MACPStatus;"MACP Status")
                {
                }
                column(MobilePhoneNo;"Mobile Phone No.")
                {
                }
                column(AadhaarNo;"Aadhaar No")
                {
                }
                column(PensionRemark;"Pension Remark")
                {
                }
                column(Status;Status)
                {
                }
                trigger OnPreDataitem()var myInt: Integer;
                begin
                    Employee.ChangeCompany(Company.Name);
                end;
            }
        }
    }
    var myInt: Integer;
}
