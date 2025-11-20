table 33066442 "Employee History" //SS07OCT
{
    Caption = 'Employee History';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            AutoIncrement = true;
            DataClassification = SystemMetadata;
        }
        field(90; "Version No."; Integer)
        {
        }
        field(2; "Employee No."; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(3; "Archived DateTime"; DateTime)
        {
            DataClassification = SystemMetadata;
        }
        field(4; "Archived By"; Code[50])
        {
            DataClassification = SystemMetadata;
        }
        // Copy all your custom fields
        field(50002; "Bill Group"; Text[50])
        {
        }
        field(50003; "Bill Type"; Text[50])
        {
        }
        field(50004; "Account Type"; Option)
        {
            OptionMembers = " ","GPF","PRAN";
        }
        field(50005; "GPF/PRAN No"; Code[20])
        {
        }
        field(50006; "Designation"; Code[20])
        {
        }
        field(50008; "Post Group"; Option)
        {
            OptionMembers = " ",A,B,C,D;
        }
        field(50009; "Category"; Option)
        {
            OptionMembers = " ",General,OBC,SEBC,SC,ST;
        }
        field(50011; "D.O.S"; Date)
        {
        }
        field(50012; "Home Dist"; Code[20])
        {
        }
        field(50013; "Basic Gr. Pay"; Decimal)
        {
        }
        field(50014; "Pension Remark"; Option)
        {
            OptionMembers = " ","GPF","NPS";
        }
        field(50016; "EPIC No"; Code[30])
        {
        }
        field(50017; "Aadhaar No"; Code[12])
        {
        }
        field(50018; "Dept./Trade/Section"; Text[60])
        {
        }
        field(50019; "Joining Station"; Text[30])
        {
        }
        field(50020; "D.O.J (Service)"; Date)
        {
        }
        field(50021; "Current Station"; Code[100])
        {
        }
        field(50022; "Service Joining Designation"; Text[30])
        {
        }
        field(50023; "Base Qualification"; Code[20])
        {
        }
        field(50024; "Employment Status"; Option)
        {
            OptionMembers = " ","Ad hoc","Temporary status","Initial appointee","Regular",Inactive;
        }
        field(50025; "Date of increment"; Date)
        {
        }
        field(50026; "MACP Status"; Option)
        {
            OptionMembers = " ","Nil","1st","2nd","3rd";
        }
        field(50027; "Designation as per HRMS Site"; Text[250])
        {
        }
        field(50028; "Home Dist as per HRMS Site"; Text[250])
        {
        }
        field(50029; "SLCM Employee"; Boolean)
        {
        }
        field(50030; "Deployment Location"; Code[20])
        {
        }
        field(50031; "Deployment Date"; Date)
        {
        }
        field(50032; "Deployment End Date"; Date)
        {
        }
        field(50035; "college code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Institute."Institute Code";
        }
        field(50036; "modified by"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50037; "modified date time"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(50038; "Employment Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Employee name';
        }
        field(50039; "Mobile Phone No"; Text[14])
        {
        }
        field(50040; "Birth Date"; Date)
        {
            Caption = 'D.O.B';
        }
        field(50041; Email; text[100])
        {
        }
        field(50042; Gender; Enum "Employee Gender")
        {
        }
        field(50100; "Company Name"; Text[100])
        {
            Caption = 'Company Name';
            Editable = false;
        }
    }
    keys
    {
        key(PK; "Employee No.", "Version No.")
        {
            Clustered = true;
        }
    }
    procedure GetNextVersion(EmployeeNo: Code[20]): Integer
    var
        EmpArchive: Record "Employee history";
        e: Record Employee;
    begin
        EmpArchive.Reset();
        EmpArchive.SetRange("Employee No.", EmployeeNo);
        if EmpArchive.FindLast() then
            exit(EmpArchive."Version No." + 1)
        else
            exit(1);
    end;
}
