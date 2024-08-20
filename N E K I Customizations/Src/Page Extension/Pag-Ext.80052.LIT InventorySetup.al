pageextension 80052 "LIT InventorySetup" extends "Inventory Setup"
{
    layout
    {
        // Add changes to page layout here
        addafter("Gen. Journal Templates")
        {
            group("LIT Default Adjusmtent Posting Setup")
            {
                Caption = 'Default Adjusmtent Posting Setup';
                field("LIT AdjGenBusPostingGroup"; Rec."LIT AdjGenBusPostingGroup")
                {
                    ApplicationArea = All;
                }
                field("LIT AdjGenProdPostingGroup"; Rec."LIT AdjGenProdPostingGroup")
                {
                    ApplicationArea = All;
                }
                field("LIT AdjLocation"; Rec."LIT AdjLocation")
                { ApplicationArea = All; }
            }
            group("LIT Default Transfer Posting Setup")
            {
                Caption = 'Default Transfer Posting Setup';
                field("LIT TransGenBusPostingGroup"; Rec."LIT TransGenBusPostingGroup")
                {
                    ApplicationArea = All;
                }
                field("LIT TransGenProdPostingGroup"; Rec."LIT TransGenProdPostingGroup")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

}