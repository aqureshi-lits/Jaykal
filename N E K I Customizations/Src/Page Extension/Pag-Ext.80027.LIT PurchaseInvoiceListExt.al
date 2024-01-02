pageextension 80027 "LIT PurchaseInvoiceListExt" extends "Purchase Invoices"

{
    layout
    {
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