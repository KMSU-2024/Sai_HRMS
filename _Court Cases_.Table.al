table 33065899 "Court Cases"
{
    DataClassification = ToBeClassified;
    Caption = 'Court Cases';

    fields
    {
        field(1;"Case No.";Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Case No.';
        }
        field(2;"Year of filing";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Name of the Court";Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(4;Place;Text[60])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Petitioner Name";Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Opposite Party Name";Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Lowest level office hierarchy";Code[20])
        {
            Caption = 'Lowest level office in the hierarchy';
            DataClassification = ToBeClassified;
        }
        field(8;"Matter Relating to";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ", "Land Building", "Criminal", "Tax", "Service matter", "Certificate matter", "Academics", "Admission", "SCTE&VT", "Other";
        }
        field(9;"Last Case Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Case Status";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Entry No";Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
    }
    keys
    {
        key(pk;"Entry No", "Case No.")
        {
            Clustered = true;
        }
    }
    var ArchieveCourCaseRec: Record "archived Court Cases ";
    EntrNo: Integer;
    trigger OnInsert()begin
        ArchieveCourCaseRec.Reset();
        if ArchieveCourCaseRec.FindLast()then EntrNo:=ArchieveCourCaseRec."Sl. No" + 1
        else
            EntrNo:=1;
        ArchieveCourCaseRec.Reset();
        ArchieveCourCaseRec.Init();
        ArchieveCourCaseRec.TransferFields(Rec);
        ArchieveCourCaseRec."Sl. No":=EntrNo;
        ArchieveCourCaseRec.Insert(true);
    end;
    trigger OnModify()begin
        ArchieveCourCaseRec.Reset();
        if ArchieveCourCaseRec.FindLast()then EntrNo:=ArchieveCourCaseRec."Sl. No" + 1
        else
            EntrNo:=1;
        ArchieveCourCaseRec.Reset();
        ArchieveCourCaseRec.Init();
        ArchieveCourCaseRec.TransferFields(Rec);
        ArchieveCourCaseRec."Sl. No":=EntrNo;
        ArchieveCourCaseRec.Insert(true);
    end;
    trigger OnDelete()begin
        ArchieveCourCaseRec.Reset();
        if ArchieveCourCaseRec.FindLast()then EntrNo:=ArchieveCourCaseRec."Sl. No" + 1
        else
            EntrNo:=1;
        ArchieveCourCaseRec.Reset();
        ArchieveCourCaseRec.Init();
        ArchieveCourCaseRec.TransferFields(Rec);
        ArchieveCourCaseRec."Sl. No":=EntrNo;
        ArchieveCourCaseRec.Insert(true);
    end;
    trigger OnRename()begin
        ArchieveCourCaseRec.Reset();
        if ArchieveCourCaseRec.FindLast()then EntrNo:=ArchieveCourCaseRec."Sl. No" + 1
        else
            EntrNo:=1;
        ArchieveCourCaseRec.Reset();
        ArchieveCourCaseRec.Init();
        ArchieveCourCaseRec.TransferFields(Rec);
        ArchieveCourCaseRec."Sl. No":=EntrNo;
        ArchieveCourCaseRec.Insert(true);
    end;
}
