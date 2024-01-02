report 80022 "LIT Transfer Reciept - IAX"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Src/Layout/Transfer Reciept - IAX.rdlc';
    Caption = 'Transfer Reciept - IAX';
    PreviewMode = PrintLayout;

    dataset
    {
        dataitem(DataItem1; "Transfer Receipt Header")
        {
            column(Picture_CompanyInformation; CompanyInformation.Picture)
            {
            }
            column(ComName; CompanyInformation.Name)
            {
            }
            column(Address; CompanyInformation.Address)
            {
            }
            column(Addrss2; CompanyInformation."Address 2")
            {
            }
            column(City; CompanyInformation.City)
            {
            }
            column(CompanyTRN; CompanyInformation."VAT Registration No.")
            {
            }
            column(CityandCountry; 'P.O. BOX. No. : ' + CompanyInformation."Post Code" + ', ' + CompanyInformation.City + ' - ' + CompanyInformation."Country/Region Code")
            {
            }
            column(CompPhone; 'Tel No. : ' + CompanyInformation."Phone No.")
            {
            }
            column(CompFax; 'Fax No. : ' + CompanyInformation."Fax No.")
            {
            }
            column(Comp_Post; 'P.O. BOX. No. : ' + CompanyInformation."Post Code")
            {
            }
            column(CompEmail; 'Email : ' + CompanyInformation."E-Mail")
            {
            }
            column(Single_TRN; 'TRN # : ' + CompanyInformation."VAT Registration No.")
            {
            }
            column(No_TransferReceiptHeader; "No.")
            {
            }
            column(TransferOrderNo_TransferReceiptHeader; "Transfer Order No.")
            {
            }
            column(TransferfromName_TransferReceiptHeader; "Transfer-from Name")
            {
            }
            column(TransferfromAddress_TransferReceiptHeader; "Transfer-from Address")
            {
            }
            column(TransferfromAddress2_TransferReceiptHeader; "Transfer-from Address 2")
            {
            }
            column(TransferfromCity_TransferReceiptHeader; "Transfer-from City")
            {
            }
            column(TransferfromCounty_TransferReceiptHeader; "Transfer-from County")
            {
            }
            column(TransfertoCode_TransferReceiptHeader; "Transfer-to Code")
            {
            }
            column(TransfertoName_TransferReceiptHeader; "Transfer-to Name")
            {
            }
            column(TransfertoAddress_TransferReceiptHeader; "Transfer-to Address")
            {
            }
            column(TransfertoAddress2_TransferReceiptHeader; "Transfer-to Address 2")
            {
            }
            column(TransfertoCity_TransferReceiptHeader; "Transfer-to City")
            {
            }
            column(TransfertoCounty_TransferReceiptHeader; "Transfer-to County")
            {
            }
            column(TransferOrderDate_TransferReceiptHeader; "Transfer Order Date")
            {
            }
            column(PostingDate_TransferReceiptHeader; "Posting Date")
            {
            }
            dataitem(DataItem17; "Transfer Receipt Line")
            {
                DataItemLink = "Document No." = FIELD("No."),
                               "Transfer-from Code" = FIELD("Transfer-from Code"),
                               "Transfer-to Code" = FIELD("Transfer-to Code");
                column(DocumentNo_TransferReceiptLine; "Document No.")
                {
                }
                column(ItemNo_TransferReceiptLine; "Item No.")
                {
                }
                column(Quantity_TransferReceiptLine; Quantity)
                {
                }
                column(UnitofMeasure_TransferReceiptLine; "Unit of Measure")
                {
                }
                column(Description_TransferReceiptLine; Description)
                {
                }
            }
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnInitReport()
    begin
        CompanyInformation.GET;
        CompanyInformation.CALCFIELDS(Picture);
    end;

    var
        CompanyInformation: Record 79;
}

