pageextension 80040 "LIT PostPurchaseInvoicesList" extends "Posted Purchase Invoices"

{
    layout
    {
        addafter(Amount)
        {
            field("Purchase Type"; Rec."Purchase Type")
            {
                ApplicationArea = All;
            }

            field("VAT Registration No."; Rec."VAT Registration No.")
            {
                ApplicationArea = All;
            }

            field("Vendor Posting Group"; Rec."Vendor Posting Group")
            {
                ApplicationArea = all;
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


}