page 33066443 "Employee Leave Applicat. card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Documents;
    Caption = 'Employee Leave Application Card';

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("HRMS ID"; HRMSID)
                {
                    ApplicationArea = All;
                    TableRelation = Employee."No.";

                    trigger OnValidate()
                    var
                        EMPREC: Record Employee;
                    begin
                        EMPREC.Get(HRMSID);
                        Name := EMPREC."First Name";
                        designVar := EMPREC.Designation;
                    end;
                }
                field("Employee Name"; Name)
                {
                    Caption = 'Employee Name';
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Designation"; designVar)
                {
                    ApplicationArea = All;
                    Editable = false;
                    Caption = 'Designation';
                }
                field("From date"; FromDate)
                {
                    ApplicationArea = All;
                    Caption = 'Leave From Date';
                }
                field("To date"; todate)
                {
                    ApplicationArea = All;
                    Caption = 'Leave To Date';

                    trigger OnValidate()
                    begin
                        if todate < FromDate then Error('To Date %1 is must be greater than or equal to To date %2', FromDate, todate);
                    end;
                }
                field("Type of Leave"; TypeofLeave)
                {
                    ApplicationArea = All;
                    Caption = 'Type of Leave';
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Leave Apply")
            {
                ApplicationArea = All;
                Image = LaunchWeb;

                trigger OnAction()
                var
                    EmpLeaveAppRec: Record "Employee Leave Application";
                begin
                    if Confirm('Dou you want to apply leave ?', false) then begin
                        EmpLeaveAppRec.Reset();
                        EmpLeaveAppRec.Init();
                        EmpLeaveAppRec."HRMS ID" := HRMSID;
                        EmpLeaveAppRec."Employee Name" := Name;
                        EmpLeaveAppRec.Designation := designVar;
                        EmpLeaveAppRec."Leave From Date" := FromDate;
                        EmpLeaveAppRec."Leave To Date" := todate;
                        EmpLeaveAppRec."Type of Leave" := TypeofLeave;
                        if fileName <> '' then begin
                            EmpLeaveAppRec."Upload Document".CreateOutStream(Outstream1);
                            CopyStream(Outstream1, Instream1);
                        end;
                        EmpLeaveAppRec.Insert(true);
                        Message('Document Submitted');
                        CurrPage.Close();
                    end;
                end;
            }
            action("Add Document")
            {
                ApplicationArea = All;
                Image = Add;

                trigger OnAction()
                var
                    filePath: Text;
                    txt: Text;
                    flname: Text;
                begin
                    fileName := Filemgmt.BLOBImportWithFilter(Tempblob, 'Upload File', '', 'All Files (*.*)|*.pdf*', '.pdf');
                    Instream1 := Tempblob.CreateInStream();
                    if Tempblob.Length() > 3000000 then
                        Error('File size must be less than or equal to 3MB')
                    else
                        Message('File uploded');
                end;
            }
            action("Download Document")
            {
                ApplicationArea = All;
                Image = Download;

                trigger OnAction()
                var
                    FilemngCU: Codeunit "File Management";
                begin
                    if Tempblob.Length() > 0 then
                        fileName := FilemngCU.BLOBExport(Tempblob, 'Leave_Document_' + HRMSID + '.pdf', true)
                    else
                        Error('Document Not found');
                end;
            }
        }
    }
    var
        FromDate: Date;
        todate: Date;
        HRMSID: Code[20];
        Name: Text[30];
        designVar: Code[20];


        // Start anmol add two new fields in option CL and Paternity Leave
        // TypeofLeave: Option "EL", "HPL", "EOL", "Medical Leave", "Maternity Leave", "Study Leave", Other;
        TypeofLeave: Option "EL","HPL","EOL","CL","Paternity Leave","Medical Leave","Maternity Leave","Study Leave",Other;
        fileName: Text;
        Filemgmt: Codeunit "File Management";
        Tempblob: Codeunit "Temp Blob";
        Instream1: InStream;
        Outstream1: OutStream;
}
