reportextension 80001 "LIT Customer Statement" extends "Standard Statement"
{
    dataset
    {
        add(DtldCustLedgEntries)
        {
            column(DocumentDate_DtldCustLedgEntries; DocumentDate)
            {
            }
        }

        modify(DtldCustLedgEntries)
        {
            trigger OnAfterAfterGetRecord()
            var
                myInt: Integer;
            begin
                Clear(DocumentDate);
                // if "Document Type" = "Document Type"::Invoice then begin
                //     PostSaleInvHeader.Reset();
                //     PostSaleInvHeader.SetRange("No.", DtldCustLedgEntries."Document No.");
                //     if PostSaleInvHeader.FindSet() then begin
                //         DocumentDate := PostSaleInvHeader."Document Date";
                //     end;
                // end;
                // if "Document Type" = "Document Type"::"Credit Memo" then begin
                //     PostSalesCreditHeader.Reset();
                //     PostSalesCreditHeader.SetRange("No.", DtldCustLedgEntries."Document No.");
                //     if PostSalesCreditHeader.FindSet() then begin
                //         DocumentDate := PostSalesCreditHeader."Document Date";
                //     end;
                // end;
                // if "Document Type" = "Document Type"::Payment then begin
                //     PostGeneralJournalLine.Reset();
                //     PostGeneralJournalLine.SetRange("Document No.", DtldCustLedgEntries."Document No.");
                //     if PostGeneralJournalLine.FindSet() then begin
                //         DocumentDate := PostGeneralJournalLine."Document Date";
                //     end;
                // end;

                CustLedgerEntry1.Reset();
                CustLedgerEntry1.SetRange("Document No.", DtldCustLedgEntries."Document No.");
                if CustLedgerEntry1.Find('-') then begin
                    DocumentDate := CustLedgerEntry1."Document Date";
                end;

            end;
        }
    }

    var
        PostSaleInvHeader: Record "Sales Invoice Header";
        PostSalesCreditHeader: Record "Sales Cr.Memo Header";
        PostGeneralJournalLine: Record "Posted Gen. Journal Line";
        CustLedgerEntry1: Record "Cust. Ledger Entry";
        DocumentDate: Date;
}
