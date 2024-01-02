pageextension 80045 "LIT PaymentJournal" extends "Payment Journal"
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
            field(ApprovalStatus; ApprovalStatus)
            {
                ApplicationArea = all;
                Caption = 'Approval Status';
                Editable = false;
                Visible = false;
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

                action("Print Payment Voucher")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Print Payment Voucher';
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
                        REPORT.RUNMODAL(80046, TRUE, FALSE, GenJnlLine);
                    end;
                }
                action("Print ENBD Check")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Print ENBD Check';
                    // Enabled = (Rec."Journal Batch Name" = 'ENBBPV-AED');
                    Enabled = false;
                    Visible = false;
                    Ellipsis = true;
                    Image = Check;
                    Promoted = true;
                    PromotedCategory = Category8;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        GenJnlLine.RESET;
                        GenJnlLine.SETFILTER(GenJnlLine."Journal Template Name", Rec."Journal Template Name");
                        GenJnlLine.SETFILTER(GenJnlLine."Journal Batch Name", Rec."Journal Batch Name");
                        GenJnlLine.SETFILTER(GenJnlLine."Document No.", Rec."Document No.");
                        REPORT.RUNMODAL(80030, TRUE, FALSE, GenJnlLine);
                    end;
                }
                action("Print CBD Check")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Print CBD Check';
                    //Enabled = (Rec."Journal Batch Name" = 'CBDBPV-AED');
                    Enabled = false;
                    Visible = false;
                    Ellipsis = true;
                    Image = Check;
                    Promoted = true;
                    PromotedCategory = Category8;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        GenJnlLine.RESET;
                        GenJnlLine.SETFILTER(GenJnlLine."Journal Template Name", Rec."Journal Template Name");
                        GenJnlLine.SETFILTER(GenJnlLine."Journal Batch Name", Rec."Journal Batch Name");
                        GenJnlLine.SETFILTER(GenJnlLine."Document No.", Rec."Document No.");
                        REPORT.RUNMODAL(80031, TRUE, FALSE, GenJnlLine);
                    end;
                }

            }
        }
    }



    var
        GenJnlLine: Record 81;
        ApprovalStatus: Text[250];
}