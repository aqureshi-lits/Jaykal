report 80014 "LIT Posted Sales Invoice - IAX"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Src/Layout/Posted Sales Invoice - IAX.rdlc';
    Caption = 'Posted Sales Invoice - IAX';
    PreviewMode = PrintLayout;

    dataset
    {
        dataitem(DataItem1; "Sales Invoice Header")
        {
            RequestFilterFields = "No.";
            CalcFields = "Work Description";

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
            column(CityandCountry; 'P.O. BOX. No. : ' + CompanyInformation."Post Code" + ' ' + CompanyInformation.City + ' -' + CompanyInformation."Country/Region Code")
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
            column(OrderNo_SalesHeader; "Order No.")
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
            column(DueDate_SalesHeader; "Due Date")
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
            column(InvoiceTypeSelection; InvoiceTypeSelection)
            {
            }


            dataitem(DataItem13; "Shipping Agent")
            {
                DataItemLink = "Code" = FIELD("Shipping Agent Code");

                column(Code_ShippingAgent; Code)
                {
                }
                column(Name_ShippingAgent; Name)
                {
                }
            }
            dataitem(DataItem9; "Sales Invoice Line")
            {
                DataItemLink = "Document No." = FIELD("No.");

                column(LineNo_SalesLine; "Line No.")
                {
                }
                column(No_SalesLine; "No.")
                {
                }
                column(Description_SalesLine; Description)
                {
                }
                column(UnitofMeasure_SalesLine; "Unit of Measure Code")
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

                trigger OnAfterGetRecord()
                begin
                    //IF Currency.GET("Currency Code") THEN



                    CLEAR(ChkPrint);
                    ChkPrint.InitTextVariable;
                    ChkPrint.FormatNoText(AmtInWord, ROUND(AmtToVend), '');

                    srno := srno + 1;

                    VATAmt := ("VAT %" * Amount) / 100;
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
                end;
            }

            trigger OnAfterGetRecord()
            begin

                IF "Currency Code" = '' THEN
                    CurrText := 'USD'
                ELSE
                    CurrText := "Currency Code";

                IF SalesPerson.GET("Salesperson Code") THEN
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

                CLEAR(CustVATRegNo);
                CustomerRec.RESET;
                CustomerRec.SETFILTER(CustomerRec."No.", "Sell-to Customer No.");
                IF NOT CustomerRec.FINDFIRST THEN BEGIN
                    CustVATRegNo := ''
                END ELSE begin
                    CustVATRegNo := CustomerRec."VAT Registration No.";
                end;



                IF ShiptoAddress.GET("Sell-to Customer No.") THEN begin
                end;
                IF Currency.GET("Currency Code") THEN begin
                end;
                IF BankRec.GET(BankAccount) THEN BEGIN
                END;
            End;

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
                    field("Bank Code"; BankAccount)
                    {
                        ApplicationArea = All;
                        Caption = 'Bank Code';
                        TableRelation = "Bank Account"."No.";
                    }
                    field(InvoiceTypeSelection; InvoiceTypeSelection)
                    {
                        ApplicationArea = All;
                        Caption = 'Invoice Type Selection';
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
        ChkPrint: Report Check;
        AmtToVend: Decimal;
        AmtInWord: array[2] of Text[80];
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
        DNNo: Code[20];
        DNDate: Date;
        CustVATRegNo: Text;
        HideLogo: Boolean;
        BankRec: Record 270;
        BankAccount: Code[20];
        InvoiceTypeSelection: Option " ",Original,Duplicate;




    procedure SetDoc(Ldoc: Code[20])
    begin
        Gdoc := Ldoc;
    end;
}

