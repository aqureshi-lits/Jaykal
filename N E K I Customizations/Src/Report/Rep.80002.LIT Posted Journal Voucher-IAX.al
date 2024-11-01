report 80002 "LIT Posted Journal Voucher-IAX"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Src/Layout/Posted Journal Voucher - IAX.rdlc';
    Caption = 'Posted Journal Voucher - IAX';
    EnableHyperlinks = true;
    PreviewMode = PrintLayout;

    dataset
    {
        dataitem(DataItemName; "G/L Entry")
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
            column(Description; Description)
            {
            }
            column(Payee; Vend.Name)
            {
            }
            column(GLAccountNo_GLEntry; "G/L Account No.")
            {
            }
            column(DebitAmount; "Debit Amount")
            {
            }
            column(CreditAmout; "Credit Amount")
            {
            }
            column(Division; "Global Dimension 1 Code")
            {
            }
            column(Department; "Global Dimension 2 Code")
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
            column(Being; "LIT Remarks")
            {
            }
            column(Description_GLEntry; Description)
            {
            }
            column(GLAccountName_GLEntry; "G/L Account Name")
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

                    IF LoopController = 1 THEN BEGIN
                        GenGnlLine.RESET;
                        //    GenGnlLine.SETRANGE(GenGnlLine."Account Type",GenGnlLine."Account Type"::"Bank Account");
                        //    GenGnlLine.SETRANGE(GenGnlLine."Journal Template Name" , "Gen. Journal Line"."Journal Template Name");
                        //    GenGnlLine.SETRANGE(GenGnlLine."Journal Batch Name" , "Gen. Journal Line"."Journal Batch Name");
                        GenGnlLine.SETRANGE("Document No.", GenJnlLine2."Document No.");
                        IF GenGnlLine.FINDFIRST THEN BEGIN
                            REPEAT
                                IF (GenGnlLine.Amount > 0) THEN
                                    AmountsFortext += GenGnlLine.Amount;

                            UNTIL GenGnlLine.NEXT = 0;
                            AmountInWordsReport.FormatNoText(DescriptionLine, ABS(AmountsFortext), '' + ' Only');
                        END;
                    END;
                    LoopController += 1;
                end;

                trigger OnPreDataItem()
                begin
                    CLEAR(AmountsFortext);
                end;
            }

            trigger OnAfterGetRecord()
            begin
                GLSetup.GET();
                /*
               IF DimensionSetEntry.GET("Dimension Set ID",GLSetup."Shortcut Dimension 3 Code")THEN
                  ExpType:=DimensionSetEntry."Dimension Value Code";
               IF DimensionSetEntry.GET("Dimension Set ID",GLSetup."Shortcut Dimension 4 Code")THEN
                  ExpValue:=DimensionSetEntry."Dimension Value Code";
                  */
                //IF JournalBatch.GET("Journal Template Name","Journal Batch Name") THEN;

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

                /*PaymentMethod.RESET;
                PaymentMethod.SETFILTER(PaymentMethod.Code ,  "Payment Method Code");
                  IF  PaymentMethod.FINDFIRST THEN BEGIN
                  PaymentMethodDesc := PaymentMethod.Description;
                  END;*/

            end;
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
        CompanyInformation: Record 79;
        ExpType: Text[30];
        ExpValue: Text[30];
        GLSetup: Record 98;
        Vend: Record 23;
        GenJnlLine2: Record 81;
        JournalBatch: Record 232;
        AmountInWordsReport: Report Check;
        LoopController: Integer;
        DescriptionLine: array[2] of Text[80];
        GenGnlLine: Record 17;
        AmountsFortext: Decimal;
        PayeeName: Text[250];
        PaymentMethodDesc: Text[50];
}

