pageextension 80056 "LIT PurchaseLines" extends "Purchase Lines"
{
    layout
    {
        // Add changes to page layout here
        addafter("Buy-from Vendor No.")
        {
            field("Buy-from Vendor Name"; Rec."LIT Buy-from Vendor Name")
            {
                ApplicationArea = all;
                Editable = false;
            }

            field("Order Date"; Rec."Order Date")
            {
                ApplicationArea = all;
                Editable = false;
            }


        }
        addafter("Line Amount")
        {
            field("Currency Code"; Rec."Currency Code")
            {
                ApplicationArea = all;
            }
            field("Outstanding Amount"; Rec."Outstanding Amount")
            {
                ApplicationArea = all;
            }

            field("Outstanding Amt. Ex. VAT (LCY)"; Rec."Outstanding Amt. Ex. VAT (LCY)")
            {
                ApplicationArea = all;
            }
        }

        addafter("Outstanding Quantity")
        {
            field("Qty. to Receive"; Rec."Qty. to Receive")
            {
                ApplicationArea = all;
            }
            field("Quantity Received"; Rec."Quantity Received")
            {
                ApplicationArea = all;
            }
            field("Qty. to Invoice"; Rec."Qty. to Invoice")
            {
                ApplicationArea = all;
            }
            field("Quantity Invoiced"; Rec."Quantity Invoiced")
            {
                ApplicationArea = all;
            }
            field("Qty. Rcd. Not Invoiced"; Rec."Qty. Rcd. Not Invoiced")
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