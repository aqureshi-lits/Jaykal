// page 80015 "PDC Journal"
// {
//     // version NAVW111.00 MAQ IAX

//     AutoSplitKey = true;
//     Caption = 'PDC Journal';
//     // DataCaptionExpression = Rec.DataCaption;
//     DelayedInsert = true;
//     PageType = Worksheet;
//     PromotedActionCategories = 'New,Process,Report,Bank,Application,Payroll,Approve,Page';
//     SaveValues = true;
//     SourceTable = "Gen. Journal Line";

//     layout
//     {
//         area(content)
//         {
//             field(CurrentJnlBatchName; Rec."Journal Batch Name")
//             {
//                 ApplicationArea = Basic, Suite;
//                 Caption = 'Batch Name';
//                 Lookup = true;
//                 ToolTip = 'Specifies the name of the journal batch.';

//                 trigger OnLookup(var Text: Text): Boolean
//                 begin
//                     CurrPage.SAVERECORD;
//                     //GenJnlManagement.LookupName(Rec."Journal Batch Name", Rec);
//                     CurrPage.UPDATE(FALSE);
//                 end;

//                 trigger OnValidate()
//                 begin
//                     // GenJnlManagement.CheckName(CurrentJnlBatchName, Rec);
//                     // CurrentJnlBatchNameOnAfterVali;
//                 end;
//             }
//             repeater(Control12)
//             {
//                 field("Posting Date"; Rec."Posting Date")
//                 {
//                     ApplicationArea = Basic, Suite;
//                     //StyleExpr = StyleTxt;
//                     ToolTip = 'Specifies the entry''s posting date.';
//                 }
//                 field("Document Date"; Rec."Document Date")
//                 {
//                     ApplicationArea = Basic, Suite;
//                     //StyleExpr = StyleTxt;
//                     ToolTip = 'Specifies the date on the document that provides the basis for the entry on the journal line.';
//                     Visible = false;
//                 }
//                 field("Document Type"; Rec."Document Type")
//                 {
//                     ApplicationArea = Basic, Suite;
//                     //StyleExpr = StyleTxt;
//                     ToolTip = 'Specifies the type of document that the entry on the journal line is.';
//                 }
//                 field("Document No."; Rec."Document No.")
//                 {
//                     ApplicationArea = Basic, Suite;
//                     ToolTip = 'Specifies a document number for the journal line.';
//                 }
//                 field("Incoming Document Entry No."; Rec."Incoming Document Entry No.")
//                 {
//                     ApplicationArea = Basic, Suite;
//                     ToolTip = 'Specifies the number of the incoming document that this general journal line is created for.';
//                     Visible = false;

//                     trigger OnAssistEdit()
//                     begin
//                         IF Rec."Incoming Document Entry No." > 0 THEN
//                             HYPERLINK(Rec.GetIncomingDocumentURL);
//                     end;
//                 }
//                 field("External Document No."; Rec."External Document No.")
//                 {
//                     ApplicationArea = Basic, Suite;
//                     ToolTip = 'Specifies a document number that refers to the customer''s or vendor''s numbering system.';
//                 }
//                 field("Applies-to Ext. Doc. No."; Rec."Applies-to Ext. Doc. No.")
//                 {
//                     ApplicationArea = Advanced;
//                     ToolTip = 'Specifies the external document number that will be exported in the payment file.';
//                     Visible = false;
//                 }
//                 field("Account Type"; Rec."Account Type")
//                 {
//                     ApplicationArea = Basic, Suite;
//                     //StyleExpr = StyleTxt;
//                     ToolTip = 'Specifies the type of account that the entry on the journal line will be posted to.';

//                     trigger OnValidate()
//                     begin
//                         GenJnlManagement.GetAccounts(Rec, AccName, BalAccName);
//                         SetUserInteractions;
//                         EnableApplyEntriesAction;
//                         CurrPage.UPDATE;
//                     end;
//                 }
//                 field("Account No."; Rec."Account No.")
//                 {
//                     ApplicationArea = Basic, Suite;
//                     StyleExpr = StyleTxt;
//                     ToolTip = 'Specifies the account number that the entry on the journal line will be posted to.';

//                     trigger OnValidate()
//                     begin
//                         GenJnlManagement.GetAccounts(Rec, AccName, BalAccName);
//                         ShowShortcutDimCode(ShortcutDimCode);
//                         SetUserInteractions;
//                         CurrPage.UPDATE;
//                     end;
//                 }
//                 field(Description; Rec.Description)
//                 {
//                     ApplicationArea = Basic, Suite;
//                     StyleExpr = StyleTxt;
//                     ToolTip = 'Specifies a description of the entry.';
//                 }
//                 field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
//                 {
//                     ToolTip = 'Specifies the code for Shortcut Dimension 1, which is one of two global dimension codes that you set up in the General Ledger Setup window.';
//                     Visible = false;
//                 }
//                 field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
//                 {
//                     ToolTip = 'Specifies the code for Shortcut Dimension 2, which is one of two global dimension codes that you set up in the General Ledger Setup window.';
//                     Visible = false;
//                 }
//                 field("Debit Amount"; Rec."Debit Amount")
//                 {
//                     ToolTip = 'Specifies the total amount (including VAT) that the journal line consists of, if it is a debit amount.';
//                 }
//                 field("Credit Amount"; Rec."Credit Amount")
//                 {
//                     ToolTip = 'Specifies the total amount (including VAT) that the journal line consists of, if it is a credit amount.';
//                 }
//                 field(Amount; Rec.Amount)
//                 {
//                     StyleExpr = StyleTxt;
//                     ToolTip = 'Specifies the total amount (including VAT) that the journal line consists of.';
//                 }
//                 field("Check No."; Rec."Check No.")
//                 {
//                 }
//                 field("Check Date"; Rec."Check Date")
//                 {
//                 }
//                 field(Remarks; Rec.Remarks)
//                 {
//                 }
//                 field("Payer Information"; Rec."Payer Information")
//                 {
//                     ApplicationArea = Advanced;
//                     StyleExpr = StyleTxt;
//                     ToolTip = 'Specifies payer information that is imported with the bank statement file.';
//                     Visible = false;
//                 }
//                 field("Transaction Information"; Rec."Transaction Information")
//                 {
//                     ApplicationArea = Advanced;
//                     StyleExpr = StyleTxt;
//                     ToolTip = 'Specifies transaction information that is imported with the bank statement file.';
//                     Visible = false;
//                 }
//                 field("Business Unit Code"; Rec."Business Unit Code")
//                 {
//                     ApplicationArea = Advanced;
//                     ToolTip = 'Specifies the code of the business unit that the entry derives from in a consolidated company.';
//                     Visible = false;
//                 }
//                 field("Salespers./Purch. Code"; Rec."Salespers./Purch. Code")
//                 {
//                     ApplicationArea = Suite;
//                     ToolTip = 'Specifies the salesperson or purchaser who is linked to the journal line.';
//                     Visible = false;
//                 }
//                 field("Campaign No."; Rec."Campaign No.")
//                 {
//                     ApplicationArea = RelationshipMgmt;
//                     ToolTip = 'Specifies the number of the campaign the journal line is linked to.';
//                     Visible = false;
//                 }
//                 field("Currency Code"; Rec."Currency Code")
//                 {
//                     AssistEdit = true;
//                     ToolTip = 'Specifies the code of the currency for the amounts on the journal line.';

//                     trigger OnAssistEdit()
//                     begin
//                         ChangeExchangeRate.SetParameter(Rec."Currency Code", Rec."Currency Factor", Rec."Posting Date");
//                         IF ChangeExchangeRate.RUNMODAL = ACTION::OK THEN
//                             VALIDATE(Rec."Currency Factor", ChangeExchangeRate.GetParameter);

