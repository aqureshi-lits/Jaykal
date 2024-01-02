pageextension 80041 "LIT PostPurchreditMemosList" extends "Posted Purchase Credit Memos"
{
    layout
    {
        // Add changes to page layout here
        addafter("Currency Code")
        {

            field("Pre-Assigned No."; Rec."Pre-Assigned No.")
            {
                ApplicationArea = all;
            }
            field("Vendor Cr. Memo No."; Rec."Vendor Cr. Memo No.")
            {
                ApplicationArea = all;
            }
            field("VAT Registration No."; Rec."VAT Registration No.")
            {
                ApplicationArea = all;
            }

            field("Vendor Posting Group"; Rec."Vendor Posting Group")
            {
                ApplicationArea = all;
            }
            field(Remarks; Rec."LIT Remarks")
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

    var
        myInt: Integer;
}