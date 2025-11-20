page 33065497 "Promotion History Card1" //SS07OCT c
{
    PageType = List;
    //   /  ApplicationArea = All;
    SourceTable = "Employee Promot History Arch";
    Caption = 'Promotion History Card Archive';
    // (h) No deletion
    Editable = false;
    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = All;
                }
                field("HRMS ID"; Rec."HRMS ID")
                {
                    ApplicationArea = All;
                }
                field("From Designation"; Rec."From Designation")
                {
                    ApplicationArea = All;
                }
                field("To Designation"; Rec."To Designation")
                {
                    ApplicationArea = All;
                }
                field("Promotion Order Date"; Rec."Promotion Order Date")
                {
                    ApplicationArea = All;
                }
                field("Letter No"; Rec."Letter No")
                {
                    ApplicationArea = All;
                }
                //      field("Promotion Order Issuing Authority"; Rec."Promotion Order Issuing Authority") { ApplicationArea = All;   }
                // (g) Modified fields
                field("Modified By"; Rec."Modified By")
                {
                    ApplicationArea = All;
                }
                field("Modified DateTime"; Rec."Modified Date Time")
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
            /*   action("Download Promotion Order")

               {

                   Caption = 'Download Promotion Order';

                   ApplicationArea = All;

                   Image = Download;

                   trigger OnAction()

                   var

                       FileMgt: Codeunit "File Management";

                       TempBlob: Codeunit "Temp Blob";

                       InS: InStream;

                       OutS: OutStream;

                   begin

                       Rec.CalcFields("Upload Promotion Order");
                       if Rec."Upload Promotion Order".HasValue then begin
                           Rec."Upload Promotion Order".CreateInStream(InS);
                           TempBlob.CreateOutStream(OutS);
                           CopyStream(OutS, InS);
                           FileMgt.BLOBExport(TempBlob, Rec."HRMS ID" + '_PromotionOrder.pdf', true);
                       end else
                           Error('File not found in archive record.');

                   end;

               }*/
            action("Download Promotion Order") //SS07OCT
            {
                Caption = 'Download Promotion Order';
                ApplicationArea = All;
                Image = Export;

                trigger OnAction()
                var
                    InStr: InStream;
                    ToFileName: Text;
                begin
                    Rec.CalcFields("Upload Promotion Order");
                    if Rec."Upload Promotion Order".HasValue then begin
                        Rec."Upload Promotion Order".CreateInStream(InStr);
                        if rec."Promotion Order File Name" <> '' then
                            ToFileName := Rec."Promotion Order File Name"
                        else
                            ToFileName := 'DowmloadDocument.pdf';
                        DownloadFromStream(InStr, 'Download Document', '', '', ToFileName);
                    end
                    else
                        Message('No document found for this record.');
                end;
            }
            /*     action(DownloadDocument)
                     {
                         ApplicationArea = All;
                         Image = Download;
                         Caption = 'Download Document';
                         ToolTip = 'Download the uploaded document.';

                         trigger OnAction()
                         var
                             FileMngCU: Codeunit "File Management";
                             InStr: InStream;
                         begin
                             if Rec."Upload Promotion Order".HasValue() then begin
                                 Rec."Upload Promotion Order".CreateInStream(InStr);
                                 FileMngCU.BLOBExport(TempBlob, 'Application_' + Rec."HRMS ID" + '.pdf', true);
                             end
                             else
                                 Error('No document found to download.');
                         end;
                     }*/
        }
    }
    var
        TempBlob: Codeunit "Temp Blob";
}