//                         CLEAR(ChangeExchangeRate);
//                     end;
//                 }
//                 field("EU 3-Party Trade"; Rec."EU 3-Party Trade")
//                 {
//                     ApplicationArea = Basic, Suite;
//                     ToolTip = 'Specifies whether the entry was part of a 3-party trade. If it was, there is a check mark in the field.';
//                     Visible = false;
//                 }
//                 field("Gen. Posting Type"; Rec."Gen. Posting Type")
//                 {
//                     ApplicationArea = Basic, Suite;
//                     ToolTip = 'Specifies the general posting type that will be used when you post the entry on this journal line.';
//                 }
//                 field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
//                 {
//                     ApplicationArea = Basic, Suite;
//                     ToolTip = 'Specifies the vendor''s or customer''s trade type to link transactions made for this business partner with the appropriate general ledger account according to the general posting setup.';
//                     Visible = false;
//                 }
//                 field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
//                 {
//                     ApplicationArea = Basic, Suite;
//                     ToolTip = 'Specifies the item''s product type to link transactions made for this item with the appropriate general ledger account according to the general posting setup.';
//                     Visible = false;
//                 }
//                 field("VAT Bus. Posting Group"; Rec."VAT Bus. Posting Group")
//                 {
//                     ApplicationArea = Basic, Suite;
//                     ToolTip = 'Specifies the VAT business posting group code that will be used when you post the entry on the journal line.';
//                     Visible = false;
//                 }
//                 field("VAT Prod. Posting Group"; Rec."VAT Prod. Posting Group")
//                 {
//                     ApplicationArea = Basic, Suite;
//                     ToolTip = 'Specifies the VAT product posting group. Links business transactions made for the item, resource, or G/L account with the general ledger, to account for VAT amounts resulting from trade with that record.';
//                     Visible = false;
//                 }
//                 field(Quantity; Rec.Quantity)
//                 {
//                     ApplicationArea = Basic, Suite;
//                     ToolTip = 'Specifies the quantity of items to be included on the journal line.';
//                     Visible = false;
//                 }
//                 field("Amount (LCY)"; Rec."Amount (LCY)")
//                 {
//                     ApplicationArea = Basic, Suite;
//                     ToolTip = 'Specifies the total amount in local currency (including VAT) that the journal line consists of.';
//                     Visible = AmountVisible;
//                 }
//                 field("VAT Amount"; Rec."VAT Amount")
//                 {
//                     ApplicationArea = Basic, Suite;
//                     ToolTip = 'Specifies the amount of VAT included in the total amount.';
//                     Visible = false;
//                 }
//                 field("VAT Difference"; Rec."VAT Difference")
//                 {
//                     ApplicationArea = Basic, Suite;
//                     ToolTip = 'Specifies the difference between the calculate VAT amount and the VAT amount that you have entered manually.';
//                     Visible = false;
//                 }
//                 field("Bal. Account Type"; Rec."Bal. Account Type")
//                 {
//                     ApplicationArea = Basic, Suite;
//                     StyleExpr = StyleTxt;
//                     ToolTip = 'Specifies the code for the balancing account type that should be used in this journal line.';

//                     trigger OnValidate()
//                     begin

//                     end;
//                 }
//                 field("Bal. Account No."; Rec."Bal. Account No.")
//                 {
//                     ApplicationArea = Basic, Suite;
//                     StyleExpr = StyleTxt;
//                     ToolTip = 'Specifies the number of the general ledger, customer, vendor, or bank account to which a balancing entry for the journal line will posted (for example, a cash account for cash purchases).';

//                     trigger OnValidate()
//                     begin
//                         GenJnlManagement.GetAccounts(Rec, AccName, BalAccName);
//                         ShowShortcutDimCode(ShortcutDimCode);
//                     end;
//                 }
//                 field("Bal. Gen. Posting Type"; REC."Bal. Gen. Posting Type")
//                 {
//                     ApplicationArea = Basic, Suite;
//                     ToolTip = 'Specifies the general posting type associated with the balancing account that will be used when you post the entry on the journal line.';
//                     Visible = false;
//                 }
//                 field("Bal. Gen. Bus. Posting Group"; REC."Bal. Gen. Bus. Posting Group")
//                 {
//                     ApplicationArea = Basic, Suite;
//                     ToolTip = 'Specifies the general business posting group code associated with the balancing account that will be used when you post the entry.';
//                     Visible = false;
//                 }
//                 field("Bal. Gen. Prod. Posting Group"; REC."Bal. Gen. Prod. Posting Group")
//                 {
//                     ApplicationArea = Basic, Suite;
//                     ToolTip = 'Specifies the general product posting group code associated with the balancing account that will be used when you post the entry.';
//                     Visible = false;
//                 }
//                 field("Deferral Code"; REC."Deferral Code")
//                 {
//                     ApplicationArea = Suite;
//                     ToolTip = 'Specifies the deferral template that governs how expenses or revenue are deferred to the different accounting periods when the expenses or revenue were incurred.';
//                     Visible = false;
//                 }
//                 field("Bal. VAT Bus. Posting Group"; REC."Bal. VAT Bus. Posting Group")
//                 {
//                     ApplicationArea = Basic, Suite;
//                     ToolTip = 'Specifies the code of the VAT business posting group that will be used when you post the entry on the journal line.';
//                     Visible = false;
//                 }
//                 field("Bal. VAT Prod. Posting Group"; REC."Bal. VAT Prod. Posting Group")
//                 {
//                     ApplicationArea = Basic, Suite;
//                     ToolTip = 'Specifies the code of the VAT product posting group that will be used when you post the entry on the journal line.';
//                     Visible = false;
//                 }
//                 field("Bill-to/Pay-to No."; REC."Bill-to/Pay-to No.")
//                 {
//                     ApplicationArea = Basic, Suite;
//                     ToolTip = 'Specifies the number of the bill-to customer or pay-to vendor that the entry is linked to.';
//                     Visible = false;
//                 }
//                 field("Ship-to/Order Address Code"; REC."Ship-to/Order Address Code")
//                 {
//                     ApplicationArea = Advanced;
//                     ToolTip = 'Specifies the address code of the ship-to customer or order-from vendor that the entry is linked to.';
//                     Visible = false;
//                 }
//                 // field("ShortcutDimCode3"; REC.ShortcutDimCode3)
//                 // {
//                 //     ApplicationArea = Suite;
//                 //     CaptionClass = '1,2,3';
//                 //     TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3),
//                 //                                                   "Dimension Value Type" = CONST(Standard),
//                 //                                                   Blocked = CONST(true));
//                 //     Visible = false;

//                 //     trigger OnValidate()
//                 //     begin
//                 //         Rec.ValidateShortcutDimCode(3, ShortcutDimCode3);
//                 //     end;
//                 // }
//                 // field(ShortcutDimCode[4];ShortcutDimCode[4])
//                 // {
//                 //     ApplicationArea = Suite;
//                 //     CaptionClass = '1,2,4';
//                 //     TableRelation = "Dimension Value".Code WHERE (Global Dimension No.=CONST(4),
//                 //                                                   Dimension Value Type=CONST(Standard),
//                 //                                                   Blocked=CONST(No));
//                 //     Visible = false;

//                 //     trigger OnValidate()
//                 //     begin
//                 //         ValidateShortcutDimCode(4,ShortcutDimCode[4]);
//                 //     end;
//                 // }
//                 // field(ShortcutDimCode[5];ShortcutDimCode[5])
//                 // {
//                 //     ApplicationArea = Suite;
//                 //     CaptionClass = '1,2,5';
//                 //     TableRelation = "Dimension Value".Code WHERE (Global Dimension No.=CONST(5),
//                 //                                                   Dimension Value Type=CONST(Standard),
//                 //                                                   Blocked=CONST(No));
//                 //     Visible = false;

//                 //     trigger OnValidate()
//                 //     begin
//                 //         ValidateShortcutDimCode(5,ShortcutDimCode[5]);
//                 //     end;
//                 // }
//                 // field(ShortcutDimCode[6];ShortcutDimCode[6])
//                 // {
//                 //     ApplicationArea = Suite;
//                 //     CaptionClass = '1,2,6';
//                 //     TableRelation = "Dimension Value".Code WHERE (Global Dimension No.=CONST(6),
//                 //                                                   Dimension Value Type=CONST(Standard),
//                 //                                                   Blocked=CONST(No));
//                 //     Visible = false;

