page 33065498 "Transfer History Card" //SS07OCT c
{
    PageType = List;
    SourceTable = "Transfer Joining History"; // Same as your list page
    Caption = 'Employee Transfer History Card';
    // (h) Disallow deletion from card page as well
    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("HRMS ID"; Rec."HRMS ID")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Employee Name"; Rec.Name)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Designation; Rec.Designation)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("From Station"; Rec."From Station")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("To Station"; Rec."To Station")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Order Issuing Authority"; Rec."Order Issuing Authority")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Relief Order Date"; Rec."Relief Order Date")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Relief Order No."; Rec."Relief Order No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Transfer Order Date"; Rec."Transfer Date")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Letter No"; Rec."Letter No")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Promotion letter no"; Rec."Promotion letter no")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Relieving Event"; Rec."Relieving Event")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Joining Event"; Rec."Joining Event")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Joining Date"; Rec."Joining Date")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("To Designation"; Rec."To Designation")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                // (g) Modified fields
                field("Modified By"; Rec."Modified By")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Modified DateTime"; Rec."Modified Date Time")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            // (e) Download Transfer Order also available from card page
            action("Download Transfer Order")
            {
                Caption = 'Download Transfer Order';
                ApplicationArea = All;

                trigger OnAction()
                var
                    FilemngCU: Codeunit "File Management";
                    inst: InStream;
                    os: OutStream;
                    TempBlobLoc: Codeunit "Temp Blob";
                begin
                    Rec.CalcFields("Upload Transfer Order");
                    if Rec."Upload Transfer Order".HasValue then begin
                        Rec."Upload Transfer Order".CreateInStream(inst);
                        TempBlobLoc.CreateOutStream(os);
                        CopyStream(os, inst);
                        FilemngCU.BLOBExport(TempBlobLoc, Rec."HRMS ID" + '_Upload Transfer Order.pdf', true);
                    end
                    else
                        Error('File not found.');
                end;
            }
        }
    }
}
