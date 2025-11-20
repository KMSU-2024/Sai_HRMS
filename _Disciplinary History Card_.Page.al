page 33065744 "Disciplinary History Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Disciplinary History";

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("Entry No";"Entry No")
                {
                    ApplicationArea = All;
                }
                field("HRMS ID";"HRMS ID")
                {
                    ApplicationArea = All;
                }
                field("Employee Name";Name)
                {
                    ApplicationArea = All;
                }
                field(Designation;Designation)
                {
                    ApplicationArea = All;
                }
                // Start Anmol 28 jan 25
                /* field("Disciplinary Charges";"Disciplinary Charges")
                {
                    ApplicationArea = All;
                } */
                field("Disciplinary Charges File Name";Rec."Disciplinary Charges File Name")
                {
                    ApplicationArea = All;
                }
                // field("Upload Disciplinary ChargesDoc"; Rec."Upload Disciplinary ChargesDoc")
                // {
                //     ApplicationArea = All;
                // }
                // End Anmol
                field("Disciplinary CaseLetter No";"Disciplinary CaseLetter No")
                {
                    ApplicationArea = All;
                }
                field("Disciplinary CaseDate";"Disciplinary CaseDate")
                {
                    ApplicationArea = All;
                }
                field("Disciplinary CasesStatus";"Disciplinary CaseStatus")
                {
                    ApplicationArea = All;
                }
                field("WhetherPlaced under suspension";"WhetherPlaced under suspension")
                {
                    ApplicationArea = All;

                    trigger Onvalidate()var myInt: Integer;
                    begin
                        if "Whether reinstated" = true then Error('You Can not tick this boolean because Reinstated boolean is already true. If you want to tick this boolean then please untick Reinstated boolean.');
                    end;
                }
                field("Whether reinstated";"Whether reinstated")
                {
                    ApplicationArea = All;

                    trigger onvalidate()var myInt: Integer;
                    begin
                        if "WhetherPlaced under suspension" then Error('You Can not tick this boolean because suspension boolean is already true. If you want to tick this boolean then please untick suspension boolean.');
                    end;
                }
                field(VigilanceCasePending;VigilanceCasePending) //anmol
                {
                    ApplicationArea = all;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()begin
                end;
            }
        }
    }
    var myInt: Integer;
}
