xmlport 33065472 "Employee Data Import"
{
    Caption = 'Employee Land Details';
    Direction = Import;
    Format = VariableText;

    schema
    {
    textelement(Root)
    {
    tableelement(Employee;
    Employee)
    {
    // XmlName = 'AER';
    fieldattribute(HRMS_ID;
    Employee."No.")
    {
    }
    fieldattribute(Name_of_the_Staff;
    Employee."First Name")
    {
    }
    fieldattribute(Bill_Group;
    Employee."Bill Group")
    {
    }
    fieldattribute(Bill_Type;
    Employee."Bill Type")
    {
    }
    fieldattribute(Account_Type;
    Employee."Account Type")
    {
    }
    fieldattribute(GPF_PRAN_No;
    Employee."GPF/PRAN No")
    {
    }
    fieldattribute(Designation_as_per_HRMS_Site;
    Employee."Designation as per HRMS Site")
    {
    }
    fieldattribute(Gender;
    Employee.Gender)
    {
    }
    fieldattribute(Post_Group;
    Employee."Post Group")
    {
    }
    fieldattribute(Category;
    Employee.Category)
    {
    }
    fieldattribute(D_O_B;
    Employee."Birth Date")
    {
    }
    fieldattribute(D_O_S;
    Employee."D.O.S")
    {
    }
    fieldattribute(Home_Dist_as_per_HRMS_Site;
    Employee."Home Dist as per HRMS Site")
    {
    }
    fieldattribute(Basic_Gr_Pay;
    Employee."Basic Gr. Pay")
    {
    }
    fieldattribute(Email_ID;
    Employee."E-Mail")
    {
    }
    fieldattribute(Mobile_no;
    Employee."Mobile Phone No.")
    {
    }
    fieldattribute("EPIC_No";
    Employee."EPIC No")
    {
    }
    fieldattribute("Aadhaar_No";
    Employee."Aadhaar No")
    {
    }
    fieldattribute("DeploymentLocation";
    Employee."Deployment Location")
    {
    }
    fieldattribute("DeploymentDate";
    Employee."Deployment Date")
    {
    }
    }
    }
    }
    var myInt: Integer;
}
