table 33065573 "Room Wise Details History"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1;"Entry No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Building/Block Name ";Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Type of Building";Option)
        {
            OptionMembers = "", "Gate Complex", "Admininstrative Building", "Workshop Building", "Institutional Building", "Staff Quarter", "Auditorium", "Guest House", "Hostel Building";
            DataClassification = ToBeClassified;
        }
        field(4;"Room No.";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Floor No.";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(6;"TRADE/DEPT";Code[20])
        {
            DataClassification = ToBeClassified;
        //TableRelation = "List of all Dep/trades/Section";
        }
        field(7;"Area of flooring";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Type of flooring";Option)
        {
            OptionMembers = "", "Concrete", "Tiles", "Carpet", " Wood Flooring";
            DataClassification = ToBeClassified;
        }
        field(9;"Area of Short wall";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Area of Long wall";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Area of Ceiling";decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Type of ceiling";Option) //
        {
            OptionMembers = "", "Wooden Ceiling", "Plywood Ceiling", "Concrete Ceiling", "Beamed Ceiling", "Others";
            DataClassification = ToBeClassified;
        }
        field(13;"No of Window";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(14;"No of Doors";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Type of door";Option) //
        {
            OptionMembers = "", "Wooden", "Metal", "UPVC", "Glass", "Composite";
            DataClassification = ToBeClassified;
        }
        field(16;"No of officer cabinet";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(17;"No of Chair";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(18;"No of Table";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(19;"Type of Table";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "", "Computer Table", "Wooden Table", "Metal Table", "Conference Table", " Others";
        }
        field(20;"No of Desk";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(21;"Type of Desk";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "", "Single Seated Desk", "Double Seated Desk", "Wooden Desk", "Metal Desk", "Others";
        }
        field(22;"AC";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(23;"No of Fan(Ceiling)";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(25;"No of Fan(Wall)";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(26;"No of Ceiling Light";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(27;"No of CCTV";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(29;"No of Desktop";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(30;"No of Printer";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(31;"Sofa";option)
        {
            DataClassification = ToBeClassified;
            optionmembers = "", "Available", "Not Available";
        }
        field(32;"Area of Office Cabinet";decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(33;"Type of Window";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "", "Sliding", "Fixed", "Cottage", "Single Hung", "Casemen";
        }
        field(34;"Type of Chair";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "Arm chair", "Wooden Chair", "Wheel chair", "Plastic Chair", " Metal Chair";
        }
        field(35;"Type of Ceiling(Fan)";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "", "Regular Fan", "Smart Fan", "Others";
        }
        field(36;"Uploaded Photo Of Room";Blob)
        {
            DataClassification = ToBeClassified;
        }
        field(37;"Uploaded File Name ";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(38;"No Of Bed ";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(40;"No Of Wall Cabinet ";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(39;"Type of Bed";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "", "Iron", "Wooden", "others";
        }
        field(41;"Type of Wall Cabinet";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "", "Wall Cabinet", "Stock Cabinet", "Custom Cabinet";
        }
        field(42;"Type of Fan(Wall)";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "", "Tower Fan", "Floor Fan", "Exhaust Fan", "Others";
        }
        field(43;"Update No.";Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
        field(44;"Modified By";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(45;"Modified Date";DateTime)
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(pk;"Update No.")
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
    // Add changes to field groups here
    }
    var myInt: Integer;
    trigger OnInsert()begin
    end;
    trigger OnModify()begin
    end;
    trigger OnDelete()begin
    end;
    trigger OnRename()begin
    end;
    procedure Assistedit(): Boolean var myInt: Integer;
    begin
        InfraSetup.GET();
        InfraSetup.TESTFIELd("Room Wise Details No.");
        if NoSeriesManagementGvar.SelectSeries(InfraSetup."Room Wise Details No.", "Entry No.", "Entry No.")THEN begin
            NoSeriesManagementGvar.SetSeries("Entry No.")end;
    end;
    var InfraSetup: Record "Infrastructure Setup";
    NoSeriesManagementGvar: Codeunit NoSeriesManagement;
}
