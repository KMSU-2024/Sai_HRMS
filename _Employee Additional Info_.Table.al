table 33065970 "Employee Additional Info"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1;"HRMS ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee."No." where("SLCM Employee"=const(false));
        }
        field(2;"Employee Name";Text[90])
        {
            DataClassification = ToBeClassified;
        //Editable = false;
        }
        field(3;"D.O.J (Service)";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Service Joining Designation";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Service Joining Station";Code[52])
        {
            DataClassification = ToBeClassified;
            TableRelation = Institute."Institute Code";
        }
        field(6;"Current Station";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Institute."Institute Code";
        }
        field(7;"Base Qualification";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Employment Status";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ", "Ad hoc", "Temporary status", "Initial appointee", "Regular", Inactive;
        }
        field(9;"Date of increment";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(10;"MACP Status";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ", "Nil", "1st", "2nd", "3rd";
            NotBlank = true;
        }
        field(11;"Pension Remark";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ", "Regular", "NPS";
        }
        field(12;"Dept./Trade/Section";Text[60])
        {
            DataClassification = ToBeClassified;
            TableRelation = "List of all Dep/trades/Section"."Departments/Trades/Section";
        }
        field(13;"Entry No";Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
        field(14;"Created By";Code[50])
        {
        }
        field(15;"Created Date Time";DateTime)
        {
        }
        field(16;"Modified By";Code[50])
        {
        }
        field(17;"Modified Date Time";DateTime)
        {
        }
        //>>--SKS_27/12/22
        field(50000;"Home Dist";code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = District.Code;
        }
        field(50001;"Designation";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Designation.Code;
        }
        field(50032;"Deployment Start Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50033;"Deployment End Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50034;"Deployment Location";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Institute."Institute Code";
            ValidateTableRelation = false;
        }
    }
    keys
    {
        key(pk;"Entry No", "HRMS ID")
        {
            Clustered = true;
        }
    }
    var SlNo: Integer;
    ArcHEmpAddInfoRec: Record "Archived Employee Add Info";
    Emp: Record Employee;
    trigger OnInsert()begin
        "Created By":=UserId;
        "Created Date Time":=CurrentDateTime;
        ArcHEmpAddInfoRec.Reset();
        if ArcHEmpAddInfoRec.FindLast()then SlNo:=ArcHEmpAddInfoRec."Sl. No" + 1
        else
            SlNo:=1;
        ArcHEmpAddInfoRec.Init();
        ArcHEmpAddInfoRec.TransferFields(Rec);
        ArcHEmpAddInfoRec."Sl. No":=SlNo;
        ArcHEmpAddInfoRec.Insert(true);
        if Emp.get(Rec."HRMS ID")then begin
            if Rec."D.O.J (Service)" <> 0D then Emp."D.O.J (Service)":=Rec."D.O.J (Service)";
            if Rec."Service Joining Designation" <> '' then Emp."Service Joining Designation":=Rec."Service Joining Designation";
            if Rec."Service Joining Station" <> '' then Emp."Joining Station":=Rec."Service Joining Station";
            if Rec."Current Station" <> '' then Emp."Current Station":=Rec."Current Station";
            if Rec."Base Qualification" <> '' then Emp."Base Qualification":=Rec."Base Qualification";
            if Rec."Employment Status" <> 0 then Emp."Employment Status":=Rec."Employment Status";
            if Rec."Date of increment" <> 0D then Emp."Date of increment":=Rec."Date of increment";
            if Rec."MACP Status" <> 0 then Emp."MACP Status":=Rec."MACP Status";
            if Rec."Pension Remark" <> 0 then Emp."Pension Remark":=Rec."Pension Remark";
            if Rec."Dept./Trade/Section" <> '' then Emp."Dept./Trade/Section":=Rec."Dept./Trade/Section";
            if Rec.Designation <> '' then emp.Designation:=Rec.Designation;
            if Rec."Home Dist" <> '' then emp."Home Dist":=Rec."Home Dist";
            if Rec."Deployment Start Date" <> 0D then emp."Deployment Start Date":=Rec."Deployment Start Date";
            if Rec."Deployment End Date" <> 0D then emp."Deployment End Date":=Rec."Deployment End Date";
            if Rec."Deployment Location" <> '' then emp."Deployment Location":=Rec."Deployment Location";
            Emp.Modify(true);
        end;
    end;
    trigger OnModify()Var Emp: Record Employee;
    begin
        "Modified By":=UserId;
        "Modified Date Time":=CurrentDateTime;
        ArcHEmpAddInfoRec.Reset();
        if ArcHEmpAddInfoRec.FindLast()then SlNo:=ArcHEmpAddInfoRec."Sl. No" + 1
        else
            SlNo:=1;
        ArcHEmpAddInfoRec.Init();
        ArcHEmpAddInfoRec.TransferFields(Rec);
        ArcHEmpAddInfoRec."Sl. No":=SlNo;
        ArcHEmpAddInfoRec.Insert(true);
        if emp.get(Rec."HRMS ID")then begin
            if Rec."Employment Status" <> xRec."Employment Status" then Emp."Employment Status":=Rec."Employment Status";
            if Rec."Date of increment" <> xRec."Date of increment" then Emp."Date of increment":=Rec."Date of increment";
            if Rec."MACP Status" <> xRec."MACP Status" then Emp."MACP Status":=Rec."MACP Status";
            Emp.Modify(true);
        end;
    end;
    trigger OnDelete()begin
        ArcHEmpAddInfoRec.Reset();
        if ArcHEmpAddInfoRec.FindLast()then SlNo:=ArcHEmpAddInfoRec."Sl. No" + 1
        else
            SlNo:=1;
        ArcHEmpAddInfoRec.Init();
        ArcHEmpAddInfoRec.TransferFields(Rec);
        ArcHEmpAddInfoRec."Sl. No":=SlNo;
        ArcHEmpAddInfoRec.Insert(true);
    end;
    trigger OnRename()begin
        ArcHEmpAddInfoRec.Reset();
        if ArcHEmpAddInfoRec.FindLast()then SlNo:=ArcHEmpAddInfoRec."Sl. No" + 1
        else
            SlNo:=1;
        ArcHEmpAddInfoRec.Init();
        ArcHEmpAddInfoRec.TransferFields(Rec);
        ArcHEmpAddInfoRec."Sl. No":=SlNo;
        ArcHEmpAddInfoRec.Insert(true);
    end;
}
