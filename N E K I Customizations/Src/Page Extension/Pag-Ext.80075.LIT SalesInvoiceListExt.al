pageextension 80075 "LIT SalesInvoiceListExt" extends "Sales Invoice List"
{
    layout
    {
        // Add changes to page layout here
        addafter(Amount)
        {
            field("Amount Including VAT"; Rec."Amount Including VAT")
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

}