//                 //     trigger OnValidate()
//                 //     begin
//                 //         ValidateShortcutDimCode(6,ShortcutDimCode[6]);
//                 //     end;
//                 // }
//                 // field(ShortcutDimCode[7];ShortcutDimCode[7])
//                 // {
//                 //     ApplicationArea = Suite;
//                 //     CaptionClass = '1,2,7';
//                 //     TableRelation = "Dimension Value".Code WHERE (Global Dimension No.=CONST(7),
//                 //                                                   Dimension Value Type=CONST(Standard),
//                 //                                                   Blocked=CONST(No));
//                 //     Visible = false;

//                 //     trigger OnValidate()
//                 //     begin
//                 //         ValidateShortcutDimCode(7,ShortcutDimCode[7]);
//                 //     end;
//                 // }
//                 // field(ShortcutDimCode[8];ShortcutDimCode[8])
//                 // {
//                 //     ApplicationArea = Suite;
//                 //     CaptionClass = '1,2,8';
//                 //     TableRelation = "Dimension Value".Code WHERE (Global Dimension No.=CONST(8),
//                 //                                                   Dimension Value Type=CONST(Standard),
//                 //                                                   Blocked=CONST(No));
//                 //     Visible = false;

//                 //     trigger OnValidate()
//                 //     begin
//                 //         ValidateShortcutDimCode(8,ShortcutDimCode[8]);
//                 //     end;
//                 // }
//                 field("Payment Terms Code"; REC."Payment Terms Code")
//                 {
//                     ApplicationArea = Basic, Suite;
//                     ToolTip = 'Specifies the code that represents the payments terms that apply to the entry on the journal line.';
//                     Visible = false;
//                 }
//                 field("Applied Automatically"; REC."Applied Automatically")
//                 {
//                     ApplicationArea = Advanced;
//                     Editable = false;
//                     ToolTip = 'Specifies that the general journal line has been automatically applied with a matching payment using the Apply Automatically function.';
//                     Visible = false;
//                 }
//                 field(Applied; REC.IsApplied)
//                 {
//                     ApplicationArea = Advanced;
//                     Caption = 'Applied';
//                     ToolTip = 'Specifies if the record on the line has been applied.';
//                     Visible = false;
//                 }
//                 field("Applies-to Doc. Type"; REC."Applies-to Doc. Type")
//                 {
//                     ApplicationArea = Basic, Suite;
//                     ToolTip = 'Specifies the type of the posted document that this document or journal line will be applied to when you post, for example to register payment.';
//                     Visible = false;
//                 }
//                 field("Applies-to Doc. No."; REC."Applies-to Doc. No.")
//                 {
//                     ApplicationArea = Basic, Suite;
//                     ToolTip = 'Specifies the number of the posted document that this document or journal line will be applied to when you post, for example to register payment.';
//                     Visible = false;
//                 }
//                 field("Applies-to ID"; REC."Applies-to ID")
//                 {
//                     ApplicationArea = Basic, Suite;
//                     ToolTip = 'Specifies the ID of entries that will be applied to when you choose the Apply Entries action.';
//                     Visible = false;
//                 }
//                 field("On Hold"; REC."On Hold")
//                 {
//                     ApplicationArea = Basic, Suite;
//                     ToolTip = 'Specifies if the journal line has been invoiced, and you execute the payment suggestions batch job, or you create a finance charge memo or reminder.';
//                     Visible = false;
//                 }
//                 field("Bank Payment Type"; REC."Bank Payment Type")
//                 {
//                     ApplicationArea = Advanced;
//                     ToolTip = 'Specifies the code for the payment type to be used for the entry on the payment journal line.';
//                     Visible = false;
//                 }
//                 field("Reason Code"; REC."Reason Code")
//                 {
//                     ApplicationArea = Basic, Suite;
//                     ToolTip = 'Specifies the reason code that has been entered on the journal lines.';
//                     Visible = false;
//                 }
//                 field(Correction; REC.Correction)
//                 {
//                     ApplicationArea = Basic, Suite;
//                     ToolTip = 'Specifies the entry as a corrective entry. You can use the field if you need to post a corrective entry to an account.';
//                     Visible = false;
//                 }
//                 field(Comment; REC.Comment)
//                 {
//                     ApplicationArea = Advanced;
//                     ToolTip = 'Specifies a comment related to registering a payment.';
//                     Visible = false;
//                 }
//                 field("Direct Debit Mandate ID"; REC."Direct Debit Mandate ID")
//                 {
//                     ApplicationArea = Advanced;
//                     ToolTip = 'Specifies the identification of the direct-debit mandate that is being used on the journal lines to process a direct debit collection.';
//                     Visible = false;
//                 }
//             }
//             group(Group)
//             {
//                 fixed(Control1)
//                 {
//                     group("Account Name")
//                     {
//                         Caption = 'Account Name';
//                         field(AccName; REC.AccName)
//                         {
//                             ApplicationArea = Basic, Suite;
//                             Editable = false;
//                             ShowCaption = false;
//                             ToolTip = 'Specifies the name of the account.';
//                         }
//                     }
//                     group("Bal. Account Name")
//                     {
//                         Caption = 'Bal. Account Name';
//                         field(BalAccName; REC.BalAccName)
//                         {
//                             ApplicationArea = Basic, Suite;
//                             Caption = 'Bal. Account Name';
//                             Editable = false;
//                             ToolTip = 'Specifies the name of the balancing account that has been entered on the journal line.';
//                         }
//                     }
//                     group(Balance)
//                     {
//                         Caption = 'Balance';
//                         field(Balance; REC.Balance + "Balance (LCY)" - xRec."Balance (LCY)")
//                         {
//                             ApplicationArea = All;
//                             AutoFormatType = 1;
//                             Caption = 'Balance';
//                             Editable = false;
//                             ToolTip = 'Specifies the balance that has accumulated in the general journal on the line where the cursor is.';
//                             Visible = BalanceVisible;
//                         }
//                     }
//                     group("Total Balance")
//                     {
//                         Caption = 'Total Balance';
//                         field(TotalBalance; TotalBalance + "Balance (LCY)" - xRec."Balance (LCY)")
//                         {
//                             ApplicationArea = All;
//                             AutoFormatType = 1;
//                             Caption = 'Total Balance';
//                             Editable = false;
//                             ToolTip = 'Specifies the total balance in the general journal.';
//                             Visible = TotalBalanceVisible;
//                         }
//                     }
//                 }
//             }
//         }
//         area(factboxes)
//         {
//             part("Dimension Set Entries FactBox"; "Dimension Set Entries FactBox")
//             {
//                 ApplicationArea = Basic, Suite;
//                 SubPageLink = "Dimension Set ID" = FIELD("Dimension Set ID");
//             }
//             part(IncomingDocAttachFactBox; 193)
//             {
//                 ApplicationArea = Basic, Suite;
//                 ShowFilter = false;
//             }
//             part(WorkflowStatusBatch; 1528)
//             {
//                 ApplicationArea = Suite;
//                 Caption = 'Batch Workflows';
//                 Editable = false;
//                 Enabled = false;
//                 ShowFilter = false;
//                 Visible = ShowWorkflowStatusOnBatch;
//             }
//             part(WorkflowStatusLine; 1528)
//             {
//                 ApplicationArea = Suite;
//                 Caption = 'Line Workflows';
//                 Editable = false;
//                 Enabled = false;
//                 ShowFilter = false;
//                 Visible = ShowWorkflowStatusOnLine;
//             }
//             systempart(Links; Links)
//             {
//                 Visible = false;
//             }
//             systempart(Notes; Notes)
//             {
//                 Visible = false;
//             }
//         }
//     }

//     actions
//     {
//         area(navigation)
//         {
//             group("&Line")
//             {
//                 Caption = '&Line';
//                 Image = Line;
//                 action(Dimensions)
//                 {
//                     AccessByPermission = TableData 348 = R;
//                     ApplicationArea = Suite;
//                     Caption = 'Dimensions';
//                     Image = Dimensions;
//                     Promoted = true;
//                     PromotedCategory = Process;
//                     ShortCutKey = 'Shift+Ctrl+D';
//                     ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.';

