pageextension 80086 LocationList extends "Location List"
{
    layout
    {
        addlast(Control1)
        {
            field("Lease Expiry Date"; Rec."Lease Expiry Date")
            {
                ApplicationArea = all;
            }

            field("Insurance Expiry Date"; Rec."Insurance Expiry Date")
            {
                ApplicationArea = all;
            }
        }
    }
}
