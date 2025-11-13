/* table 33065968 "Financial Upg Application"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "HRMS ID"; Code[20])
        {
            Caption = 'HRMS ID';
            DataClassification = ToBeClassified;
            TableRelation = Employee."No." where("SLCM Employee" = const(false));

            trigger OnValidate()
            var
                EmplRec: Record Employee;
            begin
                if EmplRec.Get("HRMS ID") then
                    if EmplRec."Middle Name" <> '' then
                        Name := EmplRec."First Name" + ' ' + EmplRec."Middle Name" + ' ' + EmplRec."Last Name"
                    else
                        Name := EmplRec."First Name" + ' ' + EmplRec."Last Name";
                Designation := EmplRec.Designation;
            end;
        }
        field(2; Name; Text[90])
        {
            Caption = 'Employee Name';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(3; Designation; Code[20])
        {
        }
        field(4; "Date of application upload"; Date)
        {
            Caption = 'Date of application upload';
            DataClassification = ToBeClassified;
        }
        field(5; "Type"; Option)
        {
            Caption = 'Type';
            DataClassification = ToBeClassified;
            OptionMembers = " ",MACP,RACP;
        }
        field(6; "Application file"; Blob)
        {
            Caption = 'Application file';
            DataClassification = ToBeClassified;
        }
        field(7; "Application file name"; Text[100])
        {
            Caption = 'Application file Name';
            DataClassification = ToBeClassified;
        }
        field(8; "Current Station"; Text[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Institute."Institute Code";
        }
        field(9; "Entry No."; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
        field(10; "Status"; Option)
        {
            OptionMembers = Applied,Objected,Processed,Rejected;
        }
        // Start Anmol 
        field(11; "Sl_no"; Integer)
        {
            DataClassification = ToBeClassified;
            // AutoIncrement = true;
        }
        field(14; "Effective Date Of MACP"; Date)
        {
            DataClassification = ToBeClassified;
        }
        // Helper to track whether this increment has been confirmed (alias for Status = Processed)

        field(13; "IsConfirmed"; Boolean) //ss16

        {

            Caption = 'Is Confirmed';

            DataClassification = ToBeClassified;

            Editable = false;

        }
 

    }
    keys
    {
        key(pk; "Entry No.", "HRMS ID")
        {
            Clustered = true;
        }
    }
    var
        myInt: Integer;
        ArchiveFinUpgTab: record "Financial Upg App history";

    trigger OnInsert()
    var
        entrno: Integer;
    begin

    end;

    trigger OnModify()
    var
        entrno: Integer;
        OldRec: Record "Financial Upg Application";
        ArchiveFinUpgTab: record "Financial Upg App history";


    begin

    end;

    trigger OnDelete()
    var
        entrno: Integer;
    begin
        ArchiveFinUpgTab.Reset();
        if ArchiveFinUpgTab.FindLast() then
            entrno := ArchiveFinUpgTab.Sl_no + 1
        else
            entrno := 1;

        ArchiveFinUpgTab.Init();
        ArchiveFinUpgTab.TransferFields(Rec, true);
        ArchiveFinUpgTab.Sl_no := entrno;

        ArchiveFinUpgTab."HRMS ID" := Rec."HRMS ID";
        ArchiveFinUpgTab."Current Station" := Rec."Current Station";

        ArchiveFinUpgTab.Insert(true);
    end;

    trigger OnRename()
    var
        entrno: Integer;
    begin
        ArchiveFinUpgTab.Reset();
        if ArchiveFinUpgTab.FindLast() then
            entrno := ArchiveFinUpgTab.Sl_no + 1
        else
            entrno := 1;

        ArchiveFinUpgTab.Init();
        ArchiveFinUpgTab.TransferFields(Rec, true);
        ArchiveFinUpgTab.Sl_no := entrno;

        ArchiveFinUpgTab."HRMS ID" := Rec."HRMS ID";
        ArchiveFinUpgTab."Current Station" := Rec."Current Station";

        ArchiveFinUpgTab.Insert(true);
    end;


    procedure GetNextVersion(HRmsid: Code[20]): Integer //SS07OCT
    var
        EmpArchive: Record "Financial Upg App history";
    begin
        EmpArchive.Reset();
        EmpArchive.SetRange("HRMS ID", HRmsid);
        if EmpArchive.FindLast() then
            exit(EmpArchive."no of versions" + 1)
        else
            exit(1);
    end;
}
 */

