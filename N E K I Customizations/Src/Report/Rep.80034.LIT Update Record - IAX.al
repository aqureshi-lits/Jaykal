report 80034 "LIT Update Record - IAX"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Src/Layout/Update Record - IAX.rdlc';
    Caption = 'Update Record - IAX';
    PreviewMode = PrintLayout;
    Permissions = TableData Customer = rimd, TableData "Cust. Ledger Entry" = rimd, TableData Vendor = rimd, TableData "Vendor Ledger Entry" = rimd, TableData "Sales Header" = rimd, TableData "Purchase Header" = rimd, TableData "Sales Shipment Header" = rimd, TableData "Sales Invoice Header" = rimd, TableData "Sales Cr.Memo Header" = rimd, TableData "Purch. Rcpt. Header" = rimd, TableData "Purch. Inv. Header" = rimd, TableData "Purch. Cr. Memo Hdr." = rimd;

    dataset
    {
        dataitem("Purch. Cr. Memo Hdr."; "Purch. Cr. Memo Hdr.")
        {
            RequestFilterFields = "No.";


            trigger OnAfterGetRecord()
            var
                myInt: Integer;
            begin
                //         "Purchase Credit Memo Date" := "Posting Date";
                //         Modify(true);
            end;



        }
    }
}