pageextension 80002 "LIT GLAccountList" extends "G/L Account List"
{
    layout
    {
        // Add changes to page layout here
        addafter("No.")
        {
            field("No. 2"; Rec."No. 2")
            {
                ApplicationArea = All, Basic, Suit;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

}