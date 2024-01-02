report 80042 "LIT Delivery Note 2"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Src/Layout/Delivery Note 2.rdl';
    Caption = 'Delivery Note';
    PreviewMode = PrintLayout;

    dataset
    {
        dataitem(DataItem1; "Sales Shipment Header")
        {
            RequestFilterFields = "No.";
            column(HideLogo; HideLogo)
            {
            }
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
            column(Comp_Post; CompanyInformation."Post Code")
            {
            }
            column(CompEmail; 'Email : ' + CompanyInformation."E-Mail")
            {
            }
            column(Comp_Country; Comp_Country)
            {
            }
            column(Single_TRN; 'TRN # : ' + CompanyInformation."VAT Registration No.")
            {
            }
            column(No_SalesHeader; "No.")
            {
            }
            column(BilltoCustomerNo_SalesHeader; "Bill-to Customer No.")
            {
            }
            column(BilltoName_SalesHeader; "Bill-to Name")
            {
            }
            column(BilltoName2_SalesHeader; "Bill-to Name 2")
            {
            }
            column(BilltoAddress_SalesHeader; "Bill-to Address")
            {
            }
            column(BilltoAddress2_SalesHeader; "Bill-to Address 2")
            {
            }
            column(BilltoCity_SalesHeader; "Bill-to City" + ' , ' + "Bill-to Country/Region Code")
            {
            }
            column(BilltoPostCode_SalesHeader; "Bill-to Post Code")
            {
            }
            column(BilltoCounty_SalesHeader; "Bill-to County")
            {
            }
            column(BilltoCountryRegionCode_SalesHeader; "Bill-to Country/Region Code")
            {
            }
            column(BilltoContact_SalesHeader; "Bill-to Contact")
            {
            }
            column(QuoteNo_SalesHeader; "Quote No.")
            {
            }
            column(OrderNo_SalesHeader; "Order No.")
            {
            }
            column(OrderDate_SalesHeader; "Order Date")
            {
            }
            column(PostingDate_SalesHeader; "Posting Date")
            {
            }
            column(ShipmentDate_SalesShipmentHeader; "Shipment Date")
            {
            }
            column(BilltoContactNo_SalesHeader; CustomerRec."Phone No.")
            {
            }
            column(YourReference_SalesHeader; "Your Reference")
            {
            }
            column(SalespersonCode_SalesHeader; SalesPerson.Name)
            {
            }
            column(VATRegistrationNo_SalesHeader; "VAT Registration No.")
            {
            }
            column(ExternalDocumentNo_SalesHeader; "External Document No.")
            {
            }
            column(CurrencyCode_SalesHeader; "Currency Code")
            {
            }
            column(CurrText; CurrText)
            {
            }
            column(Remarks_SalesHeader; "LIT Remarks")
            {
            }
            column(ShiptoCode_SalesHeader; "Ship-to Code")
            {
            }
            column(ShiptoName_SalesHeader; "Ship-to Name")
            {
            }
            column(ShiptoName2_SalesHeader; "Ship-to Name 2")
            {
            }
            column(ShiptoAddress_SalesHeader; "Ship-to Address")
            {
            }
            column(ShiptoAddress2_SalesHeader; "Ship-to Address 2")
            {
            }
            column(ShiptoCity_SalesHeader; "Ship-to City" + ' , ' + "Ship-to Country/Region Code")
            {
            }
            column(ShiptoCountryRegionCode_SalesHeader; "Ship-to Country/Region Code")
            {
            }
            column(ShiptoContact_SalesHeader; "Ship-to Contact")
            {
            }
            column(ShiptoContactNo_SalesHeader; ShiptoAddress."Phone No.")
            {
            }
            column(ShiptoEmail_SalesHeader; ShiptoAddress."E-Mail")
            {
            }
            column(Email_SalesHeader; CustomerRec."E-Mail")
            {
            }
            column(ExchangeRateAmt; ExchangeRateAmt)
            {
            }
            column(ExcRate; "Currency Factor")
            {
            }
            column(PaymentTermsCode; "Payment Terms Code")
            {
            }
            column(CurrencyCode; CurrencyCode)
            {
            }
            column(AmtInWord; AmtInWord[1] + ' ' + AmtInWord[2])
            {
            }
            column(VATAmt; VATAmt)
            {
            }
            column(DNNo; DNNo)
            {
            }
            column(DNDate; DNDate)
            {
            }
            column(PaymentDes; PaymentDes) { }
            dataitem(DataItem9; "Sales Shipment Line")
            {
                DataItemLink = "Document No." = FIELD("No.");
                DataItemTableView = WHERE(Quantity = FILTER(<> 0));
                column(No_SalesLine; "No.")
                {
                }
                column(Description_SalesLine; Description)
                {
                }
                column(UnitofMeasure_SalesLine; "Unit of Measure")
                {
                }
                column(Quantity_SalesLine; Quantity)
                {
                }
                column(UnitPrice_SalesLine; "Unit Price")
                {
                }
                column(srno; srno)
                {
                }
                column(PartNumber; "No.")
                {
                }
                column(IUOMQty; IUOMQty)
                {
                }
                column(VAT_SalesInvoiceLine; "VAT %") { }
                column(VAT_Prod__Posting_Group; "VAT Prod. Posting Group") { }
                column(Type; Type)
                {
                }
                dataitem(DataItem13; "Item Ledger Entry")
                {
                    DataItemLink = "Document No." = FIELD("Document No."),
                                   "Item No." = FIELD("No."),
                                   "Variant Code" = FIELD("Variant Code");
                    column(ItemNo_ItemLedgerEntry; "Item No.")
                    {
                    }
                    column(VariantCode_ItemLedgerEntry; "Variant Code")
                    {
                    }
                    column(LotNo_ItemLedgerEntry; "Lot No.")
                    {
                    }
                    column(ExpirationDate_ItemLedgerEntry; FORMAT("Expiration Date"))
                    {
                    }
                    column(Quantity_ItemLedgerEntry; FORMAT(-Quantity) + (' KG'))
                    {
                    }
                }

                trigger OnAfterGetRecord()
                begin
                    //IF Currency.GET("Currency Code") THEN



                    CLEAR(ChkPrint);
                    ChkPrint.InitTextVariable;
                    ChkPrint.FormatNoText(AmtInWord, ROUND(AmtToVend), CurrText);
                    if Type <> Type::" " then
                        srno := srno + 1;

                    //VATAmt := ("VAT %" * Amount)/100;
                    totvatamnt := totvatamnt + VATAmt;



                    CurrencyFactor := 0;
                    IF SalesHeader.GET("Document No.") THEN
                        IF SalesHeader."Currency Factor" <> 0 THEN
                            CurrencyFactor := 1 / SalesHeader."Currency Factor"
                        ELSE
                            CurrencyFactor := 1;

                    IUOM.RESET;
                    IUOM.SETFILTER(IUOM."Item No.", "No.");
                    IUOM.SETFILTER(IUOM.Code, "Unit of Measure Code");
                    IF IUOM.FINDFIRST THEN BEGIN
                        IUOMQty := IUOM."Qty. per Unit of Measure";
                    END;
                end;

                trigger OnPreDataItem()
                begin
                    srno := 0;
                    VATAmt := 0;
                    totvatamnt := 0;
                end;
            }

            trigger OnAfterGetRecord()
            var
                PaymentTerms: Record "Payment Terms";
            begin
                if PaymentTerms.get(DataItem1."Payment Terms Code") then
                    PaymentDes := PaymentTerms.Description;

                IF "Currency Code" = '' THEN
                    CurrText := 'USD'
                ELSE
                    CurrText := "Currency Code";

                IF SalesPerson.GET("Salesperson Code") THEN
                    IF Currency.GET("Currency Code") THEN BEGIN
                        CurrencyExchangeRate.GetLastestExchangeRate(Currency.Code, ExchangeRateDate, ExchangeRateAmt);

                    END;
                SalesInvoiceLine.RESET;
                SalesInvoiceLine.SETRANGE("Document No.", "No.");
                IF SalesInvoiceLine.FINDSET THEN
                    REPEAT
                        AmtToVend += SalesInvoiceLine.Amount + ((SalesInvoiceLine."VAT %" * SalesInvoiceLine.Amount) / 100);
                    UNTIL SalesInvoiceLine.NEXT = 0;

                //MAQ IAX Added 28-03-2018.
                CLEAR(TotalLineAmt);
                CLEAR(TotalInvDisc);
                CLEAR(VATAmt);
                SaleLine.RESET;
                SaleLine.SETFILTER(SaleLine."Document No.", "No.");
                IF SaleLine.FINDFIRST THEN BEGIN
                    REPEAT
                        TotalLineAmt += SaleLine."Line Amount";
                        TotalInvDisc += SaleLine."Inv. Discount Amount";
                        VATAmt += (SaleLine."VAT %" * SaleLine.Amount) / 100;
                    UNTIL SaleLine.NEXT = 0;
                END;

                //MAQ IAX Added 01-04-2018.
                SSH.RESET;
                SSH.SETFILTER(SSH."Order No.", "Order No.");
                IF SSH.FINDFIRST THEN BEGIN
                    DNNo := SSH."No.";
                    DNDate := SSH."Order Date";
                END;

                GLSetup.GET;
                IF Currency.GET("Currency Code") THEN
                    CurrencyCode := Currency.Code
                ELSE
                    CurrencyCode := GLSetup."Local Currency Symbol";

                IF CustomerRec.GET("Sell-to Customer No.") THEN begin

                end;
                IF ShiptoAddress.GET("Sell-to Customer No.") THEN begin

                end;
                IF Currency.GET("Currency Code") THEN begin

                end;

            end;

            trigger OnPreDataItem()
            begin
                IF Gdoc <> '' THEN
                    SETRANGE("No.", Gdoc);
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }

        actions
        {
        }

        trigger OnOpenPage()
        begin
            HideLogo := FALSE;
        end;
    }

    labels
    {
    }

    trigger OnInitReport()
    var
        Country_Region: Record "Country/Region";
    begin
        CompanyInformation.GET;
        CompanyInformation.CALCFIELDS(Picture);
        if Country_Region.Get(CompanyInformation."Country/Region Code") then
            Comp_Country := Country_Region.Name;
    end;

    var
        Comp_Country: Text[50];
        PaymentDes: Text[100];
        CompanyInformation: Record 79;
        CustomerRec: Record 18;
        ShiptoAddress: Record 222;
        ChkPrint: Report Check;
        AmtToVend: Decimal;
        AmtInWord: array[2] of Text[80];
        srno: Integer;
        Gdoc: Code[20];
        SalesInvoiceLine: Record 37;
        VATAmt: Decimal;
        TotalLineAmt: Decimal;
        TotalInvDisc: Decimal;
        totvatamnt: Decimal;
        Currency: Record 4;
        CurrencyExchangeRate: Record 330;
        ExchangeRateAmt: Decimal;
        ExchangeRateDate: Date;
        SalesHeader: Record 112;
        CurrencyFactor: Decimal;
        GLSetup: Record 98;
        CurrencyCode: Code[10];
        SaleLine: Record 37;
        CurrText: Text[10];
        SalesPerson: Record 13;
        SSH: Record 112;
        DNNo: Code[20];
        DNDate: Date;
        HideLogo: Boolean;
        PrintOnlyOnePerPage: Boolean;
        IUOM: Record 5404;
        IUOMQty: Decimal;

    procedure SetDoc(Ldoc: Code[20])
    begin
        Gdoc := Ldoc;
    end;

    //[Scope('Personalization')] //MAQ commented 02-07-2020.
    procedure InitializeRequest(ShowAmountInLCY: Boolean; SetPrintOnlyOnePerPage: Boolean; SetExcludeBalanceOnly: Boolean)
    begin
        PrintOnlyOnePerPage := SetPrintOnlyOnePerPage;
    end;
}


