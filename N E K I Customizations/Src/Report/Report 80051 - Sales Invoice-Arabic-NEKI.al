// report 80051 "Sales Invoice-Arabic"
// {
//     // version iAX.frz.01

//     DefaultLayout = RDLC;
//     RDLCLayout = './Sales Invoice-Arabic.rdlc';

//     dataset
//     {
//         dataitem(DataItem2; Table50099)
//         {
//             UseTemporary = true;
//             column(Comp_Name; CompInfo.Name)
//             {
//             }
//             column(Comp_Pic; CompInfo.Picture)
//             {
//             }
//             column(Report_Cap; Report_Cap)
//             {
//             }
//             column(BankName; 'NAME : ' + CompInfo."Bank Name")
//             {
//             }
//             column(BranchName; 'BRANCH : ' + CompInfo."Bank Branch No.")
//             {
//             }
//             column(BankAccountNo; 'A/C #  ' + CompInfo."Bank Account No.")
//             {
//             }
//             column(IBANNo; 'IBAN No. : ' + CompInfo.IBAN)
//             {
//             }
//             column(DocumentType_TemTable; "Tem Table"."Document Type")
//             {
//             }
//             column(SelltoCustomerNo_TemTable; "Tem Table"."Sell-to Customer No.")
//             {
//             }
//             column(No_TemTable; "Tem Table"."No.")
//             {
//             }
//             column(BilltoCustomerNo_TemTable; "Tem Table"."Bill-to Customer No.")
//             {
//             }
//             column(VATRegistrationNo_TemTable; "Tem Table"."VAT Registration No.")
//             {
//             }
//             column(BilltoName_TemTable; "Tem Table"."Bill-to Name")
//             {
//             }
//             column(BilltoAddress_TemTable; "Tem Table"."Bill-to Address" + ' ' + "Tem Table"."Bill-to Address 2" + ',' + "Tem Table"."Bill-to City" + ' , ' + "Tem Table"."Bill-to Post Code" + ',  ' + "Tem Table"."Bill-to County")
//             {
//             }
//             column(BilltoAddress2_TemTable; "Tem Table"."Bill-to Address 2")
//             {
//             }
//             column(BilltoCity_TemTable; "Tem Table"."Bill-to City")
//             {
//             }
//             column(BilltoPostCode_TemTable; "Tem Table"."Bill-to Post Code")
//             {
//             }
//             column(BilltoCounty_TemTable; "Tem Table"."Bill-to County")
//             {
//                 OptionCaption = '';
//             }
//             column(BilltoCountryRegionCode_TemTable; "Tem Table"."Bill-to Country/Region Code")
//             {
//             }
//             column(OrderDate_TemTable; "Tem Table"."Order Date")
//             {
//             }
//             column(PostingDate_TemTable; "Tem Table"."Posting Date")
//             {
//             }
//             column(DueDate_TemTable; "Tem Table"."Due Date")
//             {
//             }
//             column(CurrencyCode_TemTable; "Tem Table"."Currency Code")
//             {
//             }
//             column(PaymentTermsCode_TemTable; "Tem Table"."Payment Terms Code")
//             {
//             }
//             column(CurrencyFactor_TemTable; "Tem Table"."Currency Factor")
//             {
//             }
//             column(SalespersonCode_TemTable; "Tem Table"."Salesperson Code")
//             {
//             }
//             column(SelltoCustomerName2_TemTable; "Tem Table"."Sell-to Customer Name 2")
//             {
//             }
//             column(ExternalDocumentNo_TemTable; "Tem Table"."External Document No.")
//             {
//             }
//             column(TotalLineAmt; TotalLineAmt)
//             {
//             }
//             column(TotalInvDisc; TotalInvDisc)
//             {
//             }
//             column(VATAmt; VATAmt)
//             {
//             }
//             column(ShiptoCode_TemTable; "Tem Table"."Ship-to Code")
//             {
//             }
//             column(ShiptoName_TemTable; "Tem Table"."Ship-to Name")
//             {
//             }
//             column(ShiptoAddress_TemTable; "Tem Table"."Ship-to Address")
//             {
//             }
//             column(ShiptoCity_TemTable; "Tem Table"."Ship-to City")
//             {
//             }
//             column(ShiptoPostCode_TemTable; "Tem Table"."Ship-to Post Code")
//             {
//             }
//             column(ShiptoCounty_TemTable; "Tem Table"."Ship-to County")
//             {
//             }
//             column(ShiptoCountryRegionCode_TemTable; "Tem Table"."Ship-to Country/Region Code")
//             {
//             }
//             column(test; test)
//             {
//             }
//             dataitem(DataItem41; Table50098)
//             {
//                 UseTemporary = true;
//                 column(DocumentNo_TempTabLine; "Temp Tab Line"."Document No.")
//                 {
//                     OptionCaption = 'DocumentNo_TempTabLine';
//                 }
//                 column(LineNo_TempTabLine; "Temp Tab Line"."Line No.")
//                 {
//                 }
//                 column(No_TempTabLine; "Temp Tab Line"."No.")
//                 {
//                 }
//                 column(Description_TempTabLine; "Temp Tab Line".Description)
//                 {
//                 }
//                 column(Quantity_TempTabLine; "Temp Tab Line".Quantity)
//                 {
//                 }
//                 column(UnitPrice_TempTabLine; "Temp Tab Line"."Unit Price")
//                 {
//                 }
//                 column(VAT_TempTabLine; FORMAT("Temp Tab Line"."VAT %") + ' %')
//                 {
//                 }
//                 column(Amount_TempTabLine; "Temp Tab Line".Amount)
//                 {
//                 }
//                 column(AmountIncludingVAT_TempTabLine; "Temp Tab Line"."Amount Including VAT")
//                 {
//                 }
//                 column(LineNo; LineNo)
//                 {
//                 }
//                 column(uom; "Temp Tab Line"."Unit Price")
//                 {
//                 }

