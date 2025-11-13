page 33065724 "TestPageForHRMS Module"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;

    //     SourceTable = TableName;
    actions
    {
        area(Processing)
        {
            action(DataDelete)
            {
                ApplicationArea = All;
                Image = Delete;

                trigger OnAction()var EmployeeLrec: Record Employee;
                Cmp: Record Company;
                begin
                    if Confirm('Dou you want to delete Employee data Companies ?')then begin
                        Cmp.Reset();
                        Cmp.SetFilter(Name, '%1|%2|%3|%4|%5', 'DTE&T, Odisha', 'Govt ITI Rayagada Gajapati', 'GOVT Polytechnic Bargarh', 'MADHUSUDAN ITI CHOUDWAR', 'PURNA CHANDRA ITI, BARIPADA');
                        if Cmp.FindSet()then repeat // EmployeeLrec.ChangeCompany(Cmp.Name);
 // EmployeeLrec.Reset();
                            // if EmployeeLrec.FindSet() then
                            //     EmployeeLrec.DeleteAll();
                            until Cmp.next = 0;
                        Message('Done');
                    end;
                end;
            }
            action(CustomCompanyRecDataDelete)
            {
                ApplicationArea = All;

                trigger OnAction()var custCmp: Record Custom_Company;
                begin
                    if Confirm('Dou you want to delete Custom Companies ?')then begin
                    // custCmp.Reset();
                    // if custCmp.FindSet() then
                    //     custCmp.DeleteAll();
                    // Message('Company Data deleted');
                    end;
                end;
            }
            action(DeleteCourse)
            {
                ApplicationArea = All;

                trigger OnAction()var CourseLRec: Record "Course - COLLEGE";
                Cmp: Record Company;
                begin
                    Cmp.Reset();
                    Cmp.SetFilter(Name, '<>%1&<>%2', 'DTE&T, Odisha', 'CRONUS India Ltd.');
                    if Cmp.FindFirst()then repeat // Message(Cmp.Name);
 // CourseLRec.ChangeCompany(Cmp.Name);
                        // CourseLRec.Reset();
                        // if CourseLRec.FindSet() then
                        //     CourseLRec.DeleteAll();
                        until Cmp.Next() = 0;
                    Message('Course data deleted');
                end;
            }
        }
    }
    var myInt: Integer;
}