//                     trigger OnAction()
//                     begin
//                         rec.ShowDimensions;
//                         CurrPage.SAVERECORD;
//                     end;
//                 }
//             }
//             group("A&ccount")
//             {
//                 Caption = 'A&ccount';
//                 Image = ChartOfAccounts;
//                 action(Card)
//                 {
//                     ApplicationArea = Basic, Suite;
//                     Caption = 'Card';
//                     Image = EditLines;
//                     RunObject = Codeunit 15;
//                     ShortCutKey = 'Shift+F7';
//                     ToolTip = 'View or change detailed information about the record on the document or journal line.';
//                 }
//                 action("Ledger E&ntries")
//                 {
//                     ApplicationArea = Basic, Suite;
//                     Caption = 'Ledger E&ntries';
//                     Image = GLRegisters;
//                     Promoted = false;
//                     //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
//                     //PromotedCategory = Process;
//                     RunObject = Codeunit 14;
//                     ShortCutKey = 'Ctrl+F7';
//                     ToolTip = 'View the history of transactions that have been posted for the selected record.';
//                 }
//             }
//             action(Approvals)
//             {
//                 AccessByPermission = TableData 454 = R;
//                 ApplicationArea = Suite;
//                 Caption = 'Approvals';
//                 Image = Approvals;
//                 ToolTip = 'View a list of the records that are waiting to be approved. For example, you can see who requested the record to be approved, when it was sent, and when it is due to be approved.';

//                 trigger OnAction()
//                 var
//                     GenJournalLine: Record 81;
//                     ApprovalsMgmt: Codeunit 1535;
//                 begin
//                     GetCurrentlySelectedLines(GenJournalLine);
//                     ApprovalsMgmt.ShowJournalApprovalEntries(GenJournalLine);
//                 end;
//             }
//         }
//         area(processing)
//         {
//             group("F&unctions")
//             {
//                 Caption = 'F&unctions';
//                 Image = "Action";
//                 action("Renumber Document Numbers")
//                 {
//                     ApplicationArea = Basic, Suite;
//                     Caption = 'Renumber Document Numbers';
//                     Image = EditLines;
//                     ToolTip = 'Resort the numbers in the Document No. column to avoid posting errors because the document numbers are not in sequence. Entry applications and line groupings are preserved.';

//                     trigger OnAction()
//                     begin
//                         RenumberDocumentNo
//                     end;
//                 }
//                 action("Insert Conv. LCY Rndg. Lines")
//                 {
//                     ApplicationArea = Basic, Suite;
//                     Caption = 'Insert Conv. LCY Rndg. Lines';
//                     Image = InsertCurrency;
//                     RunObject = Codeunit 407;
//                     ToolTip = 'Insert a rounding correction line in the journal. This rounding correction line will balance in LCY when amounts in the foreign currency also balance. You can then post the journal.';
//                 }
//                 separator("-")
//                 {
//                     Caption = '-';
//                 }
//                 action(GetStandardJournals)
//                 {
//                     ApplicationArea = Suite;
//                     Caption = '&Get Standard Journals';
//                     Ellipsis = true;
//                     Image = GetStandardJournal;
//                     Promoted = true;
//                     PromotedCategory = Process;
//                     ToolTip = 'Select a standard general journal to be inserted.';

//                     trigger OnAction()
//                     var
//                         StdGenJnl: Record 750;
//                     begin
//                         StdGenJnl.FILTERGROUP := 2;
//                         StdGenJnl.SETRANGE("Journal Template Name", Rec."Journal Template Name");
//                         StdGenJnl.FILTERGROUP := 0;

//                         IF PAGE.RUNMODAL(PAGE::"Standard General Journals", StdGenJnl) = ACTION::LookupOK THEN BEGIN
//                             StdGenJnl.CreateGenJnlFromStdJnl(StdGenJnl, CurrentJnlBatchName);
//                             MESSAGE(Text000, StdGenJnl.Code);
//                         END;

//                         CurrPage.UPDATE(TRUE);
//                     end;
//                 }
//                 action(SaveAsStandardJournal)
//                 {
//                     ApplicationArea = Suite;
//                     Caption = '&Save as Standard Journal';
//                     Ellipsis = true;
//                     Image = SaveasStandardJournal;
//                     Promoted = true;
//                     PromotedCategory = Process;
//                     ToolTip = 'Define the journal lines that you want to use later as a standard journal before you post the journal.';

//                     trigger OnAction()
//                     var
//                         GenJnlBatch: Record 232;
//                         GeneralJnlLines: Record 81;
//                         StdGenJnl: Record 750;
//                         SaveAsStdGenJnl: Report 750;
//                     begin
//                         GeneralJnlLines.SETFILTER("Journal Template Name", REc."Journal Template Name");
//                         GeneralJnlLines.SETFILTER("Journal Batch Name", CurrentJnlBatchName);
//                         CurrPage.SETSELECTIONFILTER(GeneralJnlLines);
//                         GeneralJnlLines.COPYFILTERS(Rec);

//                         GenJnlBatch.GET(REc."Journal Template Name", CurrentJnlBatchName);
//                         SaveAsStdGenJnl.Initialise(GeneralJnlLines, GenJnlBatch);
//                         SaveAsStdGenJnl.RUNMODAL;
//                         IF NOT SaveAsStdGenJnl.GetStdGeneralJournal(StdGenJnl) THEN
//                             EXIT;

//                         MESSAGE(Text001, StdGenJnl.Code);
//                     end;
//                 }
//                 action("Test Report")
//                 {
//                     ApplicationArea = Basic, Suite;
//                     Caption = 'Test Report';
//                     Ellipsis = true;
//                     Image = TestReport;
//                     ToolTip = 'View a test report so that you can find and correct any errors before you perform the actual posting of the journal or document.';

//                     trigger OnAction()
//                     begin
//                         ReportPrint.PrintGenJnlLine(Rec);
//                     end;
//                 }
//                 action(Post)
//                 {
//                     ApplicationArea = Basic, Suite;
//                     Caption = 'P&ost';
//                     Image = PostOrder;
//                     Promoted = true;
//                     PromotedCategory = Process;
//                     PromotedIsBig = true;
//                     ShortCutKey = 'F9';
//                     ToolTip = 'Finalize the document or journal by posting the amounts and quantities to the related accounts in your company books.';

//                     trigger OnAction()
//                     begin
//                         REc.TESTFIELD(REc."Document Type");   //MAQ IAX Added 10-11-2018.
//                         REc.TESTFIELD(REc.Remarks);                 //MAQ IAX Added 10-11-2018.
//                         CODEUNIT.RUN(CODEUNIT::"Gen. Jnl.-Post", Rec);
//                         CurrentJnlBatchName := GETRANGEMAX(REc."Journal Batch Name");
//                         CurrPage.UPDATE(FALSE);
//                     end;
//                 }
//                 action(Preview)
//                 {
//                     ApplicationArea = Basic, Suite;
//                     Caption = 'Preview Posting';
//                     Image = ViewPostedOrder;
//                     Promoted = false;
//                     ToolTip = 'Review the different types of entries that will be created when you post the document or journal.';

//                     trigger OnAction()
//                     var
//                         GenJnlPost: Codeunit 231;
//                     begin
//                         REc.TESTFIELD(REc."Document Type");   //MAQ IAX Added 10-11-2018.
//                         REc.TESTFIELD(REc.Remarks);                 //MAQ IAX Added 10-11-2018.
//                         GenJnlPost.Preview(Rec);
//                     end;
//                 }
//                 action(PostAndPrint)
//                 {
//                     ApplicationArea = Basic, Suite;
//                     Caption = 'Post and &Print';
//                     Image = PostPrint;
//                     Promoted = true;
//                     PromotedCategory = Process;
//                     PromotedIsBig = true;
//                     ShortCutKey = 'Shift+F9';
//                     ToolTip = 'Finalize and prepare to print the document or journal. The values and quantities are posted to the related accounts. A report request window where you can specify what to include on the print-out.';

