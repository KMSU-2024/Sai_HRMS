table 33066428 "Sanctioned v/s Vacant"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Sanctioned Post No."; Code[20])
        {
            trigger OnValidate()
            var
                SanctionedvsVacantLrec: Record "Sanctioned v/s Vacant";
            begin
                /*  if "Sanctioned Post No." <> xRec."Sanctioned Post No." THEN BEGIN
                     SalesSetup.Get();
                     noseries.TestManual(SalesSetup."Sanctioned Post No.");
                     "No. Series" := '';
                 end; */
                if "Sanctioned Post No." < xRec."Sanctioned Post No." then
                    if not SanctionedvsVacantLrec.Get(Rec."Sanctioned Post No.") then begin
                        SalesSetup.Get();
                        NoSeriesMgt.TestManual(SalesSetup."Sanctioned Post No.");
                        "No. Series" := '';
                    end;
            end;
        }
        field(2; "Department/Trade/Section"; Text[60])
        {
            TableRelation = "List of all Dep/trades/Section"."Departments/Trades/Section";
            NotBlank = true;
            /*  trigger OnValidate()
                 var

                     sanctioned: Record "Sanctioned v/s Vacant";
                 begin
                     sanctioned.reset;
                     sanctioned.setrange("Department/Trade/Section", Rec."Department/Trade/Section");
                     sanctioned.SetRange(Designation, Rec.Designation);
                     if sanctioned.FindFirst() then
                         Error('A Record Department/Trade/Section %1 and Designation %2 alredy Exist ', Rec."Department/Trade/Section", Rec.Designation);
                 end; */
        }
        field(3; "Designation"; Code[20])
        {
            TableRelation = Designation.Code;
            //ValidateTableRelation = false;
            NotBlank = false;

            trigger OnValidate()
            var
                sanctioned: Record "Sanctioned v/s Vacant";
            begin
                sanctioned.reset;
                sanctioned.setrange("Department/Trade/Section", Rec."Department/Trade/Section");
                sanctioned.SetRange(Designation, Rec.Designation);
                if sanctioned.FindFirst() then Error('A Record Department/Trade/Section %1 and Designation %2 alredy Exist ', Rec."Department/Trade/Section", Rec.Designation);
            end;
        }
        field(4; "Sactioned Strength"; Integer)
        {
            trigger OnValidate()
            var
                myInt: Integer;
            begin
                IF xRec."Sactioned Strength" <> 0 then
                    "XSactioned Strength" := xRec."Sactioned Strength";
                rec.Modify();
            end;
        }
        field(5; "Remarks"; Text[60])
        {
            trigger OnValidate()
            var
                myInt: Integer;
            begin
                IF xRec.Remarks <> '' then
                    xRemarks := xRec.Remarks;
                rec.Modify();
            end;
        }
        field(6; "Uploaded Document"; Boolean)
        {
        }
        field(7; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(8; "Financial Year"; Code[20])
        {
            TableRelation = "Financial Year"."Financial Code";
        }
        field(9; "Approval No."; Code[30])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
                sanctioned: Record "Sanctioned v/s Vacant";
            begin
                sanctioned.reset;
                // sanctioned.setrange("Department/Trade/Section", Rec."Department/Trade/Section");
                sanctioned.SetRange("Approval No.", Rec."Approval No.");
                if sanctioned.FindFirst() then Error('A Record Approval No. %1 ', Rec."Approval No.");
                IF xRec."Approval No." <> '' then
                    "XApproval No." := xRec."Approval No.";
                rec.Modify();
            end;
        }
        field(10; Lineno; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(11; submit; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(12; submit2; Boolean)
        {
            DataClassification = ToBeClassified;
        }



        field(13; "XSactioned Strength"; Integer)
        {
            DataClassification = ToBeClassified;


        }
        field(14; "XApproval No."; Code[30])
        {
            DataClassification = ToBeClassified;


        }
        field(15; "xRemarks"; Text[60])
        {
        }
        field(16; "Vacant Positions"; Integer)//megha 18-9-25
        {

        }
        field(17; "Person in Position"; Integer)//megha 18-9-25
        {

        }
        field(18; "File Name"; Text[100])
        {

        }

    }
    keys
    {
        key(PK; "Sanctioned Post No.")
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        // Add changes to field groups here
    }
    trigger OnInsert()
    var
        sanctioned: Record "Sanctioned v/s Vacant";
        AnnualEst: Record "Annual Establishment Review";
        emp: Record Employee;
    begin
        SalesSetup.Get;
        if "Sanctioned Post No." = '' then begin
            SalesSetup.TestField("Sanctioned Post No.");
            NoSeriesMgt.InitSeries(SalesSetup."Sanctioned Post No.", xRec."No. Series", 0D, "Sanctioned Post No.", "No. Series");
            // Message('Generated Document No: %1', Rec."Sanctioned Post No."); // Debugging line
        end;



        if (Rec.Designation <> '') and (rEC."Department/Trade/Section" <> '') then begin
            AnnualEst.init();
            AnnualEst."Dept./Trade/Section" := Rec."Department/Trade/Section";
            AnnualEst.Designation := Rec.Designation;
            emp.SetRange(Designation, Rec.Designation);
            emp.SetRange("Dept./Trade/Section", Rec."Department/Trade/Section");
            Rec."Person in Position" := emp.Count();
            rec."Vacant Positions" := Rec."Sactioned Strength" - Rec."Person in Position";
            AnnualEst."Sanctioned Strength" := Rec."Sactioned Strength";
            AnnualEst."Persons in Position " := Rec."Person in Position";
            AnnualEst."Vacancy Position " := Rec."Sactioned Strength" - Rec."Person in Position";
            AnnualEst.Insert(true);

        end


        else begin
            Message('No matching Annual Establishment record found for Department %1 and Designation %2.',
              Rec."Department/Trade/Section", Rec.Designation);
        end;



        /* if "Sanctioned Post No." = '' then begin
                SalesSetup.Get();
                SalesSetup.TestField("Sanctioned Post No.");
                "No. Series" := SalesSetup."Sanctioned Post No.";
                if NoSeries.AreRelated(SalesSetup."Sanctioned Post No.", xRec."No. Series") then
                    "No. Series" := xRec."No. Series";
                "Sanctioned Post No." := NoSeries.GetNextNo("No. Series");
            end; */
    end;
    /* trigger OnModify()
    var
        SanctionedHistory: Record "Sanctioned Post History";
    begin
        if Rec."Sactioned Strength" <> xRec."Sactioned Strength" then begin
            SanctionedHistory.Init();
            SanctionedHistory.Validate("Sanctioned Post No.", "Sanctioned Post No.");
            SanctionedHistory.Validate("Old Sanctioned Strength", xRec."Sactioned Strength");
            SanctionedHistory.Validate("New Sanctioned Strength", Rec."Sactioned Strength");
            SanctionedHistory.Validate("Modified By", UserId);
            SanctionedHistory.Validate("Modified On", CurrentDateTime);
            SanctionedHistory.Insert();
        end;
    end; */
    trigger OnDelete()
    begin
    end;

    trigger OnRename()
    begin
    end;

    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
        SalesSetup: Record "Sales & Receivables Setup";
        isfilled: Boolean;
}
