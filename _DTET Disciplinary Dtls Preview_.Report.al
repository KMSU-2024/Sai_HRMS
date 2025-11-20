report 33065809 "DTET Disciplinary Dtls Preview"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    Caption = 'DTET Disciplinary Case of Employee Preview';
    RDLCLayout = './DTETDisciplinaryDetailsPreview.rdl';

    dataset
    {
        dataitem(Company;Company)
        {
            column(CompanyName;Name)
            {
            }
            dataitem("Disciplinary History";"Disciplinary History")
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
                //Anmol Changed dsciplinary charges to disciplinary charges file name
                /* column(Disciplinary_Charges; "Disciplinary Charges")
               {
               } */
                column(Disciplinary_Charges_File_Name;"Disciplinary Charges File Name")
                {
                }
                column(Disciplinary_CaseLetter_No;"Disciplinary CaseLetter No")
                {
                }
                column(Disciplinary_CaseDate;"Disciplinary CaseDate")
                {
                }
                column(CurrDtTime;CURRENTDATETIME)
                {
                }
                column(SLNo;"SLNo")
                {
                }
                trigger ONPreDataitem()var myInt: Integer;
                begin
                    "Disciplinary History".ChangeCompany(Company.Name);
                end;
                trigger onaftergetrecord()begin
                    if PrevHRMSID <> "Disciplinary History"."HRMS ID" then Clear(SLNo);
                    SLNo+=1;
                    PrevHRMSID:="Disciplinary History"."HRMS ID";
                end;
            }
        }
    }
    var SLNo: Integer;
    PrevHRMSID: Code[20];
}
