page 33065713 "Room Wise Details Form"
{
    PageType = Card;
    //ApplicationArea = All;
    // UsageCategory = Administration;
    SourceTable = "Room Wise Details";
    SourceTableTemporary = true;
    DeleteAllowed = false;
    InsertAllowed = false;
    Editable = true;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Entry No.";rec."Entry No.")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Building/Block Name ";Rec."Building/Block Name ")
                {
                    ApplicationArea = all;
                    Editable = EditG;
                }
                field("Type of Building";Rec."Type of Building")
                {
                    ApplicationArea = all;
                    Editable = EditG;

                    trigger OnValidate()begin
                        SetFieldEnabling();
                    end;
                }
                field("Room No.";Rec."Room No.")
                {
                    ApplicationArea = all;
                    Editable = EditG;
                }
                field("Floor No.";Rec."Floor No.")
                {
                    ApplicationArea = all;
                    Editable = EditG;
                }
                field("TRADE/DEPT";Rec."TRADE/DEPT")
                {
                    ApplicationArea = all;
                    Editable = EditG;
                    Enabled = EnableOtherFields;
                }
            }
            group("Civil Item")
            {
                field("Area of flooring";Rec."Area of flooring")
                {
                    ApplicationArea = all;
                    Editable = EditG;
                }
                field("Type of flooring";Rec."Type of flooring")
                {
                    ApplicationArea = all;
                    Editable = EditG;
                }
                field("Area of Short wall";Rec."Area of Short wall")
                {
                    ApplicationArea = all;
                    Editable = EditG;
                }
                field("Area of long wall";Rec."Area of long wall")
                {
                    ApplicationArea = all;
                    Editable = EditG;
                }
                field("Area of ceiling";Rec."Area of ceiling")
                {
                    ApplicationArea = all;
                    Editable = EditG;
                }
                field("Type of ceiling";Rec."Type of ceiling")
                {
                    ApplicationArea = all;
                    Editable = EditG;
                }
                field("No of window";Rec."No of window")
                {
                    ApplicationArea = all;
                    Editable = EditG;
                }
                field("Type of Window";Rec."Type of Window")
                {
                    ApplicationArea = all;
                    Editable = EditG;
                }
                field("No of doors";Rec."No of doors")
                {
                    ApplicationArea = all;
                    Editable = EditG;
                }
                field("Type of door";Rec."Type of door")
                {
                    ApplicationArea = all;
                    Editable = EditG;
                }
            }
            group("Internal Furnishing Work")
            {
                field("No of officer cabinet";Rec."No of officer cabinet")
                {
                    ApplicationArea = all;
                    Editable = EditG;
                    Enabled = EnableOtherFields;
                }
                field("Area of Office Cabinet";Rec."Area of Office Cabinet")
                {
                    ApplicationArea = all;
                    Editable = EditG;
                    Enabled = EnableOtherFields;
                }
                field("No of Chair";Rec."No of Chair")
                {
                    ApplicationArea = all;
                    Editable = EditG;
                }
                field("Type of Chair";Rec."Type of Chair")
                {
                    ApplicationArea = all;
                    Editable = EditG;
                }
                field("No of Table";Rec."No of Table")
                {
                    ApplicationArea = all;
                    Editable = EditG;
                }
                field("Type of Table";Rec."Type of Table")
                {
                    ApplicationArea = all;
                    Editable = EditG;
                }
                field("No of Desk";Rec."No of Desk")
                {
                    ApplicationArea = all;
                    Editable = EditG;
                    Enabled = EnableOtherFields;
                }
                field("Type of Desk";Rec."Type of Desk")
                {
                    ApplicationArea = all;
                    Editable = EditG;
                    Enabled = EnableOtherFields;
                }
                field(Sofa;Rec.Sofa)
                {
                    ApplicationArea = all;
                    Editable = EditG;
                }
                field("No Of Bed ";Rec."No Of Bed ")
                {
                    ApplicationArea = all;
                    Editable = EditG;
                    Enabled = EnableBedFields;
                }
                field("Type of Bed";Rec."Type of Bed")
                {
                    ApplicationArea = all;
                    Editable = EditG;
                    Enabled = EnableBedFields;
                }
                field("No Of Wall Cabinet ";Rec."No Of Wall Cabinet ")
                {
                    ApplicationArea = all;
                    Editable = EditG;
                    Enabled = EnableOtherFields;
                }
                field("Type of Wall Cabinet";Rec."Type of Wall Cabinet")
                {
                    ApplicationArea = all;
                    Editable = EditG;
                    Enabled = EnableOtherFields;
                }
            }
            group("Electrical Item")
            {
                field(AC;Rec.AC)
                {
                    ApplicationArea = all;
                    Editable = EditG;
                }
                field("No of Fan(Ceiling)";Rec."No of Fan(Ceiling)")
                {
                    ApplicationArea = all;
                    Editable = EditG;
                }
                field("Type of Ceiling(Fan)";Rec."Type of Ceiling(Fan)")
                {
                    ApplicationArea = all;
                    Editable = EditG;
                }
                field("No of Fan(Wall)";Rec."No of Fan(Wall)")
                {
                    ApplicationArea = all;
                    Editable = EditG;
                }
                field("Type of Fan(Wall)";Rec."Type of Fan(Wall)")
                {
                    ApplicationArea = all;
                    Editable = EditG;
                }
                field("No of Ceiling Light";Rec."No of Ceiling Light")
                {
                    ApplicationArea = all;
                    Editable = EditG;
                }
                field("No of CCTV";Rec."No of CCTV")
                {
                    ApplicationArea = all;
                    Editable = EditG;
                    Enabled = EnableOtherFields;
                }
                field("No of Desktop";Rec."No of Desktop")
                {
                    ApplicationArea = all;
                    Editable = EditG;
                    Enabled = EnableOtherFields;
                }
                field("No of Printer";Rec."No of Printer")
                {
                    ApplicationArea = all;
                    Editable = EditG;
                    Enabled = EnableOtherFields;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(Update)
            {
                trigger OnAction()begin
                    // CurrPage.Editable(true);
                    EditG:=true;
                end;
            }
            action(Submit) //afs 20-05-2025
            {
                Promoted = true;
                ApplicationArea = All;

                trigger OnAction()var RoomWiseDet: Record "Room Wise Details";
                RoomWiseDetlHist: Record "Room Wise Details History";
                begin
                    if Confirm('Do you want to save the record !')then begin
                        Rec.CalcFields("Uploaded Photo Of Room");
                        RoomWiseDet.SetRange("Entry No.", Rec."Entry No.");
                        if RoomWiseDet.FindFirst()then begin
                            RoomWiseDet:=Rec;
                            RoomWiseDet.Modify();
                        end
                        else
                        begin
                            RoomWiseDet.Init();
                            RoomWiseDet:=Rec;
                            RoomWiseDet.Insert();
                        end;
                        RoomWiseDetlHist.Init();
                        RoomWiseDetlHist.TransferFields(Rec);
                        RoomWiseDetlHist."Modified By":=UserId;
                        RoomWiseDetlHist."Modified Date":=CurrentDateTime;
                        RoomWiseDetlHist.Insert();
                        Message('Record saved succesfully');
                    end;
                    CurrPage.Close();
                end;
            }
            action("Upload Document")
            {
                ApplicationArea = All;
                Image = Add;
                Enabled = EditG;

                trigger OnAction()var flname: Text;
                OutstrL: OutStream;
                begin
                    fileName:=Filemgm.BLOBImportWithFilter(Tempblob, 'Upload File', '', 'Image Files (*.jpg;*.jpeg;*.png)|*.jpg;*.jpeg;*.png|All Files (*.*)|*.*', '.png''.jpg''.jpeg''.pdf');
                    if fileName > '' then begin
                        if Tempblob.Length() > 3000000 then Error('File size must be less than or equal to 3MB');
                        ins:=Tempblob.CreateInStream();
                        Rec."Uploaded File Name ":=fileName;
                        Rec.CalcFields("Uploaded Photo Of Room");
                        Rec."Uploaded Photo Of Room".CreateOutStream(OutstrL);
                        CopyStream(OutstrL, ins);
                        Rec.Modify(true);
                        Message('File "%1" uploaded successfully.', fileName);
                    end;
                end;
            }
            action("Download Document")
            {
                ApplicationArea = All;
                Image = Download;
                Visible = false;

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
    trigger OnInsertRecord(boo: Boolean): Boolean var InfraSetupRec: Record "Infrastructure Setup";
    NoMnagCU: Codeunit NoSeriesManagement;
    begin
        // ATtachB := true;
        if Rec."Entry No." = '' then begin
            InfraSetupRec.Get();
            InfraSetupRec.TestField("Room Wise Details No.");
            rec."Entry No.":=NoMnagCU.GetNextNo(InfraSetupRec."Room Wise Details No.", 0D, true);
            NewNumberG:=Rec."Entry No."; //afsar
        end;
    end;
    // trigger OnQueryClosePage(Closeaction: Action): Boolean //Afsar
    // var
    //     InfraSetupRec: Record "Infrastructure Setup";
    //     NoSeriesLine: Record "No. Series Line";
    // begin
    //     InfraSetupRec.Get();
    //     if (NewNumberG = Rec."Entry No.") and not SaveRecG then begin
    //         if Rec.Delete() then;
    //     end;
    // end;
    procedure OpenPage(RecPP: Record "Room Wise Details")begin
        if RecPP."Entry No." > '' then begin
            RecPP.CalcFields("Uploaded Photo Of Room");
            Rec:=RecPP;
            Rec.Insert();
        end;
        Page.Run(33065713, Rec);
    end;
    trigger OnOpenPage()var GateComplexL: Record "Room Wise Details";
    begin
        if not GateComplexL.Get(Rec."Entry No.")then EditG:=true;
    end;
    trigger OnAfterGetRecord()begin
        SetFieldEnabling();
    end;
    local procedure SetFieldEnabling()begin
        case Rec."Type of Building" of Rec."Type of Building"::"Guest House", Rec."Type of Building"::"Staff Quarter", Rec."Type of Building"::"Hostel Building": begin
            EnableBedFields:=true;
            EnableOtherFields:=false;
        end;
        Rec."Type of Building"::"Gate Complex", Rec."Type of Building"::"Institutional Building", Rec."Type of Building"::"Workshop Building", Rec."Type of Building"::"Auditorium", Rec."Type of Building"::"Admininstrative Building": begin
            EnableBedFields:=false;
            EnableOtherFields:=true;
        end;
        else
        begin
            EnableBedFields:=false;
            EnableOtherFields:=false;
        end;
        end;
    end;
    var myInt: Integer;
    NewNumberG: Code[20];
    SaveRecG: Boolean;
    EditG: Boolean;
    InfraSetup: Record "Infrastructure Setup";
    NoSeriesManagementGvar: Codeunit NoSeriesManagement;
    ins: InStream;
    Tempblob: Codeunit "Temp Blob";
    outstr: OutStream;
    Filemgm: Codeunit "File Management";
    fileName: text;
    fileName1: text;
    attachb: Boolean;
    GateComplex: Record "Gate Complex";
    var EnableBedFields: Boolean;
    EnableOtherFields: Boolean;
}
