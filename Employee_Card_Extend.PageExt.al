pageextension 33065646 Employee_Card_Extend extends "Employee Card"
{
    layout
    {
        addlast(General)
        {
            field("SLCM Employee";"SLCM Employee")
            {
                ApplicationArea = All;
            }
        }
    }
    trigger OnInsertRecord(Bool: Boolean): Boolean begin
        "SLCM Employee":=true;
    end;
// trigger OnOpenPage()
// begin
//     FilterGroup(0);
//     SetRange("SLCM Employee", false);
//     FilterGroup(2);
// end;
}
