page 33065734 "StaffProfile & AwardAchivement"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'Employee Profile & Award Achievement';

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(HRMSID;HRMSID)
                {
                    ApplicationArea = All;
                    Caption = 'HRMS ID';
                    TableRelation = Employee."No." where("SLCM Employee"=const(false));

                    trigger onValidate()var Employee: Record 5200;
                    begin
                        Employee.Reset();
                        Employee.SetRange("No.", HRMSID);
                        If Employee.FindFirst()then begin
                            Name:=Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                            Designation:=Employee.Designation;
                            BaseQualification:=Employee."Base Qualification";
                        end;
                    end;
                }
                field("Employee Name";Name)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Designation;Designation)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(BaseQualification;BaseQualification)
                {
                    Editable = false;
                    Caption = 'Base Qualification';
                    ApplicationArea = All;
                }
                field(InserviceQuaUpgradation;InserviceQuaUpgradation)
                {
                    Caption = 'Inservice Qualification Upgradation';
                    ApplicationArea = All;

                    trigger onvalidate()begin
                        Clear(QualificationEdit);
                        If InserviceQuaUpgradation = true then begin
                            QualificationEdit:=true;
                            Award:=false;
                            clear(AwardDetails);
                            AwardEdit:=false;
                        end;
                    end;
                }
                field("Inservice Detailes";InserviceQalificationDetailes)
                {
                    ApplicationArea = All;
                    Caption = 'In-service Qualification Details';
                    Editable = QualificationEdit;
                }
                field(AchivementRemarks;AchivementRemarks)
                {
                    ApplicationArea = All;
                    Caption = 'Achivement Remarks';
                // Editable = QualificationEdit;
                }
                field(Award;Award)
                {
                    ApplicationArea = All;

                    trigger onvalidate()var myInt: Integer;
                    begin
                        Clear(AwardEdit);
                        If Award = true then begin
                            AwardEdit:=True;
                            InserviceQuaUpgradation:=false;
                            Clear(InserviceQalificationDetailes);
                            QualificationEdit:=false;
                        end;
                    end;
                }
                field(AwardDetails;AwardDetails)
                {
                    Caption = 'Award Details';
                    Editable = AwardEdit;
                    ApplicationArea = All;
                }
                field(AcademicYear;AcademicYear)
                {
                    Caption = 'Academic Year';
                    ApplicationArea = All;
                    TableRelation = "Academic Year".Code;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Upload Document")
            {
                ApplicationArea = All;
                Image = Add;

                trigger OnAction()var filePath: Text;
                txt: Text;
                flname: Text;
                begin
                    fileName:=Filemgmt.BLOBImportWithFilter(Tempblob, 'Upload File', '', 'All Files (*.*)|*.pdf*', '.pdf');
                    Instream1:=Tempblob.CreateInStream();
                    if Tempblob.Length() > 3000000 then Error('File size must be less than or equal to 3MB')
                    else
                        Message('File uploded');
                end;
            }
            action("Download Document")
            {
                ApplicationArea = All;
                Image = Download;

                trigger OnAction()var FilemngCU: Codeunit "File Management";
                begin
                    if Tempblob.Length() > 0 then fileName:=FilemngCU.BLOBExport(Tempblob, 'Application_' + HRMSID + '.pdf', true)
                    else
                        Error('Document Not found');
                end;
            }
            /* action(Submit)
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction()begin
                    StaffAchivementHist.Init();
                    StaffAchivementHist."HRMS ID":=HRMSID;
                    StaffAchivementHist.Name:=Name;
                    StaffAchivementHist.Designation:=Designation;
                    StaffAchivementHist."Base Qualification":=BaseQualification;
                    StaffAchivementHist."Inservice Qua. Upgradation":=InserviceQuaUpgradation;
                    StaffAchivementHist."Inservise Qualification Detail":=InserviceQalificationDetailes;
                    if AchivementRemarks <> '' then StaffAchivementHist."Achivement Remarks":=AchivementRemarks;
                    if AwardDetails <> '' then StaffAchivementHist."Award Details":=AwardDetails;
                    StaffAchivementHist.Award:=Award;
                    StaffAchivementHist."Award Details":=AwardDetails;
                    StaffAchivementHist."Achivement Remarks":=AchivementRemarks;
                    StaffAchivementHist."Academic Year":=AcademicYear;
                    StaffAchivementHist."Certificate FileName":=fileName;
                    if fileName <> '' then begin
                        StaffAchivementHist.Certificate.CreateOutStream(Outstream1);
                        CopyStream(Outstream1, Instream1);
                    end;
                    StaffAchivementHist.Insert(true);
                    CurrPage.Close();
                end;
            } */
            action(Submit) //SS07OCT
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction()begin
                    StaffAchivementHist.Init();
                    StaffAchivementHist."HRMS ID":=HRMSID;
                    StaffAchivementHist.Name:=Name;
                    StaffAchivementHist.Designation:=Designation;
                    StaffAchivementHist."Modified By":=UserId;
                    StaffAchivementHist."Modified Date Time":=CurrentDateTime;
                    StaffAchivementHist."Base Qualification":=BaseQualification;
                    StaffAchivementHist."Inservice Qua. Upgradation":=InserviceQuaUpgradation;
                    StaffAchivementHist."Inservise Qualification Detail":=InserviceQalificationDetailes;
                    if AchivementRemarks <> '' then StaffAchivementHist."Achivement Remarks":=AchivementRemarks;
                    if AwardDetails <> '' then StaffAchivementHist."Award Details":=AwardDetails;
                    StaffAchivementHist.Award:=Award;
                    StaffAchivementHist."Award Details":=AwardDetails;
                    StaffAchivementHist."Achivement Remarks":=AchivementRemarks;
                    StaffAchivementHist."Academic Year":=AcademicYear;
                    StaffAchivementHist."Certificate FileName":=fileName;
                    if fileName <> '' then begin
                        StaffAchivementHist.Certificate.CreateOutStream(Outstream1);
                        CopyStream(Outstream1, Instream1);
                    end;
                    StaffAchivementHist.Insert(true);
                    CurrPage.Close();
                end;
            }
        }
    }
    var HRMSID: Code[20];
    Name: Text[90];
    Designation: Code[20];
    BaseQualification: Text[50];
    InserviceQuaUpgradation: Boolean;
    Award: Boolean;
    AchivementRemarks: Text[250];
    AcademicYear: Code[10];
    StaffAchivementHist: Record "Staff Achivement History";
    fileName: Text;
    Filemgmt: Codeunit "File Management";
    Tempblob: Codeunit "Temp Blob";
    Instream1: InStream;
    Outstream1: OutStream;
    AwardDetails: Text[250];
    AwardEdit: Boolean;
    QualificationEdit: Boolean;
    InserviceQalificationDetailes: Text[250];
}
