pageextension 80085 "LIT Post Purchase Credit Memo" extends "Posted Purchase Credit Memo"
{
    layout
    {
        addafter("Posting Date")
        {
            field("Decalration No."; Rec."Decalration No.")
            {
                ApplicationArea = All;
            }
            field("Decalration Date"; Rec."Decalration Date")
            {
                ApplicationArea = All;
            }
        }
    }
}
