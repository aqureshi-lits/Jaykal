pageextension 80019 "LIT PurchaseQuote" extends "Purchase Quote"
{
    layout
    {
        // Add changes to page layout here
        addafter("Document Date")
        {

        }
        addafter("Requested Receipt Date")
        {

            field("Your Reference"; Rec."Your Reference")
            {
                ApplicationArea = All;
            }

        }
        addafter(Status)
        {

            field("Importance Type"; Rec."LIT Importance Type")
            {
                ApplicationArea = All;
            }

            group("Remarks")
            {
                Caption = 'Remarks';
            }
            field(Remark; Rec."LIT Remarks")
            {
                ApplicationArea = All;
                MultiLine = true;
                Importance = Additional;
            }
        }

    }

    actions
    {
        // Add changes to page actions here
        addbefore(Print)
        {

        }
    }

    var
        PURCHHEAD: Record 38;
}