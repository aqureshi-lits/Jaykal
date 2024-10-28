pageextension 80096 "LIT Posted Sales Shipments" extends "Posted Sales Shipments"
{
    layout
    {
        addafter("Sell-to Customer Name")
        {
            field("LIT Order Amount"; Rec."LIT Order Amount")
            {
                ApplicationArea = All;
            }
            field("LIT Order Amount Incl. VAT"; Rec."LIT Order Amount Incl. VAT")
            {
                ApplicationArea = All;
            }
        }
    }
}
