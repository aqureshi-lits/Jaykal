report 80040 "LIT Sales Quote 2"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Src/Layout/Sales Quote 2.rdl';
    Caption = 'Sales Quote';
    PreviewMode = PrintLayout;

    dataset
    {
        dataitem(DataItem1; "Sales Header")
        {
            DataItemTableView = WHERE("Document Type" = CONST(Quote));
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
            column(CityandCountry; 'P.O. BOX. No. : ' + CompanyInformation."Post Code" + ', ' + CompanyInformation.City + ' - ' + CompanyInformation."Country/Region Code")
            {
            }
            column(CompanyTRN; CompanyInformation."VAT Registration No.")
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
            column(CourierName_SalesHeader; CompanyInformation.IBAN)
            {
            }
            column(Single_TRN; 'TRN ' + CompanyInformation."VAT Registration No.")
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
            column(BilltoContactNo_SalesHeader; CustomerRec."Phone No.")
            {
            }
            column(YourReference_SalesHeader; "Your Reference")
            {
            }
            column(OrderDate_SalesHeader; "Order Date")
            {
            }
            column(PostingDate_SalesHeader; "Posting Date")
            {
            }
            column(SalespersonName_SalesHeader; SalesPerson.Name)
            {
            }
            column(SalespersonEmail_SalesHeader; SalesPerson."E-Mail")
            {
            }
            column(SalespersonPhonel_SalesHeader; SalesPerson."Phone No.")
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
            column(TotalLineAmt; TotalLineAmt)
            {
            }
            column(TotalInvDisc; TotalInvDisc)
            {
            }
            column(VATAmt; VATAmt)
            {
            }
            column(ShipMethDesc; ShipMethDesc)
            {
            }
            //Adding By FA
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
            column(PaymentDes; PaymentDes) { }
            column(Shortcut_Dimension_1_Code; "Shortcut Dimension 1 Code")
            {
            }
            column(Quote_Valid_Until_Date; "Quote Valid Until Date")
            {
            }
            column(HideItemDetails; HideItemDetails)
            {

            }

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

            dataitem(DataItem9; "Sales Line")
            {
                DataItemLink = "Document No." = FIELD("No."),
                               "Document Type" = FIELD("Document Type");
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

                COLUMN(Promised_Delivery_Date; "Promised Delivery Date")
                {

                }
                // column(VatDescription; VatDescription) { }
                column(VAT_Prod__Posting_Group; "VAT Prod. Posting Group") { }
                column(Type; Type)
                {
                }
                trigger OnAfterGetRecord()
                // var
                // VATPostingSetup: Record "VAT Posting Setup";
                begin
                    // VatDescription := '';
                    // VATPostingSetup.Get(SaleLine."VAT Bus. Posting Group", "VAT Prod. Posting Group");
                    // VatDescription := VATPostingSetup.Description;
                    IF Currency.GET("Currency Code") THEN
                        CLEAR(ChkPrint);
                    ChkPrint.InitTextVariable;
                    ChkPrint.FormatNoText(AmtInWord, ROUND(AmtToVend), "Currency Code");
                    if Type <> DataItem9.Type::" " then
                        srno := srno + 1;

                    totvatamnt := totvatamnt + VATAmt;



                    CurrencyFactor := 0;
                    IF SalesHeader.GET("Document Type", "Document No.") THEN
                        IF SalesHeader."Currency Factor" <> 0 THEN
                            CurrencyFactor := 1 / SalesHeader."Currency Factor"
                        ELSE
                            CurrencyFactor := 1;
                end;

                trigger OnPreDataItem()
                begin
                    srno := 0;
                    totvatamnt := 0;
                end;
            }

            trigger OnAfterGetRecord()
            var
                PaymentTerms: Record "Payment Terms";
            begin
                PaymentDes := '';
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
                SaleLine.SETRANGE(SaleLine."Document Type", "Document Type");
                SaleLine.SETFILTER(SaleLine."Document No.", "No.");
                IF SaleLine.FINDFIRST THEN BEGIN
                    REPEAT
                        TotalLineAmt += SaleLine."Line Amount";
                        TotalInvDisc += SaleLine."Inv. Discount Amount";
                        VATAmt += (SaleLine."VAT %" * SaleLine.Amount) / 100;
                    UNTIL SaleLine.NEXT = 0;
                END;



                GLSetup.GET;
                IF Currency.GET("Currency Code") THEN
                    CurrencyCode := Currency.Code
                ELSE
                    CurrencyCode := GLSetup."Local Currency Symbol";

                IF CustomerRec.GET("Sell-to Customer No.") THEN
                    IF ShiptoAddress.GET("Sell-to Customer No.") THEN
                        ShipMeth.RESET;
                ShipMeth.SETFILTER(ShipMeth.Code, "Shipment Method Code");
                IF ShipMeth.FINDFIRST THEN BEGIN
                    ShipMethDesc := ShipMeth.Description;
                END;
                //////////////// WAJ 052322////////////////////
                //Quotevalid := "Quote Valid Until Date" - "Document Date";


                //////////// WAJ 052322///////////////////////
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
            //Added by FA
            area(content)
            {
                group("Bank Account")
                {
                    Visible = FALSE;
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
        // VatDescription: Text[100];
        CompanyInformation: Record 79;
        CustomerRec: Record 18;
        Quotevalid: Integer;
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

        SalesHeader: Record 36;

        CurrencyFactor: Decimal;

        GLSetup: Record 98;

        CurrencyCode: Code[10];

        SaleLine: Record 37;

        CurrText: Text[10];

        SalesPerson: Record 13;


        ShipMeth: Record 10;

        ShipMethDesc: Text[50];
        //Added by FA
        BankAccount: Code[20];
        BankRec: Record 270;
        HideItemDetails: Boolean;

    procedure SetDoc(Ldoc: Code[20])
    begin
        Gdoc := Ldoc;
    end;
}

