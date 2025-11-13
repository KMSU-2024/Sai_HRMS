report 33065814 "DTET Annual Increment"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './DTETAnnualIncrement.rdl';

    dataset
    {
        dataitem(Company;Company)
        {
            column(CompanyName;Name)
            {
            }
            dataitem(Employee;Employee)
            {
                column(No_;"No.")
                {
                }
                column(FullName;FullName)
                {
                }
                column(Designation;Designation)
                {
                }
                column(Date_of_increment;"Date of increment")
                {
                }
                column(D_O_S;"D.O.S")
                {
                }
                column(CurrDtTime;CURRENTDATETIME)
                {
                }
                trigger OnPredataitem()var myInt: Integer;
                begin
                    Employee.ChangeCompany(Company.Name);
                    Employee.SetRange("Date of increment", FirstDate, LastDate);
                end;
            }
            trigger OnpreDataitem()var myInt: Integer;
            begin
                FirstDate:=CalcDate('-CM', WorkDate);
                LastDate:=CalcDate('CM', WorkDate);
            end;
        }
    }
    var FirstDate: Date;
    LastDate: Date;
}
