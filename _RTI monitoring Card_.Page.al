page 33066445 "RTI monitoring Card"
{
    //ApplicationArea = All;
    Caption = 'RTI monitoring Card';
    PageType = Card;
    SourceTable = "RTI monitoring";

    //UsageCategory = History;
    //InsertAllowed = false;
    //ModifyAllowed = false;
    //DeleteAllowed = false;
    layout
    {
        area(content)
        {
            Group(General)
            {
                field("Entry No.";Rec."Entry No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Entry No. field.';
                }
                field("Application No.";Rec."Application No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Application No. field.';
                }
                field("Type of Application";Rec."Type of Application")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Type of Application field.';
                }
                field("Name of the applicant";Rec."Name of the applicant")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Name of the applicant field.';
                }
                field("Date of Receipt of application";Rec."Date of Receipt of application")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Date of Receipt of application field.';
                }
                field("Reply Sent";Rec."Reply Sent")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Reply Sent field.';
                }
                field("Reply Letter Date";Rec."Reply Letter Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Reply Letter Date field.';
                }
                field("Type of Reply";Rec."Type of Reply")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Type of Reply field.';
                }
                field("Letter No.";Rec."Letter No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Letter No. field.';
                }
                field("Letter Dispatch Date";Rec."Letter Dispatch Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Letter Dispatch Date field.';
                }
                field("Reply Due Date";Rec."Reply Due Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Reply Due Date field.';
                }
                field(Remark;Rec.Remark)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Remark field.';
                }
            }
        }
    }
}
