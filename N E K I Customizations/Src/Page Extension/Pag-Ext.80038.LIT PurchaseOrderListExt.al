pageextension 80038 "LIT PurchaseOrderListExt" extends "purchase order list"

{
    layout
    {
        addafter(Status)
        {
            field("Importance Type"; Rec."LIT Importance Type")
            {
                ApplicationArea = All;
            }

        }
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