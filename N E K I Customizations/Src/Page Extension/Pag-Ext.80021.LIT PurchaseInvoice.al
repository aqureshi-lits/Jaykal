pageextension 80021 "LIT PurchaseInvoice" extends "Purchase Invoice"
{
    layout
    {
        // Add changes to page layout here
        addafter("Posting Date")
        {

        }
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
                Visible = false;
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
        addafter("Vendor Invoice No.")
        {

            field("Vendor Shipment No."; Rec."Vendor Shipment No.")
            {
                ApplicationArea = All;
            }
            field("Your Reference"; Rec."Your Reference")
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
                //   Rec.TestField("Purchaser Code");
            end;
        }
    }

}