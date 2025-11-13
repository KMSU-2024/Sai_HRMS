page 33065712 "Room wise Details List"
{
    ApplicationArea = All;
    Caption = ' Room Wise Details List';
    PageType = List;
    SourceTable = "Room Wise Details";
    UsageCategory = Lists;
    ModifyAllowed = false;
    DeleteAllowed = false;
    InsertAllowed = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Entry No.";rec."Entry No.")
                {
                    ApplicationArea = all;
                }
                field("Building/Block Name ";Rec."Building/Block Name ")
                {
                    ApplicationArea = all;
                }
                field("Type of Building";Rec."Type of Building")
                {
                    ApplicationArea = all;
                }
                field("Room No.";Rec."Room No.")
                {
                    ApplicationArea = all;
                }
                field("Floor No.";Rec."Floor No.")
                {
                    ApplicationArea = all;
                }
                // field("TRADE/DEPT"; Rec."TRADE/DEPT")
                // {
                //     ApplicationArea = all;
                // }
                field("Area of flooring";Rec."Area of flooring")
                {
                    ApplicationArea = all;
                }
                field("Type of flooring";Rec."Type of flooring")
                {
                    ApplicationArea = all;
                }
                field("Area of Short wall";Rec."Area of Short wall")
                {
                    ApplicationArea = all;
                }
                field("Area of long wall";Rec."Area of long wall")
                {
                    ApplicationArea = all;
                }
                field("Area of ceiling";Rec."Area of ceiling")
                {
                    ApplicationArea = all;
                }
                field("Type of ceiling";Rec."Type of ceiling")
                {
                    ApplicationArea = all;
                }
                field("No of window";Rec."No of window")
                {
                    ApplicationArea = all;
                }
                field("Type of Window";Rec."Type of Window")
                {
                    ApplicationArea = all;
                }
                field("No of doors";Rec."No of doors")
                {
                    ApplicationArea = all;
                }
                field("Type of door";Rec."Type of door")
                {
                    ApplicationArea = all;
                }
                field("No of officer cabinet";Rec."No of officer cabinet")
                {
                    ApplicationArea = all;
                }
                field("No Of Wall Cabinet ";Rec."No Of Wall Cabinet ")
                {
                    ApplicationArea = all;
                }
                field("Type of Wall Cabinet";Rec."Type of Wall Cabinet")
                {
                    ApplicationArea = all;
                }
                field("No of Chair";Rec."No of Chair")
                {
                    ApplicationArea = all;
                }
                field("Type of Chair";Rec."Type of Chair")
                {
                    ApplicationArea = all;
                }
                field("No of Table";Rec."No of Table")
                {
                    ApplicationArea = all;
                }
                field("Type of Table";Rec."Type of Table")
                {
                    ApplicationArea = all;
                }
                field("No of Desk";Rec."No of Desk")
                {
                    ApplicationArea = all;
                }
                field("Type of Desk";Rec."Type of Desk")
                {
                    ApplicationArea = all;
                }
                field(AC;Rec.AC)
                {
                    ApplicationArea = all;
                }
                field("No of Fan(Ceiling)";Rec."No of Fan(Ceiling)")
                {
                    ApplicationArea = all;
                }
                field("Type of Ceiling(Fan)";Rec."Type of Ceiling(Fan)")
                {
                    ApplicationArea = all;
                }
                field("No of Fan(Wall)";Rec."No of Fan(Wall)")
                {
                    ApplicationArea = all;
                }
                field("Type of Fan(Wall)";Rec."Type of Fan(Wall)")
                {
                    ApplicationArea = all;
                }
                field("No of Ceiling Light";Rec."No of Ceiling Light")
                {
                    ApplicationArea = all;
                }
                field("No of CCTV";Rec."No of CCTV")
                {
                    ApplicationArea = all;
                }
                field("No of Desktop";Rec."No of Desktop")
                {
                    ApplicationArea = all;
                }
                field("No of Printer";Rec."No of Printer")
                {
                    ApplicationArea = all;
                }
                field(Sofa;Rec.Sofa)
                {
                    ApplicationArea = all;
                }
                field("Area of Office Cabinet";Rec."Area of Office Cabinet")
                {
                    ApplicationArea = all;
                }
                field("No Of Bed ";Rec."No Of Bed ")
                {
                    ApplicationArea = all;
                }
                field("Type of Bed";Rec."Type of Bed")
                {
                    ApplicationArea = all;
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
            action("&New")
            {
                ApplicationArea = All;
                Image = New;

                //Promoted = true;
                trigger OnAction()var RoomWiseCard: Page "Room Wise Details Form";
                RoomWiseDetailRecTemp: Record "Room Wise Details" temporary;
                InfraSetupRec: Record "Infrastructure Setup";
                NoMnagCU: Codeunit NoSeriesManagement;
                begin
                    // Rec.CalcFields("Uploaded Photo", "Uploaded Photo/Geotag");
                    // GateComplexRecTemp := Rec;
                    InfraSetupRec.Get();
                    InfraSetupRec.TestField("Room Wise Details No.");
                    RoomWiseDetailRecTemp.Init();
                    RoomWiseDetailRecTemp."Entry No.":=NoMnagCU.GetNextNo(InfraSetupRec."Room Wise Details No.", 0D, true);
                    RoomWiseDetailRecTemp.Insert();
                    RoomWiseCard.OpenPage(RoomWiseDetailRecTemp);
                end;
            }
            action("&Card")
            {
                ApplicationArea = All;

                //Promoted = true;
                trigger OnAction()var RoomDetCard: Page "Room Wise Details Form";
                RoomDetRecTemp: Record "Room Wise Details" temporary;
                begin
                    Rec.CalcFields("Uploaded Photo Of Room");
                    RoomDetRecTemp:=Rec;
                    RoomDetCard.OpenPage(RoomDetRecTemp);
                end;
            }
            action(History)
            {
                ApplicationArea = All;
                Image = History;
                RunObject = page "Room wise Details History List";
                RunPageLink = "Entry No."=field("Entry No.");

                trigger OnAction()begin
                end;
            }
            action("Upload Document")
            {
                ApplicationArea = All;
                Image = Add;
                Visible = false;

                trigger OnAction()var flname: Text;
                OutstrL: OutStream;
                begin
                    fileName1:=Filemgm.BLOBImportWithFilter(Tempblob, 'Upload File', '', 'Image Files (*.jpg;*.jpeg;*.png)|*.jpg;*.jpeg;*.png|All Files (*.*)|*.*', '.jpg''.jpeg');
                    if fileName1 > '' then begin
                        if Tempblob.Length() > 3000000 then Error('File size must be less than or equal to 3MB');
                        ins:=Tempblob.CreateInStream();
                        Rec."Uploaded File Name ":=fileName1;
                        Rec.CalcFields("Uploaded Photo Of Room");
                        Rec."Uploaded Photo Of Room".CreateOutStream(OutstrL);
                        CopyStream(OutstrL, ins);
                        Rec.Modify(true);
                        Message('File "%1" uploaded successfully.', fileName1);
                    end;
                end;
            }
            action("Download Document")
            {
                ApplicationArea = All;
                Image = Download;

                trigger OnAction()var FilemngCU: Codeunit "File Management";
                begin
                    Rec.CalcFields("Uploaded Photo Of Room");
                    if Rec."Uploaded Photo Of Room".HasValue then begin
                        Rec."Uploaded Photo Of Room".CreateInStream(ins);
                        DownloadFromStream(ins, 'Download', '', '', Rec."Uploaded File Name ");
                    end
                    else
                        Error('Document Not found');
                end;
            }
        }
    }
    var ins: InStream;
    Tempblob: Codeunit "Temp Blob";
    outstr: OutStream;
    Filemgm: Codeunit "File Management";
    NewNumberG: Code[20]; // afs
    SaveRecG: Boolean;
    fileName: text;
    fileName1: text;
}
