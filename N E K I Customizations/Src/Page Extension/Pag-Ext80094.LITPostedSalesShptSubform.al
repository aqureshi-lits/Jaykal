pageextension 80094 "LIT Posted Sales Shpt. Subform" extends "Posted Sales Shpt. Subform"
{
    layout
    {
        addafter(Quantity)
        {
            field("LIT Order Unit Price"; Rec."LIT Order Unit Price")
            {
                ApplicationArea = All;
            }

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
