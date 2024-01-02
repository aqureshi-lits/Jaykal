pageextension 80004 "LIT GeneralLedgerEntries" extends "General Ledger Entries"
{
    layout
    {
        // Add changes to page layout here
        addafter(Amount)
        {

            field("LIT Remarks"; Rec."LIT Remarks")
            {
                ApplicationArea = All;
                Editable = false;
            }
            field("LIT Check No."; Rec."LIT Check No.")
            {
                ApplicationArea = All;
                Editable = false;
            }
            field("Check Date"; Rec."LIT Check Date")
            {
                ApplicationArea = All;
                Editable = false;
            }
        }
        addbefore(Description)
        {

        }
        addafter("Entry No.")
        {
            field(Import; Rec.Import)
            {
                ApplicationArea = all;
            }

            field("Import CRM"; Rec."Import CRM")
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