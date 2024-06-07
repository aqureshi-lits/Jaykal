pageextension 80089 "LIT Posted Sales Credit Memos" extends "Posted Sales Invoice Lines"
{
    layout
    {
        addafter("Sell-to Customer No.")
        {
            field("Customer Name"; Rec."Customer Name")
            {
                ApplicationArea = All;
            }

        }
    }
}
