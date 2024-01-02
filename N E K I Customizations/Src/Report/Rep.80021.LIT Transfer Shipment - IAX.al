report 80021 "LIT Transfer Shipment - IAX"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Src/Layout/Transfer Shipment - IAX.rdlc';
    Caption = 'Transfer Shipment - IAX';
    PreviewMode = PrintLayout;

    dataset
    {
        dataitem(DataItem1; "Transfer Shipment Header")
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
            column(No_TransferShipmentHeader; "No.")
            {
            }
            column(TransferOrderDate_TransferShipmentHeader; "Transfer Order Date")
            {
            }
            column(TransferOrderNo_TransferShipmentHeader; "Transfer Order No.")
            {
            }
            column(InTransitCode_TransferShipmentHeader; "In-Transit Code")
            {
            }
            column(TransferfromCode_TransferShipmentHeader; "Transfer-from Code")
            {
            }
            column(TransferfromName_TransferShipmentHeader; "Transfer-from Name")
            {
            }
            column(TransferfromAddress_TransferShipmentHeader; "Transfer-from Address")
            {
            }
            column(TransferfromAddress2_TransferShipmentHeader; "Transfer-from Address 2")
            {
            }
            column(TransferfromCity_TransferShipmentHeader; "Transfer-from City")
            {
            }
            column(TransferfromCounty_TransferShipmentHeader; "Transfer-from County")
            {
            }
            column(TransfertoCode_TransferShipmentHeader; "Transfer-to Code")
            {
            }
            column(TransfertoName_TransferShipmentHeader; "Transfer-to Name")
            {
            }
            column(TransfertoAddress_TransferShipmentHeader; "Transfer-to Address")
            {
            }
            column(TransfertoAddress2_TransferShipmentHeader; "Transfer-to Address 2")
            {
            }
            column(TransfertoCity_TransferShipmentHeader; "Transfer-to City")
            {
            }
            column(TransfertoCounty_TransferShipmentHeader; "Transfer-to County")
            {
            }
            column(PostingDate_TransferShipmentHeader; "Posting Date")
            {
            }
            column(ShipmentDate_TransferShipmentHeader; "Shipment Date")
            {
            }
            column(ReceiptDate_TransferShipmentHeader; "Receipt Date")
            {
            }
            dataitem(DataItem3; "Transfer Shipment Line")
            {
                DataItemLink = "Document No." = FIELD("No."),
                               "Transfer-from Code" = FIELD("Transfer-from Code"),
                               "Transfer-to Code" = FIELD("Transfer-to Code");
                column(ItemNo_TransferShipmentLine; "Item No.")
                {
                }
                column(Description_TransferShipmentLine; Description)
                {
                }
                column(Quantity_TransferShipmentLine; Quantity)
                {
                }
                column(UnitofMeasure_TransferShipmentLine; "Unit of Measure")
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

