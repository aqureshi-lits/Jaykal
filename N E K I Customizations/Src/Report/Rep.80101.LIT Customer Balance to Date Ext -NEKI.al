reportextension 80101 CustBalancetoDat extends "Customer - Balance to Date"
{
    dataset
    {
        // Add changes to dataitems and columns here
        add(CustLedgEntry3)
        {
            column(Document_Date; "Document Date")
            { }
        }
        add("Detailed Cust. Ledg. Entry")
        {

        }
    }

    requestpage
    {
        // Add changes to the requestpage here
    }

    rendering
    {
        layout(CustomerBalancetoDate1)
        {
            Type = RDLC;
            LayoutFile = './Src/Layout/CustomerBalancetoDate1.rdlc';
        }
    }
}