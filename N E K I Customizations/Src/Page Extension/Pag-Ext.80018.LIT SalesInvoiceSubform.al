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
    }

    actions
    {
        // Add changes to page actions here
    }

}