//                     trigger OnAction()
//                     begin
//                         REc.TESTFIELD(REc."Document Type");   //MAQ IAX Added 10-11-2018.
//                         REc.TESTFIELD(REc.Remarks);                 //MAQ IAX Added 10-11-2018.
//                         CODEUNIT.RUN(CODEUNIT::"Gen. Jnl.-Post+Print", Rec);
//                         CurrentJnlBatchName := GETRANGEMAX(REc."Journal Batch Name");
//                         CurrPage.UPDATE(FALSE);
//                     end;
//                 }
//                 action(DeferralSchedule)
//                 {
//                     ApplicationArea = Suite;
//                     Caption = 'Deferral Schedule';
//                     Image = PaymentPeriod;
//                     ToolTip = 'View or edit the deferral schedule that governs how expenses or revenue are deferred to different accounting periods when the journal line is posted.';

//                     trigger OnAction()
//                     begin
//                         IF REc."Account Type" = REc."Account Type"::"Fixed Asset" THEN
//                             ERROR(AccTypeNotSupportedErr);

//                         ShowDeferrals(REc."Posting Date", REc."Currency Code");
//                     end;
//                 }
//                 action("PDC Payable")
//                 {
//                     Image = CalculatePlan;
//                     Promoted = true;
//                     PromotedCategory = "Report";
//                     PromotedIsBig = true;
//                     //RunObject = Report 50018;
//                 }
//                 action("PDC Receivable")
//                 {
//                     Image = CalculatePlan;
//                     Promoted = true;
//                     PromotedCategory = "Report";
//                     PromotedIsBig = true;
//                     // RunObject = Report 50019;
//                 }
//                 group(IncomingDocument)
//                 {
//                     Caption = 'Incoming Document';
//                     Image = Documents;
//                     action(IncomingDocCard)
//                     {
//                         ApplicationArea = Basic, Suite;
//                         Caption = 'View Incoming Document';
//                         Enabled = HasIncomingDocument;
//                         Image = ViewOrder;
//                         ToolTip = 'View any incoming document records and file attachments that exist for the entry or document.';

//                         trigger OnAction()
//                         var
//                             IncomingDocument: Record 130;
//                         begin
//                             IncomingDocument.ShowCardFromEntryNo(REc."Incoming Document Entry No.");
//                         end;
//                     }
//                     action(SelectIncomingDoc)
//                     {
//                         AccessByPermission = TableData 130 = R;
//                         ApplicationArea = Basic, Suite;
//                         Caption = 'Select Incoming Document';
//                         Image = SelectLineToApply;
//                         ToolTip = 'Select an incoming document record and file attachment that you want to link to the entry or document.';

//                         trigger OnAction()
//                         var
//                             IncomingDocument: Record 130;
//                         begin
//                             VALIDATE(REc."Incoming Document Entry No.", IncomingDocument.SelectIncomingDocument(REc."Incoming Document Entry No.", RECORDID));
//                         end;
//                     }
//                     action(IncomingDocAttachFile)
//                     {
//                         ApplicationArea = Basic, Suite;
//                         Caption = 'Create Incoming Document from File';
//                         Ellipsis = true;
//                         Enabled = NOT HasIncomingDocument;
//                         Image = Attach;
//                         ToolTip = 'Create an incoming document record by selecting a file to attach, and then link the incoming document record to the entry or document.';

//                         trigger OnAction()
//                         var
//                             IncomingDocumentAttachment: Record 133;
//                         begin
//                             IncomingDocumentAttachment.NewAttachmentFromGenJnlLine(Rec);
//                         end;
//                     }
//                     action(RemoveIncomingDoc)
//                     {
//                         ApplicationArea = Basic, Suite;
//                         Caption = 'Remove Incoming Document';
//                         Enabled = HasIncomingDocument;
//                         Image = RemoveLine;
//                         ToolTip = 'Remove any incoming document records and file attachments.';

//                         trigger OnAction()
//                         var
//                             IncomingDocument: Record "130";
//                         begin
//                             IF IncomingDocument.GET(REc."Incoming Document Entry No.") THEN
//                                 IncomingDocument.RemoveLinkToRelatedRecord;
//                             REc."Incoming Document Entry No." := 0;
//                             MODIFY(TRUE);
//                         end;
//                     }
//                 }
//             }
//             group("B&ank")
//             {
//                 Caption = 'B&ank';
//                 action(ImportBankStatement)
//                 {
//                     ApplicationArea = Advanced;
//                     Caption = 'Import Bank Statement';
//                     Image = Import;
//                     Promoted = true;
//                     PromotedCategory = Category4;
//                     PromotedIsBig = true;
//                     ToolTip = 'Import electronic bank statements from your bank to populate with data about actual bank transactions.';
//                     Visible = false;

//                     trigger OnAction()
//                     begin
//                         IF rec.FINDLAST THEN;
//                         Rec.ImportBankStatement;
//                     end;
//                 }
//                 action(ShowStatementLineDetails)
//                 {
//                     ApplicationArea = Advanced;
//                     Caption = 'Bank Statement Details';
//                     Image = ExternalDocument;
//                     Promoted = true;
//                     PromotedCategory = Category4;
//                     PromotedIsBig = true;
//                     RunObject = Page 1221;
//                     RunPageLink = "Data Exch. No." = FIELD("Data Exch"."Entry No."),
//                                   "Line No." = FIELD("Data Exch. Line No.");
//                     ToolTip = 'View the content of the imported bank statement file, such as account number, posting date, and amounts.';
//                     Visible = false;
//                 }
//                 action(Reconcile)
//                 {
//                     ApplicationArea = Basic, Suite;
//                     Caption = 'Reconcile';
//                     Image = Reconcile;
//                     Promoted = true;
//                     PromotedCategory = Category4;
//                     ShortCutKey = 'Ctrl+F11';
//                     ToolTip = 'View the balances on bank accounts that are marked for reconciliation, usually liquid accounts.';

//                     trigger OnAction()
//                     begin
//                         GLReconcile.SetGenJnlLine(Rec);
//                         GLReconcile.RUN;
//                     end;
//                 }
//             }
//             group(Application)
//             {
//                 Caption = 'Application';
//                 action("Apply Entries")
//                 {
//                     ApplicationArea = Basic, Suite;
//                     Caption = 'Apply Entries';
//                     Ellipsis = true;
//                     Enabled = ApplyEntriesActionEnabled;
//                     Image = ApplyEntries;
//                     Promoted = true;
//                     PromotedCategory = Category5;
//                     RunObject = Codeunit 225;
//                     ShortCutKey = 'Shift+F11';
//                     ToolTip = 'Apply the payment amount on a journal line to a sales or purchase document that was already posted for a customer or vendor. This updates the amount on the posted document, and the document can either be partially paid, or closed as paid or refunded.';
//                 }
//                 action(Match)
//                 {
//                     ApplicationArea = Advanced;
//                     Caption = 'Apply Automatically';
//                     Image = MapAccounts;
//                     Promoted = true;
//                     PromotedCategory = Category5;
//                     PromotedIsBig = true;
//                     RunObject = Codeunit 1250;
//                     ToolTip = 'Apply payments to their related open entries based on data matches between bank transaction text and entry information.';
//                     Visible = false;
//                 }
//                 action(AddMappingRule)
//                 {
//                     ApplicationArea = Advanced;
//                     Caption = 'Map Text to Account';
//                     Image = CheckRulesSyntax;
//                     Promoted = true;
//                     PromotedCategory = Category5;
//                     PromotedIsBig = true;
//                     ToolTip = 'Associate text on payments with debit, credit, and balancing accounts, so payments are posted to the accounts when you post payments. The payments are not applied to invoices or credit memos, and are suited for recurring cash receipts or expenses.';
//                     Visible = false;

