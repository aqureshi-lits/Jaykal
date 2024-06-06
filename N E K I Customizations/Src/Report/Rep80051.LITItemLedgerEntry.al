// report 80051 "LIT Item Ledger Entry"
// {
//     ApplicationArea = All;
//     Caption = 'Item Ledger Entry Open Change';
//     UsageCategory = Administration;
//     ProcessingOnly = true;
//     Permissions = tabledata "Item Ledger Entry" = RIMD;

//     dataset
//     {
//         dataitem(ItemLedgerEntry; "Item Ledger Entry")
//         {
//             RequestFilterFields = "Entry No.";

//             trigger OnAfterGetRecord()
//             var
//                 myInt: Integer;
//                 ItemLedgerEntryRec: Record "Item Ledger Entry";
//             begin
//                 ItemLedgerEntryRec.Reset();
//                 ItemLedgerEntryRec.SetRange("Entry No.", ItemLedgerEntry."Entry No.");
//                 if ItemLedgerEntryRec.Find('-') then begin
//                     repeat begin
//                         if ItemLedgerEntryRec.Open = true then begin
//                             ItemLedgerEntryRec.Open := false;
//                             ItemLedgerEntryRec.Modify(true);
//                         end;
//                         if ItemLedgerEntryRec.Open = false then begin
//                             ItemLedgerEntryRec.Open := true;
//                             ItemLedgerEntryRec.Modify(true);
//                         end;
//                     end until ItemLedgerEntryRec.Next = 0;
//                 end;
//             end;
//         }
//     }
//     requestpage
//     {
//         layout
//         {
//             area(Content)
//             {
//                 group(GroupName)
//                 {
//                 }
//             }
//         }
//         actions
//         {
//             area(Processing)
//             {
//             }
//         }
//     }
// }
