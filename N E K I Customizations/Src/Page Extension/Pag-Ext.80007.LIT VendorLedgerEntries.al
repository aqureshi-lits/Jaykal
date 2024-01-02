pageextension 80007 "LIT VendorLedgerEntries" extends "Vendor Ledger Entries"
{
    layout
    {
        // Add changes to page layout here
        addafter("Due Date")
        {
            field("LIT Remarks"; Rec."LIT Remarks")
            {
                ApplicationArea = All;
            }
            field("LIT Check No."; Rec."LIT Check No.")
            {
                ApplicationArea = All;
            }
            field("LIT Check Date"; Rec."LIT Check Date")
            {
                ApplicationArea = All;
            }

            field(PDC; Rec.PDC)
            {
                ApplicationArea = all;
            }

            field("PDC Bank Account Entry No."; Rec."PDC Bank Account Entry No.")
            {
                ApplicationArea = all;
            }

            field("PDC Value Date"; Rec."PDC Value Date")
            {
                ApplicationArea = all;
            }

            field("PDC Bank No."; Rec."PDC Bank No.")
            {
                ApplicationArea = all;
            }

            field("Cheque No."; Rec."Cheque No.")
            {
                ApplicationArea = all;
            }

            field("Cheque Bank No."; Rec."Cheque Bank No.")
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