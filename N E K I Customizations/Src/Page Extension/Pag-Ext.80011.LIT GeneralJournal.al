pageextension 80011 "LIT GeneralJournal" extends "General Journal"
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
        addbefore(Description)
        {
        }

        addafter("Deferral Code")
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

            field(PDC; Rec.PDC)
            {
                ApplicationArea = All;
            }

            field("PDC Customer No."; Rec."PDC Customer No.")
            {
                ApplicationArea = All;
            }

            field("Cust. PDC Entry No."; Rec."Cust. PDC Entry No.")
            {
                ApplicationArea = All;
            }

            field("PDC Vendor No."; Rec."PDC Vendor No.")
            {
                ApplicationArea = All;
            }

            field("Cheque Bank No."; Rec."Cheque Bank No.")
            {
                ApplicationArea = All;
            }

            field("Vendor PDC Entry No."; Rec."Vendor PDC Entry No.")
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
                action("Print Receipt Voucher")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Print Receipt Voucher';
                    Ellipsis = true;
                    Image = CashReceiptJournal;
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
                action("Print ENBD Check")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Print ENBD Check';
                    //Enabled = Rec."Journal Batch Name" = 'ENBBPV-AED';
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
                    //Enabled = Rec."Journal Batch Name" = 'CBDBPV-AED';
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

}