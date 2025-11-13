table 33065870 "RTI monitoring"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1;"Type of Application";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ", "To PIO", "To First Appellate Authority";
        }
        field(2;"Application No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Name of the applicant";Text[60])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Date of Receipt of application";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Reply Due Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Reply Sent";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Yes, No;
        }
        field(7;"Type of Reply";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ", Rejected, "Asked to deposit dues", "Further Compliances", "Information Supplied";
        }
        field(8;"Reply Letter Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Letter No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Letter Dispatch Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(11;Remark;Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Entry No.";Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
    }
    keys
    {
        key(pk;"Entry No.", "Type of Application")
        {
            Clustered = true;
        }
    }
    var SlNo: Integer;
    RTIARchievedRec: Record "Archived RTI monitoring";
    trigger OnInsert()begin
        RTIARchievedRec.Reset();
        if RTIARchievedRec.FindLast()then SlNo:=RTIARchievedRec."Sl. No." + 1
        else
            SlNo:=1;
        RTIARchievedRec.Reset();
        RTIARchievedRec.Init();
        RTIARchievedRec.TransferFields(Rec);
        RTIARchievedRec."Sl. No.":=SlNo;
        RTIARchievedRec.Insert(true);
    end;
    trigger OnModify()begin
        RTIARchievedRec.Reset();
        if RTIARchievedRec.FindLast()then SlNo:=RTIARchievedRec."Sl. No." + 1
        else
            SlNo:=1;
        RTIARchievedRec.Reset();
        RTIARchievedRec.Init();
        RTIARchievedRec.TransferFields(Rec);
        RTIARchievedRec."Sl. No.":=SlNo;
        RTIARchievedRec.Insert(true);
    end;
    trigger OnDelete()begin
        RTIARchievedRec.Reset();
        if RTIARchievedRec.FindLast()then SlNo:=RTIARchievedRec."Sl. No." + 1
        else
            SlNo:=1;
        RTIARchievedRec.Reset();
        RTIARchievedRec.Init();
        RTIARchievedRec.TransferFields(Rec);
        RTIARchievedRec."Sl. No.":=SlNo;
        RTIARchievedRec.Insert(true);
    end;
    trigger OnRename()begin
        RTIARchievedRec.Reset();
        if RTIARchievedRec.FindLast()then SlNo:=RTIARchievedRec."Sl. No." + 1
        else
            SlNo:=1;
        RTIARchievedRec.Reset();
        RTIARchievedRec.Init();
        RTIARchievedRec.TransferFields(Rec);
        RTIARchievedRec."Sl. No.":=SlNo;
        RTIARchievedRec.Insert(true);
    end;
}
