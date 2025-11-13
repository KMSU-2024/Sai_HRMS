page 33066437 "RTI Details Input"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            group("RTI Details Input")
            {
                field("Type of Application";TypeOpAppVar)
                {
                    ApplicationArea = All;
                }
                field("Application No.";AppNoVar)
                {
                    ApplicationArea = All;
                }
                field("Name of the applicant";NameOfApp)
                {
                    ApplicationArea = All;
                }
                field("Date of Receipt of application";RecieveDate)
                {
                    ApplicationArea = All;

                    trigger OnValidate()var myInt: Integer;
                    begin
                        ReplayDueDate:=CalcDate('<+30D>', RecieveDate)end;
                }
                field("Reply Due Date";ReplayDueDate)
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Reply Sent";ReplaysentVar)
                {
                    ApplicationArea = All;
                }
                field("Type of Reply";TypeofReplayVar)
                {
                    ApplicationArea = All;
                }
                field("Reply Letter Date";ReplayLatterDateVar)
                {
                    ApplicationArea = All;
                }
                field("Letter No.";LatterNoVar)
                {
                    ApplicationArea = All;
                }
                field("Letter Dispatch Date";LatterDispatchDateVar)
                {
                    ApplicationArea = All;
                }
                field(Remark;RemarkVar)
                {
                    ApplicationArea = All;
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
                Promoted = true;
                Image = Save;

                trigger OnAction()var RTImonitorLRec: Record "RTI monitoring";
                begin
                    if Confirm('Do you want to submit the current Document ?', false)then begin
                        RTImonitorLRec.Reset();
                        RTImonitorLRec.Init();
                        RTImonitorLRec."Type of Application":=TypeOpAppVar;
                        RTImonitorLRec."Application No.":=AppNoVar;
                        RTImonitorLRec."Name of the applicant":=NameOfApp;
                        RTImonitorLRec."Date of Receipt of application":=RecieveDate;
                        RTImonitorLRec."Reply Sent":=ReplaysentVar;
                        RTImonitorLRec."Type of Reply":=TypeofReplayVar;
                        RTImonitorLRec."Reply Letter Date":=ReplayLatterDateVar;
                        RTImonitorLRec."Reply Due Date":=ReplayDueDate;
                        RTImonitorLRec."Letter No.":=LatterNoVar;
                        RTImonitorLRec."Letter Dispatch Date":=LatterDispatchDateVar;
                        RTImonitorLRec.Remark:=RemarkVar;
                        RTImonitorLRec.Insert(true);
                        Message('Document Submit.');
                        CurrPage.Close();
                    end;
                end;
            }
        }
    }
    var TypeOpAppVar: Option " ", "To PIO", "To First Appellate Authority";
    NameOfApp: Text[60];
    RecieveDate: Date;
    ReplayDueDate: Date;
    ReplaysentVar: Option Yes, No;
    TypeofReplayVar: Option " ", Rejected, "Asked to deposit dues", "Further Compliances", "Information Supplied";
    ReplayLatterDateVar: Date;
    LatterNoVar: Code[20];
    LatterDispatchDateVar: Date;
    RemarkVar: Text[100];
    AppNoVar: Code[20];
}
