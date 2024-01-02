
pageextension 80055 "LIT VATStatementPreviewLine" extends "VAT Statement Preview Line"
{
    layout
    {
        // Add changes to page layout here
        addafter("Amount Type")
        {
            field("Amount Type 2"; Rec."LIT Amount Type 2")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies if the VAT statement line shows the VAT amounts, or the base amounts on which the VAT is calculated.';
            }
        }

        addafter(ColumnValue)
        {
            field(ColumnValue2; ColumnValue2)
            {
                ApplicationArea = VAT;
                AutoFormatType = 1;
                BlankZero = true;
                Caption = 'Column Amount 2';
                DrillDown = true;
                ToolTip = 'Specifies the type of entries that will be included in the amounts in columns.';
                trigger OnDrillDown()
                begin

                    CASE Rec.Type OF
                        Rec.Type::"Account Totaling":
                            BEGIN
                                GLEntry.SETFILTER("G/L Account No.", Rec."Account Totaling");
                                Rec.COPYFILTER("Date Filter", GLEntry."Posting Date");
                                PAGE.RUN(PAGE::"General Ledger Entries", GLEntry);
                            END;
                        Rec.Type::"VAT Entry Totaling":
                            BEGIN
                                VATEntry.RESET;
                                IF NOT
                                   VATEntry.SETCURRENTKEY(
                                     Type, Closed, "VAT Bus. Posting Group", "VAT Prod. Posting Group", "Posting Date")
                                THEN
                                    VATEntry.SETCURRENTKEY(
                                      Type, Closed, "Tax Jurisdiction Code", "Use Tax", "Posting Date");
                                VATEntry.SETRANGE(Type, Rec."Gen. Posting Type");
                                VATEntry.SETRANGE("VAT Bus. Posting Group", Rec."VAT Bus. Posting Group");
                                VATEntry.SETRANGE("VAT Prod. Posting Group", Rec."VAT Prod. Posting Group");
                                VATEntry.SETRANGE("Tax Jurisdiction Code", Rec."Tax Jurisdiction Code");
                                VATEntry.SETRANGE("Use Tax", Rec."Use Tax");
                                IF Rec.GETFILTER("Date Filter") <> '' THEN
                                    IF PeriodSelection = PeriodSelection::"Before and Within Period" THEN
                                        VATEntry.SETRANGE("Posting Date", 0D, Rec.GETRANGEMAX("Date Filter"))
                                    ELSE
                                        Rec.COPYFILTER("Date Filter", VATEntry."Posting Date");
                                CASE Selection OF
                                    Selection::Open:
                                        VATEntry.SETRANGE(Closed, FALSE);
                                    Selection::Closed:
                                        VATEntry.SETRANGE(Closed, TRUE);
                                    Selection::"Open and Closed":
                                        VATEntry.SETRANGE(Closed);
                                END;
                                PAGE.RUN(PAGE::"VAT Entries", VATEntry);
                            END;
                        Rec.Type::"Row Totaling",
                      Rec.Type::Description:
                            ERROR(Text000, Rec.FIELDCAPTION(Type), Rec.Type);
                    END;
                end;
            }

        }

    }
    trigger OnAfterGetRecord()
    var
        myInt: Integer;
    begin
        VATStatement.CalcLineTotal2(Rec, ColumnValue2, 0);
        IF Rec."Print with" = Rec."Print with"::"Opposite Sign" THEN
            ColumnValue2 := -ColumnValue2;
    end;



    var
        VATStatement: Report "LIT VATStatementwithBaseAmount";
        ColumnValue2: Decimal;
        Text000: Label 'Drilldown is not possible when %1 is %2.';


}
