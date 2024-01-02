pageextension 80044 "LIT CashReceiptJournal" extends "Cash Receipt Journal"
{
    layout
    {
        // Add changes to page layout here
        addafter("Document No.")
        {
            field("Line No."; Rec."Line No.")
            {
                ApplicationArea = all;
            }
        }
        addafter("Bal. Account No.")
        {
            field(Remarks; Rec."LIT Remarks")
            {
                ApplicationArea = All;
            }
            field("Check No."; Rec."LIT Check No.")
            {
                ApplicationArea = All;
            }
            field("Check Date"; Rec."LIT Check Date")
            {
                ApplicationArea = All;
            }
            field("Payment Reference"; Rec."Payment Reference")
            {
                ApplicationArea = All;
            }

        }

    }

    actions
    {
        // Add changes to page actions here
        addafter(Page)
        {
            group(Print)
            {
                Caption = 'Print';
                Image = Print;

                action("Print Receipt Voucher")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Print Receipt Voucher';
                    Ellipsis = true;
                    Image = Payment;
                    Promoted = true;
                    PromotedCategory = Category8;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        GenJnlLine.RESET;
                        GenJnlLine.SETFILTER(GenJnlLine."Journal Template Name", Rec."Journal Template Name");
                        GenJnlLine.SETFILTER(GenJnlLine."Journal Batch Name", Rec."Journal Batch Name");
                        GenJnlLine.SETFILTER(GenJnlLine."Document No.", Rec."Document No.");
                        REPORT.RUNMODAL(80004, TRUE, FALSE, GenJnlLine);
                    end;
                }
            }
        }
    }



    var

        GenJnlLine: Record 81;
}