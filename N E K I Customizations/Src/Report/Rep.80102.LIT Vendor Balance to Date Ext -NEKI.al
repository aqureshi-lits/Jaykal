reportextension 80102 VendBalancetoDat extends "Vendor - Balance to Date"
{
    dataset
    {
        // Add changes to dataitems and columns here
        add(VendLedgEntry3)
        {
            column(Document_Date; "Document Date")
            { }
        }

    }

    requestpage
    {
        // Add changes to the requestpage here
    }

    rendering
    {
        layout(VendorBalancetoDate1)
        {
            Type = RDLC;
            LayoutFile = './Src/Layout/VendorBalancetoDate1.rdlc';
        }
    }
}