table 33065883 "Annual Establishment Review"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1;"Sl.No";Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
        field(2;"Establishment Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ", "Part – A (Regular Establishment)", "Part – C (Non-regular Establishment)", "Part – E (Outsourced/ on contract)";
        }
        field(3;"Post Group";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ", A, C, E;
        }
        field(4;"Dept./Trade/Section";Text[60])
        {
            DataClassification = ToBeClassified;
            TableRelation = "List of all Dep/trades/Section"."Departments/Trades/Section";
        }
        field(5;Designation;Code[20])
        {
            DataClassification = ToBeClassified;
        // OptionMembers = " ",Principal,"Senior Lecturer",Lecturer,ATO,"TO","Training Superintendent","Section Officer","Assistant Section Officer"," Laboratory Assistant","Librarian","Junior Assistant";
        }
        field(6;"Pay Scale GP";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Pay scale 6th pay";text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Pay Scale level 7th pay";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Sanctioned Strength";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Persons in Position ";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Vacancy Position ";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Excess Post";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Academic Year";Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Financial Year';
            TableRelation = "Financial Year"."Financial Code";
        }
        field(14;"Remark";Text[100])
        {
            Caption = 'Remark if any';
            DataClassification = ToBeClassified;
        }
        field(15;"Institution Name";Text[90])
        {
            DataClassification = ToBeClassified;
        // trigger OnLookup()
        // var
        //     instituderec: Record Institute;
        // begin
        //     instituderec.reset;
        //     if instituderec.FindSet() then;
        //     IF PAGE.RUNMODAL(PAGE::"Institute Lists", instituderec) = ACTION::LookupOK THEN
        //         rec."Institution Name" := instituderec."Institute Name";
        // end;
        }
        field(16;"Employee Catagory";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "Group A", "Group B", "Group C", "Group D";
        }
    }
    keys
    {
        key(pk;"Sl.No", "Establishment Type")
        {
            Clustered = true;
        }
    }
    var myInt: Integer;
    AnnualEstRevHistoryRec: Record "Annual Estab Review History";
    EntNo: Integer;
    trigger OnInsert()begin
        rec."Institution Name":=CompanyName;
        AnnualEstRevHistoryRec.Reset();
        if AnnualEstRevHistoryRec.FindLast()then EntNo:=AnnualEstRevHistoryRec."Entry No" + 1
        else
            EntNo:=1;
        AnnualEstRevHistoryRec.Reset();
        AnnualEstRevHistoryRec.Init();
        AnnualEstRevHistoryRec.TransferFields(Rec);
        AnnualEstRevHistoryRec."Entry No":=EntNo;
        AnnualEstRevHistoryRec.Insert(true);
    end;
    trigger OnModify()begin
        AnnualEstRevHistoryRec.Reset();
        if AnnualEstRevHistoryRec.FindLast()then EntNo:=AnnualEstRevHistoryRec."Entry No" + 1
        else
            EntNo:=1;
        AnnualEstRevHistoryRec.Reset();
        AnnualEstRevHistoryRec.Init();
        AnnualEstRevHistoryRec.TransferFields(Rec);
        AnnualEstRevHistoryRec."Entry No":=EntNo;
        AnnualEstRevHistoryRec.Insert(true);
    end;
    trigger OnDelete()begin
        AnnualEstRevHistoryRec.Reset();
        if AnnualEstRevHistoryRec.FindLast()then EntNo:=AnnualEstRevHistoryRec."Entry No" + 1
        else
            EntNo:=1;
        AnnualEstRevHistoryRec.Reset();
        AnnualEstRevHistoryRec.Init();
        AnnualEstRevHistoryRec.TransferFields(Rec);
        AnnualEstRevHistoryRec."Entry No":=EntNo;
        AnnualEstRevHistoryRec.Insert(true);
    end;
    trigger OnRename()begin
        AnnualEstRevHistoryRec.Reset();
        if AnnualEstRevHistoryRec.FindLast()then EntNo:=AnnualEstRevHistoryRec."Entry No" + 1
        else
            EntNo:=1;
        AnnualEstRevHistoryRec.Reset();
        AnnualEstRevHistoryRec.Init();
        AnnualEstRevHistoryRec.TransferFields(Rec);
        AnnualEstRevHistoryRec."Entry No":=EntNo;
        AnnualEstRevHistoryRec.Insert(true);
    end;
}
