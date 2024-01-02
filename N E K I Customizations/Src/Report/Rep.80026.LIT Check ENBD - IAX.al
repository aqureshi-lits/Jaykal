report 80026 "LIT Check ENBD - IAX"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Src/Layout/Check ENBD - IAX.rdl';
    Caption = 'Check ENBD - IAX';
    EnableHyperlinks = true;
    PreviewMode = PrintLayout;

    dataset
    {
        dataitem("Gen. Journal Line"; "Gen. Journal Line")
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
                        GenGnlLine.SETRANGE(GenGnlLine."Journal Template Name", "Gen. Journal Line"."Journal Template Name");
                        GenGnlLine.SETRANGE(GenGnlLine."Journal Batch Name", "Gen. Journal Line"."Journal Batch Name");
                        GenGnlLine.SETRANGE("Document No.", "Gen. Journal Line"."Document No.");
                        IF GenGnlLine.FINDFIRST THEN BEGIN
                            REPEAT
                                IF (GenGnlLine.Amount <> 0) THEN
                                    AmountsFortext += GenGnlLine.Amount;

                            UNTIL GenGnlLine.NEXT = 0;
                            AmountInWordsReport.FormatNoText(DescriptionLine, ABS(AmountsFortext), '' + ' Only');
                        END;
                    END;

                    LoopController += 1;

                end;

                trigger OnPreDataItem()
                begin
                    //   CLEAR(AmountsFortext);
                end;
            }

            trigger OnAfterGetRecord()
            begin
                GLSetup.GET();

                IF JournalBatch.GET("Journal Template Name", "Journal Batch Name") THEN;

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
        Cust: Record 18;
        Vend: Record 23;
        JournalBatch: Record 232;
        AmountInWordsReport: Report "LIT StandardCheck";
        LoopController: Integer;
        DescriptionLine: array[2] of Text[50];
        GenGnlLine: Record 81;
        AmountsFortext: Decimal;
        PayeeName: Text[250];
        PaymentMethod: Record 289;
        PaymentMethodDesc: Text[50];
        EmpRec: Record 5200;
}

