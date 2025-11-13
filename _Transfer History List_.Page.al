page 33065738 "Transfer History List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Transfer Joining History";
    // CardPageId = 50058;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;
    Caption = 'Employee Transfer History List';

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Entry No";rec."Entry No")
                {
                    ApplicationArea = All;
                }
                field("HRMS ID";rec."HRMS ID")
                {
                    ApplicationArea = All;
                }
                field("Employee Name";rec.Name)
                {
                    ApplicationArea = All;
                }
                field(Designation;rec.Designation)
                {
                    ApplicationArea = All;
                }
                field("From Station";rec."From Station")
                {
                    ApplicationArea = All;
                }
                field("To Station";rec."To Station")
                {
                    ApplicationArea = All;
                }
                field("Order Issuing Authority";rec."Order Issuing Authority")
                {
                    ApplicationArea = all;
                }
                field("Relief Order Date";rec."Relief Order Date")
                {
                    ApplicationArea = all;
                }
                field("Relief Order No.";rec."Relief Order No.")
                {
                    ApplicationArea = all;
                }
                field("Transfer Order Date";rec."Transfer Date")
                {
                    ApplicationArea = All;
                }
                field("Letter No";rec."Letter No")
                {
                    ApplicationArea = All;
                }
                field("Promotion letter no";"Promotion letter no")
                {
                    ApplicationArea = All;
                }
                field("Relieving Event";rec."Relieving Event")
                {
                    ApplicationArea = All;
                }
                field("Joining Event";rec."Joining Event")
                {
                    ApplicationArea = All;
                }
                field("Joining Date";rec."Joining Date")
                {
                    ApplicationArea = All;
                }
                field(Status;rec.Status)
                {
                    ApplicationArea = All;
                }
                field("To Designation";"To Designation")
                {
                    ApplicationArea = All;
                }
            }
        }
        area(Factboxes)
        {
        }
    }
    actions
    {
        area(Processing)
        {
            action("Download Transfer Order")
            {
                ApplicationArea = All;

                trigger OnAction()var FilemngCU: Codeunit "File Management";
                inst: InStream;
                os: OutStream;
                tempblobloc: Codeunit "Temp Blob";
                begin
                    Rec.CalcFields("Upload Transfer Order");
                    if Rec."Upload Transfer Order".HasValue then begin
                        Rec."Upload Transfer Order".CreateInStream(inst);
                        tempblobloc.CreateOutStream(os);
                        CopyStream(os, inst);
                        FilemngCU.BLOBExport(tempblobloc, Rec."HRMS ID" + '_Upload Transfer Order.pdf', true);
                    end
                    else
                        Error('File Not found');
                end;
            }
        }
    }
}
