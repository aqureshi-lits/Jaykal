report 80069 "Day Book"
{
    // version Firoz

    // <changelog>
    //     <change releaseversion="IN6.00"/>
    //     <change id="IN0090" dev="AUGMENTUM" date="2008-05-07" area="Finance"
    //       baseversion="IN6.00" releaseversion="IN6.00" feature="NAVCORS20452">
    //       Report Transformation - local Report Layout
    //       Format all the dates to make NNC consistent with old client
    //     </change>
    //     <change id="PS42497" dev="suneethg" date="2009-10-07" area="Financial" releaseversion="IN7.00" feature="NAVCORS42497"
    //     >Incorrect Total amounts in RTC corrected.</change>
    // </changelog>
    DefaultLayout = RDLC;
    RDLCLayout = './Src/Layout/RGS Reports/Day Book.rdlc';

    Caption = 'Day Book';

    dataset
    {
        dataitem("G/L Entry"; "G/L Entry")
        {
            DataItemTableView = SORTING("Transaction No.");
            RequestFilterFields = "Posting Date", "Document No.", "Global Dimension 1 Code", "Global Dimension 2 Code";
            column(TodayFormatted; FORMAT(TODAY, 0, 4))
            {
            }
            column(Time; TIME)
            {
            }
            column(CompinfoName; Compinfo.Name)
            {
            }
            column(GetFilters; GETFILTERS)
            {
            }
            column(DebitAmount_GLEntry; "Debit Amount")
            {
            }
            column(CreditAmount_GLEntry; "Credit Amount")
            {
            }
            column(GLAccName; GLAccName)
            {
            }
            column(DocNo; DocNo)
            {
            }
            column(PostingDate_GLEntry; FORMAT(PostingDate))
            {
            }
            column(SourceDesc; SourceDesc)
            {
            }
            column(EntryNo_GLEntry; "Entry No.")
            {
            }
            column(TransactionNo_GLEntry; "Transaction No.")
            {
            }
            column(DayBookCaption; DayBookCaptionLbl)
            {
            }
            column(DocumentNoCaption; DocumentNoCaptionLbl)
            {
            }
            column(AccountNameCaption; AccountNameCaptionLbl)
            {
            }
            column(DebitAmountCaption; DebitAmountCaptionLbl)
            {
            }
            column(CreditAmountCaption; CreditAmountCaptionLbl)
            {
            }
            column(VoucherTypeCaption; VoucherTypeCaptionLbl)
            {
            }
            column(DateCaption; DateCaptionLbl)
            {
            }
            column(TotalCaption; TotalCaptionLbl)
            {
            }
            // dataitem(DataItem5326; Table50022)
            // {
            //     DataItemLink = Entry No.=FIELD(Entry No.);
            //     DataItemTableView = SORTING(Entry No., Transaction No., Line No.)
            //                         ORDER(Ascending);
            //     column(Narration_PostedNarration; Narration)
            //     {
            //     }

            //     trigger OnPreDataItem()
            //     begin
            //         IF NOT LineNarration THEN
            //             CurrReport.BREAK;
            //     end;
            // }
            // dataitem(PostedNarration1; Table50022)
            // {
            //     DataItemLink = Transaction No.=FIELD(Transaction No.);
            //     DataItemTableView = SORTING(Entry No., Transaction No., Line No.)
            //                         WHERE(Entry No.=FILTER(0));
            //     column(Narration_PostedNarration1;Narration)
            //     {
            //     }

            //     trigger OnPreDataItem()
            //     begin
            //         IF NOT VoucherNarration THEN
            //           CurrReport.BREAK;

            //         GLEntry.SETCURRENTKEY("Posting Date","Source Code","Transaction No.");
            //         GLEntry.SETRANGE("Posting Date","G/L Entry"."Posting Date");
            //         GLEntry.SETRANGE("Source Code","G/L Entry"."Source Code");
            //         GLEntry.SETRANGE("Transaction No.","G/L Entry"."Transaction No.");
            //         GLEntry.FINDLAST;
            //         IF NOT (GLEntry."Entry No." = "G/L Entry"."Entry No.") THEN
            //           CurrReport.BREAK;
            //     end;
            // }

            trigger OnAfterGetRecord()
            begin
                DocNo := '';
                PostingDate := 0D;
                SourceDesc := '';

                GLAccName := FindGLAccName("Source Type", "Entry No.", "Source No.", "G/L Account No.");

                // IN0090.begin
                IF TransNo = 0 THEN BEGIN
                    TransNo := "Transaction No.";
                    DocNo := "Document No.";
                    PostingDate := "Posting Date";
                    IF "Source Code" <> '' THEN BEGIN
                        SourceCode.GET("Source Code");
                        SourceDesc := SourceCode.Description;
                    END;
                END ELSE
                    IF TransNo <> "Transaction No." THEN BEGIN
                        TransNo := "Transaction No.";
                        DocNo := "Document No.";
                        PostingDate := "Posting Date";
                        IF "Source Code" <> '' THEN BEGIN
                            SourceCode.GET("Source Code");
                            SourceDesc := SourceCode.Description;
                        END;
                    END;
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
                    field(LineNarration; LineNarration)
                    {
                        Caption = 'Line Narration';
                        ApplicationArea = all;
                    }
                    field(VoucherNarration; VoucherNarration)
                    {
                        Caption = 'Voucher Narration';
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
        Compinfo.GET;
    end;

    var
        Compinfo: Record 79;
        GLEntry: Record 17;
        SourceCode: Record 230;
        GLAccName: Text[50];
        SourceDesc: Text[50];
        PostingDate: Date;
        LineNarration: Boolean;
        VoucherNarration: Boolean;
        DocNo: Code[20];
        TransNo: Integer;
        DayBookCaptionLbl: Label 'Day Book';
        DocumentNoCaptionLbl: Label 'Document No.';
        AccountNameCaptionLbl: Label 'Account Name';
        DebitAmountCaptionLbl: Label 'Debit Amount';
        CreditAmountCaptionLbl: Label 'Credit Amount';
        VoucherTypeCaptionLbl: Label 'Voucher Type';
        DateCaptionLbl: Label 'Date';
        TotalCaptionLbl: Label 'Total';

    procedure FindGLAccName("Source Type": Option " ",Customer,Vendor,"Bank Account","Fixed Asset"; "Entry No.": Integer; "Source No.": Code[20]; "G/L Account No.": Code[20]): Text[100]
    var
        AccName: Text[100];
        VendLedgEntry: Record 25;
        Vend: Record 23;
        CustLedgEntry: Record 21;
        Cust: Record 18;
        BankLedgEntry: Record 271;
        Bank: Record 270;
        FALedgEntry: Record 5601;
        FA: Record 5600;
        GLAccount: Record 15;
    begin
        IF "Source Type" = "Source Type"::Vendor THEN
            IF VendLedgEntry.GET("Entry No.") THEN BEGIN
                Vend.GET("Source No.");
                AccName := Vend.Name;
            END ELSE BEGIN
                GLAccount.GET("G/L Account No.");
                AccName := GLAccount.Name;
            END
        ELSE
            IF "Source Type" = "Source Type"::Customer THEN
                IF CustLedgEntry.GET("Entry No.") THEN BEGIN
                    Cust.GET("Source No.");
                    AccName := Cust.Name;
                END ELSE BEGIN
                    GLAccount.GET("G/L Account No.");
                    AccName := GLAccount.Name;
                END
            ELSE
                IF "Source Type" = "Source Type"::"Bank Account" THEN
                    IF BankLedgEntry.GET("Entry No.") THEN BEGIN
                        Bank.GET("Source No.");
                        AccName := Bank.Name;
                    END ELSE BEGIN
                        GLAccount.GET("G/L Account No.");
                        AccName := GLAccount.Name;
                    END
                ELSE
                    IF "Source Type" = "Source Type"::"Fixed Asset" THEN BEGIN
                        FALedgEntry.RESET;
                        FALedgEntry.SETCURRENTKEY("G/L Entry No.");
                        FALedgEntry.SETRANGE("G/L Entry No.", "Entry No.");
                        IF FALedgEntry.FINDFIRST THEN BEGIN
                            FA.GET("Source No.");
                            AccName := FA.Description;
                        END ELSE BEGIN
                            GLAccount.GET("G/L Account No.");
                            AccName := GLAccount.Name;
                        END;
                    END ELSE BEGIN
                        GLAccount.GET("G/L Account No.");
                        AccName := GLAccount.Name;
                    END;

        IF "Source Type" = "Source Type"::" " THEN BEGIN
            GLAccount.GET("G/L Account No.");
            AccName := GLAccount.Name;
        END;

        EXIT(AccName);
    end;
}

