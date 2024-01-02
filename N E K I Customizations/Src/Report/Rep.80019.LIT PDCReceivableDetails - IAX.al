report 80019 "LIT PDCReceivableDetails - IAX"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Src/Layout/PDC Receivable Details - IAX.rdlc';
    Caption = 'PDC Receivable Details - IAX';
    Description = 'PDC Receivable Details - IAX';
    PreviewMode = PrintLayout;

    dataset
    {
        dataitem(DataItem1; "Gen. Journal Line")
        {
            DataItemTableView = WHERE("Journal Template Name" = FILTER('PDC-REC'),
                                      "Journal Batch Name" = FILTER('PDC-REC'),
                                      "Account Type" = FILTER(Customer),
                                      "LIT Check No." = FILTER(<> ''),
                                      "Bal. Account Type" = FILTER("Bank Account"));
            RequestFilterFields = "Journal Template Name", "Journal Batch Name", "Document No.", "Posting Date";
            column(JournalTemplateName_GenJournalLine; "Journal Template Name")
            {
            }
            column(JournalBatchName_GenJournalLine; "Journal Batch Name")
            {
            }
            column(PostingDate_GenJournalLine; "Posting Date")
            {
            }
            column(DocumentType_GenJournalLine; "Document Type")
            {
            }
            column(DocumentNo_GenJournalLine; "Document No.")
            {
            }
            column(AccountType_GenJournalLine; "Account Type")
            {
            }
            column(AccountNo_GenJournalLine; "Account No.")
            {
            }
            column(Description_GenJournalLine; Description)
            {
            }
            column(DebitAmount_GenJournalLine; "Debit Amount")
            {
            }
            column(CreditAmount_GenJournalLine; "Credit Amount")
            {
            }
            column(Amount_GenJournalLine; Amount)
            {
            }
            column(AmountLCY_GenJournalLine; "Amount (LCY)")
            {
            }
            column(CurrencyCode_GenJournalLine; "Currency Code")
            {
            }
            column(ShortcutDimension1Code_GenJournalLine; "Shortcut Dimension 1 Code")
            {
            }
            column(ShortcutDimension2Code_GenJournalLine; "Shortcut Dimension 2 Code")
            {
            }
            column(CheckNo_GenJournalLine; "LIT Check No.")
            {
            }
            column(CheckDate_GenJournalLine; "LIT Check Date")
            {
            }
            column(Remarks_GenJournalLine; "LIT Remarks")
            {
            }
            column(Remaining_Days; "LIT Check Date" - TODAY)
            {
            }
            column(BalAccountType_GenJournalLine; "Bal. Account Type")
            {
            }
            column(BalAccountNo_GenJournalLine; "Bal. Account No.")
            {
            }
            column(CustomerName; CustomerName)
            {
            }
            column(GenJournalBatchName; GenJournalBatchName)
            {
            }
            column(BankName; BankName)
            {
            }

            trigger OnAfterGetRecord()
            begin
                IF "Account Type" = "Account Type"::Vendor THEN
                    CustRec.RESET;
                //CustRec.SETRANGE("Gen. Journal Line"."Bal. Account Type" , 'Customer');
                CustRec.SETRANGE(CustRec."No.", "Account No.");
                IF CustRec.FINDFIRST THEN BEGIN
                    CustomerName := CustRec.Name;
                END;

                BankAccount.RESET;
                BankAccount.SETFILTER("No.", "Bal. Account No.");
                IF BankAccount.FINDFIRST THEN BEGIN
                    BankName := BankAccount.Name;
                END;


                GenJournalBatch.RESET;
                GenJournalBatch.SETRANGE(GenJournalBatch."Journal Template Name", "Journal Template Name");
                GenJournalBatch.SETRANGE(GenJournalBatch.Name, "Journal Batch Name");
                IF GenJournalBatch.FINDFIRST THEN BEGIN
                    GenJournalBatchName := GenJournalBatch.Description;
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

    var
        CustRec: Record 18;
        CustomerName: Text[50];
        GenJournalBatch: Record 232;
        GenJournalBatchName: Text[30];
        BankAccount: Record 270;
        BankName: Text[50];
}

