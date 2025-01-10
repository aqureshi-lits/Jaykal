report 80063 "PDC Payable Details - IAX"
{
    // version MAQ IAX

    DefaultLayout = RDLC;
    RDLCLayout = './Src/Layout/RGS Reports/PDC Payable Details - IAX.rdlc';
    Caption = 'PDC Payable Details - IAX';
    Description = 'PDC Payable Details - IAX';
    PreviewMode = PrintLayout;

    dataset
    {
        dataitem("Gen. Journal Line"; "Gen. Journal Line")
        {
            DataItemTableView = WHERE("Journal Template Name" = FILTER('PDC-PAY'),
                                      "Journal Batch Name" = FILTER('PDC-PAY'),
                                      "Account Type" = FILTER(Vendor),
                                      "Check No." = FILTER(<> ''),
                                      "Bal. Account Type" = FILTER("Bank Account"));
            RequestFilterFields = "Journal Template Name", "Journal Batch Name", "Document No.", "Posting Date";
            column(JournalTemplateName_GenJournalLine; "Gen. Journal Line"."Journal Template Name")
            {
            }
            column(JournalBatchName_GenJournalLine; "Gen. Journal Line"."Journal Batch Name")
            {
            }
            column(PostingDate_GenJournalLine; "Gen. Journal Line"."Posting Date")
            {
            }
            column(DocumentType_GenJournalLine; "Gen. Journal Line"."Document Type")
            {
            }
            column(DocumentNo_GenJournalLine; "Gen. Journal Line"."Document No.")
            {
            }
            column(AccountType_GenJournalLine; "Gen. Journal Line"."Account Type")
            {
            }
            column(AccountNo_GenJournalLine; "Gen. Journal Line"."Account No.")
            {
            }
            column(Description_GenJournalLine; "Gen. Journal Line".Description)
            {
            }
            column(DebitAmount_GenJournalLine; "Gen. Journal Line"."Debit Amount")
            {
            }
            column(CreditAmount_GenJournalLine; "Gen. Journal Line"."Credit Amount")
            {
            }
            column(Amount_GenJournalLine; "Gen. Journal Line".Amount)
            {
            }
            column(AmountLCY_GenJournalLine; "Gen. Journal Line"."Amount (LCY)")
            {
            }
            column(CurrencyCode_GenJournalLine; "Gen. Journal Line"."Currency Code")
            {
            }
            column(ShortcutDimension1Code_GenJournalLine; "Gen. Journal Line"."Shortcut Dimension 1 Code")
            {
            }
            column(ShortcutDimension2Code_GenJournalLine; "Gen. Journal Line"."Shortcut Dimension 2 Code")
            {
            }
            column(CheckNo_GenJournalLine; "Gen. Journal Line"."Check No.")
            {
            }
            column(CheckDate_GenJournalLine; "Gen. Journal Line"."Check Date")
            {
            }
            column(Remarks_GenJournalLine; "Gen. Journal Line".Remarks)
            {
            }
            column(Remaining_Days; "Gen. Journal Line"."Check Date" - TODAY)
            {
            }
            column(BalAccountType_GenJournalLine; "Gen. Journal Line"."Bal. Account Type")
            {
            }
            column(BalAccountNo_GenJournalLine; "Gen. Journal Line"."Bal. Account No.")
            {
            }
            column(VendorName; VendorName)
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
                    VendorRec.RESET;
                //VendorRec.SETRANGE("Gen. Journal Line"."Bal. Account Type" , 'Vendor');
                VendorRec.SETRANGE(VendorRec."No.", "Account No.");
                IF VendorRec.FINDFIRST THEN BEGIN
                    VendorName := VendorRec.Name;
                END;

                BankAccount.RESET;
                BankAccount.SETFILTER("No.", "Bal. Account No.");
                IF BankAccount.FINDFIRST THEN BEGIN
                    BankName := BankAccount.Name;
                END;


                GenJournalBatch.RESET;
                GenJournalBatch.SETRANGE(GenJournalBatch."Journal Template Name", "Gen. Journal Line"."Journal Template Name");
                GenJournalBatch.SETRANGE(GenJournalBatch.Name, "Gen. Journal Line"."Journal Batch Name");
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
        VendorRec: Record 23;
        VendorName: Text[50];
        UserSetup: Record 91;
        GenJournalBatch: Record 232;
        GenJournalBatchName: Text[30];
        BankAccount: Record 270;
        BankName: Text[50];
}

