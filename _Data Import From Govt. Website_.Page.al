page 33065748 "Data Import From Govt. Website"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'Employee List Data Input';

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(Text1; 'Instruction')
                {
                }
                field(Text2; '1. Download the template CSV file')
                {
                }
                field(Text3; '2. Take data from Employee List table from Government of Odisha HRMS Website.')
                {
                }
                field(Text4; '3. File the downloaded template with the same data.')
                {
                }
                field(Text5; '4. Upload the filled template CSV file.')
                {
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(Export)
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedIsBig = true;
                Image = Export;

                trigger OnAction()
                begin
                    //Xmlport.Run(50200, false, false);33065471
                    Xmlport.Run(33065471, false, false);
                    Message('Done');
                end;
            }
            action(Import)
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedIsBig = true;
                Image = Import;

                trigger OnAction()
                begin
                    //Xmlport.Run(50201, true, true);33065472
                    Xmlport.Run(33065472, true, true);
                    Message('Done');
                end;
            }
        }
    }
    var
        Text1: Text[30];
        Text2: Text[30];
        Text3: Text[100];
        Text4: Text[50];
        Text5: Text[50];
}
