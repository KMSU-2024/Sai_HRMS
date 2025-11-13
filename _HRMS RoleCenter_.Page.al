page 33065750 "HRMS RoleCenter"
{
    PageType = RoleCenter;

    layout
    {
        area("RoleCenter")
        {
        }
    }
    actions
    {
        area(Creation)
        {
            action("Employee List Data Input")
            {
                ApplicationArea = all;
                RunObject = Page "Employee List";
            }
            action("Employee Custom List")
            {
                ApplicationArea = all;
                RunObject = Page "Employee Custom Lists";
            }
            action("Fianacial Upgradation Application Form")
            {
                ApplicationArea = all;
                RunObject = Page "Financial Upg Application";
            }
            action("Employee Transfer Relief Card")
            {
                ApplicationArea = all;
                RunObject = Page "Employee Transfer Relief Card";
            }
            action("Employee Transfer Joining Card")
            {
                ApplicationArea = all;
                RunObject = Page "Employee Transfer Joining card";
            }
            action("Employee Transfer History List")
            {
                ApplicationArea = all;
                RunObject = Page "Employee transfer lists";
            }
            action("Promotion Card")
            {
                ApplicationArea = all;
                RunObject = page "Employee Promotion";
            }
            action("Promotion History List")
            {
                ApplicationArea = all;
                RunObject = Page "Promotion History List";
            }
            action("Annual Establishment Review Part-A")
            {
                Caption = 'Annual Establishment Review Part-A (Regular Establishment)';
                ApplicationArea = all;
                RunObject = Page "Annual Establishment(Part-A)";
            }
            action("Annual Establishment Review Part-C")
            {
                Caption = 'Annual Establishment Review Part-C (Non Regular Establishment)';
                ApplicationArea = all;
                RunObject = Page "Annual Establishment(Part-C)";
            }
            action("Annual Establishment Review Part-E")
            {
                Caption = 'Annual Establishment Review Part-E (Outsourced/Oncontract)';
                ApplicationArea = all;
                RunObject = Page "Annual Establishment(Part-E)";
            }
            action("Transfer Application Of Employee")
            {
                ApplicationArea = all;
                RunObject = Page "Employee Transfer Card";
            }
            action("Staff Achivement History List")
            {
                ApplicationArea = all;
                RunObject = Page "Staff Achivement History List";
            }
            action("Disciplinary Case of Employee")
            {
                ApplicationArea = all;
                RunObject = Page "Disciplinary Case Input";
            }
            action("Employee Disciplinary Case History List")
            {
                ApplicationArea = all;
                RunObject = Page "Disciplinary History List";
            }
            action("Annual Internal Performance Review")
            {
                ApplicationArea = all;
                RunObject = Page "Annual Performance Entry";
            }
            action("Annual Internal Performance Review History List")
            {
                ApplicationArea = all;
                RunObject = Page "Annual perfomance History List";
            }
            action("CourtCase Details Input")
            {
                ApplicationArea = all;
                RunObject = Page "Court Cases Details Input";
            }
            action("CourtCase List")
            {
                ApplicationArea = all;
                RunObject = Page "Court Case Lists";
            }
            action("RTI Details Input")
            {
                ApplicationArea = all;
                RunObject = Page "RTI Details Input";
            }
            action("RTI Monitoring List")
            {
                ApplicationArea = all;
                RunObject = Page "RTI monitoring Lists";
            }
            action("Employee Leave Application Card")
            {
                ApplicationArea = all;
                RunObject = Page "Employee Leave Applicat. card";
            }
        }
    }
}
