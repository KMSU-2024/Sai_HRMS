report 33065728 "Annual Increment"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './AnnualIncrement.rdl';
    Caption = 'Annual Increment Report';

    dataset
    {
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
            column(CompanyName;COMPANYNAME)
            {
            }
            column(CurrDtTime;CURRENTDATETIME)
            {
            }
            trigger OnpreDataitem()var myInt: Integer;
            begin
                FirstDate:=CalcDate('-CM', WorkDate);
                LastDate:=CalcDate('CM', WorkDate);
                Employee.SetRange("Date of increment", FirstDate, LastDate);
            end;
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
    var FirstDate: Date;
    LastDate: Date;
}