//                 trigger OnAfterGetRecord()
//                 begin
//                     LineNo += 1;
//                 end;

//                 trigger OnPreDataItem()
//                 begin
//                     LineNo := 0;
//                 end;
//             }
//         }
//     }

//     requestpage
//     {

//         layout
//         {
//         }

//         actions
//         {
//         }
//     }

//     labels
//     {
//     }

//     trigger OnPreReport()
//     begin
//         CompInfo.GET;
//         CompInfo.CALCFIELDS(Picture);
//         "Tem Table".DELETEALL;
//         "Temp Tab Line".DELETEALL;
//         //IF SH_UnPosted.GET(InvoiceNo) THEN
//         Report_Cap := '';
//         IF SH_UnPosted.GET(SH_UnPosted."Document Type"::Invoice, InvoiceNo) THEN BEGIN
//             Report_Cap := 'Proforma Invoice';
//             "Tem Table"."Document Type" := SH_UnPosted."Document Type";
//             "Tem Table"."No." := SH_UnPosted."No.";
//             "Tem Table"."Sell-to Customer No." := SH_UnPosted."Sell-to Customer No.";
//             "Tem Table"."Bill-to Name" := SH_UnPosted."Sell-to Customer Name";
//             "Tem Table"."Bill-to Address" := SH_UnPosted."Sell-to Address";
//             "Tem Table"."Bill-to Address 2" := SH_UnPosted."Sell-to Address 2";
//             "Tem Table"."Bill-to City" := SH_UnPosted."Sell-to City";
//             "Tem Table"."Bill-to Post Code" := SH_UnPosted."Sell-to Post Code";
//             "Tem Table"."Bill-to Country/Region Code" := SH_UnPosted."Sell-to Country/Region Code";
//             "Tem Table"."Bill-to County" := SH_UnPosted."Sell-to County";
//             "Tem Table"."Posting Date" := SH_UnPosted."Posting Date";
//             "Tem Table"."External Document No." := SH_UnPosted."External Document No.";
//             "Tem Table"."Order Date" := SH_UnPosted."Order Date";
//             "Tem Table"."VAT Registration No." := SH_UnPosted."VAT Registration No.";
//             "Tem Table"."Ship-to Code" := SH_UnPosted."Ship-to Code";
//             "Tem Table"."Ship-to Name" := SH_UnPosted."Ship-to Name";
//             "Tem Table"."Ship-to Address" := SH_UnPosted."Ship-to Address";
//             "Tem Table"."Ship-to City" := SH_UnPosted."Ship-to City";
//             "Tem Table"."Ship-to Post Code" := SH_UnPosted."Ship-to Post Code";
//             "Tem Table"."Ship-to County" := SH_UnPosted."Ship-to County";
//             "Tem Table"."Ship-to Country/Region Code" := SH_UnPosted."Ship-to Country/Region Code";

