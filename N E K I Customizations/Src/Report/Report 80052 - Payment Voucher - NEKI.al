report 80052 "Payment Voucher - IAX"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Src/Layout/RGS Reports/Payment Voucher - IAX.rdlc';
    PreviewMode = PrintLayout;

    dataset
    {
        dataitem("Gen. Journal Line"; "Gen. Journal Line")
        {
            DataItemTableView = SORTING("Document No.")
                                WHERE("Account Type" = FILTER(Vendor));
            RequestFilterFields = "Document No.", "Posting Date";
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
            column(CompName; CompanyInfo.Name)
            {
            }
            column(CompAdd; CompanyInfo.Address)
            {
            }
            column(CompAdd2; CompanyInfo."Address 2")
            {
            }
            column(CompCity; CompanyInfo.City)
            {
            }
            column(CompPhn; CompanyInfo."Phone No.")
            {
            }
            column(Logo; CompanyInfo.Picture)
            {
            }
            column(ChekNo; "Gen. Journal Line"."Creditor No.")
            {
            }
            column(CheckDate_GenJournalLine; "Gen. Journal Line".Description)
            {
            }
            column(ExtNo; "External Document No.")
            {
            }
            column(Being; "Gen. Journal Line".Comment)
            {
            }
            column(BatchDescription; JournalBatch.Description)
            {
            }
            column(PayeeName; PayeeName)
            {
            }
            column(ShowLine; ShowLine)
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
                        GenGnlLine.SETRANGE(GenGnlLine."Account Type", GenGnlLine."Account Type"::"Bank Account");
                        GenGnlLine.SETRANGE("Document No.", "Gen. Journal Line"."Document No.");
                        IF GenGnlLine.FINDFIRST THEN BEGIN
                            REPEAT
                                //          IF(GenGnlLine.Amount>0)THEN
                                AmountsFortext += GenGnlLine.Amount;

                            UNTIL GenGnlLine.NEXT = 0;
                            AmountInWordsReport.FormatNoText(DescriptionLine, ABS(AmountsFortext), GenGnlLine."Currency Code" + ' Only');
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
                Vend.RESET;
                IF Vend.GET("Account No.") THEN BEGIN
                    PayeeName := Vend.Name
                END;

            end;
        }
    }

    requestpage
    {
        SourceTable = "G/L Account";

        layout
        {
            area(content)
            {
                field("Show Line"; ShowLine)
                {
                    ApplicationArea = all;
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
    begin
        AmountInWordsReport.InitTextVariable;
    end;

    trigger OnPreReport()
    begin
        IF CompanyInfo.GET() THEN
            CompanyInfo.CALCFIELDS(Picture);
        LoopController := 1;
    end;

    var
        CompanyInfo: Record 79;
        DimensionSetEntry: Record 480;
        ExpType: Text[30];
        ExpValue: Text[30];
        GLSetup: Record 98;
        SalesSetup: Record 311;
        PurchSetup: Record 312;
        UserSetup: Record 91;
        AccountingPeriod: Record 50;
        GLAcc: Record 15;
        Currency: Record 4;
        Cust: Record 18;
        Vend: Record 23;
        BankAccPostingGr: Record 277;
        BankAcc: Record 270;
        GenJnlTemplate: Record 80;
        GenJnlLine2: Record 81;
        TempGenJnlLine: Record 81 temporary;
        GenJnlAlloc: Record 221;
        OldCustLedgEntry: Record 21;
        OldVendLedgEntry: Record 25;
        VATPostingSetup: Record 325;
        NoSeries: Record 308;
        FA: Record 5600;
        ICPartner: Record 413;
        DeprBook: Record 5611;
        FADeprBook: Record 5612;
        FASetup: Record 5603;
        GLAccNetChange: Record 269 temporary;
        DimSetEntry: Record 480;
        ExchAccGLJnlLine: Codeunit 366;
        GenJnlLineFilter: Text;
        AllowPostingFrom: Date;
        AllowPostingTo: Date;
        AllowFAPostingFrom: Date;
        AllowFAPostingTo: Date;
        LastDate: Date;
        LastDocType: Option Document,Payment,Invoice,"Credit Memo","Finance Charge Memo",Reminder;
        LastDocNo: Code[20];
        LastEntrdDocNo: Code[20];
        LastEntrdDate: Date;
        BalanceLCY: Decimal;
        AmountLCY: Decimal;
        DocBalance: Decimal;
        DocBalanceReverse: Decimal;
        DateBalance: Decimal;
        DateBalanceReverse: Decimal;
        TotalBalance: Decimal;
        TotalBalanceReverse: Decimal;
        AccName: Text[50];
        LastLineNo: Integer;
        GLDocNo: Code[20];
        Day: Integer;
        Week: Integer;
        Month: Integer;
        MonthText: Text[30];
        AmountError: Boolean;
        ErrorCounter: Integer;
        ErrorText: array[50] of Text[250];
        TempErrorText: Text[250];
        BalAccName: Text[50];
        CurrentCustomerVendors: Integer;
        VATEntryCreated: Boolean;
        CustPosting: Boolean;
        VendPosting: Boolean;
        SalesPostingType: Boolean;
        PurchPostingType: Boolean;
        DimText: Text[75];
        AllocationDimText: Text[75];
        ShowDim: Boolean;
        Continue: Boolean;
        CurrentICPartner: Code[20];
        Text000: Label '%1 cannot be filtered when you post recurring journals.';
        Text001: Label '%1 or %2 must be specified.';
        Text002: Label '%1 must be specified.';
        Text003: Label '%1 + %2 must be %3.';
        Text004: Label '%1 must be " " when %2 is %3.';
        Text005: Label '%1, %2, %3 or %4 must not be completed when %5 is %6.';
        Text006: Label '%1 must be negative.';
        Text007: Label '%1 must be positive.';
        Text008: Label '%1 must have the same sign as %2.';
        Text009: Label '%1 cannot be specified.';
        Text010: Label '%1 must be Yes.';
        Text011: Label '%1 + %2 must be -%3.';
        Text012: Label '%1 must have a different sign than %2.';
        Text013: Label '%1 must only be a closing date for G/L entries.';
        Text014: Label '%1 is not within your allowed range of posting dates.';
        Text015: Label 'The lines are not listed according to Posting Date because they were not entered in that order.';
        Text016: Label 'There is a gap in the number series.';
        Text017: Label '%1 or %2 must be G/L Account or Bank Account.';
        Text018: Label '%1 must be 0.';
        Text019: Label '%1 cannot be specified when using recurring journals.';
        Text020: Label '%1 must not be %2 when %3 = %4.';
        Text021: Label 'Allocations can only be used with recurring journals.';
        Text022: Label 'Please specify %1 in the %2 allocation lines.';
        Text023: Label '<Month Text>';
        Text024: Label '%1 %2 posted on %3, must be separated by an empty line';
        Text025: Label '%1 %2 is out of balance by %3.';
        Text026: Label 'The reversing entries for %1 %2 are out of balance by %3.';
        Text027: Label 'As of %1, the lines are out of balance by %2.';
        Text028: Label 'As of %1, the reversing entries are out of balance by %2.';
        Text029: Label 'The total of the lines is out of balance by %1.';
        Text030: Label 'The total of the reversing entries is out of balance by %1.';
        Text031: Label '%1 %2 does not exist.';
        Text032: Label '%1 must be %2 for %3 %4.';
        Text036: Label '%1 %2 %3 does not exist.';
        Text037: Label '%1 must be %2.';
        Text038: Label 'The currency %1 cannot be found. Please check the currency table.';
        Text039: Label 'Sales %1 %2 already exists.';
        Text040: Label 'Purchase %1 %2 already exists.';
        Text041: Label '%1 must be entered.';
        Text042: Label '%1 must not be filled when %2 is different in %3 and %4.';
        Text043: Label '%1 %2 must not have %3 = %4.';
        Text044: Label '%1 must not be specified in fixed asset journal lines.';
        Text045: Label '%1 must be specified in fixed asset journal lines.';
        Text046: Label '%1 must be different than %2.';
        Text047: Label '%1 and %2 must not both be %3.';
        Text048: Label '%1  must not be specified when %2 = %3.';
        Text049: Label '%1 must not be specified when %2 = %3.';
        Text050: Label 'must not be specified together with %1 = %2.';
        Text051: Label '%1 must be identical to %2.';
        Text052: Label '%1 cannot be a closing date.';
        Text053: Label '%1 is not within your range of allowed posting dates.';
        Text054: Label 'Insurance integration is not activated for %1 %2.';
        Text055: Label 'must not be specified when %1 is specified.';
        Text056: Label 'When G/L integration is not activated, %1 must not be posted in the general journal.';
        Text057: Label 'When G/L integration is not activated, %1 must not be specified in the general journal.';
        Text058: Label '%1 must not be specified.';
        Text059: Label 'The combination of Customer and Gen. Posting Type Purchase is not allowed.';
        Text060: Label 'The combination of Vendor and Gen. Posting Type Sales is not allowed.';
        Text061: Label 'The Balance and Reversing Balance recurring methods can be used only with Allocations.';
        Text062: Label '%1 must not be 0.';
        Text063: Label 'Document,Payment,Invoice,Credit Memo,Finance Charge Memo,Reminder,Refund';
        Text064: Label '%1 %2 is already used in line %3 (%4 %5).';
        Text065: Label '%1 must not be blocked with type %2 when %3 is %4';
        Text066: Label 'You cannot enter G/L Account or Bank Account in both %1 and %2.';
        Text067: Label '%1 %2 is linked to %3 %4.';
        Text069: Label '%1 must not be specified when %2 is %3.';
        Text070: Label '%1 must not be specified when the document is not an intercompany transaction.';
        Text071: Label '%1 %2 does not exist.';
        Text072: Label '%1 must not be %2 for %3 %4.';
        Text073: Label '%1 %2 already exists.';
        GeneralJnlTestCap: Label 'General Journal - Test';
        PageNoCap: Label 'Page';
        JnlBatchNameCap: Label 'Journal Batch';
        PostingDateCap: Label 'Posting Date';
        DocumentTypeCap: Label 'Document Type';
        AccountTypeCap: Label 'Account Type';
        AccNameCap: Label 'Name';
        GenPostingTypeCap: Label 'Gen. Posting Type';
        GenBusPostingGroupCap: Label 'Gen. Bus. Posting Group';
        GenProdPostingGroupCap: Label 'Gen. Prod. Posting Group';
        AmountLCYCap: Label 'Total (LCY)';
        DimensionsCap: Label 'Dimensions';
        WarningCap: Label 'Warning!';
        ReconciliationCap: Label 'Reconciliation';
        NoCap: Label 'No.';
        NameCap: Label 'Name';
        NetChangeinJnlCap: Label 'Net Change in Jnl.';
        BalafterPostingCap: Label 'Balance after Posting';
        DimensionAllocationsCap: Label 'Allocation Dimensions';
        JournalBatch: Record 232;
        AmountInWordsReport: Report 1401;
        LoopController: Integer;
        DescriptionLine: array[2] of Text[80];
        GenGnlLine: Record 81;
        AmountsFortext: Decimal;
        PayeeName: Text[250];
        DimensionValue: Record 349;
        ShowLine: Boolean;
}

