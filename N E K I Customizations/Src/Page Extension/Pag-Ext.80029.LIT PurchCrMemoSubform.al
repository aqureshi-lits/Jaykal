pageextension 80029 "LIT PurchCrMemoSubform" extends "Purch. Cr. Memo Subform"
{
    layout
    {
        // Add changes to page layout here
        addafter(Description)
        {
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

    var
        myInt: Integer;
}