//             "Tem Table".INSERT;
//             SalesLine_Rec.RESET;
//             SalesLine_Rec.SETRANGE("Document Type", SH_UnPosted."Document Type");
//             SalesLine_Rec.SETRANGE("Document No.", InvoiceNo);
//             IF SalesLine_Rec.FINDFIRST THEN
//                 REPEAT
//                     "Temp Tab Line"."Document Type" := SalesLine_Rec."Document Type";
//                     "Temp Tab Line"."Document No." := SalesLine_Rec."Document No.";
//                     "Temp Tab Line"."Line No." := SalesLine_Rec."Line No.";
//                     "Temp Tab Line"."No." := SalesLine_Rec."No.";
//                     "Temp Tab Line".Description := SalesLine_Rec.Description;
//                     "Temp Tab Line".Quantity := SalesLine_Rec.Quantity;
//                     "Temp Tab Line".Amount := SalesLine_Rec.Amount;
//                     "Temp Tab Line"."Amount Including VAT" := SalesLine_Rec."Amount Including VAT";
//                     "Temp Tab Line"."Location Code" := SalesLine_Rec."Location Code";
//                     "Temp Tab Line"."VAT %" := SalesLine_Rec."VAT %";

//                     "Temp Tab Line".INSERT;
//                 UNTIL SalesLine_Rec.NEXT = 0;

//             CLEAR(TotalLineAmt);
//             CLEAR(TotalInvDisc);
//             CLEAR(VATAmt);
//             SalesLine_Rec.RESET;
//             SalesLine_Rec.SETFILTER(SalesLine_Rec."Document No.", InvoiceNo);
//             IF SalesLine_Rec.FINDFIRST THEN BEGIN
//                 REPEAT
//                     TotalLineAmt += SalesLine_Rec."Line Amount";
//                     TotalInvDisc += SalesLine_Rec."Inv. Discount Amount";
//                     VATAmt += (SalesLine_Rec."VAT %" * SalesLine_Rec.Amount) / 100;
//                 UNTIL SalesLine_Rec.NEXT = 0;
//             END;

