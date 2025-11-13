pageextension 33065862 usersetupExt1 extends "User Setup" //SS08OCT
{
    layout
    {
        // Add changes to page layout here
        addafter("Student Edit")
        {
            field("E-Dairy";Rec."E-Dairy")
            {
                ApplicationArea = all;
            }
        }
    }
    var myInt: Integer;
}
