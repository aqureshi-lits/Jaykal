report 80016 "LIT Posted Sales Inv.2 - IAX"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Src/Layout/Posted Sales Inv.2 - IAX.rdlc';
    Caption = 'IAX Sales Invoice';
    PreviewMode = PrintLayout;

    dataset
    {
        dataitem(DataItem1; "Sales Invoice Header")
        {
            RequestFilterFields = "No.";
            column(Picture_CompanyInformation; CompanyInformation.Picture)
            {
            }
            column(ComName; CompanyInformation.Name)
            {
            }

            column(Homepage; CompanyInformation."Home Page")
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
            column(DocDate; "Document Date")
            {
            }
            column(OrderNo_SalesHeader; SalesOrderNo)
            {
            }
            column(OrderDate_SalesHeader; "Order Date")
            {
            }
            column(BilltoContactNo_SalesHeader; CustomerRec."Phone No.")
            {
            }
            column(YourReference_SalesHeader; "Your Reference")
            {
            }
            column(PostingDate_SalesHeader; "Posting Date")
            {
            }
            column(ShipmentDate_SalesInvoiceHeader; "Shipment Date")
            {
            }
            column(DueDate_SalesInvoiceHeader; "Due Date")
            {
            }
            column(SalespersonCode_SalesHeader; SalesPerson.Name)
            {
            }
            column(VATRegistrationNo_SalesHeader; CustVATRegNo)
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
            column(AmtInWordAED; AmtInWordAED[1] + ' ' + AmtInWordAED[2])
            {
            }
            column(VATAmtInWord; VATAmtInWord[1] + ' ' + VATAmtInWord[2])
            {
            }
            column(VATAmtInWordAED; VATAmtInWordAED[1] + ' ' + VATAmtInWordAED[2])
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
            column(Amount_SalesInvoiceHeader; Amount)
            {
            }
            column(AmountIncludingVAT_SalesInvoiceHeader; "Amount Including VAT")
            {
            }
            column(ShipmentMethodCode_SalesInvoiceHeader; "Shipment Method Code")
            {
            }
            column(ShipMethDesc; ShipMethDesc)
            {
            }
            column(BankAccount; BankAccount)
            {
            }
            column(Bank_Name; BankRec.Name)
            {
            }
            column(Bank_Name2; BankRec."Name 2")
            {
            }
            column(Bank_SWIFTCode; BankRec."SWIFT Code")
            {
            }
            column(Bank_BranchNo; BankRec."Bank Branch No.")
            {
            }
            column(Bank_AccountNo; BankRec."Bank Account No.")
            {
            }
            column(Bank_IBAN; BankRec.IBAN)
            {
            }
            column(Bank_Currency; BankRec."Currency Code")
            {
            }
            //
            column(CompAccountName; CompanyInformation."Name 2")
            {

            }

            column(CompBankAccount; CompanyInformation."Bank Account No.")
            {

            }

            column(compBankName; CompanyInformation."Bank Name")
            {

            }

            column(CompIBAN; CompanyInformation.IBAN)
            {

            }

            column(CompSWIFTCODE; CompanyInformation."SWIFT Code")
            {

            }

            dataitem(DataItem9; "Sales Invoice Line")
            {
                DataItemLink = "Document No." = FIELD("No.");
                DataItemTableView = WHERE("No." = FILTER(<> ''),
                                          Quantity = FILTER(<> 0));
                column(No_SalesLine; "No.")
                {
                }
                column(Description_SalesLine; Description)
                {
                }
                column(HSNCode_SalesLine; CompanyInformation.IBAN)
                {
                }
                column(UnitofMeasure_SalesLine; UOM)
                {
                }
                column(UnitofMeasureCode_SalesInvoiceLine; "Unit of Measure Code")
                {
                }
                column(Quantity_SalesLine; Quantity)
                {
                }
                column(UnitPrice_SalesLine; "Unit Price")
                {
                }
                column(LineAmount_SalesLine; "Line Amount")
                {
                }
                column(InvDiscountAmount_SalesLine; "Inv. Discount Amount")
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
                column(PartNumber; "No.")
                {
                }
                column(CurrencyFactor; CurrencyFactor)
                {
                }
                column(AmtIncVat; "Amount Including VAT")
                {
                }
                column(ItemVat; ItemVat)
                {
                }
                column(LineComments; LineComments)
                {
                }
                column(VariantUOM; VariantUOM)
                {
                }
                column(VariantQtyUOM; VariantQtyUOM)
                {
                }
                column(TotalVariantQtyUOM; Quantity * VariantQtyUOM)
                {
                }
                column(UnitPriceAED_SalesInvoiceLine; "Unit Price" * CurrencyFactor)
                {
                }
                column(AmountIncludingVATAED_SalesInvoiceLine; "Amount Including VAT" * CurrencyFactor)
                {
                }

                column(HideItemDetails; HideItemDetails)
                {

                }

                column(Type; Type)
                {
                }

                trigger OnAfterGetRecord()
                begin

                    CLEAR(ChkPrint);
                    ChkPrint.InitTextVariable;
                    ChkPrint.FormatNoText(AmtInWord, ROUND(AmtToVend), '');
                    ChkPrint.FormatNoText(AmtInWordAED, ROUND(AmtToVend * ExchangeRateAmt), ''); //MAQ IAX


                    if Type <> DataItem9.Type::" " then
                        srno := srno + 1;

                    VATAmt := ROUND((("VAT %" * Amount) / 100), 0.01);
                    totvatamnt := totvatamnt + VATAmt;
                    ItemVat := ("VAT %" * Amount) / 100;


                    CurrencyFactor := 0;
                    IF SalesHeader.GET("Document No.") THEN
                        IF SalesHeader."Currency Factor" <> 0 THEN
                            CurrencyFactor := 1 / SalesHeader."Currency Factor"
                        ELSE
                            CurrencyFactor := 1;

                    IF ItemCard.GET("No.") THEN
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

                    ItemVariant.RESET;
                    ItemVariant.SETFILTER(ItemVariant."Item No.", "No.");
                    ItemVariant.SETFILTER(ItemVariant.Code, "Variant Code");
                    IF ItemVariant.FINDFIRST THEN BEGIN
                    END;
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
                IF "Order No." <> '' THEN
                    SalesOrderNo := "Order No."
                ELSE
                    SalesOrderNo := "Your Reference";
                IF "Currency Code" = '' THEN
                    CurrText := 'AED'
                ELSE
                    CurrText := "Currency Code";




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
                        VATAmt += ROUND(((SaleLine."VAT %" * SaleLine.Amount) / 100), 0.01);
                    //   MESSAGE(FORMAT(VATAmt));
                    UNTIL SaleLine.NEXT = 0;
                END;

                CLEAR(ChkPrint);
                ChkPrint.InitTextVariable;
                ChkPrint.FormatNoText(VATAmtInWord, ROUND(VATAmt), '');
                ChkPrint.FormatNoText(VATAmtInWordAED, ROUND(VATAmt * ExchangeRateAmt), '');   //MAQ IAX


                //DNNo   := '';
                DNNo := '';
                DNDate := 0D;
                SSH.RESET;
                SSH.SETFILTER(SSH."Order No.", "Order No.");
                //SSH.SETFILTER(SSH."No." ,  "Customer Shipment No.");
                IF SSH.FINDFIRST THEN BEGIN
                    IF "Order No." <> '' THEN BEGIN

                        DNDate := SSH."Order Date";
                        DNNo := SSH."No.";
                    END;
                END;
                DOrepeat := '';

                /*
                SalesInvRec.RESET;
                SalesInvRec.SETRANGE("Document No.","No.");
                IF SalesInvRec.FINDFIRST THEN BEGIN
                   REPEAT
                     IF DOrepeat<>SalesInvRec."Shipment No." THEN BEGIN
                        DNNo:=SalesInvRec."Shipment No."+','+DNNo;
                        DOrepeat:=SalesInvRec."Shipment No.";
                        END;
                        IF SalesInvRec."Shipment No."='' THEN BEGIN
                           SSH.RESET;
                           SSH.SETRANGE("Order No.",SalesInvRec."Order No.");
                           IF SSH.FINDFIRST THEN
                              DNNo:=SSH."No.";
                           END;
                
                     UNTIL SalesInvRec.NEXT=0;
                END;
                */

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


                IF ShiptoAddress.GET("Sell-to Customer No.") THEN
                    IF Currency.GET("Currency Code") THEN
                        IF SalesPerson.GET("Salesperson Code") THEN
                            ShipMeth.RESET;
                ShipMeth.SETFILTER(ShipMeth.Code, "Shipment Method Code");
                IF ShipMeth.FINDFIRST THEN BEGIN
                    ShipMethDesc := ShipMeth.Description;
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
                group("Bank Account")
                {
                    Visible = false;
                    field("Bank Code"; BankAccount)
                    {
                        ApplicationArea = All;
                        Caption = 'Bank Code';
                        TableRelation = "Bank Account"."No.";
                    }
                }

                group("Hide Item Details")
                {
                    field("Hide Item Detailss"; HideItemDetails)
                    {
                        ApplicationArea = all;
                        Caption = 'Hide Item Details';

                    }
                }

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
        CompanyInformation: Record 79;
        CustomerRec: Record 18;
        ShiptoAddress: Record 222;
        ChkPrint: Report Check;
        AmtToVend: Decimal;
        AmtInWord: array[2] of Text[80];
        AmtInWordAED: array[2] of Text[80];
        srno: Integer;
        Gdoc: Code[20];
        SalesInvoiceLine: Record 113;
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
        SaleLine: Record 113;
        CurrText: Text[10];
        SalesPerson: Record 13;
        SSH: Record 110;
        DNNo: Code[250];
        DNDate: Date;
        CustVATRegNo: Text;
        ItemVat: Decimal;
        VATAmtInWord: array[2] of Text[80];
        VATAmtInWordAED: array[2] of Text[80];
        ItemCard: Record 27;
        UOM: Code[20];
        DOrepeat: Code[20];
        SalesOrderNo: Text[250];
        SalesCmtLine: Record 44;
        LineComments: Text[250];
        ShipMeth: Record 10;
        ShipMethDesc: Text[50];
        ItemVariant: Record 5401;
        VariantUOM: Code[10];
        VariantQtyUOM: Decimal;
        BankRec: Record 270;
        BankAccount: Code[20];
        HideItemDetails: Boolean;

    procedure SetDoc(Ldoc: Code[20])
    begin
        Gdoc := Ldoc;
    end;
}

