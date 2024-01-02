pageextension 80006 "LIT PurchaseCreditMemosList" extends "Purchase Credit Memos"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
        modify(Post)
        {
            trigger OnBeforeAction()
            begin

                // Rec.TestField("Purchaser Code");
            end;
        }
        modify(PostAndPrint)
        {
            trigger OnBeforeAction()
            begin

                // Rec.TestField("Purchaser Code");
            end;
        }
    }

}