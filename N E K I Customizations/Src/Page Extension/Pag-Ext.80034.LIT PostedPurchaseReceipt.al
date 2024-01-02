pageextension 80034 "LIT PostedPurchaseReceipt" extends "Posted Purchase Receipt"
{
    layout
    {
        // Add changes to page layout here
        addafter("Responsibility Center")
        {
            field("Importance Type"; Rec."LIT Importance Type")
            {
                ApplicationArea = All;
            }

            field("Prepared By"; Rec."Prepared By")
            {
                ApplicationArea = all;
            }

            field("Approved By"; Rec."Approved By")
            {
                ApplicationArea = all;
            }

            field("Driver Name"; Rec."Driver Name")
            {
                ApplicationArea = all;
            }
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
    }

}