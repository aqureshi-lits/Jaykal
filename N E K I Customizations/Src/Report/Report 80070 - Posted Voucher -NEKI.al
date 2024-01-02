report 80070 "Posted Voucher"
{
    // version Firoz

    DefaultLayout = RDLC;
    RDLCLayout = './Src/Layout/RGS Reports/Posted Voucher.rdlc';
    Caption = 'Posted Voucher';

    dataset
    {
        dataitem("G/L Entry"; "G/L Entry")
        {
            DataItemTableView = SORTING("Document No.", "Posting Date", Amount)
                                ORDER(Descending);
            RequestFilterFields = "Posting Date", "Document No.";
            column(PDCCustName; PDCCustName)
            {
            }
            column(PDCChequeNo; PDCChequeNo)
            {
            }
            column(PDCChequeDate; PDCChequeDate)
            {
            }
            column(PDCAccountNo; PDCAccountNo)
            {
            }
            column(DetailsCaption; DetailsCaption)
            {
            }
            column(VoucherSourceDesc; SourceDesc)
            {
            }
            column(DocumentNo_GLEntry; "Document No.")
            {
            }
            column(PostingDateFormatted; 'Date: ' + FORMAT("Posting Date"))
            {
            }
            column(CompanyInformationAddress; CompanyInformation.Address)
            {
            }
            column(CompanyInformationAdress1; CompanyInformation."Address 2" + '  ' + CompanyInformation.City)
            {
            }
            column(CompanyInformationName; CompanyInformation.Name)
            {
            }
            column(Companyinfo_Pic; CompanyInformation.Picture)
            {
            }
            column(CreditAmount_GLEntry; "Credit Amount")
            {
            }
            column(DebitAmount_GLEntry; "Debit Amount")
            {
            }
            column(DrText; DrText)
            {
            }
            column(GLAccName; GLAccName)
            {
            }
            column(EmployeeName; EmployeeName)
            {
                AutoCalcField = true;
            }
            column(CrText; CrText)
            {
            }
            column(DebitAmountTotal; DebitAmountTotal)
            {
            }
            column(CreditAmountTotal; CreditAmountTotal)
            {
            }
            column(ChequeDetail; 'Cheque No: ' + ChequeNo + '  Dated: ' + FORMAT(ChequeDate))
            {
            }
            column(ChequeNo; ChequeNo)
            {
            }
            column(ChequeDate; ChequeDate)
            {
            }
            column(RsNumberText1NumberText2; 'DHS ' + notext[1] + ' ' + notext[2])
            {
            }
            column(EntryNo_GLEntry; "Entry No.")
            {
            }
            column(PostingDate_GLEntry; "Posting Date")
            {
            }
            column(TransactionNo_GLEntry; "Transaction No.")
            {
            }
            column(PAY; PAY)
            {
            }
            column(VoucherNoCaption; VoucherNoCaptionLbl)
            {
            }
            column(CreditAmountCaption; CreditAmountCaptionLbl)
            {
            }
            column(DebitAmountCaption; DebitAmountCaptionLbl)
            {
            }
            column(ParticularsCaption; ParticularsCaptionLbl)
            {
            }
            column(AmountInWordsCaption; AmountInWordsCaptionLbl)
            {
            }
            column(PreparedByCaption; PreparedByCaptionLbl)
            {
            }
            column(CheckedByCaption; CheckedByCaptionLbl)
            {
            }
            column(ApprovedByCaption; ApprovedByCaptionLbl)
            {
            }
            dataitem("Company Information"; "Company Information")
            {
                column(Narration_LineNarration; CompanyInformation.Name)
                {
                }
                column(PrintLineNarration; CompanyInformation.Name)
                {
                }

                trigger OnAfterGetRecord()
                begin

                    IF PrintLineNarration THEN BEGIN
                        PageLoop := PageLoop - 1;
                        LinesPrinted := LinesPrinted + 1;
                    END;
                end;
            }
            dataitem(DataItem5444; Integer)
            {
                DataItemTableView = SORTING(Number);
                column(IntegerOccurcesCaption; IntegerOccurcesCaptionLbl)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    PageLoop := PageLoop - 1;
                end;

                trigger OnPreDataItem()
                begin
                    GLEntry.SETCURRENTKEY("Document No.", "Posting Date", Amount);
                    GLEntry.ASCENDING(FALSE);
                    GLEntry.SETRANGE("Posting Date", "G/L Entry"."Posting Date");
                    GLEntry.SETRANGE("Document No.", "G/L Entry"."Document No.");
                    GLEntry.FINDLAST;
                    IF NOT (GLEntry."Entry No." = "G/L Entry"."Entry No.") THEN
                        CurrReport.BREAK;

                    SETRANGE(Number, 1, PageLoop)
                end;
            }
            dataitem(PostedNarration1; "Company Information")
            {
                column(Narration_PostedNarration1; CompanyInformation.Name)
                {
                }
                column(NarrationCaption; CompanyInformation.Name)
                {
                }

                trigger OnPreDataItem()
                begin
                    GLEntry.SETCURRENTKEY("Document No.", "Posting Date", Amount);
                    GLEntry.ASCENDING(FALSE);
                    GLEntry.SETRANGE("Posting Date", "G/L Entry"."Posting Date");
                    GLEntry.SETRANGE("Document No.", "G/L Entry"."Document No.");
                    GLEntry.FINDLAST;
                    IF NOT (GLEntry."Entry No." = "G/L Entry"."Entry No.") THEN
                        CurrReport.BREAK;
                end;
            }

            trigger OnAfterGetRecord()
            begin
                CompanyInformation.CALCFIELDS(CompanyInformation.Picture);

                GLAccName := FindGLAccName("Source Type", "Entry No.", "Source No.", "G/L Account No.");
                IF Amount < 0 THEN BEGIN
                    //CrText := 'To';
                    DrText := '';
                END ELSE BEGIN
                    CrText := '';
                    DrText := 'Dr';
                END;

                SourceDesc := '';
                IF "Source Code" <> '' THEN BEGIN
                    SourceCode.GET("Source Code");
                    SourceDesc := SourceCode.Description;
                END;

                PageLoop := PageLoop - 1;
                LinesPrinted := LinesPrinted + 1;

                ChequeNo := '';
                ChequeDate := 0D;
                IF ("Source No." <> '') AND ("Source Type" = "Source Type"::"Bank Account") THEN BEGIN
                    IF BankAccLedgEntry.GET("Entry No.") THEN BEGIN
                        //ChequeNo := BankAccLedgEntry."Cheque No.";
                        //ChequeDate := BankAccLedgEntry."Cheque Date";
                        Currencycode2 := BankAccLedgEntry."Currency Code";
                    END;
                END;

                IF (ChequeNo <> '') AND (ChequeDate <> 0D) THEN BEGIN
                    PageLoop := PageLoop - 1;
                    LinesPrinted := LinesPrinted + 1;
                END;
                IF PostingDate <> "Posting Date" THEN BEGIN
                    PostingDate := "Posting Date";
                    TotalDebitAmt := 0;
                END;
                IF DocumentNo <> "Document No." THEN BEGIN
                    DocumentNo := "Document No.";
                    TotalDebitAmt := 0;
                END;

                IF PostingDate = "Posting Date" THEN BEGIN
                    InitTextVariable;
                    TotalDebitAmt += "Debit Amount";
                    FormatNoText(notext, ABS(TotalDebitAmt), Currencycode2);
                    // MESSAGE(FORMAT(ABS(TotalDebitAmt)));
                    // AmttoText.FormatNoTextposted(notext,TotalDebitAmt,'');

                    //  MESSAGE(notext[1]+notext[2]);


                    PageLoop := NUMLines;
                    LinesPrinted := 0;
                END;
                IF (PrePostingDate <> "Posting Date") OR (PreDocumentNo <> "Document No.") THEN BEGIN
                    DebitAmountTotal := 0;
                    CreditAmountTotal := 0;
                    PrePostingDate := "Posting Date";
                    PreDocumentNo := "Document No.";
                END;

                DebitAmountTotal := DebitAmountTotal + "Debit Amount";
                CreditAmountTotal := CreditAmountTotal + "Credit Amount";

                IF "Dimension Set ID" <> 0 THEN BEGIN
                    EmployeeName := '';
                    DemesnsionSetId.RESET;
                    DemesnsionSetId.SETRANGE(DemesnsionSetId."Dimension Set ID", "Dimension Set ID");
                    IF DemesnsionSetId.FINDFIRST THEN
                        IF DemesnsionSetId."Dimension Code" = 'EMPLOYEE' THEN
                            DemesnsionSetId.CALCFIELDS("Dimension Value Name");
                    EmployeeName := 'Employee Name :  ' + DemesnsionSetId."Dimension Value Name";
                END ELSE BEGIN
                    EmployeeName := '';
                END;


                // PDCCustName:='';
                //PDCChequeNo:='';
                //PDCChequeDate:=0D;
                //PDCAccountNo:='';

                /*IF ("PDC Type" = "PDC Type"::"1") OR ("PDC Type" = "PDC Type"::"2") THEN BEGIN
                PDCCard.RESET;
                PDCCard.SETRANGE(PDCCard."PDC Number","G/L Entry"."Document No.");
                IF PDCCard.FINDFIRST THEN BEGIN
                   PDCCustName:='Account Name : '+PDCCard.Description;
                   PDCChequeNo:='Cheque No. & Date : '+PDCCard."Cheque No"+' &';
                   PDCChequeDate:=PDCCard."Cheque Date";
                   PDCAccountNo:='Account No. : '+PDCCard."Account No";
                   DetailsCaption:='PDC Details :';
                   //MESSAGE(PDCCustName);
                END;
                END ELSE BEGIN
                   PDCCustName:='';
                   PDCChequeNo:='';
                   PDCChequeDate:=0D;
                   PDCAccountNo:='';
                   DetailsCaption:='';
                END;
                */

            end;

            trigger OnPreDataItem()
            begin
                NUMLines := 13;
                PageLoop := NUMLines;
                LinesPrinted := 0;
                DebitAmountTotal := 0;
                CreditAmountTotal := 0;
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(PrintLineNarration; PrintLineNarration)
                    {
                        Caption = 'PrintLineNarration';
                        Visible = false;
                        ApplicationArea = all;
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

    trigger OnPreReport()
    begin
        CompanyInformation.GET;
    end;

    var
        CompanyInformation: Record 79;
        SourceCode: Record 230;
        GLEntry: Record 17;
        BankAccLedgEntry: Record 271;
        GLAccName: Text[50];
        SourceDesc: Text[50];
        CrText: Text[2];
        DrText: Text[2];
        NumberText1: Text[80];
        PageLoop: Integer;
        LinesPrinted: Integer;
        NUMLines: Integer;
        ChequeNo: Code[50];
        ChequeDate: Date;
        Text16526: Label 'ZERO';
        Text16527: Label 'HUNDRED';
        Text16528: Label 'AND';
        Text16529: Label '%1 results in a written number that is too long.';
        Text16532: Label 'ONE';
        Text16533: Label 'TWO';
        Text16534: Label 'THREE';
        Text16535: Label 'FOUR';
        Text16536: Label 'FIVE';
        Text16537: Label 'SIX';
        Text16538: Label 'SEVEN';
        Text16539: Label 'EIGHT';
        Text16540: Label 'NINE';
        Text16541: Label 'TEN';
        Text16542: Label 'ELEVEN';
        Text16543: Label 'TWELVE';
        Text16544: Label 'THIRTEEN';
        Text16545: Label 'FOURTEEN';
        Text16546: Label 'FIFTEEN';
        Text16547: Label 'SIXTEEN';
        Text16548: Label 'SEVENTEEN';
        Text16549: Label 'EIGHTEEN';
        Text16550: Label 'NINETEEN';
        Text16551: Label 'TWENTY';
        Text16552: Label 'THIRTY';
        Text16553: Label 'FORTY';
        Text16554: Label 'FIFTY';
        Text16555: Label 'SIXTY';
        Text16556: Label 'SEVENTY';
        Text16557: Label 'EIGHTY';
        Text16558: Label 'NINETY';
        Text16559: Label 'THOUSAND';
        Text16560: Label 'MILLION';
        Text16561: Label 'BILLION';
        Text16562: Label 'HUNDRED';
        Text16564: Label 'FILS';
        Text16563: Label 'CRORE';
        OnesText: array[20] of Text[30];
        TensText: array[10] of Text[30];
        ExponentText: array[5] of Text[30];
        PrintLineNarration: Boolean;
        PostingDate: Date;
        TotalDebitAmt: Decimal;
        DocumentNo: Code[20];
        DebitAmountTotal: Decimal;
        CreditAmountTotal: Decimal;
        PrePostingDate: Date;
        PreDocumentNo: Code[50];
        VoucherNoCaptionLbl: Label 'Voucher No. :';
        CreditAmountCaptionLbl: Label 'Credit Amount';
        DebitAmountCaptionLbl: Label 'Debit Amount';
        ParticularsCaptionLbl: Label 'Particulars';
        AmountInWordsCaptionLbl: Label 'Amount (in words):';
        PreparedByCaptionLbl: Label 'Prepared by:';
        CheckedByCaptionLbl: Label 'Checked by:';
        ApprovedByCaptionLbl: Label 'Approved by:';
        IntegerOccurcesCaptionLbl: Label 'IntegerOccurces';
        NarrationCaptionLbl: Label 'Narration :';
        PAY: Text;
        AmttoText: Report 1401;
        notext: array[2] of Text;
        Currencycode2: Code[10];
        DemesnsionSetId: Record 480;
        EmployeeName: Text[100];
        PDCCard: Record 81;
        PDCCustName: Text[100];
        PDCChequeNo: Code[60];
        PDCChequeDate: Date;
        PDCAccountNo: Code[100];
        DetailsCaption: Text[20];

    procedure FindGLAccName("Source Type": Option " ",Customer,Vendor,"Bank Account","Fixed Asset"; "Entry No.": Integer; "Source No.": Code[20]; "G/L Account No.": Code[20]): Text[50]
    var
        AccName: Text[50];
        VendLedgerEntry: Record 25;
        Vend: Record 23;
        CustLedgerEntry: Record 21;
        Cust: Record 18;
        BankLedgerEntry: Record 271;
        Bank: Record 270;
        FALedgerEntry: Record 5601;
        FA: Record 5600;
        GLAccount: Record 15;
    begin
        IF "Source Type" = "Source Type"::Vendor THEN
            IF VendLedgerEntry.GET("Entry No.") THEN BEGIN
                Vend.GET("Source No.");
                AccName := Vend.Name;
            END ELSE BEGIN
                GLAccount.GET("G/L Account No.");
                AccName := GLAccount.Name;
            END
        ELSE
            IF "Source Type" = "Source Type"::Customer THEN
                IF CustLedgerEntry.GET("Entry No.") THEN BEGIN
                    Cust.GET("Source No.");
                    AccName := Cust.Name;
                END ELSE BEGIN
                    GLAccount.GET("G/L Account No.");
                    AccName := GLAccount.Name;
                END
            ELSE
                IF "Source Type" = "Source Type"::"Bank Account" THEN
                    IF BankLedgerEntry.GET("Entry No.") THEN BEGIN
                        Bank.GET("Source No.");
                        AccName := Bank.Name;
                    END ELSE BEGIN
                        GLAccount.GET("G/L Account No.");
                        AccName := GLAccount.Name;
                    END
                ELSE BEGIN
                    GLAccount.GET("G/L Account No.");
                    AccName := GLAccount.Name;
                END;

        IF "Source Type" = "Source Type"::" " THEN BEGIN
            GLAccount.GET("G/L Account No.");
            AccName := GLAccount.Name;
        END;

        EXIT(AccName);
    end;

    procedure FormatNoText(var NoText: array[2] of Text[80]; No: Decimal; CurrencyCode: Code[10])
    var
        PrintExponent: Boolean;
        Ones: Integer;
        Tens: Integer;
        Hundreds: Integer;
        Exponent: Integer;
        NoTextIndex: Integer;
        Currency: Record 4;
        TensDec: Integer;
        OnesDec: Integer;
    begin
        CLEAR(NoText);
        NoTextIndex := 1;
        NoText[1] := '';

        IF No < 1 THEN
            AddToNoText(NoText, NoTextIndex, PrintExponent, Text16526, '')
        ELSE BEGIN
            FOR Exponent := 4 DOWNTO 1 DO BEGIN
                PrintExponent := FALSE;
                Ones := No DIV POWER(1000, Exponent - 1);
                Hundreds := Ones DIV 100;
                Tens := (Ones MOD 100) DIV 10;
                Ones := Ones MOD 10;
                IF Hundreds > 0 THEN BEGIN
                    AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[Hundreds], '');
                    AddToNoText(NoText, NoTextIndex, PrintExponent, Text16527, '');
                END;
                IF Tens >= 2 THEN BEGIN
                    AddToNoText(NoText, NoTextIndex, PrintExponent, TensText[Tens], '');
                    IF Ones > 0 THEN
                        AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[Ones], '');
                END ELSE
                    IF (Tens * 10 + Ones) > 0 THEN
                        AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[Tens * 10 + Ones], '');
                IF PrintExponent AND (Exponent > 1) THEN
                    AddToNoText(NoText, NoTextIndex, PrintExponent, ExponentText[Exponent], '');
                No := No - (Hundreds * 100 + Tens * 10 + Ones) * POWER(1000, Exponent - 1);
            END;

        END;

        IF CurrencyCode <> '' THEN BEGIN
            Currency.GET(CurrencyCode);
            //AddToNoText(NoText,NoTextIndex,PrintExponent,' ' + Currency."Currency Numeric description",''); //new
            AddToNoText(NoText, NoTextIndex, PrintExponent, '', '');
        END ELSE
            AddToNoText(NoText, NoTextIndex, PrintExponent, '', '');

        IF (CurrencyCode <> '') THEN BEGIN
            Currency.GET(CurrencyCode);  //new
                                         //MESSAGE(CurrencyCode);
            AddToNoText(NoText, NoTextIndex, PrintExponent, Text16528 + ' ' + Text16564, '');//  new
        END ELSE
            AddToNoText(NoText, NoTextIndex, PrintExponent, Text16528 + ' ' + 'FILS', '');//  new1


        TensDec := ((No * 100) MOD 100) DIV 10;
        OnesDec := (No * 100) MOD 10;
        IF TensDec >= 2 THEN BEGIN
            AddToNoText(NoText, NoTextIndex, PrintExponent, TensText[TensDec], '');
            IF OnesDec > 0 THEN
                AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[OnesDec], '');
        END ELSE
            IF (TensDec * 10 + OnesDec) > 0 THEN
                AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[TensDec * 10 + OnesDec], '')
            ELSE
                //AddToNoText(NoText,NoTextIndex,PrintExponent,'FILS '+Text16526,'');

                AddToNoText(NoText, NoTextIndex, PrintExponent, Text16526, '');
        IF (CurrencyCode <> '') THEN
            AddToNoText(NoText, NoTextIndex, PrintExponent, ' ONLY', '') //
        ELSE
            AddToNoText(NoText, NoTextIndex, PrintExponent, 'ONLY', '');//
    end;

    local procedure AddToNoText(var NoText: array[2] of Text[80]; var NoTextIndex: Integer; var PrintExponent: Boolean; AddText: Text[30]; text1: Text[30])
    begin
        PrintExponent := TRUE;

        WHILE STRLEN(NoText[NoTextIndex] + ' ' + AddText) > MAXSTRLEN(NoText[1]) DO BEGIN
            NoTextIndex := NoTextIndex + 1;
            IF NoTextIndex > ARRAYLEN(NoText) THEN
                ERROR(Text16529, AddText);
        END;

        NoText[NoTextIndex] := DELCHR(NoText[NoTextIndex] + ' ' + AddText, '<');
    end;

    procedure InitTextVariable()
    begin
        OnesText[1] := Text16532;
        OnesText[2] := Text16533;
        OnesText[3] := Text16534;
        OnesText[4] := Text16535;
        OnesText[5] := Text16536;
        OnesText[6] := Text16537;
        OnesText[7] := Text16538;
        OnesText[8] := Text16539;
        OnesText[9] := Text16540;
        OnesText[10] := Text16541;
        OnesText[11] := Text16542;
        OnesText[12] := Text16543;
        OnesText[13] := Text16544;
        OnesText[14] := Text16545;
        OnesText[15] := Text16546;
        OnesText[16] := Text16547;
        OnesText[17] := Text16548;
        OnesText[18] := Text16549;
        OnesText[19] := Text16550;

        TensText[1] := '';
        TensText[2] := Text16551;
        TensText[3] := Text16552;
        TensText[4] := Text16553;
        TensText[5] := Text16554;
        TensText[6] := Text16555;
        TensText[7] := Text16556;
        TensText[8] := Text16557;
        TensText[9] := Text16558;

        ExponentText[1] := '';
        ExponentText[2] := Text16559;
        ExponentText[3] := Text16560;
        ExponentText[4] := Text16561;
    end;
}

