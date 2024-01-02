report 80020 "LIT Transfer Order - IAX"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Src/Layout/Transfer Order - IAX.rdlc';
    Caption = 'Transfer Order - IAX';
    PreviewMode = PrintLayout;

    dataset
    {
        dataitem(DataItem1; "Transfer Header")
        {
            RequestFilterFields = "No.";
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
            column(No_TransferHeader; "No.")
            {
            }
            column(TransferfromCode_TransferHeader; "Transfer-from Code")
            {
            }
            column(TransferfromName_TransferHeader; "Transfer-from Name")
            {
            }
            column(TransferfromName2_TransferHeader; "Transfer-from Name 2")
            {
            }
            column(TransferfromAddress_TransferHeader; "Transfer-from Address")
            {
            }
            column(TransferfromAddress2_TransferHeader; "Transfer-from Address 2")
            {
            }
            column(TransferfromPostCode_TransferHeader; "Transfer-from Post Code")
            {
            }
            column(TransferfromCity_TransferHeader; "Transfer-from City")
            {
            }
            column(TransferfromCounty_TransferHeader; "Transfer-from County")
            {
            }
            column(TrsffromCountryRegionCode_TransferHeader; "Trsf.-from Country/Region Code")
            {
            }
            column(TransfertoCode_TransferHeader; "Transfer-to Code")
            {
            }
            column(TransfertoName_TransferHeader; "Transfer-to Name")
            {
            }
            column(TransfertoName2_TransferHeader; "Transfer-to Name 2")
            {
            }
            column(TransfertoAddress_TransferHeader; "Transfer-to Address")
            {
            }
            column(TransfertoAddress2_TransferHeader; "Transfer-to Address 2")
            {
            }
            column(TransfertoPostCode_TransferHeader; "Transfer-to Post Code")
            {
            }
            column(TransfertoCity_TransferHeader; "Transfer-to City")
            {
            }
            column(TransfertoCounty_TransferHeader; "Transfer-to County")
            {
            }
            column(PostingDate_TransferHeader; "Posting Date")
            {
            }
            column(ShipmentDate_TransferHeader; "Shipment Date")
            {
            }
            column(ReceiptDate_TransferHeader; "Receipt Date")
            {
            }
            column(Status_TransferHeader; Status)
            {
            }
            column(ShortcutDimension1Code_TransferHeader; "Shortcut Dimension 1 Code")
            {
            }
            column(ShortcutDimension2Code_TransferHeader; "Shortcut Dimension 2 Code")
            {
            }
            column(InTransitCode_TransferHeader; "In-Transit Code")
            {
            }
            dataitem(DataItem27; "Transfer Line")
            {
                DataItemLink = "Document No." = FIELD("No."),
                               "Transfer-from Code" = FIELD("Transfer-from Code"),
                               "Transfer-to Code" = FIELD("Transfer-to Code");
                DataItemTableView = SORTING("Document No.", "Line No.")
                                    ORDER(Ascending);
                column(LineNo_TransferLine; "Line No.")
                {
                }
                column(ItemNo_TransferLine; "Item No.")
                {
                }
                column(VariantCode_TransferLine; "Variant Code")
                {
                }
                column(Description_TransferLine; Description)
                {
                }
                column(Quantity_TransferLine; Quantity)
                {
                }
                column(UnitofMeasure_TransferLine; "Unit of Measure")
                {
                }
                column(UnitofMeasureCode_TransferLine; "Unit of Measure Code")
                {
                }
                column(QuantityShipped_TransferLine; "Quantity Shipped")
                {
                }
                column(QuantityReceived_TransferLine; "Quantity Received")
                {
                }
                dataitem(DataItem43; "Reservation Entry")
                {
                    DataItemLink = "Source ID" = FIELD("Document No."),
                                   "Item No." = FIELD("Item No.");
                    DataItemTableView = WHERE("Source Subtype" = CONST(1));
                    column(ItemNo_ReservationEntry; "Item No.")
                    {
                    }
                    column(VariantCode_ReservationEntry; "Variant Code")
                    {
                    }
                    column(LotNo_ReservationEntry; "Lot No.")
                    {
                    }
                    column(ExpirationDate_ReservationEntry; "Expiration Date")
                    {
                    }
                    column(ExpiryDate; ExpiryDate)
                    {
                    }
                    column(Quantity_ReservationEntry; Quantity)
                    {
                    }
                    column(QuantityBase_ReservationEntry; "Quantity (Base)")
                    {
                    }
                    column(LocationCode_ReservationEntry; "Location Code")
                    {
                    }
                    column(VariantUOM; VariantUOM)
                    {
                    }
                    column(VariantQtyUOM; VariantQtyUOM)
                    {
                    }

                    trigger OnAfterGetRecord()
                    begin
                        ILE.RESET;
                        ILE.SETFILTER(ILE."Item No.", "Item No.");
                        ILE.SETFILTER(ILE."Lot No.", "Lot No.");
                        IF ILE.FINDFIRST THEN BEGIN
                            ExpiryDate := ILE."Expiration Date";
                        END;

                        ItemVariant.RESET;
                        ItemVariant.SETFILTER(ItemVariant."Item No.", "Item No.");
                        ItemVariant.SETFILTER(ItemVariant.Code, "Variant Code");
                        IF ItemVariant.FINDFIRST THEN BEGIN

                        END;
                    end;
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
        ILE: Record 32;
        ExpiryDate: Date;
        ItemVariant: Record 5401;
        VariantUOM: Code[10];
        VariantQtyUOM: Decimal;
}

