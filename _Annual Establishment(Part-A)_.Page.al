page 33066441 "Annual Establishment(Part-A)"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Annual Establishment Review";
    DelayedInsert = true;
    SourceTableView = where("Establishment Type"=const("Part – A (Regular Establishment)"));
    caption = 'Annual Establishment Review Part A (Regular Establishment)';

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
                // field("Post Group"; postgrpVar)
                // {
                //     ApplicationArea = All;
                // }
                field("Employee Category";EmpCategr)
                {
                    ApplicationArea = All;
                    Caption = 'Employee Catagory';
                }
                /*                 field("Dept./Trade/Section";DeptsectradeVar)
                                {
                                    ApplicationArea = All;
                                    TableRelation = "List of all Dep/trades/Section"."Departments/Trades/Section";
                                }
                                field(Designation;DesignatVar)
                                {
                                    ApplicationArea = All;
                                    TableRelation = Designation.Code;
                                }
                 */
                field(Designation;DesignatVar)
                {
                    ApplicationArea = All;
                    TableRelation = Designation.Code;

                    trigger OnValidate()var sacvsvacant: Record "Sanctioned v/s Vacant";
                    emp: Record Employee;
                    begin
                        // Update Persons in Position
                        if(DesignatVar <> '') and (DeptsectradeVar <> '')then begin
                            emp.SetRange(Designation, DesignatVar);
                            emp.SetRange("Dept./Trade/Section", DeptsectradeVar);
                            perSinPoisionVar:=emp.Count();
                        end;
                        // Fetch Sanctioned Strength from Sanctioned v/s Vacant table
                        if(DesignatVar <> '') and (DeptsectradeVar <> '')then begin
                            sacvsvacant.SetRange("Department/Trade/Section", DeptsectradeVar);
                            sacvsvacant.SetRange(Designation, DesignatVar);
                            if sacvsvacant.FindFirst()then scactionStrength:=sacvsvacant."Sactioned Strength"
                            else
                                scactionStrength:=0; // Default to 0 if no record is found
                        end;
                        // Recalculate Vacant Positions
                        VacantPositions:=scactionStrength - perSinPoisionVar;
                    end;
                }
                field("Dept./Trade/Section";DeptsectradeVar)
                {
                    ApplicationArea = All;
                    TableRelation = "List of all Dep/trades/Section"."Departments/Trades/Section";

                    trigger OnValidate()var sacvsvacant: Record "Sanctioned v/s Vacant";
                    emp: Record Employee;
                    begin
                        // Update Persons in Position
                        if(DesignatVar <> '') and (DeptsectradeVar <> '')then begin
                            emp.SetRange(Designation, DesignatVar);
                            emp.SetRange("Dept./Trade/Section", DeptsectradeVar);
                            perSinPoisionVar:=emp.Count();
                        end;
                        // Fetch Sanctioned Strength from Sanctioned v/s Vacant table
                        if(DesignatVar <> '') and (DeptsectradeVar <> '')then begin
                            sacvsvacant.SetRange("Department/Trade/Section", DeptsectradeVar);
                            sacvsvacant.SetRange(Designation, DesignatVar);
                            if sacvsvacant.FindFirst()then scactionStrength:=sacvsvacant."Sactioned Strength"
                            else
                                scactionStrength:=0; // Default to 0 if no record is found
                        end;
                        // Recalculate Vacant Positions
                        VacantPositions:=scactionStrength - perSinPoisionVar;
                    end;
                }
                field("Sanctioned Strength";scactionStrength) //megha 
                {
                    ApplicationArea = All;
                    Editable = false;

                    trigger OnValidate()begin
                        VacantPositions:=scactionStrength - perSinPoisionVar;
                    end;
                }
                field("Vacant Positions";VacantPositions) //megha 
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Pay Scale GP";PayScaleGPVar)
                {
                    ApplicationArea = All;
                    DecimalPlaces = 0;
                }
                field("Pay scale 6th pay";PayScale6thVar)
                {
                    ApplicationArea = All;
                //DecimalPlaces = 0;
                }
                field("Pay Scale level 7th pay";PayScale7thVar)
                {
                    ApplicationArea = All;
                    DecimalPlaces = 0;
                }
                /* field("Sanctioned Strength"; scactionStrength)
                {
                    ApplicationArea = All;
                } */
                field("Persons in Position ";perSinPoisionVar)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Academic Year";ACYvar)
                {
                    Caption = 'Financial Year';
                    ApplicationArea = All;
                    TableRelation = "Financial Year"."Financial Code";
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
            //     IF PAGE.RUNMODAL(PAGE::"Posted Institution List", instituderec) = ACTION::LookupOK THEN
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
                        // AnnualEstabRevieRec."Post Group" := postgrpVar;
                        AnnualEstabRevieRec."Employee Catagory":=EmpCategr;
                        AnnualEstabRevieRec."Dept./Trade/Section":=DeptsectradeVar;
                        AnnualEstabRevieRec.Designation:=DesignatVar;
                        AnnualEstabRevieRec."Pay Scale GP":=PayScaleGPVar;
                        AnnualEstabRevieRec."Pay scale 6th pay":=PayScale6thVar;
                        AnnualEstabRevieRec."Pay Scale level 7th pay":=PayScale7thVar;
                        AnnualEstabRevieRec."Persons in Position ":=perSinPoisionVar;
                        AnnualEstabRevieRec."Academic Year":=ACYvar;
                        AnnualEstabRevieRec."Sanctioned Strength":=scactionStrength;
                        AnnualEstabRevieRec."Vacancy Position ":=VacantPositions; //megha
                        AnnualEstabRevieRec.Remark:=Remark;
                        AnnualEstabRevieRec."Institution Name":=InstituName;
                        AnnualEstabRevieRec.Insert(true);
                        Message('Document Submit.');
                        CurrPage.Close();
                    end;
                end;
            }
        }
    }
    trigger OnOpenPage()var begin
        EstablType:=EstablType::"Part – A (Regular Establishment)";
    end;
    var EstablType: Option " ", "Part – A (Regular Establishment)", "Part – C (Non-regular Establishment)", "Part – E (Outsourced/ on contract)";
    postgrpVar: Option " ", A, C, E;
    DesignatVar: Code[20];
    DeptsectradeVar: Text[60];
    PayScaleGPVar: Decimal;
    PayScale6thVar: text[250];
    PayScale7thVar: Decimal;
    scactionStrength: Integer;
    perSinPoisionVar: Integer;
    ACYvar: Code[20];
    Remark: Text[100];
    InstituName: Text[90];
    EmpCategr: Option "Group A", "Group B", "Group C", "Group D";
    VacantPositions: Integer;
// ok:Boolean;
}
