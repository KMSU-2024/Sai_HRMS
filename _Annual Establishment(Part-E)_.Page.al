page 33066438 "Annual Establishment(Part-E)"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Lists;
    // SourceTable = "Annual Establishment Review";
    // SourceTableView = where("Establishment Type" = const("Part – E (Outsourced/ on contract)"));
    Caption = 'Annual Establishment Review Part E (Outsourced/ on contract)';

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Establishment Type";EstablType)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Academic Year";ACY)
                {
                    ApplicationArea = All;
                    Caption = 'Financial Year';
                    TableRelation = "Financial Year"."Financial Code";
                }
                field("Persons in Position(Number) ";perSinPoisionVar)
                {
                    ApplicationArea = All;
                }
                field("Remark If Any";Remark)
                {
                    ApplicationArea = All;
                }
            // field("Institution Name"; InstituName)
            // {
            // ApplicationArea = All;
            // trigger OnDrillDown()
            // var
            //     instituderec: Record Institute;
            // begin
            //     instituderec.reset;
            //     if instituderec.FindSet() then;
            //     IF PAGE.RUNMODAL(PAGE::"Institute Lists", instituderec) = ACTION::LookupOK THEN
            //         InstituName := instituderec."Institute Name";
            // end;
            // }
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

                trigger OnAction()var AnnualEstabRevieRec: Record "Annual Establishment Review";
                begin
                    if Confirm('Do you want to submit the current Document ?', false)then begin
                        AnnualEstabRevieRec.Reset();
                        AnnualEstabRevieRec.Init();
                        AnnualEstabRevieRec."Establishment Type":=EstablType;
                        AnnualEstabRevieRec."Academic Year":=ACY;
                        AnnualEstabRevieRec."Institution Name":=InstituName;
                        AnnualEstabRevieRec.Remark:=Remark;
                        AnnualEstabRevieRec.Insert(true);
                        Message('Document Submit.');
                        CurrPage.Close();
                    end;
                end;
            }
        }
    }
    trigger OnOpenPage()var begin
        EstablType:=EstablType::"Part – E (Outsourced/ on contract)";
    end;
    var EstablType: Option " ", "Part – A (Regular Establishment)", "Part – C (Non-regular Establishment)", "Part – E (Outsourced/ on contract)";
    ACY: Code[20];
    perSinPoisionVar: Integer;
    Remark: Text[100];
    InstituName: Text[90];
}
