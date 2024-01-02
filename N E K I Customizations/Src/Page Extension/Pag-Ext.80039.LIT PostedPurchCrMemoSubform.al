pageextension 80039 "LIT PostedPurchCrMemoSubform" extends "Posted Purch. Cr. Memo Subform"
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