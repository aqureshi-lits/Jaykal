pageextension 80022 "LIT PurchaseCreditMemo" extends "Purchase Credit Memo"
{
    layout
    {
        // Add changes to page layout here
        addafter("Responsibility Center")
        {


            group("Remarks")
            {
                Caption = 'Remarks';
            }
            field(Remark; Rec."LIT Remarks")
            {
                ApplicationArea = All;
                MultiLine = true;
                Importance = Additional;
            }

        }
        addafter("Document Date")
        {

        }
        addafter("Vendor Cr. Memo No.")
        {
            field("Vendor Order No."; Rec."Vendor Order No.")
            {
                ApplicationArea = All;
            }
            field("Vendor Shipment No."; Rec."Vendor Shipment No.")
            {
                ApplicationArea = All;
            }
            field("Your Reference"; Rec."Your Reference")
            {
                ApplicationArea = All;
            }
        }
        addafter("Posting Date")
        {
            field("Decalration No."; Rec."Decalration No.")
            {
                ApplicationArea = All;
            }
            field("Decalration Date"; Rec."Decalration Date")
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