//                     trigger OnAction()
//                     var
//                         TextToAccMapping: Record "1251";
//                     begin
//                         TextToAccMapping.InsertRec(Rec);
//                     end;
//                 }
//             }
//             group("Payro&ll")
//             {
//                 Caption = 'Payro&ll';
//                 action(ImportPayrollFile)
//                 {
//                     ApplicationArea = Basic, Suite;
//                     Caption = 'Import Payroll File';
//                     Image = Import;
//                     Promoted = true;
//                     PromotedCategory = Category6;
//                     PromotedIsBig = true;
//                     ToolTip = 'Import a payroll file that you select.';
//                     Visible = false;

//                     trigger OnAction()
//                     var
//                         GeneralLedgerSetup: Record "98";
//                         ImportPayrollTransaction: Codeunit 1202;
//                     begin
//                         GeneralLedgerSetup.GET;
//                         GeneralLedgerSetup.TESTFIELD("Payroll Trans. Import Format");
//                         IF FINDLAST THEN;
//                         ImportPayrollTransaction.SelectAndImportPayrollDataToGL(Rec, GeneralLedgerSetup."Payroll Trans. Import Format");
//                     end;
//                 }
//                 action(ImportPayrollTransactions)
//                 {
//                     ApplicationArea = Basic, Suite;
//                     Caption = 'Import Payroll Transactions';
//                     Image = ImportChartOfAccounts;
//                     Promoted = true;
//                     PromotedCategory = Category6;
//                     PromotedIsBig = true;
//                     ToolTip = 'Import Payroll Transactions';
//                     Visible = ImportPayrollTransactionsAvailable;

//                     trigger OnAction()
//                     begin
//                         IF FINDLAST THEN;
//                         PayrollManagement.ImportPayroll(Rec);
//                     end;
//                 }
//             }
//             group("Request Approval")
//             {
//                 Caption = 'Request Approval';
//                 group(SendApprovalRequest)
//                 {
//                     Caption = 'Send Approval Request';
//                     Image = SendApprovalRequest;
//                     action(SendApprovalRequestJournalBatch)
//                     {
//                         ApplicationArea = Basic, Suite;
//                         Caption = 'Journal Batch';
//                         Enabled = NOT OpenApprovalEntriesOnBatchOrAnyJnlLineExist AND CanRequestFlowApprovalForBatchAndAllLines;
//                         Image = SendApprovalRequest;
//                         ToolTip = 'Send all journal lines for approval, also those that you may not see because of filters.';

//                         trigger OnAction()
//                         var
//                             ApprovalsMgmt: Codeunit 1535;
//                         begin
//                             ApprovalsMgmt.TrySendJournalBatchApprovalRequest(Rec);
//                             SetControlAppearanceFromBatch;
//                             SetControlAppearance;
//                         end;
//                     }
//                     action(SendApprovalRequestJournalLine)
//                     {
//                         ApplicationArea = Basic, Suite;
//                         Caption = 'Selected Journal Lines';
//                         Enabled = NOT OpenApprovalEntriesOnBatchOrCurrJnlLineExist AND CanRequestFlowApprovalForBatchAndCurrentLine;
//                         Image = SendApprovalRequest;
//                         ToolTip = 'Send selected journal lines for approval.';

//                         trigger OnAction()
//                         var
//                             GenJournalLine: Record 81;
//                             ApprovalsMgmt: Codeunit 1535;
//                         begin
//                             GetCurrentlySelectedLines(GenJournalLine);
//                             ApprovalsMgmt.TrySendJournalLineApprovalRequests(GenJournalLine);
//                             SetControlAppearanceFromBatch;
//                         end;
//                     }
//                 }
//                 group(CancelApprovalRequest)
//                 {
//                     Caption = 'Cancel Approval Request';
//                     Image = Cancel;
//                     action(CancelApprovalRequestJournalBatch)
//                     {
//                         ApplicationArea = Basic, Suite;
//                         Caption = 'Journal Batch';
//                         Enabled = CanCancelApprovalForJnlBatch OR CanCancelFlowApprovalForBatch;
//                         Image = CancelApprovalRequest;
//                         ToolTip = 'Cancel sending all journal lines for approval, also those that you may not see because of filters.';

//                         trigger OnAction()
//                         var
//                             ApprovalsMgmt: Codeunit 1535;
//                         begin
//                             ApprovalsMgmt.TryCancelJournalBatchApprovalRequest(Rec);
//                             SetControlAppearance;
//                             SetControlAppearanceFromBatch;
//                         end;
//                     }
//                     action(CancelApprovalRequestJournalLine)
//                     {
//                         ApplicationArea = Basic, Suite;
//                         Caption = 'Selected Journal Lines';
//                         Enabled = CanCancelApprovalForJnlLine OR CanCancelFlowApprovalForLine;
//                         Image = CancelApprovalRequest;
//                         ToolTip = 'Cancel sending selected journal lines for approval.';

//                         trigger OnAction()
//                         var
//                             GenJournalLine: Record 81;
//                             ApprovalsMgmt: Codeunit 1535;
//                         begin
//                             GetCurrentlySelectedLines(GenJournalLine);
//                             ApprovalsMgmt.TryCancelJournalLineApprovalRequests(GenJournalLine);
//                         end;
//                     }
//                 }
//                 action(CreateFlow)
//                 {
//                     ApplicationArea = Basic, Suite;
//                     Caption = 'Create a Flow';
//                     Image = Flow;
//                     ToolTip = 'Create a new Flow from a list of relevant Flow templates.';
//                     Visible = IsSaaS;

//                     trigger OnAction()
//                     var
//                         FlowServiceManagement: Codeunit 6400;
//                         FlowTemplateSelector: Page 6400;
//                     begin
//                         // Opens page 6400 where the user can use filtered templates to create new flows.
//                         FlowTemplateSelector.SetSearchText(FlowServiceManagement.GetJournalTemplateFilter);
//                         FlowTemplateSelector.RUN;
//                     end;
//                 }
//                 action(SeeFlows)
//                 {
//                     ApplicationArea = Basic, Suite;
//                     Caption = 'See my Flows';
//                     Image = Flow;
//                     RunObject = Page 6401;
//                                     ToolTip = 'View and configure Flows that you created.';
//                 }
//             }
//             group(Approval)
//             {
//                 Caption = 'Approval';
//                 action(Approve)
//                 {
//                     ApplicationArea = All;
//                     Caption = 'Approve';
//                     Image = Approve;
//                     Promoted = true;
//                     PromotedCategory = Category7;
//                     PromotedIsBig = true;
//                     ToolTip = 'Approve the requested changes.';
//                     Visible = OpenApprovalEntriesExistForCurrUser;

//                     trigger OnAction()
//                     var
//                         ApprovalsMgmt: Codeunit 1535;
//                     begin
//                         ApprovalsMgmt.ApproveGenJournalLineRequest(Rec);
//                     end;
//                 }
//                 action(Reject)
//                 {
//                     ApplicationArea = All;
//                     Caption = 'Reject';
//                     Image = Reject;
//                     Promoted = true;
//                     PromotedCategory = Category7;
//                     PromotedIsBig = true;
//                     ToolTip = 'Reject the approval request.';
//                     Visible = OpenApprovalEntriesExistForCurrUser;

//                     trigger OnAction()
//                     var
//                         ApprovalsMgmt: Codeunit 1535;
//                     begin
//                         ApprovalsMgmt.RejectGenJournalLineRequest(Rec);
//                     end;
//                 }
//                 action(Delegate)
//                 {
//                     ApplicationArea = All;
//                     Caption = 'Delegate';
//                     Image = Delegate;
//                     Promoted = true;
//                     PromotedCategory = Category7;
//                     ToolTip = 'Delegate the approval to a substitute approver.';
//                     Visible = OpenApprovalEntriesExistForCurrUser;

//                     trigger OnAction()
//                     var
//                         ApprovalsMgmt: Codeunit 1535;
//                     begin
//                         ApprovalsMgmt.DelegateGenJournalLineRequest(Rec);
//                     end;
//                 }
//                 action(Comment)
//                 {
//                     ApplicationArea = All;
//                     Caption = 'Comments';
//                     Image = ViewComments;
//                     Promoted = true;
//                     PromotedCategory = Category7;
//                     ToolTip = 'View or add comments for the record.';
//                     Visible = OpenApprovalEntriesExistForCurrUser;

