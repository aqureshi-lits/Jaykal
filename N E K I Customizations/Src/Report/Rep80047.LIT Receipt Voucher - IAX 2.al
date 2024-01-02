report 80047 "LIT Receipt Voucher - IAX 2"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Src/Layout/Receipt Voucher - IAX 2.rdlc';
    Caption = 'Receipt Voucher - IAX';
    EnableHyperlinks = true;
    // PreviewMode = PrintLayout;

    dataset
    {
        dataitem(GenJournalLine; "Gen. Journal Line")
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
            column(Comp_Post; 'P.O. BOX. No. : ' + CompanyInformation."Post Code")
            {
            }
            column(CompEmail; 'Email : ' + CompanyInformation."E-Mail")
            {
            }
            column(CompWeb; CompanyInformation."Home Page")
            {
            }
            column(Single_TRN; 'TRN # : ' + CompanyInformation."VAT Registration No.")
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
            // column(JobNo; "Shortcut Dimension 1 Code")
            // {
            // }
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
            // column(Being; Remarks)
            // {
            // }
            column(BatchDescription; JournalBatch.Description)
            {
            }
            column(PayeeName; PayeeName)
            {
            }
            column(PaymentMethodDesc; PaymentMethodDesc)
            {
            }
            column(Document_Date; "Document Date") { }

            column(GL_Bal__Account_No_; GenJournalLine."Account No.")
            {
            }
            column(GL_Bal__Account_Name_; BankAccount2.Name)
            {
            }
            // column(short)
            dataitem(AmountInWords; Integer)
            {
                MaxIteration = 1;
                column(DescriptionLine1; DescriptionLine[1])
                {
                }
                column(DescriptionLine2; DescriptionLine[2])
                {
                }
                column(AmountInDiram; ABS(AmountsFortext1))
                {
                }
                dataitem("Cust. Ledger Entry"; "Cust. Ledger Entry")
                {
                    // DataItemLink = "Applies-to ID" = field("Document No.");
                    DataItemLink = "Applies-to ID" = field("Document No."), "Customer No." = field("Bal. Account No.");
                    // MaxIteration = 1;
                    DataItemLinkReference = GenJournalLine;

                    column(Applies_to_ID; "Applies-to ID")
                    {
                    }
                    column(Posting_Date; "Posting Date")
                    {
                    }
                    column(Document_No_; "Document No.")
                    {
                    }
                    column(Document_Type; "Document Type")
                    {
                    }
                    column(Currency_Code; "Currency Code")
                    {
                    }
                    column(External_Document_No_; "External Document No.")
                    {
                    }
                    column(Original_Amt; Amount)
                    {
                    }
                    column(Amount1; Amount1)
                    {
                    }
                    column(Original_Amt___LCY_; ABS("Original Amt. (LCY)"))
                    {
                    }
                    column(Remaining_Amt___LCY_; "Remaining Amt. (LCY)")
                    {
                    }
                    column(Amount_to_Apply; "Amount to Apply")
                    {
                    }
                    column(Due_Date; "Due Date")
                    {
                    }
                    column(Customer_Code; "Customer No.")
                    {
                    }
                    column(Customer_Name; "Customer Name")
                    {
                    }
                    column(Apply_Description; Description)
                    {
                    }
                    column(Bal__Account_No_; "Bal. Account No.")
                    {
                    }
                    column(BankName; BankAccount.Name) { }
                    column(OrderNo; SalesInvoiceHeader."External Document No.") { }
                    column(CustomerInvoiceNo; SalesInvoiceHeader."No.") { }
                    column(JobNo; SalesInvoiceHeader."Shortcut Dimension 1 Code")
                    {
                    }

                    trigger OnAfterGetRecord()
                    var
                        myInt: Integer;

                    begin

                        SalesInvoiceHeader.Reset();
                        SalesInvoiceHeader.Get("Cust. Ledger Entry"."Document No.");
                        Amount1 := 0;
                        // "Vendor Ledger Entry".CalcFields(Amount);
                        Amount1 := ABS(Amount);
                    end;
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
                    // AmountInWordsReport.FormatNoText(DescriptionLine, ABS("Vendor Ledger Entry".Amount), "Vendor Ledger Entry"."Currency Code" + ' Only');
                end;

                trigger OnPreDataItem()
                begin
                    //   CLEAR(AmountsFortext);
                end;
            }

            trigger OnAfterGetRecord()
            var
                CustLedgerEntry: Record "Cust. Ledger Entry";
                DimensionSetEntry: Record "Dimension Set Entry";
                GLSetup: Record "General Ledger Setup";

            begin
                // ShowDimensions();
                ExpType := '';
                GLSetup.GET();
                BankAccount2.Reset();
                if GenJournalLine."Account Type" = GenJournalLine."Account Type"::"Bank Account" then
                    BankAccount2.get("Account No.");
                IF DimensionSetEntry.GET("Dimension Set ID", GLSetup."Shortcut Dimension 5 Code") THEN begin
                    DimensionSetEntry.CalcFields("Dimension Value Name");
                    ExpType := DimensionSetEntry."Dimension Value Name";
                end;
                /* IF DimensionSetEntry.GET("Dimension Set ID",GLSetup."Shortcut Dimension 4 Code")THEN
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
                PaymentMethod.SetRange(Code, GenJournalLine."Payment Method Code");
                IF PaymentMethod.FindSet() THEN BEGIN
                    PaymentMethodDesc := PaymentMethod.Description;
                END;

                //Start convert Amount in Text.
                CLEAR(AmountsFortext1);

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
                        //AmountInWordsReport.FormatNoText(DescriptionLine, ABS(AmountsFortext), GenGnlLine."Currency Code" + ' Only');
                    END;
                END;
                CustLedgerEntry.Reset();
                CustLedgerEntry.SETRANGE("Applies-to ID", GenGnlLine."Document No.");
                CustLedgerEntry.SETRANGE("Customer No.", GenGnlLine."Bal. Account No.");
                IF CustLedgerEntry.FindSet() THEN BEGIN
                    REPEAT
                        CustLedgerEntry.CalcFields(Amount);
                        // IF (VendorLedgerEntry.Amount > 0) THEN
                        AmountsFortext1 += CustLedgerEntry.Amount;

                    UNTIL CustLedgerEntry.NEXT = 0;
                end;
                // AmountInWordsReport.FormatNoText(DescriptionLine, ABS(AmountsFortext1), GenJournalLine."Currency Code" + ' Only');
                AmountInWordsReport.FormatNoText(DescriptionLine, ABS(GenJournalLine.Amount), GenJournalLine."Currency Code" + ' Only');

                LoopController += 1;
                //End convert Amount in Text.
                // VendorLedgerEntry.SetRange("Applies-to ID", "Document No.");
                // if VendorLedgerEntry.Findset() then
                // column(Applies_to_ID; "Applies-to ID")
                // {
                // }
                // column(Document_No_; "Document No.")
                // {
                // }
                // column(Vendor_Name; "Vendor Name")
                // {
                // }
                // column(Apply_Description; Description)
                // {
                // }
                // column(Amount_to_Apply; "Amount to Apply")
                // {
                // }

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
    begin
        IF CompanyInformation.GET() THEN
            CompanyInformation.CALCFIELDS(Picture);
        LoopController := 1;
    end;

    var
        Amount1: Decimal;
        AmountsFortext1: Decimal;
        SalesInvoiceHeader: Record "Sales Invoice Header";
        BankAccount: Record "Bank Account";
        BankAccount2: Record "Bank Account";
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
        VendorAmtDescription: array[2] of Text[80];
        GenGnlLine: Record 81;
        AmountsFortext: Decimal;
        PayeeName: Text[250];
        PaymentMethod: Record 289;
        PaymentMethodDesc: Text[50];
        EmpRec: Record 5200;
    // v: Page 233;
    // v: Report 2;
}

