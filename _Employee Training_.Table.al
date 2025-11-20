table 33066445 "Employee Training" //SS07OCT
{
    DataClassification = ToBeClassified;
    LookupPageId = "Employee Training List";
    DrillDownPageId = "Employee Training Input";

    fields
    {
        field(1;"Entry No";Integer)
        {
            AutoIncrement = true;
        }
        field(2;"HRMS ID";Code[20])
        {
        }
        field(3;Name;Text[90])
        {
        }
        field(4;"Designation";Code[20])
        {
        }
        field(5;"Type Of Training";Enum "Type Of Training")
        {
        }
        field(6;"Course Name";Text[30])
        {
        }
        field(7;"Start Date";Date)
        {
        }
        field(8;"EndDate";Date)
        {
        }
        field(9;"Duration Of Training";Integer)
        {
        }
        field(10;"Conducted By";Text[30])
        {
        }
        field(11;"Training Location";Text[30])
        {
        }
        field(12;"Created By";Code[50])
        {
        }
        field(13;"Created Date Time";DateTime)
        {
        }
        field(14;"Modified By";Code[50])
        {
        }
        field(15;"Modified Date Time";DateTime)
        {
        }
        field(16;"Certificate FileName";Text[100])
        {
        }
        field(17;"Certificate";Blob)
        {
        }
        field(18;"Spcified Type of training";Text[50])
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK;"Entry No")
        {
            Clustered = true;
        }
    }
    var ArchiveEmpTrainingRec: Record "Archive Employee Training Hist";
    trigger OnInsert()var EmpTrainingHistory: Record "Employee Training History";
    InStream1: InStream;
    OutStream1: OutStream;
    begin
        /* if not Rec.Certificate.HasValue then
            Error('You must upload a document before inserting the record.'); */
        "Created By":=UserId;
        "Created Date Time":=CurrentDateTime;
    /*      EmpTrainingHistory.Reset();
                 EmpTrainingHistory.Init();
                 EmpTrainingHistory.TransferFields(Rec);
                 EmpTrainingHistory.Insert(true); */
    end;
    trigger OnModify()begin
    /* if not Rec.Certificate.HasValue then
                Error('You must upload a document before updating the record.'); */
    //  "Modified By" := UserId;
    // "Modified Date Time" := CurrentDateTime;
    /* ArchiveEmpTrainingRec.Reset();
             ArchiveEmpTrainingRec.Init();
             ArchiveEmpTrainingRec.TransferFields(Rec);
             ArchiveEmpTrainingRec.Insert(true);
             InsertIntoTrainingHistory();*/
    end;
    trigger OnDelete()begin
    /*    ArchiveEmpTrainingRec.Reset();
               ArchiveEmpTrainingRec.Init();
               ArchiveEmpTrainingRec.TransferFields(Rec);
               ArchiveEmpTrainingRec.Insert(true);
         */
    end;
    trigger OnRename()begin
    /*    ArchiveEmpTrainingRec.Reset();
               ArchiveEmpTrainingRec.Init();
               ArchiveEmpTrainingRec.TransferFields(Rec);
               ArchiveEmpTrainingRec.Insert(true); */
    end;
    procedure InsertIntoTrainingHistory() //SS07OCT
    var EmpTrainingHistory: Record "Employee Training History";
    InStream1: InStream;
    OutStream1: OutStream;
    begin
        EmpTrainingHistory.Init();
        EmpTrainingHistory."HRMS ID":="HRMS ID";
        EmpTrainingHistory.Name:=Name;
        EmpTrainingHistory.Designation:=Designation;
        //  EmpTrainingHistory."Type Of Training" := "Type Of Training"; //sai
        EmpTrainingHistory."Course Name":="Course Name";
        EmpTrainingHistory."Start Date":="Start Date";
        EmpTrainingHistory.EndDate:=EndDate;
        EmpTrainingHistory."Duration Of Training":="Duration Of Training";
        EmpTrainingHistory."Conducted By":="Conducted By";
        EmpTrainingHistory."Training Location":="Training Location";
        EmpTrainingHistory."Certificate FileName":="Certificate FileName";
        EmpTrainingHistory."Modified By":=UserId;
        EmpTrainingHistory."Modified Date Time":=CurrentDateTime;
        if Certificate.HasValue then begin
            Certificate.CreateInStream(InStream1);
            EmpTrainingHistory.Certificate.CreateOutStream(OutStream1);
            CopyStream(OutStream1, InStream1);
        end;
        EmpTrainingHistory.Insert(true);
        Message('Inserting into training history table');
    end;
}