//                     trigger OnAction()
//                     var
//                         GenJournalBatch: Record 232;
//                         ApprovalsMgmt: Codeunit 1535;
//                     begin
//                         IF OpenApprovalEntriesOnJnlLineExist THEN
//                             ApprovalsMgmt.GetApprovalComment(Rec)
//                         ELSE
//                             IF OpenApprovalEntriesOnJnlBatchExist THEN
//                                 IF GenJournalBatch.GET("Journal Template Name", "Journal Batch Name") THEN
//                                     ApprovalsMgmt.GetApprovalComment(GenJournalBatch);
//                     end;
//                 }
//             }
//             group("Opening Balance")
//             {
//                 Caption = 'Opening Balance';
//                 group("Prepare journal")
//                 {
//                     Caption = 'Prepare journal';
//                     Image = Journals;
//                     action("G/L Accounts Opening balance ")
//                     {
//                         ApplicationArea = Basic, Suite;
//                         Caption = 'G/L Accounts Opening balance';
//                         Image = TransferToGeneralJournal;
//                         ToolTip = 'Creates general journal line per G/L account to enable manual entry of G/L account open balances during the setup of a new company';

//                         trigger OnAction()
//                         var
//                             GLAccount: Record 15;
//                             CreateGLAccJournalLines: Report 8610;
//                                                          DocumentTypes: Option;
//                         begin
//                             GLAccount.SETRANGE("Account Type", GLAccount."Account Type"::Posting);
//                             GLAccount.SETRANGE("Income/Balance", GLAccount."Income/Balance"::"Balance Sheet");
//                             GLAccount.SETRANGE("Direct Posting", TRUE);
//                             GLAccount.SETRANGE(Blocked, FALSE);
//                             CreateGLAccJournalLines.SETTABLEVIEW(GLAccount);
//                             CreateGLAccJournalLines.InitializeRequest(DocumentTypes, TODAY, "Journal Template Name", "Journal Batch Name", '');
//                             CreateGLAccJournalLines.USEREQUESTPAGE(FALSE);
//                             COMMIT;  // Commit is required for Create Lines.
//                             CreateGLAccJournalLines.RUN;
//                         end;
//                     }
//                     action("Customers Opening balance")
//                     {
//                         ApplicationArea = Basic, Suite;
//                         Caption = 'Customers Opening balance';
//                         Image = TransferToGeneralJournal;
//                         ToolTip = 'Creates general journal line per Customer to enable manual entry of Customer open balances during the setup of a new company';

//                         trigger OnAction()
//                         var
//                             Customer: Record 18;
//                             CreateCustomerJournalLines: Report 8611;
//                                                             DocumentTypes: Option;
//                         begin
//                             Customer.SETRANGE(Blocked, Customer.Blocked::" ");
//                             CreateCustomerJournalLines.SETTABLEVIEW(Customer);
//                             CreateCustomerJournalLines.InitializeRequest(DocumentTypes, TODAY, TODAY);
//                             CreateCustomerJournalLines.InitializeRequestTemplate("Journal Template Name", "Journal Batch Name", '');
//                             CreateCustomerJournalLines.USEREQUESTPAGE(FALSE);
//                             COMMIT;  // Commit is required for Create Lines.
//                             CreateCustomerJournalLines.RUN;
//                         end;
//                     }
//                     action("Vendors Opening balance")
//                     {
//                         ApplicationArea = Basic, Suite;
//                         Caption = 'Vendors Opening balance';
//                         Image = TransferToGeneralJournal;
//                         ToolTip = 'Creates a general journal line for each vendor. This lets you manually enter open balances for vendors when you set up a new company.';

//                         trigger OnAction()
//                         var
//                             Vendor: Record 23;
//                             CreateVendorJournalLines: Report 8612;
//                                                           DocumentTypes: Option;
//                         begin
//                             Vendor.SETRANGE(Blocked, Vendor.Blocked::" ");
//                             CreateVendorJournalLines.SETTABLEVIEW(Vendor);
//                             CreateVendorJournalLines.InitializeRequest(DocumentTypes, TODAY, TODAY);
//                             CreateVendorJournalLines.InitializeRequestTemplate("Journal Template Name", "Journal Batch Name", '');
//                             CreateVendorJournalLines.USEREQUESTPAGE(FALSE);
//                             COMMIT;  // Commit is required for Create Lines.
//                             CreateVendorJournalLines.RUN;
//                         end;
//                     }
//                 }
//             }
//             group(Page)
//             {
//                 Caption = 'Page';
//                 action(EditInExcel)
//                 {
//                     ApplicationArea = Basic, Suite;
//                     Caption = 'Edit in Excel';
//                     Image = Excel;
//                     Promoted = true;
//                     PromotedCategory = Category8;
//                     PromotedIsBig = true;
//                     PromotedOnly = true;
//                     ToolTip = 'Send the data in the journal to an Excel file for analysis or editing.';
//                     Visible = IsSaasExcelAddinEnabled;

//                     trigger OnAction()
//                     var
//                         ODataUtility: Codeunit 6710;
//                     begin
//                         ODataUtility.EditJournalWorksheetInExcel(CurrPage.CAPTION, CurrPage.OBJECTID(FALSE), "Journal Batch Name", "Journal Template Name");
//                     end;
//                 }
//             }
//         }
//     }

//     trigger OnAfterGetCurrRecord()
//     begin
//         GenJnlManagement.GetAccounts(Rec, AccName, BalAccName);
//         UpdateBalance;
//         EnableApplyEntriesAction;
//         SetControlAppearance;
//         CurrPage.IncomingDocAttachFactBox.PAGE.LoadDataFromRecord(Rec);
//     end;

//     trigger OnAfterGetRecord()
//     begin
//         ShowShortcutDimCode(ShortcutDimCode);
//         HasIncomingDocument := "Incoming Document Entry No." <> 0;
//         SetUserInteractions;
//     end;

//     trigger OnInit()
//     begin
//         TotalBalanceVisible := TRUE;
//         BalanceVisible := TRUE;
//         AmountVisible := TRUE;
//     end;

//     trigger OnModifyRecord(): Boolean
//     begin
//         SetUserInteractions;
//     end;

//     trigger OnNewRecord(BelowxRec: Boolean)
//     begin
//         UpdateBalance;
//         EnableApplyEntriesAction;
//         SetUpNewLine(xRec, Balance, BelowxRec);
//         CLEAR(ShortcutDimCode);
//         CLEAR(AccName);
//         SetUserInteractions;
//     end;

//     trigger OnOpenPage()
//     var
//         ServerConfigSettingHandler: Codeunit 6723;
//         PermissionManager: Codeunit 9002;
//         JnlSelected: Boolean;
//     begin
//         IsSaasExcelAddinEnabled := ServerConfigSettingHandler.GetIsSaasExcelAddinEnabled;
//         IF ClientTypeManagement.GetCurrentClientType = CLIENTTYPE::ODataV4 THEN
//             EXIT;

//         BalAccName := '';
//         ShowAmounts;
//         IF IsOpenedFromBatch THEN BEGIN
//             CurrentJnlBatchName := "Journal Batch Name";
//             GenJnlManagement.OpenJnl(CurrentJnlBatchName, Rec);
//             SetControlAppearanceFromBatch;
//             EXIT;
//         END;
//         //GenJnlManagement.TemplateSelection(PAGE::"General Journal",0,FALSE,Rec,JnlSelected);
//         GenJnlManagement.TemplateSelection(PAGE::"PDC Journal", 0, FALSE, Rec, JnlSelected);   //MAQ IAX Added 29-07-2019
//         IF NOT JnlSelected THEN
//             ERROR('');
//         GenJnlManagement.OpenJnl(CurrentJnlBatchName, Rec);
//         SetControlAppearanceFromBatch;

