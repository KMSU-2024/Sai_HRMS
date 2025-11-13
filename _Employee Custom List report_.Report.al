report 33065832 "Employee Custom List report"
{
    ApplicationArea = All;
    Caption = 'Employee Custom List report';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Employee Custom List report.rdl';

    dataset
    {
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
        }
    }
}
