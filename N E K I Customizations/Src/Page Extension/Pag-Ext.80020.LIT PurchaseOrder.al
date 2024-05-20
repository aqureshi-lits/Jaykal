pageextension 80020 "LIT PurchaseOrder" extends "Purchase Order"

{
    layout
    {
        // Add changes to page layout here
        addafter("Due Date")
        {

            field("Purchase Type"; rec."Purchase Type")
            {
                ApplicationArea = all;

                //ShowMandatory = VendorInvoiceNoMandatory;
            }
            //This field is already defined in new version
            // field("Your Reference"; Rec."Your Reference")
            // {
            //     ApplicationArea = all;
            // }

        }

        addafter("Assigned User ID")
        {
            field("Posting No. Series"; Rec."Posting No. Series")
            {
                ApplicationArea = all;
            }

            field("Posting No."; Rec."Posting No.")
            {
                ApplicationArea = all;
            }
        }
        addafter("Vendor Invoice No.")
        {
            field("Decalration No."; Rec."Decalration No.")
            {
                ApplicationArea = all;
            }
            field("Decalration Date"; Rec."Decalration Date")
            {
                ApplicationArea = all;
            }
        }
        addafter(Status)
        {

            field("Importance Type"; Rec."LIT Importance Type")
            {
                ApplicationArea = All;
                Importance = Additional;
                ToolTip = 'Select the importance type.';
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

    }

    actions
    {
        // Add changes to page actions here
        modify(Post)
        {
            trigger OnBeforeAction()
            begin
                //     Rec.TestField("Purchaser Code");
            end;
        }
        modify("Post and &Print")
        {
            trigger OnBeforeAction()
            begin
                //    Rec.TestField("Purchaser Code");
            end;
        }

        addbefore(Print)
        {
            action("Print GRN")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Print GRN';
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedCategory = Category6;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    PURCHHEAD.RESET;
                    PURCHHEAD.SetFilter("Document Type", 'Order');
                    PURCHHEAD.SETRANGE("No.", Rec."No.");
                    PURCHHEAD.SETRANGE("Buy-from Vendor No.", Rec."Buy-from Vendor No.");
                    REPORT.RUNMODAL(80010, TRUE, FALSE, PURCHHEAD);
                end;
            }

        }
    }

    var
        PURCHHEAD: Record 38;


}