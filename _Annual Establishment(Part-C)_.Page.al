page 33066431 "Annual Establishment(Part-C)"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Lists;
    // SourceTable = "Annual Establishment Review";
    // SourceTableView = where("Establishment Type" = const("Part – C (Non-regular Establishment)"));
    Caption = 'Annual Establishment Review Part -C (Non-Regular Establishment)';

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
                field("Category Of Employee(If Any)";EmpCategoryVar)
                {
                    ApplicationArea = All;
                }
                field("Dept./Trade/Section";DeptsectradeVar)
                {
                    ApplicationArea = All;
                    TableRelation = "List of all Dep/trades/Section"."Departments/Trades/Section";
                }
                field("Designation";DesignVar)
                {
                    ApplicationArea = All;
                    TableRelation = Designation.Code;
                }
                field("Pay Scale level 7th pay";PayScale7thVar)
                {
                    ApplicationArea = All;
                    DecimalPlaces = 0;
                }
                field("Persons in Position ";perSinPoisionVar)
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
                        AnnualEstabRevieRec."Dept./Trade/Section":=DeptsectradeVar;
                        AnnualEstabRevieRec."Pay Scale level 7th pay":=PayScale7thVar;
                        AnnualEstabRevieRec."Persons in Position ":=perSinPoisionVar;
                        AnnualEstabRevieRec."Employee Catagory":=EmpCategoryVar;
                        // AnnualEstabRevieRec."Dept./Trade/Section" := DeptsectradeVar;
                        AnnualEstabRevieRec.Designation:=DesignVar;
                        AnnualEstabRevieRec."Institution Name":=InstituName;
                        // AnnualEstabRevieRec."Pay Scale GP" := PayScaleGPVar;
                        // AnnualEstabRevieRec."Pay scale 6th pay" := PayScale6thVar;
                        // AnnualEstabRevieRec."Sanctioned Strength" := scactionStrength;
                        AnnualEstabRevieRec.Remark:=Remark;
                        AnnualEstabRevieRec.Insert(true);
                        Message('Document Submit.');
                        CurrPage.Close();
                    end;
                end;
            }
        }
    }
    trigger OnOpenPage()begin
        EstablType:=EstablType::"Part – C (Non-regular Establishment)";
    end;
    var EstablType: Option " ", "Part – A (Regular Establishment)", "Part – C (Non-regular Establishment)", "Part – E (Outsourced/ on contract)";
    ACY: Code[20];
    EmpCategoryVar: Option "Group A", "Group B", "Group C", "Group D";
    DesignVar: Code[20];
    PayScale7thVar: Decimal;
    perSinPoisionVar: Integer;
    Remark: Text[100];
    InstituName: Text[90];
    DeptsectradeVar: Text[60];
}