table 33065968 "Financial Upg Application"

{

    DataClassification = ToBeClassified;

    fields

    {

        field(1; "HRMS ID"; Code[20])

        {

            Caption = 'HRMS ID';

            DataClassification = ToBeClassified;

            TableRelation = Employee."No." where("SLCM Employee" = const(false));

            trigger OnValidate()

            var

                EmplRec: Record Employee;

            begin

                if EmplRec.Get("HRMS ID") then begin

                    if EmplRec."Middle Name" <> '' then
                        Name := EmplRec."First Name" + ' ' + EmplRec."Middle Name" + ' ' + EmplRec."Last Name"

                    else
                        Name := EmplRec."First Name" + ' ' + EmplRec."Last Name";

                    Designation := EmplRec.Designation;
                    "Current Station" := EmplRec."Current Station";

                end;

            end;

        }

        field(2; Name; Text[90])

        {

            Caption = 'Employee Name';

            DataClassification = ToBeClassified;

            Editable = false;

        }

        field(3; Designation; Code[20])

        {

        }

        field(4; "Date of application upload"; DateTime)

        {

            Caption = 'Date of application upload';

            DataClassification = ToBeClassified;

        }

        field(5; "Type"; Option)

        {

            Caption = 'Type';

            DataClassification = ToBeClassified;

            OptionMembers = " ",MACP,RACP;

        }

        field(6; "Application file"; Blob)

        {

            Caption = 'Application file';

            DataClassification = ToBeClassified;

        }

        field(7; "Application file name"; Text[100])

        {

            Caption = 'Application file Name';

            DataClassification = ToBeClassified;

        }

        field(8; "Current Station"; Text[50])

        {

            DataClassification = ToBeClassified;

            TableRelation = Institute."Institute Code";

        }

        field(9; "Entry No."; Integer)

        {

            DataClassification = ToBeClassified;

            AutoIncrement = true;

        }

        field(10; "Status"; Option)

        {

            OptionMembers = Applied,Objected,Processed,Rejected;

        }

        field(11; "Sl_no"; Integer)

        {

            DataClassification = ToBeClassified;

        }

        field(12; "Effective Date Of MACP"; Date)

        {

            DataClassification = ToBeClassified;

        }

        // Added helper boolean to mark a confirmed/processed increment (prevents accidental edit) //ss16oct

        field(13; "IsConfirmed"; Boolean)

        {

            Caption = 'Is Confirmed';

            DataClassification = ToBeClassified;

            Editable = false;


        }
        field(15; "Increment Amount"; Decimal)

        {

            Caption = 'Increment Amount';

            DataClassification = ToBeClassified;

            DecimalPlaces = 2 : 2;

        }
        field(16; "Type of increment"; Option)
        {
            OptionMembers = "Annual increment","Promotional increment";
        }
        //ss16oct


    }

    keys

    {

        key(pk; "Entry No.", "HRMS ID")

        {

            Clustered = true;

        }

    }

    var

        myInt: Integer;

        ArchiveFinUpgTab: Record "Financial Upg App history";

    trigger OnInsert()

    var

        entrno: Integer;

    begin

        // keep default behaviour — inserts from pages / actions //ss16oct

    end;

    trigger OnModify()

    var

        entrno: Integer;

        OldRec: Record "Financial Upg Application";

        ArchiveFinUpgTab: Record "Financial Upg App history";

    begin

        // Prevent direct modification of already confirmed (Processed) increments.

        // If status changes from non-Processed to Processed, archive a history version. //ss16oct

        if OldRec.Get("Entry No.", "HRMS ID") then begin

            // If modifying a previously confirmed record, block and instruct to create a new version //ss16oct

            if OldRec."Status" = OldRec.Status::Processed then
                Error('This increment (Entry No. %1) is already Confirmed/Processed. Create a new version instead.', OldRec."Entry No.");

            // If user changes status to Processed now, archive snapshot into history //ss16oct

            if (OldRec."Status" <> Rec."Status") and (Rec."Status" = Rec.Status::Processed) then begin

                ArchiveFinUpgTab.Reset();

                if ArchiveFinUpgTab.FindLast() then
                    entrno := ArchiveFinUpgTab.Sl_no + 1

                else
                    entrno := 1;
                //   ArchiveFinUpgTab.TransferFields(Rec, false); // false = copy only matching fields safely

                ArchiveFinUpgTab.Sl_no := entrno;

                // ✅ Manual assignments to ensure accuracy //ss16oct

                ArchiveFinUpgTab."HRMS ID" := Rec."HRMS ID";

                ArchiveFinUpgTab."Current Station" := Rec."Current Station";

                ArchiveFinUpgTab."Increment Amount" := Rec."Increment Amount";

                ArchiveFinUpgTab."IsConfirmed" := Rec."IsConfirmed";

                ArchiveFinUpgTab."User Id" := UserId();

                ArchiveFinUpgTab."Modified Date Time" := CurrentDateTime();

                // ArchiveFinUpgTab."college code" := 'DEFAULT'; // optional placeholder

                ArchiveFinUpgTab."no of versions" := GetNextVersion(Rec."HRMS ID");


                ArchiveFinUpgTab.Insert(true);

                Rec."IsConfirmed" := true; // mark confirmed //ss16oct

                Rec.Modify(false);

            end;

        end;

    end;

    trigger OnDelete()

    var

        entrno: Integer;

    begin

        // Archive deleted row into history for audit — change marked //ss16oct

        ArchiveFinUpgTab.Reset();

        if ArchiveFinUpgTab.FindLast() then
            entrno := ArchiveFinUpgTab.Sl_no + 1

        else
            entrno := 1;

        ArchiveFinUpgTab.Init();

        //    ArchiveFinUpgTab.TransferFields(Rec, true);
        ArchiveFinUpgTab."Application file name" := Rec."Application file name";
        ArchiveFinUpgTab."Date of application upload" := Rec."Date of application upload";
        ArchiveFinUpgTab."Effective Date Of MACP" := Rec."Effective Date Of MACP";
        ArchiveFinUpgTab.Name := Rec.Name;
        ArchiveFinUpgTab.Designation := Rec.Designation;
        ArchiveFinUpgTab."Type" := Rec.Type;
        ArchiveFinUpgTab."Current Station" := Rec."Current Station";
        ArchiveFinUpgTab."Status" := Rec.Status;

        ArchiveFinUpgTab.Sl_no := entrno;

        ArchiveFinUpgTab."HRMS ID" := Rec."HRMS ID";

        ArchiveFinUpgTab."Current Station" := Rec."Current Station";

        ArchiveFinUpgTab.Insert(true);

    end;

    /* trigger OnRename()

     var

         entrno: Integer;

     begin

         // Archive renamed row into history — change marked //ss16oct

         ArchiveFinUpgTab.Reset();

         if ArchiveFinUpgTab.FindLast() then
             entrno := ArchiveFinUpgTab.Sl_no + 1

         else
             entrno := 1;

         ArchiveFinUpgTab.Init();

         ArchiveFinUpgTab.TransferFields(Rec, true);

         ArchiveFinUpgTab.Sl_no := entrno;

         ArchiveFinUpgTab."HRMS ID" := Rec."HRMS ID";

         ArchiveFinUpgTab."Current Station" := Rec."Current Station";

         ArchiveFinUpgTab.Insert(true);

     end;*/

    procedure GetNextVersion(HRmsid: Code[20]): Integer //SS07OCT preserved, used by archive //ss16oct

    var

        EmpArchive: Record "Financial Upg App history";

    begin

        EmpArchive.Reset();

        EmpArchive.SetRange("HRMS ID", HRmsid);

        if EmpArchive.FindLast() then
            exit(EmpArchive."no of versions" + 1)

        else
            exit(1);

    end;

}

