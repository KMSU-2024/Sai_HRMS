table 33065971 "List of all Dep/trades/Section"
{
    DataClassification = ToBeClassified;
    LookupPageId = "Dep/trades/Section Lists";

    fields
    {
        field(1;"Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ", "Departments", "Trades", "Section";
        }
        field(2;"Departments/Trades/Section";Text[60])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Entry No";Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
        field(4;"Created By";Code[50])
        {
        }
        field(5;"Created Date Time";DateTime)
        {
        }
        field(6;"Modified By";Code[50])
        {
        }
        field(7;"Modified Date Time";DateTime)
        {
        }
        field(9;"Gen. Prod. Posting Group";Code[20])
        {
            TableRelation = "Gen. Product Posting Group";
        }
        field(10;"User ID";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = User."User Name";
            ValidateTableRelation = false;
        }
        field(11;"Location";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Location.Code;
        }
    }
    keys
    {
        key(pk;"Type", "Departments/Trades/Section")
        {
            Clustered = true;
        }
    }
    var DeptTradeSecRec: Record "List of  Dep/tra/Sec History";
    EntNo: Integer;
    trigger OnInsert()begin
        "Created By":=UserId;
        "Created Date Time":=CurrentDateTime;
        DeptTradeSecRec.Reset();
        if DeptTradeSecRec.FindLast()then EntNo:=DeptTradeSecRec."Sl. No" + 1
        else
            EntNo:=1;
        DeptTradeSecRec.Reset();
        DeptTradeSecRec.Init();
        DeptTradeSecRec.TransferFields(Rec);
        DeptTradeSecRec."Sl. No":=EntNo;
        DeptTradeSecRec.Insert(true);
    end;
    trigger OnModify()begin
        "Modified By":=UserId;
        "Modified Date Time":=CurrentDateTime;
        DeptTradeSecRec.Reset();
        if DeptTradeSecRec.FindLast()then EntNo:=DeptTradeSecRec."Sl. No" + 1
        else
            EntNo:=1;
        DeptTradeSecRec.Reset();
        DeptTradeSecRec.Init();
        DeptTradeSecRec.TransferFields(Rec);
        DeptTradeSecRec."Sl. No":=EntNo;
        DeptTradeSecRec.Insert(true);
    end;
    trigger OnDelete()begin
        DeptTradeSecRec.Reset();
        if DeptTradeSecRec.FindLast()then EntNo:=DeptTradeSecRec."Sl. No" + 1
        else
            EntNo:=1;
        DeptTradeSecRec.Reset();
        DeptTradeSecRec.Init();
        DeptTradeSecRec.TransferFields(Rec);
        DeptTradeSecRec."Sl. No":=EntNo;
        DeptTradeSecRec.Insert(true);
    end;
    trigger OnRename()begin
        DeptTradeSecRec.Reset();
        if DeptTradeSecRec.FindLast()then EntNo:=DeptTradeSecRec."Sl. No" + 1
        else
            EntNo:=1;
        DeptTradeSecRec.Reset();
        DeptTradeSecRec.Init();
        DeptTradeSecRec.TransferFields(Rec);
        DeptTradeSecRec."Sl. No":=EntNo;
        DeptTradeSecRec.Insert(true);
    end;
}
