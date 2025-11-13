xmlport 33065471 "Employee Data Export"
{
    Caption = 'Employee Data Export';
    Direction = Export;
    FormatEvaluate = Legacy;
    Format = VariableText;
    FieldSeparator = ',';
    FieldDelimiter = '';

    schema
    {
    textelement(Root)
    {
    tableelement("Employee_Data";
    Integer)
    {
    XmlName = 'export';
    SourceTableView = sorting(number)WHERE(Number=const(1));

    textattribute(HRMSID)
    {
    }
    textattribute(Name_of_the_Staff)
    {
    }
    textattribute(Bill_Group)
    {
    }
    textattribute(Bill_Type)
    {
    }
    textattribute(Account_Type)
    {
    }
    textattribute(GPF_PRAN_No)
    {
    }
    textattribute(Designation_as_per_HRMS_Site)
    {
    }
    textattribute(Gender)
    {
    }
    textattribute(Post_Group)
    {
    }
    textattribute(Category)
    {
    }
    textattribute(D_O_B)
    {
    }
    textattribute(D_O_S)
    {
    }
    textattribute(Home_Dist_as_per_HRMS_Site)
    {
    }
    textattribute(Basic_Gr_Pay)
    {
    }
    textattribute(Email_ID)
    {
    }
    textattribute(Mobile_no)
    {
    }
    textattribute(EPIC_No)
    {
    }
    textattribute(Aadhaar_No)
    {
    }
    }
    }
    }
    trigger OnInitXmlPort()var myInt: Integer;
    begin
        HRMSID:=EmployeeVar.FieldCaption("No.");
        Name_of_the_Staff:=EmployeeVar.FieldCaption("First Name");
        Bill_Group:=EmployeeVar.FieldCaption("Bill Group");
        Bill_Type:=EmployeeVar.FieldCaption("Bill Type");
        Account_Type:=EmployeeVar.FieldCaption("Account Type");
        GPF_PRAN_No:=EmployeeVar.FieldCaption("GPF/PRAN No");
        Designation_as_per_HRMS_Site:=EmployeeVar.FieldCaption("Designation as per HRMS Site");
        Gender:=EmployeeVar.FieldCaption(Gender);
        Post_Group:=EmployeeVar.FieldCaption("Post Group");
        Category:=EmployeeVar.FieldCaption(Category);
        D_O_B:=EmployeeVar.FieldCaption("Birth Date");
        D_O_S:=EmployeeVar.FieldCaption("D.O.S");
        Home_Dist_as_per_HRMS_Site:=EmployeeVar.FieldCaption("Home Dist as per HRMS Site");
        Basic_Gr_Pay:=EmployeeVar.FieldCaption("Basic Gr. Pay");
        Email_ID:=EmployeeVar.FieldCaption("E-Mail");
        Mobile_no:=EmployeeVar.FieldCaption("Mobile Phone No.");
        EPIC_No:=EmployeeVar.FieldCaption("EPIC No");
        Aadhaar_No:=EmployeeVar.FieldCaption("Aadhaar No");
    end;
    var EmployeeVar: Record Employee;
}
