pageextension 80001 "LIT PurchaseQuoteListExt" extends "Purchase Quotes"
{
    layout
    {
        // Add changes to page layout here
        addafter("Location Code")
        {
            field("No. of Archived Versions"; Rec."No. of Archived Versions")
            {
                ApplicationArea = all;
            }
            field("Importance Type"; Rec."LIT Importance Type")
            {
                ApplicationArea = All;
            }


        }


    }

    actions
    {
        // Add changes to page actions here
        addbefore(Print)
        {
            action("RFQ with Price")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'RFQ with Price';
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedCategory = Category6;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    PURCHHEAD.RESET;
                    PURCHHEAD.SetFilter("Document Type", 'Quote');
                    PURCHHEAD.SETRANGE("No.", Rec."No.");
                    PURCHHEAD.SETRANGE("Buy-from Vendor No.", Rec."Buy-from Vendor No.");
                    REPORT.RUNMODAL(80025, TRUE, FALSE, PURCHHEAD);
                end;
            }
            /*

            action(UpdateRecord)
            {
                ApplicationArea = All;
                Caption = 'UpdateRecord';
                Ellipsis = true;
                Image = Payment;
                Promoted = true;
                PromotedCategory = Category8;
                RunObject = report "Update Record - IAX";
            }
            */

        }
    }

    var
        PURCHHEAD: Record 38;
}