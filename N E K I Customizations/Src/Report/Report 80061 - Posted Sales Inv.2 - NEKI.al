report 80061 "Posted Sales Inv.2 - IAX"
{
    // version IAX Frz

    DefaultLayout = RDLC;
    RDLCLayout = './Src/Layout/RGS Reports/Posted Sales Inv.2 - IAX.rdlc';
    PreviewMode = PrintLayout;

    dataset
    {
        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {
            RequestFilterFields = "No.";
            column(CompPic; CompanyInformation.Picture)
            {
            }
            column(Picture2_RespCent; CompanyInformation.Picture)
            {
            }
            column(No_SalesHeader; "Sales Invoice Header"."No.")
            {
            }
            column(BilltoCustomerNo_SalesHeader; "Sales Invoice Header"."Bill-to Customer No.")
            {
            }
            column(BilltoName_SalesHeader; "Sales Invoice Header"."Bill-to Name")
            {
            }
            column(BilltoName2_SalesHeader; "Sales Invoice Header"."Bill-to Name 2")
            {
            }
            column(BilltoAddress_SalesHeader; "Sales Invoice Header"."Bill-to Address")
            {
            }
            column(BilltoAddress2_SalesHeader; "Sales Invoice Header"."Bill-to Address 2")
            {
            }
            column(BilltoCity_SalesHeader; "Sales Invoice Header"."Bill-to City" + ' , ' + "Sales Invoice Header"."Bill-to Country/Region Code")
            {
            }
            column(BilltoPostCode_SalesHeader; "Sales Invoice Header"."Bill-to Post Code")
            {
            }
            column(BilltoCounty_SalesHeader; "Sales Invoice Header"."Bill-to County")
            {
            }
            column(BilltoCountryRegionCode_SalesHeader; "Sales Invoice Header"."Bill-to Country/Region Code")
            {
            }
            column(BilltoContact_SalesHeader; "Sales Invoice Header"."Bill-to Contact")
            {
            }
            column(QuoteNo_SalesHeader; "Sales Invoice Header"."Quote No.")
            {
            }
            column(DocDate; "Sales Invoice Header"."Document Date")
            {
            }
            column(OrderNo_SalesHeader; SalesOrderNo)
            {
            }
            column(OrderDate_SalesHeader; "Sales Invoice Header"."Order Date")
            {
            }
            column(BilltoContactNo_SalesHeader; CustomerRec."Phone No.")
            {
            }
            column(YourReference_SalesHeader; "Sales Invoice Header"."Your Reference")
            {
            }
            column(PostingDate_SalesHeader; "Sales Invoice Header"."Posting Date")
            {
            }
            column(SalespersonCode_SalesHeader; SalesPerson.Name)
            {
            }
            column(VATRegistrationNo_SalesHeader; CustVATRegNo)
            {
            }
            column(ExternalDocumentNo_SalesHeader; "Sales Invoice Header"."External Document No.")
            {
            }
            column(CurrencyCode_SalesHeader; "Sales Invoice Header"."Currency Code")
            {
            }
            column(CurrText; CurrText)
            {
            }
            column(CourierName_SalesHeader; CompanyInformation.IBAN)
            {
            }
            column(AWBNo_SalesHeader; CompanyInformation.IBAN)
            {
            }
            column(AWBDate_SalesHeader; CompanyInformation.IBAN)
            {
            }
            column(Remarks_SalesHeader; CompanyInformation.IBAN)
            {
            }
            column(ShiptoCode_SalesHeader; "Sales Invoice Header"."Ship-to Code")
            {
            }
            column(ShiptoName_SalesHeader; "Sales Invoice Header"."Ship-to Name")
            {
            }
            column(ShiptoName2_SalesHeader; "Sales Invoice Header"."Ship-to Name 2")
            {
            }
            column(ShiptoAddress_SalesHeader; "Sales Invoice Header"."Ship-to Address")
            {
            }
            column(ShiptoAddress2_SalesHeader; "Sales Invoice Header"."Ship-to Address 2")
            {
            }
            column(ShiptoCity_SalesHeader; "Sales Invoice Header"."Ship-to City" + ' , ' + "Sales Invoice Header"."Ship-to Country/Region Code")
            {
            }
            column(ShiptoCountryRegionCode_SalesHeader; "Sales Invoice Header"."Ship-to Country/Region Code")
            {
            }
            column(ShiptoContact_SalesHeader; "Sales Invoice Header"."Ship-to Contact")
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
            column(Single_TRN; CompanyInformation."VAT Registration No.")
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
            column(CompContry; CompanyInformation."Country/Region Code")
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
            column(ExcRate; "Sales Invoice Header"."Currency Factor")
            {
            }
            column(WorkDescription; "Work Description")
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
            column(AmtInWordVAt; AmtInWordVat[1] + ' ' + AmtInWordVat[2])
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
            column(Amount_SalesInvoiceHeader; "Sales Invoice Header".Amount)
            {
            }
            column(AmountIncludingVAT_SalesInvoiceHeader; "Sales Invoice Header"."Amount Including VAT")
            {
            }
            dataitem("Sales Invoice Line"; "Sales Invoice Line")
            {
                DataItemLink = "Document No." = FIELD("No.");
                DataItemTableView = WHERE("No." = FILTER(<> ''),
                                          Quantity = FILTER(<> 0));
                column(No_SalesLine; "Sales Invoice Line"."No.")
                {
                }
                column(Description_SalesLine; "Sales Invoice Line".Description)
                {
                }
                column(HSNCode_SalesLine; CompanyInformation.IBAN)
                {
                }
                column(UnitofMeasure_SalesLine; UOM)
                {
                }
                column(Quantity_SalesLine; "Sales Invoice Line".Quantity)
                {
                }
                column(UnitPrice_SalesLine; "Sales Invoice Line"."Unit Price")
                {
                }
                column(LineAmount_SalesLine; "Sales Invoice Line"."Line Amount")
                {
                }
                column(InvDiscountAmount_SalesLine; "Sales Invoice Line"."Inv. Discount Amount")
                {
                }
                column(LineDiscountAmount_PurchaseLine; "Line Discount Amount")
                {
                }
                column(Amount_PurchaseLine; Amount)
                {
                }
                column(VATBaseAmount_SalesInvoiceLine; "VAT Base Amount")
                {
                }
                column(VAT_SalesInvoiceLine; "VAT %")
                {
                }
                column(srno; srno)
                {
                }
                column(totvatamnt; totvatamnt)
                {
                }
                column(PartNumber; "Sales Invoice Line"."No.")
                {
                }
                column(CurrencyFactor; CurrencyFactor)
                {
                }
                column(AmtIncVat; "Sales Invoice Line"."Amount Including VAT")
                {
                }
                column(ItemVat; ItemVat)
                {
                }
                column(LineComments; LineComments)
                {
                }

                trigger OnAfterGetRecord()
                begin




                    CLEAR(ChkPrint);
                    ChkPrint.InitTextVariable;
                    ChkPrint.FormatNoText(AmtInWord, ROUND(AmtToVend), '');



                    srno := srno + 1;

                    VATAmt := ("VAT %" * Amount) / 100;
                    totvatamnt := totvatamnt + VATAmt;
                    ItemVat := ("VAT %" * Amount) / 100;


                    CurrencyFactor := 0;
                    IF SalesHeader.GET("Document No.") THEN
                        IF SalesHeader."Currency Factor" <> 0 THEN
                            CurrencyFactor := 1 / SalesHeader."Currency Factor"
                        ELSE
                            CurrencyFactor := 1;

                    IF ItemCard.GET("Sales Invoice Line"."No.") THEN
                        UOM := ItemCard."Sales Unit of Measure"
                    ELSE
                        UOM := '';



                    //comments
                    LineComments := '';
                    SalesCmtLine.RESET;
                    //SalesCmtLine.SETRANGE("Document Type","Sales Invoice Line""Document Type");
                    SalesCmtLine.SETRANGE("No.", "Document No.");
                    SalesCmtLine.SETRANGE("Document Line No.", "Line No.");
                    IF SalesCmtLine.FINDFIRST THEN
                        REPEAT
                            LineComments := LineComments + ' ' + SalesCmtLine.Comment;
                        UNTIL SalesCmtLine.NEXT = 0;
                end;

                trigger OnPreDataItem()
                begin
                    srno := 0;
                    VATAmt := 0;
                    totvatamnt := 0;
                    ItemVat := 0
                end;
            }

            trigger OnAfterGetRecord()
            begin
                IF "Sales Invoice Header"."Order No." <> '' THEN
                    SalesOrderNo := "Sales Invoice Header"."Order No."
                ELSE
                    SalesOrderNo := "Sales Invoice Header"."Your Reference";
                IF "Currency Code" = '' THEN
                    CurrText := 'AED'
                ELSE
                    CurrText := "Currency Code";

                IF SalesPerson.GET("Sales Invoice Header"."Salesperson Code") THEN
                    IF Currency.GET("Currency Code") THEN BEGIN
                        CurrencyExchangeRate.GetLastestExchangeRate(Currency.Code, ExchangeRateDate, ExchangeRateAmt);

                    END;

                CLEAR(AmtToVend);
                SalesInvoiceLine.RESET;
                SalesInvoiceLine.SETRANGE("Document No.", "No.");
                IF SalesInvoiceLine.FINDFIRST THEN
                    REPEAT
                        AmtToVend += SalesInvoiceLine.Amount + ((SalesInvoiceLine."VAT %" * SalesInvoiceLine.Amount) / 100);
                    UNTIL SalesInvoiceLine.NEXT = 0;


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

                CLEAR(ChkPrint);
                ChkPrint.InitTextVariable;
                ChkPrint.FormatNoText(AmtInWordVat, ROUND(VATAmt), '');

                //DNNo   := '';
                DNDate := 0D;
                SSH.RESET;
                SSH.SETFILTER(SSH."Order No.", "Sales Invoice Header"."Order No.");
                IF SSH.FINDFIRST THEN BEGIN
                    IF "Sales Invoice Header"."Order No." <> '' THEN BEGIN

                        DNDate := SSH."Order Date";
                    END;
                END;
                DOrepeat := '';
                DNNo := '';
                SalesInvRec.RESET;
                SalesInvRec.SETRANGE("Document No.", "No.");
                IF SalesInvRec.FINDFIRST THEN BEGIN
                    REPEAT
                        IF DOrepeat <> SalesInvRec."Shipment No." THEN BEGIN
                            DNNo := SalesInvRec."Shipment No." + ',' + DNNo;
                            DOrepeat := SalesInvRec."Shipment No.";
                        END;
                        IF SalesInvRec."Shipment No." = '' THEN BEGIN
                            SSH.RESET;
                            SSH.SETRANGE("Order No.", SalesInvRec."Order No.");
                            IF SSH.FINDFIRST THEN
                                DNNo := SSH."No.";
                        END;

                    UNTIL SalesInvRec.NEXT = 0;

                END;

                GLSetup.GET;
                IF Currency.GET("Currency Code") THEN
                    CurrencyCode := Currency.Code
                ELSE
                    CurrencyCode := GLSetup."Local Currency Symbol";

                CLEAR(CustVATRegNo);
                CustomerRec.RESET;
                CustomerRec.SETFILTER(CustomerRec."No.", "Sell-to Customer No.");
                IF NOT CustomerRec.FINDFIRST THEN BEGIN
                    CustVATRegNo := ''
                END ELSE
                    CustVATRegNo := CustomerRec."VAT Registration No.";


                IF ShiptoAddress.GET("Sales Invoice Header"."Sell-to Customer No.") THEN
                    IF Currency.GET("Currency Code") THEN;
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

            }
        }

        actions
        {
        }

        trigger OnOpenPage()
        begin
            //HideLogo := FALSE;
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
        CompanyInformation: Record "79";
        CustomerRec: Record "18";
        ShiptoAddress: Record "222";
        ChkPrint: Report "1401";
        AmtToVend: Decimal;
        AmtInWord: array[2] of Text[80];
        srno: Integer;
        Gdoc: Code[20];
        SalesInvoiceLine: Record "113";
        VATAmt: Decimal;
        TotalLineAmt: Decimal;
        TotalInvDisc: Decimal;
        totvatamnt: Decimal;
        Currency: Record "4";
        CurrencyExchangeRate: Record "330";
        ExchangeRateAmt: Decimal;
        ExchangeRateDate: Date;
        SalesHeader: Record "112";
        CurrencyFactor: Decimal;
        GLSetup: Record "98";
        CurrencyCode: Code[10];
        SaleLine: Record "113";
        CurrText: Text[10];
        SalesPerson: Record "13";
        SSH: Record "110";
        DNNo: Code[250];
        DNDate: Date;
        RespCent: Record "5714";
        CustVATRegNo: Text;
        ItemVat: Decimal;
        AmtInWordVat: array[2] of Text[80];
        ItemCard: Record "27";
        UOM: Code[20];
        SalesInvRec: Record "113";
        DOrepeat: Code[20];
        SalesOrderNo: Text[250];
        SalesCmtLine: Record "44";
        LineComments: Text[250];

    procedure SetDoc(Ldoc: Code[20])
    begin
        Gdoc := Ldoc;
    end;
}

