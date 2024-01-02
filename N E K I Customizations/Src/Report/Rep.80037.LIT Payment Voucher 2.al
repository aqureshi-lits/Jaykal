report 80037 "LIT Payment Voucher 2"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Src/Layout/Payment Voucher 2.rdl';
    Caption = 'Payment Voucher';
    // Caption = 'Payment Voucher - IAX';
    EnableHyperlinks = true;
    PreviewMode = PrintLayout;

    dataset
    {
        dataitem(DataItemName; "Gen. Journal Line")
        {
            DataItemTableView = SORTING("Document No.");
            RequestFilterFields = "Document No.", "Posting Date";
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
            column(Single_TRN; 'TRN ' + CompanyInformation."VAT Registration No.")
            {
            }
            column(BatchName; "Journal Batch Name")
            {
            }
            column(PostingDate; "Posting Date")
            {
            }
            column(DocNo; "Document No.")
            {
            }
            column(AccountNo; "Account No.")
            {
            }
            column(Description; Description)
            {
            }
            column(Payee; Vend.Name)
            {
            }
            column(DebitAmount; "Debit Amount")
            {
            }
            column(CreditAmout; "Credit Amount")
            {
            }
            column(Division; "Shortcut Dimension 1 Code")
            {
            }
            column(Department; "Shortcut Dimension 2 Code")
            {
            }
            column(CurrCode; "Currency Code")
            {
            }
            column(ExpType; ExpType)
            {
            }
            column(ExpValue; ExpValue)
            {
            }
            column(ChekNo; "LIT Check No.")
            {
            }
            column(CheckDate_GenJournalLine; "LIT Check Date")
            {
            }
            column(ExtNo; "External Document No.")
            {
            }
            column(Comment; Comment)
            {
            }
            column(Being; "LIT Remarks")
            {
            }
            column(BatchDescription; JournalBatch.Description)
            {
            }
            column(PayeeName; PayeeName)
            {
            }
            column(PaymentMethodDesc; PaymentMethodDesc)
            {
            }
            column(Applies_to_Doc__No_; "Applies-to Doc. No.")
            {
            }
            column(InvoiceDate; InvoiceDate)
            {
            }
            column(Invoiceamount; Invoiceamount)
            {
            }
            column(CustomerName; CustomerName)
            {
            }
            column(CustomerAddress; CustomerAddress)
            {
            }
            column(CustomerCity; CustomerCity)
            {
            }
            column(CustomerPostCode; CustomerPostCode)
            {
            }
            column(CustomerCounty; CustomerCounty)
            {
            }
            column(VAT_Prod__Posting_Group; "VAT Prod. Posting Group")
            {
            }
            column(VAT__; "VAT %")
            {
            }
            column(VAT_Amount; "VAT Amount")
            {
            }
            column(Amount; Amount)
            {
            }
            column(Document_Date; "Document Date")
            {
            }
            column(Remarks; "LIT Remarks")
            {
            }

            dataitem(AmountInWords; Integer)
            {
                MaxIteration = 1;
                column(DescriptionLine1; DescriptionLine[1])
                {
                }
                column(DescriptionLine2; DescriptionLine[2])
                {
                }
                column(AmountInDiram; ABS(AmountsFortext))
                {
                }

                trigger OnAfterGetRecord()

                begin
                    /*
                    IF LoopController = 1 THEN BEGIN
                        GenGnlLine.RESET;
                        //    GenGnlLine.SETRANGE(GenGnlLine."Account Type",GenGnlLine."Account Type"::"Bank Account");
                        GenGnlLine.SETRANGE(GenGnlLine."Journal Template Name", "Journal Template Name");
                        GenGnlLine.SETRANGE(GenGnlLine."Journal Batch Name", "Journal Batch Name");
                        GenGnlLine.SETRANGE("Document No.", "Document No.");
                        IF GenGnlLine.FINDFIRST THEN BEGIN
                            REPEAT
                                IF (GenGnlLine.Amount > 0) THEN
                                    AmountsFortext += GenGnlLine.Amount;

                            UNTIL GenGnlLine.NEXT = 0;
                            AmountInWordsReport.FormatNoText(DescriptionLine, ABS(AmountsFortext), GenGnlLine."Currency Code" + ' Only');
                        END;
                    END;
                                   
                    LoopController += 1;
                    */
                end;

                trigger OnPreDataItem()
                begin
                    //   CLEAR(AmountsFortext);
                end;
            }

            trigger OnAfterGetRecord()
            var
                SalesInvoiceHeader: Record "Sales Invoice Header";
                Customer: Record Customer;

            begin
                if SalesInvoiceHeader.Get("Applies-to Doc. No.") then begin
                    InvoiceDate := SalesInvoiceHeader."Document Date";
                    SalesInvoiceHeader.CalcFields(Amount);
                    Invoiceamount := SalesInvoiceHeader.Amount;
                end;
                if Customer.Get("Account No.") then begin
                    CustomerName := Customer.Name;
                    CustomerAddress := Customer.Address;
                    CustomerCity := Customer.City;
                    CustomerPostCode := Customer."Post Code";
                    CustomerCounty := Customer.County;
                end;

                GLSetup.GET();
                /*
               IF DimensionSetEntry.GET("Dimension Set ID",GLSetup."Shortcut Dimension 3 Code")THEN
                  ExpType:=DimensionSetEntry."Dimension Value Code";
               IF DimensionSetEntry.GET("Dimension Set ID",GLSetup."Shortcut Dimension 4 Code")THEN
                  ExpValue:=DimensionSetEntry."Dimension Value Code";
                  */
                IF JournalBatch.GET("Journal Template Name", "Journal Batch Name") THEN;

                /*
                IF "Employee Code" <> '' THEN BEGIN
                DimensionValue.RESET;
                DimensionValue.SETRANGE(DimensionValue.Code,"Employee Code");
                IF DimensionValue.FINDFIRST THEN
                  PayeeName := DimensionValue.Name
                END ELSE BEGIN
                */
                /*Vend.RESET;
                IF Vend.GET("Account No.")THEN BEGIN
                PayeeName := Vend.Name
                END ELSE BEGIN
                Cust.RESET;
                IF Cust.GET("Account No.") THEN BEGIN
                PayeeName := Cust.Name;
                END;
                END;*/

                CLEAR(PayeeName);
                Vend.RESET;
                Vend.SETFILTER("No.", "Account No.");
                IF Vend.FINDFIRST THEN BEGIN
                    PayeeName := Vend.Name;
                END;

                Cust.RESET;
                Cust.SETFILTER("No.", "Account No.");
                IF Cust.FINDFIRST THEN BEGIN
                    PayeeName := Cust.Name;
                END;

                EmpRec.RESET;
                EmpRec.SETFILTER("No.", "Account No.");
                IF EmpRec.FINDFIRST THEN BEGIN
                    PayeeName := EmpRec."First Name";
                END;

                PaymentMethod.RESET;
                PaymentMethod.SETFILTER(PaymentMethod.Code, "Payment Method Code");
                IF PaymentMethod.FINDFIRST THEN BEGIN
                    PaymentMethodDesc := PaymentMethod.Description;
                END;

                //Start convert Amount in Text.
                CLEAR(AmountsFortext);

                IF LoopController = 1 THEN BEGIN
                    GenGnlLine.RESET;
                    //    GenGnlLine.SETRANGE(GenGnlLine."Account Type",GenGnlLine."Account Type"::"Bank Account");
                    GenGnlLine.SETRANGE(GenGnlLine."Journal Template Name", "Journal Template Name");
                    GenGnlLine.SETRANGE(GenGnlLine."Journal Batch Name", "Journal Batch Name");
                    GenGnlLine.SETRANGE("Document No.", "Document No.");
                    IF GenGnlLine.FINDFIRST THEN BEGIN
                        REPEAT
                            IF (GenGnlLine.Amount > 0) THEN
                                AmountsFortext += GenGnlLine.Amount;
                        UNTIL GenGnlLine.NEXT = 0;
                        AmountInWordsReport.FormatNoText(DescriptionLine, ABS(AmountsFortext), GenGnlLine."Currency Code" + ' Only');
                    END;
                END;
                LoopController += 1;
                //End convert Amount in Text.


            END;
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
        AmountInWordsReport.InitTextVariable;
    end;

    trigger OnPreReport()
    var
        Country_Region: Record "Country/Region";
    begin
        IF CompanyInformation.GET() THEN
            CompanyInformation.CALCFIELDS(Picture);
        LoopController := 1;
        if Country_Region.Get(CompanyInformation."Country/Region Code") then
            Comp_Country := Country_Region.Name;
    end;

    var
        Comp_Country: text[50];
        Rep: Report 1316;
        CustomerName: Text[100];
        CustomerCity: Text[30];
        CustomerPostCode: Code[20];
        CustomerCounty: Text[100];
        CustomerAddress: Text[100];
        Invoiceamount: Decimal;
        InvoiceDate: Date;
        CompanyInformation: Record 79;
        ExpType: Text[30];
        ExpValue: Text[30];
        GLSetup: Record 98;
        Cust: Record 18;
        Vend: Record 23;
        JournalBatch: Record 232;
        AmountInWordsReport: Report Check;
        LoopController: Integer;
        DescriptionLine: array[2] of Text[80];
        GenGnlLine: Record 81;
        AmountsFortext: Decimal;
        PayeeName: Text[250];
        PaymentMethod: Record 289;
        PaymentMethodDesc: Text[50];
        EmpRec: Record 5200;
}

