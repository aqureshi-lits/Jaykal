pageextension 80024 "LIT PurchaseInvoiceSubform" extends "Purch. Invoice Subform"

{
    layout
    {
        addafter(Description)
        {

            field("Description 3"; Rec."LIT Description 3")
            {
                ApplicationArea = all;
            }
            field(Comment; Rec."LIT Comment")
            {
                ApplicationArea = all;
            }


        }

        modify("Line Amount")
        {
            Editable = false;
        }


    }

}