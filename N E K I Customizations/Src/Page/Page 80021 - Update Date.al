page 80021 "Update Date"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = Card;
    Permissions = TableData 17 = rm,
                  TableData 271 = rm,
                  TableData 380 = rm,
                  TableData 5802 = rm;
    SourceTable = 271;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Entry No."; "Entry No")
                {
                    TableRelation = "Bank Account Ledger Entry"."Entry No.";
                    ApplicationArea = all;

                    trigger OnValidate()
                    begin
                        BankLedgerEntry.RESET;
                        BankLedgerEntry.SETRANGE("Entry No.", "Entry No");
                        IF BankLedgerEntry.FINDFIRST THEN BEGIN
                            "Document No" := BankLedgerEntry."Document No.";
                            PostingDateBefore := BankLedgerEntry."Posting Date";
                        END;
                    end;
                }
                field("Document No"; "Document No")
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field("Before Posting date"; PostingDateBefore)
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field("Change Posting Date"; "Posting Date")
                {
                    ApplicationArea = all;
                }
                field("Change PDC Date"; ChangePDCDate)
                {
                    Editable = false;
                    ApplicationArea = all;
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Change Date")
            {
                Image = Undo;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ApplicationArea = all;

                trigger OnAction()
                begin

                    BankLedgerEntry.RESET;
                    BankLedgerEntry.SETRANGE(BankLedgerEntry."Document No.", "Document No");
                    IF BankLedgerEntry.FINDFIRST THEN BEGIN
                        REPEAT
                            BankLedgerEntry."Posting Date" := "Posting Date";
                            BankLedgerEntry.MODIFY;
                        UNTIL BankLedgerEntry.NEXT = 0;
                    END;

                    GLEntry.RESET;
                    GLEntry.SETRANGE("Document No.", "Document No");
                    IF GLEntry.FINDFIRST THEN BEGIN
                        REPEAT
                            GLEntry."Posting Date" := "Posting Date";
                            GLEntry.MODIFY;
                        UNTIL GLEntry.NEXT = 0;
                    END;

                    ValueEntry.RESET;
                    ValueEntry.SETRANGE("Document No.", "Document No");
                    IF ValueEntry.FINDFIRST THEN BEGIN
                        REPEAT
                            ValueEntry."Posting Date" := "Posting Date";
                            ValueEntry.MODIFY;
                        UNTIL ValueEntry.NEXT = 0;
                    END;
                    VLE.RESET;
                    VLE.SETRANGE("Document No.", "Document No");
                    IF VLE.FINDFIRST THEN BEGIN
                        REPEAT
                            VLE."Posting Date" := "Posting Date";
                            MESSAGE(VLE."Document No.");
                        UNTIL VLE.NEXT = 0;
                        VLE.MODIFY;
                    END;

                    VendorDetailedLedgR.RESET;
                    VendorDetailedLedgR.SETRANGE("Document No.", "Document No");
                    IF VendorDetailedLedgR.FINDFIRST THEN BEGIN
                        REPEAT
                            VendorDetailedLedgR."Posting Date" := "Posting Date";
                            VendorDetailedLedgR.MODIFY;
                        UNTIL VendorDetailedLedgR.NEXT = 0;
                    END;

                    ///cust
                    CLE.RESET;
                    CLE.SETRANGE("Document No.", "Document No");
                    IF CLE.FINDFIRST THEN BEGIN
                        REPEAT
                            CLE."Posting Date" := "Posting Date";
                            CLE.MODIFY;
                        UNTIL CLE.NEXT = 0;
                    END;

                    CLE_DET.RESET;
                    CLE_DET.SETRANGE("Document No.", "Document No");
                    IF CLE_DET.FINDFIRST THEN BEGIN
                        REPEAT
                            CLE_DET."Posting Date" := "Posting Date";
                            CLE_DET.MODIFY;
                        UNTIL CLE_DET.NEXT = 0;
                    END;

                    IF "Document No" <> '' THEN
                        MESSAGE('Date has been Changed  %1 , for Document No. %2', "Posting Date", "Document No");
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        ChangePDCDate := TRUE;
    end;

    var
        "Document No": Code[20];
        BankLedgerEntry: Record 271;
        GLEntry: Record 17;
        ValueEntry: Record 5802;
        VendDetLedger: Record 380;
        ChangePDCDate: Boolean;
        "Entry No": Integer;
        "Posting Date": Date;
        VendorDetailedLedgR: Record 380;
        PostingDateBefore: Date;
        VLE: Record 25;
        CLE: Record 21;
        CLE_DET: Record 379;
}

