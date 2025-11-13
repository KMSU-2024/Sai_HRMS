table 33066434 "TempEmployeeHistory" //SS07OCT c
{
    DataClassification = ToBeClassified;
    TableType = Temporary;

    fields
    {
        field(1; "Line ID"; Integer)
        {
        }
        field(2; "Company Name"; Text[100])
        {
        }
        field(3; "No."; Code[20])
        {
        } // Employee No.
        field(4; "HRMS ID"; Code[20])
        {
        }
        field(5; "First Name"; Text[100])
        {
        }
        field(6; "Designation"; Text[100])
        {
        }
        field(7; "Employment Status"; Text[50])
        {
        }
        field(8; "Current Station"; Text[100])
        {
        }
        field(9; "Deployment Location"; Text[100])
        {
        }
        // Continue with same fields as Employee Promotion History
        field(10; "Employee Name"; Text[100])
        {
        }
        field(11; "Bill Group"; Text[50])
        {
        }
        field(12; "Bill Type"; Text[50])
        {
        }
        field(13; "Account Type"; Text[50])
        {
        }
        field(14; "Designation as per HRMS Site"; Text[100])
        {
        }
        field(15; "Dept./Trade/Section"; Text[100])
        {
        }
        field(16; "Post Group"; Text[50])
        {
        }
        field(17; "GPF/PRAN No"; Text[30])
        {
        }
        field(18; "Birth Date"; Date)
        {
        }
        field(19; "Gender"; Option)
        {
            OptionMembers = Male,Female,Other;
        }
        field(20; "D.O.S (Date of Superannuation)"; Date)
        {
        }
        field(21; "Category"; Text[50])
        {
        }
        field(22; "Joining Station"; Text[100])
        {
        }
        field(23; "D.O.J (Service)"; Date)
        {
        }
        field(24; "Service Joining Designation"; Text[100])
        {
        }
        field(25; "Base Qualification"; Text[100])
        {
        }
        field(26; "Home Dist as per HRMS Site"; Text[100])
        {
        }
        field(27; "Home Dist"; Text[100])
        {
        }
        field(28; "Basic Gr. Pay"; Decimal)
        {
        }
        field(29; "Date of increment"; Date)
        {
        }
        field(30; "Email"; Text[100])
        {
        }
        field(31; "EPIC No"; Text[50])
        {
        }
        field(32; "MACP Status"; Text[50])
        {
        }
        field(33; "Mobile Phone No."; Text[20])
        {
        }
        field(34; "Pension Remark"; Text[250])
        {
        }
        field(35; "Status"; Text[50])
        {
        }
        field(36; "SLCM Employee"; Boolean)
        {
        }
        field(37; "Deployment Start Date"; Date)
        {
        }
        field(38; "Deployment Start Date1"; Date)
        {
        }
        field(39; "Deployment End Date"; Date)
        {
        }
        field(40; "Last Name"; Text[50])
        {
        }
    }
    keys
    {
        key(PK; "Line ID")
        {
            Clustered = true;
        }
    }
}