//         IsSaaS := PermissionManager.SoftwareAsAService;
//     end;

//     var
//         GenJnlManagement: Codeunit GenJnlManagement;
//         ReportPrint: Codeunit print;
//         PayrollManagement: Codeunit 1660;
//         ClientTypeManagement: Codeunit 4;
//         ChangeExchangeRate: record ExchangeRate;
//                                 GLReconcile: Page 345;
//                                                  CurrentJnlBatchName: Code[10];
//                                                  AccName: Text[50];
//                                                  BalAccName: Text[50];
//                                                  Balance: Decimal;
//                                                  TotalBalance: Decimal;
//                                                  ShowBalance: Boolean;
//                                                  ShowTotalBalance: Boolean;
//                                                  ShortcutDimCode: array[8] of Code[20];
//                                                  Text000: Label 'General Journal lines have been successfully inserted from Standard General Journal %1.';
//         Text001: Label 'Standard General Journal %1 has been successfully created.';
//         HasIncomingDocument: Boolean;
//         ApplyEntriesActionEnabled: Boolean;
//         [InDataSet]
//         BalanceVisible: Boolean;
//         [InDataSet]
//         TotalBalanceVisible: Boolean;
//         StyleTxt: Text;
//         OpenApprovalEntriesExistForCurrUser: Boolean;
//         AccTypeNotSupportedErr: Label 'You cannot specify a deferral code for this type of account.';
//         OpenApprovalEntriesOnJnlBatchExist: Boolean;
//         OpenApprovalEntriesOnJnlLineExist: Boolean;
//         OpenApprovalEntriesOnBatchOrCurrJnlLineExist: Boolean;
//         OpenApprovalEntriesOnBatchOrAnyJnlLineExist: Boolean;
//         ShowWorkflowStatusOnBatch: Boolean;
//         ShowWorkflowStatusOnLine: Boolean;
//         CanCancelApprovalForJnlBatch: Boolean;
//         CanCancelApprovalForJnlLine: Boolean;
//         ImportPayrollTransactionsAvailable: Boolean;
//         IsSaasExcelAddinEnabled: Boolean;
//         CanRequestFlowApprovalForBatch: Boolean;
//         CanRequestFlowApprovalForBatchAndAllLines: Boolean;
//         CanRequestFlowApprovalForBatchAndCurrentLine: Boolean;
//         CanCancelFlowApprovalForBatch: Boolean;
//         CanCancelFlowApprovalForLine: Boolean;
//         AmountVisible: Boolean;
//         DebitCreditVisible: Boolean;
//         IsSaaS: Boolean;
//         UserSetup: Record 91;
//         RespCent: Record 5714;

//     local procedure UpdateBalance()
//     begin
//         GenJnlManagement.CalcBalance(Rec, xRec, Balance, TotalBalance, ShowBalance, ShowTotalBalance);
//         BalanceVisible := ShowBalance;
//         TotalBalanceVisible := ShowTotalBalance;
//     end;

//     local procedure EnableApplyEntriesAction()
//     begin
//         ApplyEntriesActionEnabled :=
//           ("Account Type" IN ["Account Type"::Customer, "Account Type"::Vendor, "Account Type"::Employee]) OR
//           ("Bal. Account Type" IN ["Bal. Account Type"::Customer, "Bal. Account Type"::Vendor, "Bal. Account Type"::Employee]);
//     end;

//     local procedure CurrentJnlBatchNameOnAfterVali()
//     begin
//         CurrPage.SAVERECORD;
//         GenJnlManagement.SetName(CurrentJnlBatchName, Rec);
//         SetControlAppearanceFromBatch;
//         CurrPage.UPDATE(FALSE);
//     end;

//     [Scope('Personalization')]
//     procedure SetUserInteractions()
//     begin
//         StyleTxt := GetStyle;
//     end;

//     local procedure GetCurrentlySelectedLines(var GenJournalLine: Record "81"): Boolean
//     begin
//         CurrPage.SETSELECTIONFILTER(GenJournalLine);
//         EXIT(GenJournalLine.FINDSET);
//     end;

//     local procedure SetControlAppearance()
//     var
//         ApprovalsMgmt: Codeunit 1535;
//         WorkflowWebhookManagement: Codeunit 1543;
//         CanRequestFlowApprovalForLine: Boolean;
//     begin
//         OpenApprovalEntriesExistForCurrUser :=
//           OpenApprovalEntriesExistForCurrUser OR
//           ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(RECORDID);

//         OpenApprovalEntriesOnJnlLineExist := ApprovalsMgmt.HasOpenApprovalEntries(RECORDID);
//         OpenApprovalEntriesOnBatchOrCurrJnlLineExist := OpenApprovalEntriesOnJnlBatchExist OR OpenApprovalEntriesOnJnlLineExist;

//         ShowWorkflowStatusOnLine := CurrPage.WorkflowStatusLine.PAGE.SetFilterOnWorkflowRecord(RECORDID);

//         CanCancelApprovalForJnlLine := ApprovalsMgmt.CanCancelApprovalForRecord(RECORDID);

//         SetPayrollAppearance;

//         WorkflowWebhookManagement.GetCanRequestAndCanCancel(RECORDID, CanRequestFlowApprovalForLine, CanCancelFlowApprovalForLine);
//         CanRequestFlowApprovalForBatchAndCurrentLine := CanRequestFlowApprovalForBatch AND CanRequestFlowApprovalForLine;
//     end;

//     local procedure SetPayrollAppearance()
//     var
//         TempPayrollServiceConnection: Record "1400" temporary;
//     begin
//         PayrollManagement.OnRegisterPayrollService(TempPayrollServiceConnection);
//         ImportPayrollTransactionsAvailable := NOT TempPayrollServiceConnection.ISEMPTY;
//     end;

//     local procedure SetControlAppearanceFromBatch()
//     var
//         GenJournalBatch: Record 232;
//         ApprovalsMgmt: Codeunit 1535;
//         WorkflowWebhookManagement: Codeunit 1543;
//         CanRequestFlowApprovalForAllLines: Boolean;
//     begin
//         IF ("Journal Template Name" <> '') AND ("Journal Batch Name" <> '') THEN
//             GenJournalBatch.GET("Journal Template Name", "Journal Batch Name")
//         ELSE
//             IF NOT GenJournalBatch.GET(GETRANGEMAX("Journal Template Name"), CurrentJnlBatchName) THEN
//                 EXIT;

//         ShowWorkflowStatusOnBatch := CurrPage.WorkflowStatusBatch.PAGE.SetFilterOnWorkflowRecord(GenJournalBatch.RECORDID);
//         OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(GenJournalBatch.RECORDID);
//         OpenApprovalEntriesOnJnlBatchExist := ApprovalsMgmt.HasOpenApprovalEntries(GenJournalBatch.RECORDID);

//         OpenApprovalEntriesOnBatchOrAnyJnlLineExist :=
//           OpenApprovalEntriesOnJnlBatchExist OR
//           ApprovalsMgmt.HasAnyOpenJournalLineApprovalEntries("Journal Template Name", "Journal Batch Name");

//         CanCancelApprovalForJnlBatch := ApprovalsMgmt.CanCancelApprovalForRecord(GenJournalBatch.RECORDID);

//         WorkflowWebhookManagement.GetCanRequestAndCanCancelJournalBatch(
//           GenJournalBatch, CanRequestFlowApprovalForBatch, CanCancelFlowApprovalForBatch, CanRequestFlowApprovalForAllLines);
//         CanRequestFlowApprovalForBatchAndAllLines := CanRequestFlowApprovalForBatch AND CanRequestFlowApprovalForAllLines;
//     end;

//     local procedure ShowAmounts()
//     var
//         GLSetup: Record "98";
//     begin
//         GLSetup.GET;
//         AmountVisible := NOT (GLSetup."Show Amounts" = GLSetup."Show Amounts"::"Debit/Credit Only");
//         DebitCreditVisible := NOT (GLSetup."Show Amounts" = GLSetup."Show Amounts"::"Amount Only");
//     end;
// }