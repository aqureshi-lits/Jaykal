pageextension 80049 "LIT ApplyBankAccLedgerEntries" extends "Apply Bank Acc. Ledger Entries"
{
    layout
    {
        // Add changes to page layout here
        addafter(Amount)
        {
            field(Remarks; Rec."LIT Remarks")
            {
                ApplicationArea = all;
                Editable = false;
            }
            field("Check No."; Rec."LIT Check No.")
            {
                ApplicationArea = all;
                Editable = false;
            }
            field("Check Date"; Rec."LIT Check Date")
            {
                ApplicationArea = all;
                Editable = false;
            }
        }

    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}