pageextension 80063 "LIT EmpLedgerEntriesPreview" extends "Empl. Ledger Entries Preview"
{
    layout
    {
        // Add changes to page layout here
        addbefore(Description)
        {

        }
        addbefore(AmountLCY)
        {

            field("Credit Amount"; Rec."Credit Amount")
            {
                ApplicationArea = all;
            }


            field("Debit Amount"; Rec."Debit Amount")
            {
                ApplicationArea = all;
            }

        }
        addafter(RemainingAmountLCY)
        {
            field(Remarks; Rec."LIT Remarks")
            {
                ApplicationArea = all;
            }
            field("Check No."; Rec."LIT Check No.")
            {
                ApplicationArea = all;
            }
            field("Check Date"; Rec."LIT Check Date")
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