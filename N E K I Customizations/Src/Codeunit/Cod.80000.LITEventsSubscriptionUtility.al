codeunit 80000 "LITEvents Subscription Utility"
{
    EventSubscriberInstance = StaticAutomatic;
    Permissions = tabledata "Sales Shipment Line" = RIMD, tabledata "Sales Shipment Header" = RIMD;

    trigger OnRun()
    var

    begin

    end;

    //Transfer Fields from General Journal to Customer Ledger Entries.
    [EventSubscriber(ObjectType::Table, database::"Cust. Ledger Entry", 'OnAfterCopyCustLedgerEntryFromGenJnlLine', '', true, true)]
    local procedure OnAfterCopyCustLedgerEntryFromGenJnlLine_TransferFields(VAR CustLedgerEntry: Record "Cust. Ledger Entry"; GenJournalLine: Record "Gen. Journal Line");
    begin
        CustLedgerEntry."LIT Remarks" := GenJournalLine."LIT Remarks";
        CustLedgerEntry."LIT Check No." := GenJournalLine."LIT Check No.";
        CustLedgerEntry."LIT Check Date" := GenJournalLine."LIT Check Date";
    end;

    //Transfer Fields from General Journal to Vendor Ledger Entries.
    [EventSubscriber(ObjectType::Table, Database::"Vendor Ledger Entry", 'OnAfterCopyVendLedgerEntryFromGenJnlLine', '', true, true)]
    local procedure OnAfterCopyVendLedgerEntryFromGenJnlLine_TransferFields(VAR VendorLedgerEntry: Record "Vendor Ledger Entry"; GenJournalLine: Record "Gen. Journal Line");
    begin
        VendorLedgerEntry."LIT Remarks" := GenJournalLine."LIT Remarks";
        VendorLedgerEntry."LIT Check No." := GenJournalLine."LIT Check No.";
        VendorLedgerEntry."LIT Check Date" := GenJournalLine."LIT Check Date";
    end;

    //Transfer Fields from General Journal to GL Ledger Entries.
    [EventSubscriber(ObjectType::Table, database::"G/L Entry", 'OnAfterCopyGLEntryFromGenJnlLine', '', true, true)]
    local procedure OnAfterCopyGLEntryFromGenJnlLine_TransferFields(VAR GLEntry: Record "G/L Entry"; VAR GenJournalLine: Record "Gen. Journal Line");
    begin
        GLEntry."LIT Remarks" := GenJournalLine."LIT Remarks";
        GLEntry."LIT Check No." := GenJournalLine."LIT Check No.";
        GLEntry."LIT Check Date" := GenJournalLine."LIT Check Date";
        // GLEntry.Comment:= GenJournalLine.Comment;

    end;


    //Transfer Fields from General Journal to BankAccount Ledger Entries.
    [EventSubscriber(ObjectType::Table, Database::"Bank Account Ledger Entry", 'OnAfterCopyFromGenJnlLine', '', true, true)]
    local procedure OnAfterCopyFromGenJnlLine_TransferFields(VAR BankAccountLedgerEntry: Record "Bank Account Ledger Entry"; GenJournalLine: Record "Gen. Journal Line");
    begin
        BankAccountLedgerEntry."LIT Remarks" := GenJournalLine."LIT Remarks";
        BankAccountLedgerEntry."LIT Check No." := GenJournalLine."LIT Check No.";
        BankAccountLedgerEntry."LIT Check Date" := GenJournalLine."LIT Check Date";
    end;

    //Transfer Fields from General Journal to Employee Ledger Entries.
    [EventSubscriber(ObjectType::Table, Database::"Employee Ledger Entry", 'OnAfterCopyEmployeeLedgerEntryFromGenJnlLine', '', true, true)]
    local procedure OnAfterCopyEmployeeLedgerEntryFromGenJnlLine_TransferFields(VAR EmployeeLedgerEntry: Record "Employee Ledger Entry"; GenJournalLine: Record "Gen. Journal Line");
    begin
        EmployeeLedgerEntry."LIT Remarks" := GenJournalLine."LIT Remarks";
        EmployeeLedgerEntry."LIT Check No." := GenJournalLine."LIT Check No.";
        EmployeeLedgerEntry."LIT Check Date" := GenJournalLine."LIT Check Date";

    end;

    //Transfer Fields from Purchase Header to Vendor Ledger Entries.
    [EventSubscriber(ObjectType::Table, Database::"Gen. Journal Line", 'OnAfterCopyGenJnlLineFromPurchHeader', '', true, true)]
    local procedure OnAfterCopyGenJnlLineFromPurchHeader_TransferFields(PurchaseHeader: Record "Purchase Header"; VAR GenJournalLine: Record "Gen. Journal Line");
    begin
        GenJournalLine."LIT Remarks" := PurchaseHeader."LIT Remarks";
    end;


    //Transfer Fields from Sales Header to Vendor Ledger Entries.
    [EventSubscriber(ObjectType::Table, Database::"Gen. Journal Line", 'OnAfterCopyGenJnlLineFromSalesHeader', '', true, true)]
    local procedure OnAfterCopyGenJnlLineFromSalesHeader_TransferFields(SalesHeader: Record "Sales Header"; VAR GenJournalLine: Record "Gen. Journal Line");
    begin
        GenJournalLine."LIT Remarks" := SalesHeader."LIT Remarks";
    end;

    //Transfer Fields from Transfer Header to Transfer Shipment Header.
    [EventSubscriber(ObjectType::Table, Database::"Transfer Shipment Header", 'OnAfterCopyFromTransferHeader', '', true, true)]
    local procedure OnAfterCopyFromTransferHeader_TransferFields(VAR TransferShipmentHeader: Record "Transfer Shipment Header"; TransferHeader: Record "Transfer Header");
    begin
        TransferShipmentHeader."LIT Remarks" := TransferHeader."LIT Remarks";
    end;

    //Transfer Fields from Transfer Header to Transfer Receipt Header.
    [EventSubscriber(ObjectType::Table, Database::"Transfer Receipt Header", 'OnAfterCopyFromTransferHeader', '', true, true)]
    local procedure OnAfterCopyFromTransferHeader(VAR TransferReceiptHeader: Record "Transfer Receipt Header"; TransferHeader: Record "Transfer Header");
    begin
        TransferReceiptHeader."LIT Remarks" := TransferHeader."LIT Remarks";
    end;

    //Transfer Fields from Transfer Line to Transfer Shipment Line.
    [EventSubscriber(ObjectType::Table, Database::"Transfer Shipment Line", 'OnAfterCopyFromTransferLine', '', true, true)]
    local procedure OnAfterCopyFromTransferLine_TransferShipmentFields(VAR TransferShipmentLine: Record "Transfer Shipment Line"; TransferLine: Record "Transfer Line");
    begin
        TransferShipmentLine."LIT Gen. Bus. Posting Group" := TransferLine."LIT Gen. Bus. Posting Group";
    end;

    //Transfer Fields from Transfer Line to Transfer Receipt Line.
    [EventSubscriber(ObjectType::Table, Database::"Transfer Receipt Line", 'OnAfterCopyFromTransferLine', '', true, true)]
    local procedure OnAfterCopyFromTransferLine_TransferReceiptFields(VAR TransferReceiptLine: Record "Transfer Receipt Line"; TransferLine: Record "Transfer Line");
    begin
        TransferReceiptLine."LIT Gen. Bus. Posting Group" := TransferLine."LIT Gen. Bus. Posting Group";
    end;

    //Transfer Fields from Transfer Shipment Line to Item Journal Line.
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"TransferOrder-Post Shipment", 'OnAfterCreateItemJnlLine', '', true, true)]
    local procedure OnAfterCreateItemJnlLine_TransferFieldsFromTransferShipmentLines(VAR ItemJournalLine: Record "Item Journal Line"; TransferLine: Record "Transfer Line"; TransferShipmentHeader: Record "Transfer Shipment Header"; TransferShipmentLine: Record "Transfer Shipment Line");
    begin
        ItemJournalLine."Gen. Bus. Posting Group" := TransferShipmentLine."LIT Gen. Bus. Posting Group";
    end;

    //Transfer Fields from Transfer Receipt Line to Item Journal Line.
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"TransferOrder-Post Receipt", 'OnBeforePostItemJournalLine', '', true, true)]
    local procedure OnBeforePostItemJournalLine_TransferFieldsFromTransferReceiptLines(VAR ItemJournalLine: Record "Item Journal Line"; TransferLine: Record "Transfer Line"; TransferReceiptHeader: Record "Transfer Receipt Header"; TransferReceiptLine: Record "Transfer Receipt Line"; CommitIsSuppressed: Boolean);
    begin
        ItemJournalLine."Gen. Bus. Posting Group" := TransferReceiptLine."LIT Gen. Bus. Posting Group";
    end;

    //Transfer Fields from Item Journal Line to Item Ledger entries.
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line", 'OnAfterInitItemLedgEntry', '', true, true)]
    local procedure OnAfterInitItemLedgEntry_TransferFieldsFromIJLtoILE(VAR NewItemLedgEntry: Record "Item Ledger Entry"; ItemJournalLine: Record "Item Journal Line"; VAR ItemLedgEntryNo: Integer);
    begin
        NewItemLedgEntry."LIT Remarks" := ItemJournalLine."LIT Remarks";
    end;

    //Transfer Fields from Item Journal Line to Item Value entry.
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line", 'OnAfterInitValueEntry', '', true, true)]
    local procedure OnAfterInitValueEntry_TransferFieldsFromIJLtoIVE(VAR ValueEntry: Record "Value Entry"; ItemJournalLine: Record "Item Journal Line"; VAR ValueEntryNo: Integer);
    begin
        ValueEntry."LIT Remarks" := ItemJournalLine."LIT Remarks";
    end;

    //Transfer Fields from Job Card to Sales Header.
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Job Create-Invoice", 'OnCreateSalesHeaderOnBeforeUpdateSalesHeader', '', TRUE, TRUE)]
    local procedure OnCreateSalesHeaderOnBeforeUpdateSalesHeader_TransferFieldsFromJobtoSalesHeader(VAR SalesHeader: Record "Sales Header"; VAR Job: Record Job; VAR IsHandled: Boolean);
    begin
        SalesHeader."LIT Remarks" := Job."LIT Remarks";

    end;



    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Global Triggers", 'GetDatabaseTableTriggerSetup', '', false, false)]
    local procedure GetDatabaseTableTriggerSetup(TableId: Integer; var OnDatabaseInsert: Boolean; var OnDatabaseModify: Boolean; var OnDatabaseDelete: Boolean; var OnDatabaseRename: Boolean)
    begin
        // OnDatabaseInsert := true;
        // OnDatabaseModify := true;
        // OnDatabaseDelete := true;
        // OnDatabaseRename := true;
    end;

    // //Allow Purchase Order Receive and Invoice Posting.
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post (Yes/No)", 'OnBeforeConfirmPost', '', true, true)]
    local procedure OnBeforeConfirmPost_AllowPurchasePosting(VAR PurchaseHeader: Record "Purchase Header"; VAR HideDialog: Boolean; VAR IsHandled: Boolean; VAR DefaultOption: Integer);
    var
        UserSetup: Record "User Setup";
    begin
        PurchaseHeader.tESTFIELD(PurchaseHeader."Purchase Type");// WAJ 
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post + Print", 'OnBeforeConfirmPost', '', true, true)]
    local procedure OnBeforeConfirmPost_AllowPurchasePostandPrint(VAR PurchaseHeader: Record "Purchase Header"; VAR HideDialog: Boolean; VAR IsHandled: Boolean; VAR DefaultOption: Integer);
    var
        UserSetup: Record "User Setup";
    begin
        PurchaseHeader.tESTFIELD(PurchaseHeader."Purchase Type");// WAJ 
    end;

    //Allow Sales Order Ship and Invoice Posting.
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post (Yes/No)", 'OnBeforeConfirmSalesPost', '', true, true)]
    local procedure OnBeforeConfirmSalesPost_AllowSalesPosting(VAR SalesHeader: Record "Sales Header"; VAR HideDialog: Boolean; VAR IsHandled: Boolean; VAR DefaultOption: Integer; VAR PostAndSend: Boolean);
    var
        UserSetup: Record "User Setup";
    begin
        if SalesHeader."Document Type" <> SalesHeader."Document Type"::"Credit Memo" then begin
            SalesHeader.tESTFIELD(SalesHeader."sales Type");// WAJ 
            SalesHeader.TESTFIELD(SalesHeader."Your Reference");
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post and Send", 'OnBeforePostAndSend', '', true, true)]
    local procedure OnBeforePostAndSend_AllowSalesPostandSend(VAR SalesHeader: Record "Sales Header"; VAR HideDialog: Boolean);
    var
        UserSetup: Record "User Setup";
    begin
        SalesHeader.tESTFIELD(SalesHeader."sales Type");
        SalesHeader.TESTFIELD(SalesHeader."Your Reference");// WAJ 
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post + Print", 'OnBeforeConfirmPost', '', true, true)]
    local procedure OnBeforeConfirmPost_AllowSalesPostandPrint(VAR SalesHeader: Record "Sales Header"; VAR HideDialog: Boolean; VAR IsHandled: Boolean; VAR SendReportAsEmail: Boolean; VAR DefaultOption: Integer);
    var
        UserSetup: Record "User Setup";
    begin

    end;
    //Allow Item Journal Posting.
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post", 'OnBeforeCode', '', true, true)]
    local procedure OnBeforeCode_AllowItemJournalPost(VAR ItemJournalLine: Record "Item Journal Line"; VAR HideDialog: Boolean);
    var
        UserSetup: Record "User Setup";
    begin

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post+Print", 'OnBeforePostJournalBatch', '', true, true)]
    local procedure OnBeforePostJournalBatch_AllowItemJournalPostandPrint(VAR ItemJournalLine: Record "Item Journal Line"; VAR HideDialog: Boolean);
    var
        UserSetup: Record "User Setup";
    begin

    end;
    /*
        //Allow Job Journal Posting.
        [EventSubscriber(ObjectType::Codeunit, Codeunit::"Job Jnl.-Post", 'OnBeforeCode', '', true, true)]
        local procedure OnBeforeCode_AllowJobJournalPost(VAR JobJournalLine : Record "Job Journal Line";VAR HideDialog : Boolean);
        var
            UserSetup: Record "User Setup";
        begin
            //MAQ IAX Added 08-12-2020 START.
            IF UserSetup.GET(USERID) THEN
                IF UserSetup."Allow Item Journal Post" = false THEN BEGIN
                    ERROR('You do not have permission to post this journal. Please contact your system administrator...');
                END;
            //MAQ IAX Added 08-12-2020 END.
        end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Job Jnl.-Post+print", 'OnBeforePostJournalBatch', '', true, true)]
    local procedure OnBeforePostJournalBatch_AllowJobJournalPost(VAR JobJournalLine: Record "Job Journal Line"; VAR HideDialog: Boolean);
    var
        UserSetup: Record "User Setup";
    begin
        //MAQ IAX Added 08-12-2020 START.
        IF UserSetup.GET(USERID) THEN
            IF UserSetup."Allow Job Journal Post" = false THEN BEGIN
                ERROR('You do not have permission to post this journal. Please contact your system administrator...');
            END;
        //MAQ IAX Added 08-12-2020 END.
    end;
*/
    //Copy fields from item master to purchase line.
    [EventSubscriber(ObjectType::Table, Database::"Purchase Line", 'OnAfterAssignItemValues', '', true, true)]
    local procedure OnAfterAssignItemValues(VAR PurchLine: Record "Purchase Line"; Item: Record Item);
    begin
        PurchLine."LIT Description 3" := Item."LIT Description 3";
    end;

    //Copy fields from Fixed Asset master to purchase line.
    [EventSubscriber(ObjectType::Table, Database::"Purchase Line", 'OnAfterAssignFixedAssetValues', '', true, true)]
    local procedure OnAfterAssignFixedAssetValues(VAR PurchLine: Record "Purchase Line"; FixedAsset: Record "Fixed Asset");
    begin
        //PurchLine."LIT Description 3" := FixedAsset."LIT Description 3"; WAJ
    end;

    //Copy fields from GL Account to purchase line.
    [EventSubscriber(ObjectType::Table, Database::"Purchase Line", 'OnAfterAssignGLAccountValues', '', true, true)]
    local procedure OnAfterAssignGLAccountValues(VAR PurchLine: Record "Purchase Line"; GLAccount: Record "G/L Account");
    begin
        PurchLine."LIT Description 3" := GLAccount.Name;
    end;

    [EventSubscriber(ObjectType::Table, Database::Job, 'OnAfterDeleteEvent', '', true, true)]
    local procedure EventOnAfterDeleteOfJobRecord(var Rec: Record Job; RunTrigger: Boolean)
    var
        SalesHeader: Record "Sales Header";
    begin
        SalesHeader.SetRange(SalesHeader."Document Type", SalesHeader."Document Type"::Quote);
        SalesHeader.SetRange("LIT Job No.", Rec."No.");
        if SalesHeader.FindFirst() then begin
            SalesHeader."LIT Job No." := '';
            SalesHeader.Modify();
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Header", 'OnBeforeModifyEvent', '', true, true)]
    local procedure EventOnBeforeModifyOfSalesHeaderRecord(var Rec: Record "Sales Header"; var xRec: Record "Sales Header"; RunTrigger: Boolean)
    var
        Job: Record Job;
    begin
        // if (Rec."Document Type" = Rec."Document Type"::Quote) and (Rec."Job No." <> '') and (xRec."Job No." <> '') and (RunTrigger) then
        //     if Job.Get(Rec."Job No.") then
        //         Error('Sales Quote cannot be modified as a Job against this dcoument is already created. Either delete the existing Job or create a new Sales Quote.');
    end;

    //Allowing Access to update the unit price record  created by FA 
    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnBeforeTestStatusOpen', '', true, true)]
    local procedure OnBeforeTestStatusOpen(var SalesLine: Record "Sales Line"; var SalesHeader: Record "Sales Header"; var IsHandled: Boolean; xSalesLine: Record "Sales Line"; CallingFieldNo: Integer; var StatusCheckSuspended: Boolean)
    var
        Number: Integer;
    begin
        Number := SalesLine.FIELDNO(SalesLine."Unit Price");
        if SalesLine."Document Type" = SalesLine."Document Type"::Quote then
            if Number = CallingFieldNo then
                IsHandled := true;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::DimensionManagement, 'OnAfterDefaultDimObjectNoWithoutGlobalDimsList', '', false, false)]
    local procedure OnAfterDefaultDimObjectNoWithoutGlobalDimsList(var TempAllObjWithCaption: Record AllObjWithCaption temporary)
    var
        DimensionManagement: Codeunit DimensionManagement;
    begin
        DimensionManagement.DefaultDimInsertTempObject(TempAllObjWithCaption, Database::"Item Category");
        DimensionManagement.DefaultDimInsertTempObject(TempAllObjWithCaption, Database::"LIT Item Brand");
        DimensionManagement.DefaultDimInsertTempObject(TempAllObjWithCaption, Database::"LIT Customer Group");
        DimensionManagement.DefaultDimInsertTempObject(TempAllObjWithCaption, Database::"LIT Item Group");
        DimensionManagement.DefaultDimInsertTempObject(TempAllObjWithCaption, Database::"LIT Storage Condition");
        DimensionManagement.DefaultDimInsertTempObject(TempAllObjWithCaption, Database::"LIT Vendor Group");
    end;

    [EventSubscriber(ObjectType::Table, Database::"Purchase Header", 'OnInitRecordOnAfterAssignDates', '', false, false)]
    local procedure OnInitRecordOnAfterAssignDates(var PurchaseHeader: Record "Purchase Header")
    begin
        PurchaseHeader."Decalration Date" := workdate();
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post (Yes/No)", 'OnBeforeConfirmPost', '', false, false)]
    local procedure OnBeforeConfirmPost(var SalesHeader: Record "Sales Header")
    var
        SalesInvHead: Record "Sales Invoice Header";
        SalesInvHead1: Record "Sales Invoice Header";
        SalesHead: Record "Sales Header";
    begin
        //MAQ IAX Added 26-10-2020.
        SalesInvHead.RESET;
        SalesInvHead.SETRANGE("External Document No.", SalesHeader."External Document No.");
        // SalesInvHead.SETRANGE("Sell-to Customer No.", SalesHeader."Sell-to Customer No.");
        IF SalesInvHead.Find('-') THEN begin
            // Error('%1 LPO No. with Customer No. %2 already posted', SalesInvHead."External Document No.", SalesInvHead."Sell-to Customer No.");
            // EXIT;
            IF NOT CONFIRM('%1 LPO No. is already exist!, Do want to continue?', FALSE, SalesInvHead."External Document No.") THEN
                ERROR('')
            ELSE
                EXIT;

        end;


    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterInsertShipmentLine', '', true, true)]
    local procedure OnAfterInsertShipmentLine(PreviewMode: Boolean; var SalesHeader: Record "Sales Header"; var SalesLine: Record "Sales Line"; var SalesShptLine: Record "Sales Shipment Line"; xSalesLine: Record "Sales Line")
    var
        SalesLineGet: Record "Sales Line";
        VATAmount: Decimal;
        LineDiscountPercent: Decimal;
        LineDiscountAmount: Decimal;
    begin
        // comment code b/c in case of partial shipment Amount & Amount Incl code is not getting
        // IF PreviewMode = false THEN begin
        //     SalesShptLine."LIT Order Amount" := Abs(SalesLine.Amount);
        //     SalesShptLine."LIT Order Amount Incl. VAT" := Abs(SalesLine."Amount Including VAT");
        //     SalesShptLine.Modify(true);
        // end;
        // comment code b/c in case of partial shipment Amount & Amount Incl code is not getting

        IF PreviewMode = false THEN begin

            SalesLineGet.Reset();
            SalesLineGet.SetRange(SalesLineGet."Document Type", SalesLine."Document Type");
            SalesLineGet.SetRange(SalesLineGet."Document No.", SalesLine."Document No.");
            SalesLineGet.SetRange(SalesLineGet."Line No.", SalesLine."Line No.");
            if SalesLineGet.FindSet() then begin

                if SalesShptLine.Quantity > 0 then begin
                    // SalesShptLine."LIT Order Amount" := Abs(SalesLineGet.Amount);
                    // SalesShptLine."LIT Order Amount Incl. VAT" := Abs(SalesLineGet."Amount Including VAT");
                    // SalesShptLine.Modify(true);

                    if SalesHeader."Prices Including VAT" = true then begin

                        Clear(LineDiscountPercent);
                        Clear(LineDiscountAmount);
                        if SalesLineGet."Line Discount Amount" > 0 then begin
                            LineDiscountAmount := Round((Abs(SalesLineGet."Unit Price" / SalesLineGet."Line Discount %")), 0.01, '>');
                            // LineDiscountAmount := Abs(SalesLineGet."Unit Price" / SalesLineGet."Line Discount %");
                        end;

                        Clear(VATAmount);
                        // VATAmount := Round((Abs(SalesLineGet."Unit Price" - LineDiscountAmount) * (SalesLineGet."VAT %" / 100)), 0.01, '>');
                        VATAmount := Abs(SalesLineGet."Unit Price" - LineDiscountAmount) * (SalesLineGet."VAT %" / 100);


                        SalesShptLine."LIT Order Unit Price" := SalesLineGet."Unit Price";
                        SalesShptLine."LIT Order Amount" := Abs(SalesShptLine.Quantity) * (Abs(SalesLineGet."Unit Price" - LineDiscountAmount) - Abs(VATAmount));//Abs(SalesLineGet.Amount);
                        SalesShptLine."LIT Order Amount Incl. VAT" := Abs(SalesShptLine.Quantity) * Abs(SalesLineGet."Unit Price" - LineDiscountAmount);//Abs(SalesLineGet."Amount Including VAT");
                        SalesShptLine.Modify(true);
                    end
                    else begin

                        Clear(LineDiscountPercent);
                        Clear(LineDiscountAmount);
                        if SalesLineGet."Line Discount Amount" > 0 then begin
                            LineDiscountAmount := Round((Abs(SalesLineGet."Unit Price" / SalesLineGet."Line Discount %")), 0.01, '>');
                            // LineDiscountAmount := Abs(SalesLineGet."Unit Price" / SalesLineGet."Line Discount %");
                        end;

                        Clear(VATAmount);
                        // VATAmount := Round((Abs(SalesLineGet."Unit Price" - LineDiscountAmount) * (SalesLineGet."VAT %" / 100)), 0.01, '>');
                        VATAmount := Abs(SalesLineGet."Unit Price" - LineDiscountAmount) * (SalesLineGet."VAT %" / 100);

                        SalesShptLine."LIT Order Unit Price" := SalesLineGet."Unit Price";
                        SalesShptLine."LIT Order Amount" := Abs(SalesShptLine.Quantity) * Abs(SalesLineGet."Unit Price" - LineDiscountAmount);//Abs(SalesLineGet.Amount);
                        SalesShptLine."LIT Order Amount Incl. VAT" := Abs(SalesShptLine.Quantity) * (Abs(SalesLineGet."Unit Price" - LineDiscountAmount) + Abs(VATAmount));//Abs(SalesLineGet."Amount Including VAT");
                        SalesShptLine.Modify(true);
                    end;

                end;
            end;

        end;


    end;




    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnInsertShipmentLineOnAfterInitQuantityFields', '', true, true)]
    // local procedure OnAfterInsertShipmentLine1(var SalesLine: Record "Sales Line"; var SalesShptLine: Record "Sales Shipment Line"; var xSalesLine: Record "Sales Line")
    // var
    //     ff: Decimal;
    // begin
    //     //IF PreviewMode = false THEN begin
    //     ff := xSalesLine.Amount;

    //     SalesShptLine."LIT Order Amount" := Abs(SalesLine.Amount);
    //     SalesShptLine."LIT Order Amount Incl. VAT" := Abs(SalesLine."Amount Including VAT");
    //     // SalesShptLine.Modify(true);

    //     // end;


    // end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterInsertShipmentHeader', '', true, true)]
    local procedure MyProcedure(var SalesHeader: Record "Sales Header"; var SalesShipmentHeader: Record "Sales Shipment Header")
    begin
        SalesShipmentHeader."LIT Order Discount Value" := SalesHeader."Invoice Discount Value";
        SalesShipmentHeader.Modify(true);
    end;
}