pageextension 80018 "LIT SalesInvoiceSubform" extends "Sales Invoice Subform"
{
    layout
    {
        // Add changes to page layout here
        addafter(Description)
        {

        }
        modify("Line Amount")
        {
            Editable = false;
        }

        addafter("Location Code")
        {
            field("Salesperson Code"; Rec."Salesperson Code")
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