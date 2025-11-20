table 33065862 "Employee Promotion History"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No"; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "HRMS ID"; Code[20])
        {
        }
        field(3; "Name"; Text[90])
        {
        }

        // Start Anmol 20 Feb 2025
        // field(4;"From Designation";Code[20])
        // {
        // }
        // field(5;"To Designation";Code[20])
        // {
        //     Caption = 'Promoted To';
        // }
        field(4; "From Designation"; Code[100])
        {
        }
        field(5; "To Designation"; Code[100])
        {
            Caption = 'Promoted To';
        }
        // End Anmol 20 Feb 2025

        field(6; "Promotion Order Date"; Date)
        {
        }
        field(7; "Letter NO"; Code[20])
        {
        }
        field(8; "Created By"; Code[50])
        {
        }
        field(9; "Created Date Time"; DateTime)
        {
        }
        field(10; "Modified By"; Code[50]) //SS07OCT
        {
        }
        field(11; "Modified Date Time"; DateTime) //SS07OCT
        {
        }
        field(12; "Order Issuing Authority"; Option)
        {
            Caption = 'Promotion Order Issuing Authority';
            OptionMembers = " ","DTE&T","SDTE",Principal;//SS07OCT
        }
        field(13; "Promotion Order"; Blob)
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Promotion Order File Name"; Text[200])
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Entry No")
        {
            Clustered = true;
        }
    }
    var
        myInt: Integer;
        ArcEmpPromotionHistRec: Record "Arch Employee Promotion hist";

    trigger OnInsert()
    Var
        employee: Record Employee;
    begin
        "Created By" := UserId;
        "Created Date Time" := CurrentDateTime;
        ArcEmpPromotionHistRec.Reset();
        ArcEmpPromotionHistRec.Init();
        ArcEmpPromotionHistRec.TransferFields(Rec);
        ArcEmpPromotionHistRec.Insert(true);
        if Rec."To Designation" <> '' then begin
            If employee.Get(Rec."HRMS ID") then begin
                employee.Designation := Rec."To Designation";
                employee.Modify(true);
            end;
        end;
    end;

    trigger OnModify()
    begin
        "Modified By" := UserId;
        "Modified Date Time" := CurrentDateTime;
        ArcEmpPromotionHistRec.Reset();
        ArcEmpPromotionHistRec.Init();
        ArcEmpPromotionHistRec.TransferFields(Rec);
        ArcEmpPromotionHistRec.Insert(true);
    end;

    trigger OnDelete()
    begin
        ArcEmpPromotionHistRec.Reset();
        ArcEmpPromotionHistRec.Init();
        ArcEmpPromotionHistRec.TransferFields(Rec);
        ArcEmpPromotionHistRec.Insert(true);
    end;

    trigger OnRename()
    begin
        ArcEmpPromotionHistRec.Reset();
        ArcEmpPromotionHistRec.Init();
        ArcEmpPromotionHistRec.TransferFields(Rec);
        ArcEmpPromotionHistRec.Insert(true);
    end;
}
