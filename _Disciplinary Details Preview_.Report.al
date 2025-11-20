report 33065687 "Disciplinary Details Preview"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './DisciplinaryDetailsPreview.rdl';
    Caption = 'Disciplinary Cases Of Employee Preview';

    dataset
    {
        dataitem(Employee; Employee)
        {
            dataitem("Disciplinary History"; "Disciplinary History")
            {
                DataItemLink = "HRMS ID" = field("No.");

                column(HRMS_ID; "HRMS ID")
                {
                }
                column(Name; Name)
                {
                }
                column(Designation; Designation)
                {
                }

                // Start Anmol 28 jan 25 replace disciplinary charge to Disciplinary Charge file name
                /*  column(Disciplinary_Charges;"Disciplinary Charges")
               {
               } */
                column(Disciplinary_Charges_File_Name; "Disciplinary Charges File Name")
                {
                }

                column(Disciplinary_CaseLetter_No; "Disciplinary CaseLetter No")
                {
                }
                column(Disciplinary_CaseDate; "Disciplinary CaseDate")
                {
                }
                column(CurrDtTime; CURRENTDATETIME)
                {
                }
                column(SLNo; "SLNo")
                {
                }
                trigger onaftergetrecord()
                begin
                    if PrevHRMSID <> "Disciplinary History"."HRMS ID" then Clear(SLNo);
                    SLNo += 1;
                    PrevHRMSID := "Disciplinary History"."HRMS ID";
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
    var
        SLNo: Integer;
        PrevHRMSID: Code[20];
}
