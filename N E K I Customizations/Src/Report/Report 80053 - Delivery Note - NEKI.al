report 80053 "Delivery Note - IAX"
{
    // version IAX Frz

    DefaultLayout = RDLC;
    RDLCLayout = './Src/Layout/RGS Reports/Delivery Note - IAX.rdlc';
    PreviewMode = PrintLayout;

    dataset
    {
        dataitem("Sales Shipment Header"; "Sales Shipment Header")
        {
            RequestFilterFields = "No.";
            column(HideLogo; HideLogo)
            {
            }
            column(Picture_RespCent; CompanyInformation.Picture)
            {
            }
            column(No_SalesHeader; "Sales Shipment Header"."No.")
            {
            }
            column(BilltoCustomerNo_SalesHeader; "Sales Shipment Header"."Bill-to Customer No.")
            {
            }
            column(BilltoName_SalesHeader; "Sales Shipment Header"."Bill-to Name")
            {
            }
            column(BilltoName2_SalesHeader; "Sales Shipment Header"."Bill-to Name 2")
            {
            }
            column(BilltoAddress_SalesHeader; "Sales Shipment Header"."Bill-to Address")
            {
            }
            column(BilltoAddress2_SalesHeader; "Sales Shipment Header"."Bill-to Address 2")
            {
            }
            column(BilltoCity_SalesHeader; "Sales Shipment Header"."Bill-to City" + ' , ' + "Sales Shipment Header"."Bill-to Country/Region Code")
            {
            }
            column(BilltoPostCode_SalesHeader; "Sales Shipment Header"."Bill-to Post Code")
            {
            }
            column(BilltoCounty_SalesHeader; "Sales Shipment Header"."Bill-to County")
            {
            }
            column(BilltoCountryRegionCode_SalesHeader; "Sales Shipment Header"."Bill-to Country/Region Code")
            {
            }
            column(BilltoContact_SalesHeader; "Sales Shipment Header"."Bill-to Contact")
            {
            }
            column(QuoteNo_SalesHeader; "Sales Shipment Header"."Quote No.")
            {
            }
            column(OrderNo_SalesHeader; "Sales Shipment Header"."Order No.")
            {
            }
            column(OrderDate_SalesHeader; "Sales Shipment Header"."Order Date")
            {
            }
            column(BilltoContactNo_SalesHeader; CustomerRec."Phone No.")
            {
            }
            column(YourReference_SalesHeader; "Sales Shipment Header"."Your Reference")
            {
            }
            column(PostingDate_SalesHeader; "Sales Shipment Header"."Posting Date")
            {
            }
            column(SalespersonCode_SalesHeader; SalesPerson.Name)
            {
            }
            column(VATRegistrationNo_SalesHeader; "Sales Shipment Header"."VAT Registration No.")
            {
            }
            column(ExternalDocumentNo_SalesHeader; "Sales Shipment Header"."External Document No.")
            {
            }
            column(CurrencyCode_SalesHeader; "Sales Shipment Header"."Currency Code")
            {
            }
            column(DocDate; "Sales Shipment Header"."Document Date")
            {
            }
            column(CurrText; CurrText)
            {
            }
            column(ShiptoCode_SalesHeader; "Sales Shipment Header"."Ship-to Code")
            {
            }
            column(ShiptoName_SalesHeader; "Sales Shipment Header"."Ship-to Name")
            {
            }
            column(ShiptoName2_SalesHeader; "Sales Shipment Header"."Ship-to Name 2")
            {
            }
            column(ShiptoAddress_SalesHeader; "Sales Shipment Header"."Ship-to Address")
            {
            }
            column(ShiptoAddress2_SalesHeader; "Sales Shipment Header"."Ship-to Address 2")
            {
            }
            column(ShiptoCity_SalesHeader; "Sales Shipment Header"."Ship-to City" + ' , ' + "Sales Shipment Header"."Ship-to Country/Region Code")
            {
            }
            column(ShiptoCountryRegionCode_SalesHeader; "Sales Shipment Header"."Ship-to Country/Region Code")
            {
            }
            column(ShiptoContact_SalesHeader; "Sales Shipment Header"."Ship-to Contact")
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
            column(CompanyTRN; 'TRN No. : ' + CompanyInformation."VAT Registration No." + ' , Email  : ' + CompanyInformation."E-Mail")
            {
            }
            column(ComName; CompanyInformation.Name)
            {
            }
            column(Address; CompanyInformation.Address + ' , ' + CompanyInformation."Address 2")
            {
            }
            column(Addrss2; CompanyInformation."Address 2")
            {
            }
            column(City; CompanyInformation.City + ' -' + CompanyInformation."Country/Region Code")
            {
            }
            column(CompPhone; 'Phone No. : ' + CompanyInformation."Phone No." + ', Fax No. : ' + CompanyInformation."Fax No.")
            {
            }
            column(Comp_Post; CompanyInformation."Post Code")
            {
            }
            column(CompContry; CompanyInformation.County)
            {
            }
            column(CompEmail; CompanyInformation."E-Mail")
            {
            }
            column(CompFax; CompanyInformation."Fax No.")
            {
            }
            column(ExchangeRateAmt; ExchangeRateAmt)
            {
            }
            column(ExcRate; "Sales Shipment Header"."Currency Factor")
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
            column(InvoiceNo; InvoiceNo)
            {
            }
            column(InvoiceDate; InvoiceDate)
            {
            }
            dataitem("Sales Shipment Line"; "Sales Shipment Line")
            {
                DataItemLink = "Document No." = FIELD("No.");
                DataItemTableView = WHERE(Quantity = FILTER(<> 0));
                column(No_SalesLine; "Sales Shipment Line"."No.")
                {
                }
                column(Description_SalesLine; "Sales Shipment Line".Description)
                {
                }
                column(UnitofMeasure_SalesLine; UOM)
                {
                }
                column(Quantity_SalesLine; "Sales Shipment Line".Quantity)
                {
                }
                column(UnitPrice_SalesLine; "Sales Shipment Line"."Unit Price")
                {
                }
                column(srno; srno)
                {
                }
                column(PartNumber; "Sales Shipment Line"."No.")
                {
                }
                column(ExtText; ExtText)
                {
                }
                dataitem("Sales Comment Line"; "Sales Comment Line")
                {
                    DataItemLink = "No." = FIELD("Document No."),
                                   "Document Line No." = FIELD("Line No.");
                    column(S_Comments; "Sales Comment Line".Comment)
                    {
                    }
                }

                trigger OnAfterGetRecord()
                begin
                    //IF Currency.GET("Currency Code") THEN
                    //IF "Sales Shipment Line".Type="Sales Shipment Line".Type::" " THEN
                    //IF "Sales Shipment Line".Description<>'' THEN
                    //ExtText:=ShipmentLine_Rec.Description;
                    //MESSAGE(ExtText);
                    //ELSE
                    //ExtText:='';
                    /*
                    ExtText:='';
                    ShipmentLine_Rec.RESET;
                    ShipmentLine_Rec.SETRANGE("Document No.","Document No.");
                    ShipmentLine_Rec.SETRANGE("No.",'');
                    IF ShipmentLine_Rec.FINDFIRST THEN
                      REPEAT
                      ExtText+=' '+ShipmentLine_Rec.Description;
                      UNTIL  ShipmentLine_Rec.NEXT=0;*/

                    IF ItemCard.GET("Sales Shipment Line"."No.") THEN
                        UOM := ItemCard."Sales Unit of Measure"
                    ELSE
                        UOM := '';


                    CLEAR(ChkPrint);
                    ChkPrint.InitTextVariable;
                    ChkPrint.FormatNoText(AmtInWord, ROUND(AmtToVend), CurrText);

                    srno := srno + 1;

                    //VATAmt := ("VAT %" * Amount)/100;
                    totvatamnt := totvatamnt + VATAmt;



                    CurrencyFactor := 0;
                    IF SalesHeader.GET("Document No.") THEN
                        IF SalesHeader."Currency Factor" <> 0 THEN
                            CurrencyFactor := 1 / SalesHeader."Currency Factor"
                        ELSE
                            CurrencyFactor := 1;

                end;

                trigger OnPreDataItem()
                begin
                    srno := 0;
                    VATAmt := 0;
                    totvatamnt := 0;
                    ExtText := ''
                end;
            }

            trigger OnAfterGetRecord()
            begin

                IF "Currency Code" = '' THEN
                    CurrText := 'AED'
                ELSE
                    CurrText := "Currency Code";

                IF SalesPerson.GET("Sales Shipment Header"."Salesperson Code") THEN
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
                SSH.SETFILTER(SSH."Order No.", "Sales Shipment Header"."Order No.");
                IF SSH.FINDFIRST THEN BEGIN
                    DNNo := SSH."No.";
                    DNDate := SSH."Order Date";
                END;

                GLSetup.GET;
                IF Currency.GET("Currency Code") THEN
                    CurrencyCode := Currency.Code
                ELSE
                    CurrencyCode := GLSetup."Local Currency Symbol";

                IF CustomerRec.GET("Sales Shipment Header"."Sell-to Customer No.") THEN
                    IF ShiptoAddress.GET("Sales Shipment Header"."Sell-to Customer No.") THEN
                        IF Currency.GET("Currency Code") THEN
                            InvoiceDate := 0D;
                InvoiceNo := '';
                SalesHeader.RESET;
                SalesHeader.SETRANGE("Order No.", "Order No.");
                IF SalesHeader.FINDFIRST THEN BEGIN
                    InvoiceDate := SalesHeader."Posting Date";
                    InvoiceNo := SalesHeader."No.";
                END;
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
                group(Print)
                {
                    field("Print on Letter Head"; HideLogo)
                    {
                        ApplicationArea = all;
                    }
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
    begin
        CompanyInformation.GET;
        CompanyInformation.CALCFIELDS(Picture);
    end;

    var
        CompanyInformation: Record 79;
        CustomerRec: Record 18;
        ShiptoAddress: Record 222;
        ChkPrint: Report 1401;
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
        RespCent: Record 5714;
        HideLogo: Boolean;
        ShipmentLine_Rec: Record 111;
        ExtText: Text[500];
        ItemCard: Record 27;
        UOM: Code[20];
        InvoiceNo: Code[20];
        InvoiceDate: Date;

    procedure SetDoc(Ldoc: Code[20])
    begin
        Gdoc := Ldoc;
    end;
}

