page 33065739 "Transfer Joining History Card"
{
    PageType = Card;
    // ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Transfer Joining History";

    //Editable = False;
    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("Entry No";"Entry No")
                {
                }
                field("HRMS ID";"HRMS ID")
                {
                }
                field("Employee Name";Name)
                {
                }
                field(Designation;Designation)
                {
                }
                field("From Station";"From Station")
                {
                }
                field("To Station";"To Station")
                {
                }
                field("Transfer Order Date";"Transfer Date")
                {
                }
                field("Letter No";"Letter No")
                {
                }
                field("Relieving Event";"Relieving Event")
                {
                }
                field("Joining Event";"Joining Event")
                {
                }
                field("Joining Date";"Joining Date")
                {
                }
                field(Status;Status)
                {
                }
                field("Relief Order No.";"Relief Order No.")
                {
                }
                field("Relief Order Date";"Relief Order Date")
                {
                }
                field("To Designation";"To Designation")
                {
                }
                field("Order Issuing Authority";"Order Issuing Authority")
                {
                }
                field("Promotion order date";"Promotion order date")
                {
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
