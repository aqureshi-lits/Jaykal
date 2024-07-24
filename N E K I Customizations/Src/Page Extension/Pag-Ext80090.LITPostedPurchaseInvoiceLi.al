pageextension 80090 "LIT Posted Purchase Invoice Li" extends "Posted Purchase Invoice Lines"
{
    layout
    {
        addafter("Buy-from Vendor No.")
        {
            field("Vendor Name"; Rec."Vendor Name")
            {
                ApplicationArea = All;
            }
            field("Posting Date"; Rec."Posting Date")
            {
                ApplicationArea = All;
            }
            field("Item Category Code"; Rec."Item Category Code")
            {
                ApplicationArea = All;
            }

        }
    }
}