//         END ELSE BEGIN
//             IF SI_Posted.GET(InvoiceNo) THEN BEGIN
//                 //"Tem Table"."Document Type":=."Document Type";
//                 Report_Cap := 'TAX INVOICE';
//                 "Tem Table"."No." := SI_Posted."No.";
//                 "Tem Table"."Sell-to Customer No." := SI_Posted."Sell-to Customer No.";
//                 "Tem Table"."Bill-to Name" := SI_Posted."Sell-to Customer Name";
//                 "Tem Table"."Bill-to Address" := SI_Posted."Sell-to Address";
//                 "Tem Table"."Bill-to Address 2" := SI_Posted."Sell-to Address 2";
//                 "Tem Table"."Bill-to City" := SI_Posted."Sell-to City";
//                 "Tem Table"."Bill-to Post Code" := SI_Posted."Sell-to Post Code";
//                 "Tem Table"."Bill-to Country/Region Code" := SI_Posted."Sell-to Country/Region Code";
//                 "Tem Table"."Bill-to County" := SI_Posted."Sell-to County";
//                 "Tem Table"."Posting Date" := SI_Posted."Posting Date";
//                 "Tem Table"."External Document No." := SI_Posted."External Document No.";
//                 "Tem Table"."Order Date" := SI_Posted."Order Date";
//                 "Tem Table"."VAT Registration No." := SI_Posted."VAT Registration No.";
//                 "Tem Table"."Ship-to Code" := SI_Posted."Ship-to Code";
//                 "Tem Table"."Ship-to Name" := SI_Posted."Ship-to Name";
//                 "Tem Table"."Ship-to Address" := SI_Posted."Ship-to Address";
//                 "Tem Table"."Ship-to City" := SI_Posted."Ship-to City";
//                 "Tem Table"."Ship-to Post Code" := SI_Posted."Ship-to Post Code";
//                 "Tem Table"."Ship-to County" := SI_Posted."Ship-to County";
//                 "Tem Table"."Ship-to Country/Region Code" := SI_Posted."Ship-to Country/Region Code";
//                 "Tem Table".INSERT;
//                 SalesInvLine.RESET;
//                 SalesInvLine.SETRANGE("Document No.", InvoiceNo);
//                 IF SalesInvLine.FINDFIRST THEN
//                     REPEAT
//                         //"Temp Tab Line"."Document Type":=SalesInvLine."Document Type";
//                         "Temp Tab Line"."Document No." := SalesInvLine."Document No.";
//                         "Temp Tab Line"."Line No." := SalesInvLine."Line No.";
//                         "Temp Tab Line"."No." := SalesInvLine."No.";
//                         "Temp Tab Line".Description := SalesInvLine.Description;
//                         "Temp Tab Line".Quantity := SalesInvLine.Quantity;
//                         "Temp Tab Line".Amount := SalesInvLine.Amount;
//                         "Temp Tab Line"."Amount Including VAT" := SalesInvLine."Amount Including VAT";
//                         "Temp Tab Line"."Location Code" := SalesInvLine."Location Code";
//                         "Temp Tab Line"."VAT %" := SalesInvLine."VAT %";

//                         "Temp Tab Line".INSERT;
//                     UNTIL SalesInvLine.NEXT = 0;


//                 CLEAR(TotalLineAmt);
//                 CLEAR(TotalInvDisc);
//                 CLEAR(VATAmt);
//                 SalesInvLine.RESET;
//                 SalesInvLine.SETFILTER(SalesInvLine."Document No.", InvoiceNo);
//                 IF SalesInvLine.FINDFIRST THEN BEGIN
//                     REPEAT
//                         TotalLineAmt += SalesInvLine."Line Amount";
//                         TotalInvDisc += SalesInvLine."Inv. Discount Amount";
//                         VATAmt += (SalesInvLine."VAT %" * SalesInvLine.Amount) / 100;
//                     UNTIL SalesInvLine.NEXT = 0;
//                 END;

//             END;
//         END;
//     end;

//     var
//         SI_Posted: Record "112";
//         SH_UnPosted: Record "36";
//         InvoiceNo: Code[20];
//         SalesLine_Rec: Record "37";
//         LineNo: Integer;
//         CompInfo: Record "79";
//         CompName_CapArb: Label '???? ???? ?????? ???????? ????????';
//         test: Text[100];
//         TotalLineAmt: Decimal;
//         TotalInvDisc: Decimal;
//         VATAmt: Decimal;
//         SalesInvLine: Record "113";
//         Report_Cap: Text[30];

//     procedure GetInvoiceNo(tempInvoiceNo: Code[20])
//     begin
//         InvoiceNo := tempInvoiceNo;
//     end;
// }

