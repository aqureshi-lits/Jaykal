pageextension 80010 "LIT ItemLedgerEntries" extends "Item Ledger Entries"
{
    layout
    {
        // Add changes to page layout here
        addafter(Description)
        {
            field(Remarks; Rec."LIT Remarks")
            {
                ApplicationArea = All;
                Editable = false;
            }

            field("Item Desc"; Rec."Item Desc")
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