report 80031 "LIT VATStatementwithBaseAmount"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Src/Layout/VAT Statement with Base Amount.rdlc';
    ApplicationArea = all, Basic, Suite;
    Caption = 'VAT Statement with Base Amount';
    PreviewMode = PrintLayout;
    UsageCategory = ReportsAndAnalysis;

    dataset
    {
        dataitem("VAT Statement Name"; "VAT Statement Name")
        {
            DataItemTableView = SORTING("Statement Template Name", Name);
            PrintOnlyIfDetail = true;
            RequestFilterFields = "Statement Template Name", Name;
            column(StmtName1_VatStmtName; "Statement Template Name")
            {
            }
            column(Name1_VatStmtName; Name)
            {
            }
            dataitem("VAT Statement Line"; "VAT Statement Line")
            {
                DataItemLink = "Statement Template Name" = FIELD("Statement Template Name"),
                               "Statement Name" = FIELD(Name);
                DataItemTableView = SORTING("Statement Template Name", "Statement Name")
                                    WHERE(Print = CONST(true));
                RequestFilterFields = "Row No.";
                column(Heading; Heading)
                {
                }
                column(CompanyName; COMPANYPROPERTY.DISPLAYNAME)
                {
                }
                column(StmtName_VatStmtName; "VAT Statement Name"."Statement Template Name")
                {
                }
                column(Name_VatStmtName; "VAT Statement Name".Name)
                {
                }
                column(Heading2; Heading2)
                {
                }
                column(HeaderText; HeaderText)
                {
                }
                column(GlSetupLCYCode; GLSetup."LCY Code")
                {
                }
                column(Allamountsarein; AllamountsareinLbl)
                {
                }
                column(TxtGLSetupAddnalReportCur; STRSUBSTNO(Text003, GLSetup."Additional Reporting Currency"))
                {
                }
                column(GLSetupAddRepCurrency; GLSetup."Additional Reporting Currency")
                {
                }
                column(VatStmLineTableCaptFilter; TABLECAPTION + ': ' + VATStmtLineFilter)
                {
                }
                column(VatStmtLineFilter; VATStmtLineFilter)
                {
                }
                column(VatStmtLineRowNo; "Row No.")
                {
                    IncludeCaption = true;
                }
                column(Description_VatStmtLine; Description)
                {
                    IncludeCaption = true;
                }
                column(TotalAmount; TotalAmount)
                {
                    AutoFormatExpression = GetCurrency;
                    AutoFormatType = 1;
                }
                column(TotalAmount2; TotalAmount2)
                {
                    AutoFormatExpression = GetCurrency;
                    AutoFormatType = 1;
                }
                column(UseAmtsInAddCurr; UseAmtsInAddCurr)
                {
                }
                column(Selection; Selection)
                {
                }
                column(PeriodSelection; PeriodSelection)
                {
                }
                column(PrintInIntegers; PrintInIntegers)
                {
                }
                column(PageGroupNo; PageGroupNo)
                {
                }
                column(VATStmtCaption; VATStmtCaptionLbl)
                {
                }
                column(CurrReportPageNoCaption; CurrReportPageNoCaptionLbl)
                {
                }
                column(VATStmtTemplateCaption; VATStmtTemplateCaptionLbl)
                {
                }
                column(VATStmtNameCaption; VATStmtNameCaptionLbl)
                {
                }
                column(AmtsareinwholeLCYsCaption; AmtsareinwholeLCYsCaptionLbl)
                {
                }
                column(ReportinclallVATentriesCaption; ReportinclallVATentriesCaptionLbl)
                {
                }
                column(RepinclonlyclosedVATentCaption; RepinclonlyclosedVATentCaptionLbl)
                {
                }
                column(TotalAmountCaption; TotalAmountCaptionLbl)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    CalcLineTotal("VAT Statement Line", TotalAmount, 0);
                    CalcLineTotal2("VAT Statement Line", TotalAmount2, 0);    //MAQ IAX Added 18-05-2020.
                    IF PrintInIntegers THEN
                        TotalAmount := ROUND(TotalAmount, 1, '<');
                    TotalAmount2 := ROUND(TotalAmount2, 1, '<');            //MAQ IAX Added 18-05-2020.
                    IF "Print with" = "Print with"::"Opposite Sign" THEN
                        TotalAmount := -TotalAmount;
                    TotalAmount2 := -TotalAmount2;                       //MAQ IAX Added 18-05-2020.
                    PageGroupNo := NextPageGroupNo;
                    IF "New Page" THEN
                        NextPageGroupNo := PageGroupNo + 1;
                end;

                trigger OnPreDataItem()
                begin
                    PageGroupNo := 1;
                    NextPageGroupNo := 1;
                end;
            }

            trigger OnAfterGetRecord()
            begin
                CurrReport.PAGENO := 1;
            end;

            trigger OnPreDataItem()
            begin
                GLSetup.GET;
            end;
        }
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    group("Statement Period")
                    {
                        Caption = 'Statement Period';
                        field(StartingDate; StartDate)
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Starting Date';
                            ToolTip = 'Specifies the start date for the time interval for VAT statement lines in the report.';
                        }
                        field(EndingDate; EndDateReq)
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Ending Date';
                            ToolTip = 'Specifies the end date for the time interval for VAT statement lines in the report.';
                        }
                    }
                    field(Selection; Selection)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Include VAT Entries';
                        Importance = Additional;
                        OptionCaption = 'Open,Closed,Open and Closed';
                        ToolTip = 'Specifies if you want to include open VAT entries in the report.';
                    }
                    field(PeriodSelection; PeriodSelection)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Include VAT Entries';
                        Importance = Additional;
                        OptionCaption = 'Before and Within Period,Within Period';
                        ToolTip = 'Specifies if you want to include VAT entries from before the specified time period in the report.';
                    }
                    field(RoundToWholeNumbers; PrintInIntegers)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Round to Whole Numbers';
                        Importance = Additional;
                        ToolTip = 'Specifies if you want the amounts in the report to be rounded to whole numbers.';
                    }
                    field(ShowAmtInAddCurrency; UseAmtsInAddCurr)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Show Amounts in Add. Reporting Currency';
                        Importance = Additional;
                        MultiLine = true;
                        ToolTip = 'Specifies if you want report amounts to be shown in the additional reporting currency.';
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
        IF EndDateReq = 0D THEN
            EndDate := DMY2DATE(31, 12, 9999)
        ELSE
            EndDate := EndDateReq;
        VATStmtLine.SETRANGE("Date Filter", StartDate, EndDateReq);
        IF PeriodSelection = PeriodSelection::"Before and Within Period" THEN
            Heading := Text000
        ELSE
            Heading := Text004;
        Heading2 := STRSUBSTNO(Text005, StartDate, EndDateReq);
        VATStmtLineFilter := VATStmtLine.GETFILTERS;
    end;

    var
        Text000: Label 'VAT entries before and within the period';
        Text003: Label 'Amounts are in %1, rounded without decimals.';
        Text004: Label 'VAT entries within the period';
        Text005: Label 'Period: %1..%2';
        GLAcc: Record 15;
        VATEntry: Record 254;
        GLSetup: Record 98;
        VATStmtLine: Record 256;
        Selection: Option Open,Closed,"Open and Closed";
        PeriodSelection: Option "Before and Within Period","Within Period";
        PrintInIntegers: Boolean;
        VATStmtLineFilter: Text;
        Heading: Text[50];
        Amount: Decimal;
        TotalAmount: Decimal;
        RowNo: array[6] of Code[10];
        ErrorText: Text[80];
        i: Integer;
        PageGroupNo: Integer;
        NextPageGroupNo: Integer;
        UseAmtsInAddCurr: Boolean;
        HeaderText: Text[50];
        EndDate: Date;
        StartDate: Date;
        EndDateReq: Date;
        Heading2: Text[50];
        AllamountsareinLbl: Label 'All amounts are in';
        VATStmtCaptionLbl: Label 'VAT Statement';
        CurrReportPageNoCaptionLbl: Label 'Page';
        VATStmtTemplateCaptionLbl: Label 'VAT Statement Template';
        VATStmtNameCaptionLbl: Label 'VAT Statement Name';
        AmtsareinwholeLCYsCaptionLbl: Label 'Amounts are in whole LCYs.';
        ReportinclallVATentriesCaptionLbl: Label 'The report includes all VAT entries.';
        RepinclonlyclosedVATentCaptionLbl: Label 'The report includes only closed VAT entries.';
        TotalAmountCaptionLbl: Label 'Amount';
        TotalAmount2: Decimal;

    [Scope('Cloud')]
    procedure CalcLineTotal(VATStmtLine2: Record 256; var TotalAmount: Decimal; Level: Integer): Boolean
    begin
        IF Level = 0 THEN
            TotalAmount := 0;
        CASE VATStmtLine2.Type OF
            VATStmtLine2.Type::"Account Totaling":
                BEGIN
                    GLAcc.SETFILTER("No.", VATStmtLine2."Account Totaling");
                    IF EndDateReq = 0D THEN
                        EndDate := DMY2DATE(31, 12, 9999)
                    ELSE
                        EndDate := EndDateReq;
                    GLAcc.SETRANGE("Date Filter", StartDate, EndDate);
                    Amount := 0;
                    IF GLAcc.FIND('-') AND (VATStmtLine2."Account Totaling" <> '') THEN
                        REPEAT
                            GLAcc.CALCFIELDS("Net Change", "Additional-Currency Net Change");
                            Amount := ConditionalAdd(Amount, GLAcc."Net Change", GLAcc."Additional-Currency Net Change");
                        UNTIL GLAcc.NEXT = 0;
                    CalcTotalAmount(VATStmtLine2, TotalAmount);
                END;
            VATStmtLine2.Type::"VAT Entry Totaling":
                BEGIN
                    VATEntry.RESET;
                    IF VATEntry.SETCURRENTKEY(
                         Type, Closed, "VAT Bus. Posting Group", "VAT Prod. Posting Group", "Posting Date")
                    THEN BEGIN
                        VATEntry.SETRANGE("VAT Bus. Posting Group", VATStmtLine2."VAT Bus. Posting Group");
                        VATEntry.SETRANGE("VAT Prod. Posting Group", VATStmtLine2."VAT Prod. Posting Group");
                    END ELSE BEGIN
                        VATEntry.SETCURRENTKEY(
                          Type, Closed, "Tax Jurisdiction Code", "Use Tax", "Posting Date");
                        VATEntry.SETRANGE("Tax Jurisdiction Code", VATStmtLine2."Tax Jurisdiction Code");
                        VATEntry.SETRANGE("Use Tax", VATStmtLine2."Use Tax");
                    END;
                    VATEntry.SETRANGE(Type, VATStmtLine2."Gen. Posting Type");
                    IF (EndDateReq <> 0D) OR (StartDate <> 0D) THEN
                        IF PeriodSelection = PeriodSelection::"Before and Within Period" THEN
                            VATEntry.SETRANGE("Posting Date", 0D, EndDate)
                        ELSE
                            VATEntry.SETRANGE("Posting Date", StartDate, EndDate);
                    CASE Selection OF
                        Selection::Open:
                            VATEntry.SETRANGE(Closed, FALSE);
                        Selection::Closed:
                            VATEntry.SETRANGE(Closed, TRUE);
                        ELSE
                            VATEntry.SETRANGE(Closed);
                    END;
                    CASE VATStmtLine2."Amount Type" OF
                        VATStmtLine2."Amount Type"::Amount:
                            BEGIN
                                VATEntry.CALCSUMS(Amount, "Additional-Currency Amount");
                                Amount := ConditionalAdd(0, VATEntry.Amount, VATEntry."Additional-Currency Amount");
                            END;
                        VATStmtLine2."Amount Type"::Base:
                            BEGIN
                                VATEntry.CALCSUMS(Base, "Additional-Currency Base");
                                Amount := ConditionalAdd(0, VATEntry.Base, VATEntry."Additional-Currency Base");
                            END;
                        VATStmtLine2."Amount Type"::"Unrealized Amount":
                            BEGIN
                                VATEntry.CALCSUMS("Remaining Unrealized Amount", "Add.-Curr. Rem. Unreal. Amount");
                                Amount := ConditionalAdd(0, VATEntry."Remaining Unrealized Amount", VATEntry."Add.-Curr. Rem. Unreal. Amount");
                            END;
                        VATStmtLine2."Amount Type"::"Unrealized Base":
                            BEGIN
                                VATEntry.CALCSUMS("Remaining Unrealized Base", "Add.-Curr. Rem. Unreal. Base");
                                Amount := ConditionalAdd(0, VATEntry."Remaining Unrealized Base", VATEntry."Add.-Curr. Rem. Unreal. Base");
                            END;
                    END;
                    CalcTotalAmount(VATStmtLine2, TotalAmount);
                END;
            VATStmtLine2.Type::"Row Totaling":
                BEGIN
                    IF Level >= ARRAYLEN(RowNo) THEN
                        EXIT(FALSE);
                    Level := Level + 1;
                    RowNo[Level] := VATStmtLine2."Row No.";

                    IF VATStmtLine2."Row Totaling" = '' THEN
                        EXIT(TRUE);
                    VATStmtLine2.SETRANGE("Statement Template Name", VATStmtLine2."Statement Template Name");
                    VATStmtLine2.SETRANGE("Statement Name", VATStmtLine2."Statement Name");
                    VATStmtLine2.SETFILTER("Row No.", VATStmtLine2."Row Totaling");
                    IF VATStmtLine2.FIND('-') THEN
                        REPEAT
                            IF NOT CalcLineTotal(VATStmtLine2, TotalAmount, Level) THEN BEGIN
                                IF Level > 1 THEN
                                    EXIT(FALSE);
                                FOR i := 1 TO ARRAYLEN(RowNo) DO
                                    ErrorText := ErrorText + RowNo[i] + ' => ';
                                ErrorText := ErrorText + '...';
                                VATStmtLine2.FIELDERROR("Row No.", ErrorText);
                            END;
                        UNTIL VATStmtLine2.NEXT = 0;
                END;
            VATStmtLine2.Type::Description:
                ;
        END;

        EXIT(TRUE);
    end;

    local procedure CalcTotalAmount(VATStmtLine2: Record 256; var TotalAmount: Decimal)
    begin
        IF VATStmtLine2."Calculate with" = 1 THEN
            Amount := -Amount;
        IF PrintInIntegers AND VATStmtLine2.Print THEN
            Amount := ROUND(Amount, 1, '<');
        TotalAmount := TotalAmount + Amount;
    end;

    [Scope('Cloud')]
    procedure InitializeRequest(var NewVATStmtName: Record 257; var NewVATStatementLine: Record 256; NewSelection: Option Open,Closed,"Open and Closed"; NewPeriodSelection: Option "Before and Within Period","Within Period"; NewPrintInIntegers: Boolean; NewUseAmtsInAddCurr: Boolean)
    begin
        "VAT Statement Name".COPY(NewVATStmtName);
        "VAT Statement Line".COPY(NewVATStatementLine);
        Selection := NewSelection;
        PeriodSelection := NewPeriodSelection;
        PrintInIntegers := NewPrintInIntegers;
        UseAmtsInAddCurr := NewUseAmtsInAddCurr;
        IF NewVATStatementLine.GETFILTER("Date Filter") <> '' THEN BEGIN
            StartDate := NewVATStatementLine.GETRANGEMIN("Date Filter");
            EndDateReq := NewVATStatementLine.GETRANGEMAX("Date Filter");
            EndDate := EndDateReq;
        END ELSE BEGIN
            StartDate := 0D;
            EndDateReq := 0D;
            EndDate := DMY2DATE(31, 12, 9999);
        END;
    end;

    local procedure ConditionalAdd(Amount: Decimal; AmountToAdd: Decimal; AddCurrAmountToAdd: Decimal): Decimal
    begin
        IF UseAmtsInAddCurr THEN
            EXIT(Amount + AddCurrAmountToAdd);

        EXIT(Amount + AmountToAdd);
    end;

    local procedure GetCurrency(): Code[10]
    begin
        IF UseAmtsInAddCurr THEN
            EXIT(GLSetup."Additional Reporting Currency");

        EXIT('');
    end;

    [Scope('Cloud')]
    procedure CalcLineTotal2(VATStmtLine2: Record 256; var TotalAmount: Decimal; Level: Integer): Boolean
    begin
        IF Level = 0 THEN
            TotalAmount := 0;
        CASE VATStmtLine2.Type OF
            VATStmtLine2.Type::"Account Totaling":
                BEGIN
                    GLAcc.SETFILTER("No.", VATStmtLine2."Account Totaling");
                    IF EndDateReq = 0D THEN
                        EndDate := DMY2DATE(31, 12, 9999)
                    ELSE
                        EndDate := EndDateReq;
                    GLAcc.SETRANGE("Date Filter", StartDate, EndDate);
                    Amount := 0;
                    IF GLAcc.FIND('-') AND (VATStmtLine2."Account Totaling" <> '') THEN
                        REPEAT
                            GLAcc.CALCFIELDS("Net Change", "Additional-Currency Net Change");
                            Amount := ConditionalAdd(Amount, GLAcc."Net Change", GLAcc."Additional-Currency Net Change");
                        UNTIL GLAcc.NEXT = 0;
                    CalcTotalAmount(VATStmtLine2, TotalAmount);
                END;
            VATStmtLine2.Type::"VAT Entry Totaling":
                BEGIN
                    VATEntry.RESET;
                    IF VATEntry.SETCURRENTKEY(
                         Type, Closed, "VAT Bus. Posting Group", "VAT Prod. Posting Group", "Posting Date")
                    THEN BEGIN
                        VATEntry.SETRANGE("VAT Bus. Posting Group", VATStmtLine2."VAT Bus. Posting Group");
                        VATEntry.SETRANGE("VAT Prod. Posting Group", VATStmtLine2."VAT Prod. Posting Group");
                    END ELSE BEGIN
                        VATEntry.SETCURRENTKEY(
                          Type, Closed, "Tax Jurisdiction Code", "Use Tax", "Posting Date");
                        VATEntry.SETRANGE("Tax Jurisdiction Code", VATStmtLine2."Tax Jurisdiction Code");
                        VATEntry.SETRANGE("Use Tax", VATStmtLine2."Use Tax");
                    END;
                    VATEntry.SETRANGE(Type, VATStmtLine2."Gen. Posting Type");
                    IF (EndDateReq <> 0D) OR (StartDate <> 0D) THEN
                        IF PeriodSelection = PeriodSelection::"Before and Within Period" THEN
                            VATEntry.SETRANGE("Posting Date", 0D, EndDate)
                        ELSE
                            VATEntry.SETRANGE("Posting Date", StartDate, EndDate);
                    CASE Selection OF
                        Selection::Open:
                            VATEntry.SETRANGE(Closed, FALSE);
                        Selection::Closed:
                            VATEntry.SETRANGE(Closed, TRUE);
                        ELSE
                            VATEntry.SETRANGE(Closed);
                    END;
                    CASE VATStmtLine2."LIT Amount Type 2" OF
                        VATStmtLine2."LIT Amount Type 2"::Amount:
                            BEGIN
                                VATEntry.CALCSUMS(Amount, "Additional-Currency Amount");
                                Amount := ConditionalAdd(0, VATEntry.Amount, VATEntry."Additional-Currency Amount");
                            END;
                        VATStmtLine2."LIT Amount Type 2"::Base:
                            BEGIN
                                VATEntry.CALCSUMS(Base, "Additional-Currency Base");
                                Amount := ConditionalAdd(0, VATEntry.Base, VATEntry."Additional-Currency Base");
                            END;
                        VATStmtLine2."LIT Amount Type 2"::"Unrealized Amount":
                            BEGIN
                                VATEntry.CALCSUMS("Remaining Unrealized Amount", "Add.-Curr. Rem. Unreal. Amount");
                                Amount := ConditionalAdd(0, VATEntry."Remaining Unrealized Amount", VATEntry."Add.-Curr. Rem. Unreal. Amount");
                            END;
                        VATStmtLine2."LIT Amount Type 2"::"Unrealized Base":
                            BEGIN
                                VATEntry.CALCSUMS("Remaining Unrealized Base", "Add.-Curr. Rem. Unreal. Base");
                                Amount := ConditionalAdd(0, VATEntry."Remaining Unrealized Base", VATEntry."Add.-Curr. Rem. Unreal. Base");
                            END;
                    END;
                    CalcTotalAmount(VATStmtLine2, TotalAmount);
                END;
            VATStmtLine2.Type::"Row Totaling":
                BEGIN
                    IF Level >= ARRAYLEN(RowNo) THEN
                        EXIT(FALSE);
                    Level := Level + 1;
                    RowNo[Level] := VATStmtLine2."Row No.";

                    IF VATStmtLine2."Row Totaling" = '' THEN
                        EXIT(TRUE);
                    VATStmtLine2.SETRANGE("Statement Template Name", VATStmtLine2."Statement Template Name");
                    VATStmtLine2.SETRANGE("Statement Name", VATStmtLine2."Statement Name");
                    VATStmtLine2.SETFILTER("Row No.", VATStmtLine2."Row Totaling");
                    IF VATStmtLine2.FIND('-') THEN
                        REPEAT
                            IF NOT CalcLineTotal2(VATStmtLine2, TotalAmount, Level) THEN BEGIN
                                IF Level > 1 THEN
                                    EXIT(FALSE);
                                FOR i := 1 TO ARRAYLEN(RowNo) DO
                                    ErrorText := ErrorText + RowNo[i] + ' => ';
                                ErrorText := ErrorText + '...';
                                VATStmtLine2.FIELDERROR("Row No.", ErrorText);
                            END;
                        UNTIL VATStmtLine2.NEXT = 0;
                END;
            VATStmtLine2.Type::Description:
                ;
        END;

        EXIT(TRUE);
    end;
}

