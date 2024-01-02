pageextension 80054 "LIT BankAccountLedgerEntries" extends "Bank Account Ledger Entries"
{
    layout
    {
        // Add changes to page layout here
        addafter(Amount)
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
        }
    }

    actions
    {
        addafter("&Navigate")
        {
            action("Reconcile PDC Date")
            {
                Image = Change;
                ApplicationArea = all;
                Visible = false;
                //RunObject = Page 50021; // Need to check this

            }
        }
        // Add changes to page actions here
    }

}