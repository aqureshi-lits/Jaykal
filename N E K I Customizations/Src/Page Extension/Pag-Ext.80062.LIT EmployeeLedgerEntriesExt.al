pageextension 80062 "LIT EmployeeLedgerEntriesExt" extends "Employee Ledger Entries"
{
    layout
    {
        // Add changes to page layout here
        addbefore(Description)
        {

        }
        addbefore("Amount (LCY)")
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
        addafter("Remaining Amt. (LCY)")
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