pageextension 80028 "LIT PurchaseQuoteSubform" extends "Purchase Quote Subform"
{
    layout
    {
        // Add changes to page layout here
        addafter(Description)
        {

            field("Description 3"; Rec."LIT Description 3")
            {
                ApplicationArea = all;
            }
            field(Comment; Rec."LIT Comment")
            {
                ApplicationArea = all;
            }

        }
    }

    actions
    {
        // Add changes to page actions here
    }

}