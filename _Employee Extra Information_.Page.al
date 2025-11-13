page 33066427 "Employee Extra Information"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Documents;
    Caption = 'Update Additional Employee  Details';

    layout
    {
        area(Content)
        {
            group("Employee Details")
            {
                field("HRMS ID";HRMSID)
                {
                    ApplicationArea = All;
                    TableRelation = Employee."No." where("SLCM Employee"=const(false));

                    trigger OnValidate()var EmpVar: Record Employee;
                    begin
                        EmpVar.Get(HRMSID);
                        EmpNameVar:=EmpVar."First Name";
                    end;
                }
                field("Employee Name";EmpNameVar)
                {
                    ApplicationArea = All;
                // Editable = false;
                }
            }
            group("Employee Status")
            {
                field("Employment Status";EmpStatusVar)
                {
                    ApplicationArea = All;
                }
            }
            group(Others)
            {
                field("Date of increment";dateOfIncVar)
                {
                    ApplicationArea = All;
                }
                field("MACP Status";McapStatus)
                {
                    ApplicationArea = All;

                    trigger onvalidate()var EmpRec: Record 5200;
                    begin
                        Int2:=McapStatus;
                        EmpRec.Reset();
                        EmpRec.SetRange("No.", HRMSID);
                        if EmpRec.FindFirst()then Int1:=EmpRec."MACP Status";
                        IF Int1 > Int2 then Error('You cannot enter %1 MACP value in this because you have already %2 macp value in employee card.', McapStatus, EmpRec."MACP Status");
                    end;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Submit")
            {
                ApplicationArea = All;
                // Promoted = true;
                // PromotedCategory = Report;
                Image = Save;

                trigger OnAction()var EmpAddInfo: Record "Employee Additional Info";
                EmpLrec: Record Employee;
                begin
                    EmpLrec.Get(HRMSID);
                    EmpLrec."Employment Status":=EmpStatusVar;
                    EmpLrec."Date of increment":=dateOfIncVar;
                    EmpLrec."MACP Status":=McapStatus;
                    EmpLrec.Modify();
                    EmpAddInfo.Init();
                    EmpAddInfo."HRMS ID":=EmpLrec."No.";
                    EmpAddInfo."Employee Name":=EmpLrec."First Name";
                    EmpAddInfo."D.O.J (Service)":=EmpLrec."D.O.J (Service)";
                    EmpAddInfo."Service Joining Designation":=EmpLrec."Service Joining Designation";
                    EmpAddInfo."Service Joining Station":=EmpLrec."Joining Station";
                    EmpAddInfo."Base Qualification":=EmpLrec."Base Qualification";
                    EmpAddInfo."Employment Status":=EmpLrec."Employment Status";
                    EmpAddInfo."Date of increment":=EmpLrec."Date of increment";
                    EmpAddInfo."MACP Status":=EmpLrec."MACP Status";
                    EmpAddInfo."Pension Remark":=EmpLrec."Pension Remark";
                    EmpAddInfo."Dept./Trade/Section":=EmpLrec."Dept./Trade/Section";
                    EmpAddInfo.Insert(true);
                    Message('Submitted');
                    CurrPage.Close();
                end;
            }
        }
    }
    procedure PageRun(HRMIdpar: Code[20])var EmpLocVarrec: Record Employee;
    begin
        EmpLocVarrec.get(HRMIdpar);
        EmpNameVar:=EmpLocVarrec."First Name";
        HRMSID:=HRMIdpar;
        CurrPage.Run();
    end;
    var myInt: Integer;
    HRMSID: code[20];
    EmpNameVar: text[50];
    EmpStatusVar: option " ", "Ad hoc", "Temporary status", "Initial appointee", "Regular", Inactive;
    dateOfIncVar: Date;
    McapStatus: Option " ", "Nil", "1st", "2nd", "3rd";
    Int1: Integer;
    Int2: Integer;
}
