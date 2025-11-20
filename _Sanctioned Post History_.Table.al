table 33066429 "Sanctioned Post History"
{
    Caption = 'Sanctioned Post History';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Code[30])
        {
            Caption = 'Entry No.';
        }
        field(2; "Sanctioned Post No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(3; "Old Sanctioned Strength"; Integer)
        {
            Caption = 'Old Sanctioned Strength';
        }
        field(4; "New Sanctioned Strength"; Integer)
        {
            Caption = 'Modified Sanctioned Strength';
        }
        field(5; "Designation"; Text[250])
        {
        }
        field(6; "Department/Trade/Section"; Text[250])
        {
        }
        field(7; "Modified By"; Code[50])
        {
            Caption = 'Modified By';
        }
        field(8; "Modified On"; DateTime)
        {
            Caption = 'Modified On';
        }
        field(10; "Approval No."; code[30])
        {
            DataClassification = CustomerContent;
            Caption = 'Approval No.';
        }
        field(11; "Version No."; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(12; ApplicantNo; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(13; Remarks; Text[250])
        {

        }
    }
    keys
    {
        key(PK; "Entry No.") //megha 9-6-25 Applicant No changed to entry no
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
        SanctionedPostHistory: Record "Sanctioned Post History";
    begin
        SanctionedPostHistory.Reset();
        if SanctionedPostHistory.FindLast() then
            Rec.ApplicantNo := SanctionedPostHistory.ApplicantNo + 1
        else
            Rec.ApplicantNo := 1;
    end;
}
