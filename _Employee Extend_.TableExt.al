tableextension 33065861 "Employee Extend" extends Employee
{
    LookupPageId = "Employee Custom Lists";
    DrillDownPageId = "Employee Custom Lists";

    fields
    {
        field(70501;"No. of Archived Versions";Integer) //SS07OCT
        {
            Caption = 'No. of Archived Versions';
            FieldClass = FlowField;
            CalcFormula = count("Employee History" where("Employee No."=field("No.")));
            Editable = false;
        }
        field(50002;"Bill Group";Text[50])
        {
            DataClassification = ToBeClassified;
        //OptionMembers = " ","Gazetted","Non-Gazetted";
        }
        field(50003;"Bill Type";Text[50])
        {
            DataClassification = ToBeClassified;
        // OptionMembers = " ","Regular","Ad-hoc","Initial Appointee","Temporary Status";
        }
        field(50004;"Account Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ", "GPF", "PRAN";
        }
        field(50005;"GPF/PRAN No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50006;"Designation";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Designation.Code;
        }
        field(50008;"Post Group";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ", A, B, C, D;
        }
        field(50009;"Category";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ", General, OBC, SEBC, SC, ST;
        }
        field(50011;"D.O.S";Date)
        {
            Caption = 'D.O.S (Date of Superannuation)';
            DataClassification = ToBeClassified;
        }
        field(50012;"Home Dist";code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = District.Code;
        // trigger OnLookup()
        // var
        //     DistrictsDistictVar: Record District;
        // begin
        //     DistrictsDistictVar.reset;
        //     if DistrictsDistictVar.FindSet() then;
        //     IF PAGE.RUNMODAL(PAGE::"DistrictList", DistrictsDistictVar) = ACTION::LookupOK THEN
        //         rec."Home Dist" := DistrictsDistictVar.Code;
        // end;
        }
        field(50013;"Basic Gr. Pay";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50014;"Pension Remark";Option)
        {
            // Start Anmol 17 Jan 2025
            // OptionMembers = " ", "Regular", "NPS";
            // End Anmol
            OptionMembers = " ", "GPF", "NPS";
        }
        field(50016;"EPIC No";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50017;"Aadhaar No";Code[12])
        {
            DataClassification = ToBeClassified;
        }
        field(50018;"Dept./Trade/Section";Text[60])
        {
            DataClassification = ToBeClassified;
            TableRelation = "List of all Dep/trades/Section"."Departments/Trades/Section";
        }
        field(50019;"Joining Station";Text[30])
        {
            DataClassification = ToBeClassified;
        // trigger OnLookup()
        // var
        //     InstitudeRecL: Record Institute;
        // begin
        //     InstitudeRecL.Reset();
        //     IF PAGE.RUNMODAL(PAGE::"Institute Lists", InstitudeRecL) = ACTION::LookupOK THEN
        //         "Joining Station" := InstitudeRecL."Institute Name";
        // end;
        }
        field(50020;"D.O.J (Service)";Date)
        {
            DataClassification = ToBeClassified;
        }
        //Start Anmol 21 Feb 2025 code length change 20 to 100
        // field(50021; "Current Station"; Code[20])
        field(50021;"Current Station";Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = Institute."Institute Code";
        // trigger OnLookup()
        // var
        //     InstitudeRecL: Record Institute;
        // begin
        //     InstitudeRecL.Reset();
        //     IF PAGE.RUNMODAL(PAGE::"Institute Lists", InstitudeRecL) = ACTION::LookupOK THEN
        //         "Current Station" := InstitudeRecL."Institute Name";
        // end;
        }
        /*  field(50021; "Current Station"; Code[20])
         {
             DataClassification = ToBeClassified;
             TableRelation = Institute."Institute Code";
             // trigger OnLookup()
             // var
             //     InstitudeRecL: Record Institute;
             // begin
             //     InstitudeRecL.Reset();
             //     IF PAGE.RUNMODAL(PAGE::"Institute Lists", InstitudeRecL) = ACTION::LookupOK THEN
             //         "Current Station" := InstitudeRecL."Institute Name";
             // end;
         } */
        field(50022;"Service Joining Designation";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50023;"Base Qualification";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50024;"Employment Status";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ", "Ad hoc", "Temporary status", "Initial appointee", "Regular", Inactive;
        }
        field(50025;"Date of increment";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50026;"MACP Status";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ", "Nil", "1st", "2nd", "3rd";
            NotBlank = true;
        }
        field(50027;"Designation as per HRMS Site";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(50028;"Home Dist as per HRMS Site";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(50029;"SLCM Employee";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50030;"Deployment Location";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Institute."Institute Code";
        }
        field(50031;"Deployment Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50032;"Deployment Start Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50033;"Deployment End Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        modify("No.")
        {
        trigger OnBeforeValidate()var CompanyLLRec: Record Company;
        Emplrec: Record Employee;
        begin
            CompanyLLRec.Reset();
            if CompanyLLRec.FindSet()then repeat Emplrec.ChangeCompany(CompanyLLRec.Name);
                    if Emplrec.Get(Rec."No.")then Error('This Employee No. %1 is already Exist in %2 Company for Employee %3!', Rec."No.", CompanyLLRec.Name, Emplrec."First Name");
                until CompanyLLRec.Next() = 0 end;
        }
    }
    var myInt: Integer;
}
