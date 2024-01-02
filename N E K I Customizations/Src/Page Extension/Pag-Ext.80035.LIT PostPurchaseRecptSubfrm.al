pageextension 80035 "LIT PostPurchaseRecptSubfrm" extends "Posted Purchase Rcpt. Subform"
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