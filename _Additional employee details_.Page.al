page 33066436 "Additional employee details"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Documents;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("HRMS ID";HRMSID)
                {
                    ApplicationArea = All;
                    TableRelation = Employee."No." where("SLCM Employee"=const(false));

                    trigger OnValidate()var EmpVar: Record Employee;
                    begin
                        EmpVar.Get(HRMSID);
                        EmpNameVar:=EmpVar."First Name";
                        DOJ:=EmpVar."D.O.J (Service)";
                        serviseDesgn:=EmpVar."Service Joining Designation";
                        joinStation:=EmpVar."Joining Station";
                        CurrStation:=EmpVar."Current Station";
                        BaseQualificationVar:=EmpVar."Base Qualification";
                        EmpStatusVar:=EmpVar."Employment Status";
                        dateOfIncVar:=EmpVar."Date of increment";
                        McapStatus:=EmpVar."MACP Status";
                        PensionRemVar:=EmpVar."Pension Remark";
                        DeptSecTrade:=EmpVar."Dept./Trade/Section";
                        DesignationVar:=EmpVar.Designation;
                        HomedistVar:=EmpVar."Home Dist";
                        dojEdit:=false;
                        serviseDesgnEdit:=false;
                        joinStationEdit:=false;
                        BaseQualificationVarEdit:=false;
                        CurrStationEdit:=false;
                        EmpStatusVarEdit:=false;
                        dateOfIncVarEdit:=false;
                        McapStatusEdit:=false;
                        PensionRemVarEdit:=false;
                        DeptSecTradeEdit:=false;
                        HomedistVarBool:=false;
                        DesignationVarBool:=HomedistVarBool;
                        //-- for conditional 
                        if DOJ = 0D then dojEdit:=true;
                        if serviseDesgn = '' then serviseDesgnEdit:=true;
                        if joinStation = '' then joinStationEdit:=true;
                        if CurrStation = '' then CurrStationEdit:=true;
                        if BaseQualificationVar = '' then BaseQualificationVarEdit:=true;
                        if EmpStatusVar = 0 then EmpStatusVarEdit:=true;
                        if dateOfIncVar = 0D then dateOfIncVarEdit:=true;
                        if McapStatus = 0 then McapStatusEdit:=true;
                        if PensionRemVar = 0 then PensionRemVarEdit:=true;
                        if DeptSecTrade = '' then DeptSecTradeEdit:=true;
                        if DesignationVar = '' then DesignationVarBool:=true;
                        if HomedistVar = '' then HomedistVarBool:=true;
                    end;
                }
                field("Employee Name";EmpNameVar)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Designation;DesignationVar)
                {
                    ApplicationArea = All;
                    Editable = DesignationVarBool;
                    TableRelation = Designation.Code;
                }
                field("Home Dist";HomedistVar)
                {
                    ApplicationArea = All;
                    Editable = HomedistVarBool;
                    TableRelation = District.Code;
                }
                field("D.O.J (Service)";DOJ)
                {
                    ApplicationArea = All;
                    Editable = dojEdit;
                }
                field("Service Joining Designation";serviseDesgn)
                {
                    ApplicationArea = All;
                    Editable = serviseDesgnEdit;
                }
                field("Deployment Start Date";DeploymentStartDate) //megha 16-05-2025
                {
                    Caption = 'Deployment Start Date';
                    ApplicationArea = all;
                }
                field("Deployment End Date";DeploymentEndDate) //megha 16-5-2025
                {
                    Caption = 'Deployment End Date';
                    ApplicationArea = all;
                }
                field("Deployment Location";DeploymentLocation)
                {
                    ApplicationArea = all;
                    TableRelation = Institute."Institute Code"; //megha 16-5-2025
                }
                field("Service Joining Station";joinStation)
                {
                    ApplicationArea = All;
                    Editable = joinStationEdit;
                // trigger OnDrillDown()
                // var
                //     myInt: Integer;
                // begin
                // end;
                }
                field("Current Station";CurrStation)
                {
                    ApplicationArea = All;
                    Editable = CurrStationEdit;
                    TableRelation = Institute."Institute Code";
                }
                field("Base Qualification";BaseQualificationVar)
                {
                    ApplicationArea = All;
                    Editable = BaseQualificationVarEdit;
                }
                field("Employment Status";EmpStatusVar)
                {
                    ApplicationArea = All;
                    Editable = EmpStatusVarEdit;
                }
                field("Date of increment";dateOfIncVar)
                {
                    ApplicationArea = All;
                    Editable = dateOfIncVarEdit;
                }
                field("MACP Status";McapStatus)
                {
                    ApplicationArea = All;
                    Editable = McapStatusEdit;

                    trigger onvalidate()var EmpRec: Record 5200;
                    Int2: Integer;
                    Int1: Integer;
                    begin
                        Int2:=McapStatus;
                        EmpRec.Reset();
                        EmpRec.SetRange("No.", HRMSID);
                        if EmpRec.FindFirst()then Int1:=EmpRec."MACP Status";
                        IF Int1 > Int2 then Error('You Cannot enter %1 macp value in this because you have already %2 macp value in employee card.', McapStatus, EmpRec."MACP Status");
                    end;
                }
                field("Pension Remark";PensionRemVar)
                {
                    ApplicationArea = All;
                    Editable = PensionRemVarEdit;
                }
                field("Dept./Trade/Section";DeptSecTrade)
                {
                    ApplicationArea = All;
                    TableRelation = "List of all Dep/trades/Section"."Departments/Trades/Section";
                    Editable = DeptSecTradeEdit;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            /* action("Submit")
            {
                ApplicationArea = All;
                // Promoted = true;
                // PromotedCategory = Report;
                Image = Save;

                trigger OnAction()
                var
                    EmpAddInfo: Record "Employee Additional Info";
                    EmpLrec: Record Employee;
                begin
                    EmpLrec.Get(HRMSID);
                    EmpLrec."Employment Status" := EmpStatusVar;
                    EmpLrec."Date of increment" := dateOfIncVar;
                    EmpLrec."MACP Status" := McapStatus;
                    EmpLrec."D.O.J (Service)" := DOJ;
                    EmpLrec."Service Joining Designation" := serviseDesgn;
                    EmpLrec."Joining Station" := joinStation;
                    EmpLrec."Current Station" := CurrStation;
                    EmpLrec."Base Qualification" := BaseQualificationVar;
                    EmpLrec."Pension Remark" := PensionRemVar;
                    EmpLrec."Dept./Trade/Section" := DeptSecTrade;
                    EmpLrec."Home Dist" := HomedistVar;
                    EmpLrec.Designation := DesignationVar;
                    EmpLrec.Modify(true);
                    EmpAddInfo.Init();
                    EmpAddInfo."HRMS ID" := EmpLrec."No.";
                    EmpAddInfo."Employee Name" := EmpLrec."First Name";
                    EmpAddInfo."D.O.J (Service)" := EmpLrec."D.O.J (Service)";
                    EmpAddInfo."Service Joining Designation" := EmpLrec."Service Joining Designation";
                    EmpAddInfo."Service Joining Station" := EmpLrec."Joining Station";
                    EmpAddInfo."Base Qualification" := EmpLrec."Base Qualification";
                    EmpAddInfo."Employment Status" := EmpLrec."Employment Status";
                    EmpAddInfo."Date of increment" := EmpLrec."Date of increment";
                    EmpAddInfo."MACP Status" := EmpLrec."MACP Status";
                    EmpAddInfo."Pension Remark" := EmpLrec."Pension Remark";
                    EmpAddInfo."Dept./Trade/Section" := EmpLrec."Dept./Trade/Section";
                    EmpAddInfo.Designation := DesignationVar; //--SKS
                    EmpAddInfo."Home Dist" := HomedistVar; //--SKs
                    EmpAddInfo."Deployment Start Date" := DeploymentStartDate;//megha 16-05-2025
                    EmpAddInfo."Deployment End Date" := DeploymentEndDate;//megha 16-05-2025
                    EmpAddInfo."Deployment Location" := DeploymentLocation;//megha 16-05-2025
                    EmpAddInfo.Insert(true);
                    Message('Submitted');
                    CurrPage.Close();
                end;
            } */
            action("Submit") //SS07OCT
            {
                ApplicationArea = All;
                // Promoted = true;
                // PromotedCategory = Report;
                Image = Save;

                trigger OnAction()var EmpAddInfo: Record "Employee Additional Info";
                EmpLrec: Record Employee;
                ArchiveMgt: Codeunit "Employee Archive Mgt.";
                begin
                    EmpLrec.Get(HRMSID);
                    EmpLrec."Employment Status":=EmpStatusVar;
                    EmpLrec."Date of increment":=dateOfIncVar;
                    EmpLrec."MACP Status":=McapStatus;
                    EmpLrec."D.O.J (Service)":=DOJ;
                    EmpLrec."Service Joining Designation":=serviseDesgn;
                    EmpLrec."Joining Station":=joinStation;
                    EmpLrec."Current Station":=CurrStation;
                    EmpLrec."Base Qualification":=BaseQualificationVar;
                    EmpLrec."Pension Remark":=PensionRemVar;
                    EmpLrec."Dept./Trade/Section":=DeptSecTrade;
                    EmpLrec."Home Dist":=HomedistVar;
                    EmpLrec.Designation:=DesignationVar;
                    EmpLrec.Modify(true);
                    EmpAddInfo.Init();
                    EmpAddInfo."HRMS ID":=EmpLrec."No.";
                    EmpAddInfo."Employee Name":=EmpLrec."First Name";
                    EmpAddInfo."D.O.J (Service)":=EmpLrec."D.O.J (Service)";
                    EmpAddInfo."Service Joining Designation":=EmpLrec."Service Joining Designation";
                    EmpAddInfo."Service Joining Station":=EmpLrec."Joining Station";
                    EmpAddInfo."Base Qualification":=EmpLrec."Base Qualification";
                    EmpAddInfo."Employment Status":=EmpLrec."Employment Status";
                    EmpAddInfo."Date of increment":=EmpLrec."Date of increment";
                    EmpAddInfo."MACP Status":=EmpLrec."MACP Status";
                    EmpAddInfo."Pension Remark":=EmpLrec."Pension Remark";
                    EmpAddInfo."Dept./Trade/Section":=EmpLrec."Dept./Trade/Section";
                    EmpAddInfo.Designation:=DesignationVar; //--SKS
                    EmpAddInfo."Home Dist":=HomedistVar; //--SKs
                    EmpAddInfo."Deployment Start Date":=DeploymentStartDate; //megha 16-05-2025
                    EmpAddInfo."Deployment End Date":=DeploymentEndDate; //megha 16-05-2025
                    EmpAddInfo."Deployment Location":=DeploymentLocation;
                    EmpAddInfo.Insert(true);
                    ArchiveMgt.ArchiveEmployee(EmpLrec);
                    Message('Submitted');
                    CurrPage.Close();
                end;
            }
        }
    }
    procedure PageRun(HRMIdpar: Code[20])var EmpLocVarrec: Record Employee;
    begin
        EmpLocVarrec.get(HRMIdpar);
        EmpNameVar:=EmpLocVarrec."First Name";
        HRMSID:=HRMIdpar;
        DOJ:=EmpLocVarrec."D.O.J (Service)";
        serviseDesgn:=EmpLocVarrec."Service Joining Designation";
        joinStation:=EmpLocVarrec."Joining Station";
        CurrStation:=EmpLocVarrec."Current Station";
        BaseQualificationVar:=EmpLocVarrec."Base Qualification";
        EmpStatusVar:=EmpLocVarrec."Employment Status";
        dateOfIncVar:=EmpLocVarrec."Date of increment";
        McapStatus:=EmpLocVarrec."MACP Status";
        PensionRemVar:=EmpLocVarrec."Pension Remark";
        DeptSecTrade:=EmpLocVarrec."Dept./Trade/Section";
        DesignationVar:=EmpLocVarrec.Designation;
        HomedistVar:=EmpLocVarrec."Home Dist";
        if DOJ = 0D then dojEdit:=true;
        if serviseDesgn = '' then serviseDesgnEdit:=true;
        if joinStation = '' then joinStationEdit:=true;
        if CurrStation = '' then CurrStationEdit:=true;
        if BaseQualificationVar = '' then BaseQualificationVarEdit:=true;
        if EmpStatusVar = 0 then EmpStatusVarEdit:=true;
        if dateOfIncVar = 0D then dateOfIncVarEdit:=true;
        if McapStatus = 0 then McapStatusEdit:=true;
        if PensionRemVar = 0 then PensionRemVarEdit:=true;
        if DeptSecTrade = '' then DeptSecTradeEdit:=true;
        if DesignationVar = '' then DesignationVarBool:=true;
        if HomedistVar = '' then HomedistVarBool:=true;
        CurrPage.Run();
    end;
    var myInt: Integer;
    HRMSID: code[20];
    EmpNameVar: text[50];
    DOJ: Date;
    dojEdit: Boolean;
    serviseDesgn: Text[30];
    serviseDesgnEdit: Boolean;
    joinStation: Text[30];
    joinStationEdit: Boolean;
    CurrStation: Code[20];
    CurrStationEdit: Boolean;
    EmpStatusVar: option " ", "Ad hoc", "Temporary status", "Initial appointee", "Regular", Inactive;
    EmpStatusVarEdit: Boolean;
    BaseQualificationVar: code[20];
    BaseQualificationVarEdit: Boolean;
    dateOfIncVar: Date;
    dateOfIncVarEdit: Boolean;
    McapStatus: Option " ", "Nil", "1st", "2nd", "3rd";
    McapStatusEdit: Boolean;
    // Start Anmol 17 Jan 2025
    //PensionRemVar: Option " ", "Regular", "NPS";
    PensionRemVar: Option " ", "GPF", "NPS";
    PensionRemVarEdit: Boolean;
    DeptSecTrade: Text[60];
    DeptSecTradeEdit: Boolean;
    DesignationVar: Code[20];
    HomedistVar: Code[20];
    DesignationVarBool: Boolean;
    HomedistVarBool: Boolean;
    DeploymentLocation: Code[20];
    DeploymentStartDate: Date; //megha 16-05-2025
    DeploymentEndDate: Date; //megha 16-05-2025
}
