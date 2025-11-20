table 33065861 "Transfer Joining History"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1;"Entry No";Integer)
        {
            AutoIncrement = true;
        }
        field(2;"HRMS ID";Code[20])
        {
        }
        field(3;"Name";Text[90])
        {
        }
        field(4;"Designation";Code[20])
        {
            Caption = 'From Designation';
        }
        //Start Anmol 20 Feb 2025
        // field(5;"From Station";Code[50])
        // {
        // }
        field(5;"From Station";Code[100])
        {
        }
        // field(6;"To Station";Code[50])
        // {
        // }
        field(6;"To Station";Code[100])
        {
        }
        // End Anmol
        field(7;"Transfer Date";Date)
        {
        }
        field(8;"Letter No";Code[20])
        {
        }
        field(9;"Relieving Event";Enum "Relieving Event")
        {
        }
        field(10;"Joining Event";Enum "Joining Event")
        {
        }
        field(11;"Joining Date";Date)
        {
        }
        field(12;"Status";Option)
        {
            OptionMembers = Submitted, Relieved, Joined;
        }
        field(13;"Created By";Code[50])
        {
        }
        field(14;"Created Date Time";DateTime)
        {
        }
        field(15;"Modified By";Code[50])
        {
        }
        field(16;"Modified Date Time";DateTime)
        {
        }
        field(17;"To Designation";Code[20])
        {
            TableRelation = Designation;
        }
        field(18;"Promotion order date";Date)
        {
        }
        field(19;"Promotion letter no";Code[20])
        {
        }
        field(20;"Order Issuing Authority";Option)
        {
            OptionMembers = "DTE&T", "SDTE";
            Caption = 'Transfer Order Issuing Authority';
        }
        field(21;"Relief Order No.";Code[30])
        {
        }
        field(22;"Relief Order Date";Date)
        {
        }
        field(23;"Upload Transfer Order";Blob)
        {
            DataClassification = ToBeClassified;
        }
        field(24;"Transfer Order File Name";Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(25;"No. of Archived Versions";Integer) //SS07OCT
        {
            FieldClass = FlowField;
            CalcFormula = Count("Archive Employee Transfer" WHERE("HRMS ID"=FIELD("HRMS ID")));
        }
        field(26;"Is Latest";Boolean)
        {
            Editable = false;
        }
    }
    keys
    {
        key("PK";"Entry No")
        {
            Clustered = true;
        }
        key(hrms;"HRMS ID", "Entry No") //SS07OCT
        {
            Clustered = false;
        }
    }
    var myInt: Integer;
    ArchiveTransferJoinRec: Record "Archived Trans Joining History";
    trigger OnInsert()begin
        "Created By":=UserId;
        "Created Date Time":=CurrentDateTime;
        ArchiveTransferJoinRec.Reset();
        ArchiveTransferJoinRec.Init();
        ArchiveTransferJoinRec.TransferFields(Rec);
        ArchiveTransferJoinRec.Insert(true);
    end;
    trigger OnModify()begin
        "Modified By":=UserId;
        "Modified Date Time":=CurrentDateTime;
        ArchiveTransferJoinRec.Reset();
        ArchiveTransferJoinRec.Init();
        ArchiveTransferJoinRec.TransferFields(Rec);
        ArchiveTransferJoinRec.Insert(true);
    end;
    trigger OnDelete()begin
        ArchiveTransferJoinRec.Reset();
        ArchiveTransferJoinRec.Init();
        ArchiveTransferJoinRec.TransferFields(Rec);
        ArchiveTransferJoinRec.Insert(true);
    end;
    trigger OnRename()begin
        ArchiveTransferJoinRec.Reset();
        ArchiveTransferJoinRec.Init();
        ArchiveTransferJoinRec.TransferFields(Rec);
        ArchiveTransferJoinRec.Insert(true);
    end;
    procedure MarkLatestTransfer(HRMSID: Code[20]) //SS07OCT
    var TransferHist: Record "Transfer Joining History";
    LatestHist: Record "Transfer Joining History";
    begin
        // Reset all records for this employee
        TransferHist.Reset();
        TransferHist.SetRange("HRMS ID", HRMSID);
        if TransferHist.FindSet()then repeat TransferHist."Is Latest":=false;
                TransferHist.Modify();
            until TransferHist.Next() = 0;
        // Mark only the latest one as TRUE
        LatestHist.Reset();
        LatestHist.SetRange("HRMS ID", HRMSID);
        if LatestHist.FindLast()then begin
            LatestHist."Is Latest":=true;
            LatestHist.Modify();
        end;
    end;
}
