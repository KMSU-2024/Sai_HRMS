page 33065752 "Court Cases Details Input"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Case No.";CaseNoVar)
                {
                    ApplicationArea = All;
                }
                field("Year of filing";YearOfRelifVar)
                {
                    ApplicationArea = All;
                }
                field("Name of the Court";NameOfCourtVar)
                {
                    ApplicationArea = All;
                }
                field(Place;PlaceVar)
                {
                    ApplicationArea = All;
                }
                field("Petitioner Name";PetitionerNameVar)
                {
                    ApplicationArea = All;
                }
                field("Opposite Party Name";OppositeNameVar)
                {
                    ApplicationArea = All;
                }
                field("Matter Relating to";MatterRelateVar)
                {
                    ApplicationArea = All;
                }
                field("Lowest level office In THe hierarchy(Relating To This Case)";LowestlevelVar)
                {
                    ApplicationArea = All;
                    TableRelation = Institute."Institute Code";
                }
                field("Last Case Date";caseLastdateVar)
                {
                    ApplicationArea = All;
                }
                field("Case Status";CaseStatus)
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

                trigger OnAction()var CourtCardLRec: Record "Court Cases";
                begin
                    if Confirm('Do you want to submit the current Document ?', false)then begin
                        CourtCardLRec.Reset();
                        CourtCardLRec.Init();
                        CourtCardLRec."Case No.":=CaseNoVar;
                        CourtCardLRec."Year of filing":=YearOfRelifVar;
                        CourtCardLRec."Name of the Court":=NameOfCourtVar;
                        CourtCardLRec.Place:=PlaceVar;
                        CourtCardLRec."Petitioner Name":=PetitionerNameVar;
                        CourtCardLRec."Opposite Party Name":=OppositeNameVar;
                        CourtCardLRec."Matter Relating to":=MatterRelateVar;
                        CourtCardLRec."Lowest level office hierarchy":=LowestlevelVar;
                        CourtCardLRec."Last Case Date":=caseLastdateVar;
                        CourtCardLRec."Case Status":=CaseStatus;
                        CourtCardLRec.Insert(true);
                        Message('Document Submit.');
                        CurrPage.Close();
                    end;
                end;
            }
        }
    }
    var CaseNoVar: Code[20];
    YearOfRelifVar: Integer;
    NameOfCourtVar: Text[50];
    PlaceVar: Text[60];
    PetitionerNameVar: Text[50];
    OppositeNameVar: Text[50];
    MatterRelateVar: Option " ", "Land Building", "Criminal", "Tax", "Service matter", "Certificate matter", "Academics", "Admission", "SCTE&VT", "Other";
    LowestlevelVar: Code[20];
    caseLastdateVar: Date;
    CaseStatus: Text[30];
}
