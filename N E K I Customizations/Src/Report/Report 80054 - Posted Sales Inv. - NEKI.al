report 80054 "Posted Sales Inv. - IAX"
{
    // version IAX Frz

    DefaultLayout = RDLC;
    RDLCLayout = './Src/Layout/RGS Reports/Posted Sales Inv. - IAXV5.rdlc';
    PreviewMode = PrintLayout;

    dataset
    {
        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {
            RequestFilterFields = "No.";
            column(CompPic; CompanyInformation.Picture)
            {
            }
            column(Picture2_RespCent; CompanyInformation.Picture)
            {
            }
            column(No_SalesHeader; "Sales Invoice Header"."No.")
            {
            }
            column(BilltoCustomerNo_SalesHeader; "Sales Invoice Header"."Bill-to Customer No.")
            {
            }
            column(BilltoName_SalesHeader; "Sales Invoice Header"."Bill-to Name")
            {
            }
            column(BilltoName2_SalesHeader; "Sales Invoice Header"."Bill-to Name 2")
            {
            }
            column(BilltoAddress_SalesHeader; "Sales Invoice Header"."Bill-to Address")
            {
            }
            column(BilltoAddress2_SalesHeader; "Sales Invoice Header"."Bill-to Address 2")
            {
            }
            column(BilltoCity_SalesHeader; "Sales Invoice Header"."Bill-to City" + ' , ' + "Sales Invoice Header"."Bill-to Country/Region Code")
            {
            }
            column(BilltoPostCode_SalesHeader; "Sales Invoice Header"."Bill-to Post Code")
            {
            }
            column(BilltoCounty_SalesHeader; "Sales Invoice Header"."Bill-to County")
            {
            }
            column(BilltoCountryRegionCode_SalesHeader; "Sales Invoice Header"."Bill-to Country/Region Code")
            {
            }
            column(BilltoContact_SalesHeader; "Sales Invoice Header"."Bill-to Contact")
            {
            }
            column(QuoteNo_SalesHeader; "Sales Invoice Header"."Quote No.")
            {
            }
            column(DocDate; "Sales Invoice Header"."Document Date")
            {
            }
            column(OrderNo_SalesHeader; SalesOrderNo)
            {
            }
            column(OrderDate_SalesHeader; "Sales Invoice Header"."Order Date")
            {
            }
            column(BilltoContactNo_SalesHeader; CustomerRec."Phone No.")
            {
            }
            column(YourReference_SalesHeader; "Sales Invoice Header"."Your Reference")
            {
            }
            column(PostingDate_SalesHeader; "Sales Invoice Header"."Posting Date")
            {
            }
            column(SalespersonCode_SalesHeader; SalesPerson.Name)
            {
            }
            column(VATRegistrationNo_SalesHeader; CustVATRegNo)
            {
            }
            column(ExternalDocumentNo_SalesHeader; "Sales Invoice Header"."External Document No.")
            {
            }
            column(CurrencyCode_SalesHeader; "Sales Invoice Header"."Currency Code")
            {
            }
            column(CurrText; CurrText)
            {
            }
            column(CourierName_SalesHeader; CompanyInformation.IBAN)
            {
            }
            column(AWBNo_SalesHeader; CompanyInformation.IBAN)
            {
            }
            column(AWBDate_SalesHeader; CompanyInformation.IBAN)
            {
            }
            column(Remarks_SalesHeader; CompanyInformation.IBAN)
            {
            }
            column(ShiptoCode_SalesHeader; "Sales Invoice Header"."Ship-to Code")
            {
            }
            column(ShiptoName_SalesHeader; "Sales Invoice Header"."Ship-to Name")
            {
            }
            column(ShiptoName2_SalesHeader; "Sales Invoice Header"."Ship-to Name 2")
            {
            }
            column(ShiptoAddress_SalesHeader; "Sales Invoice Header"."Ship-to Address")
            {
            }
            column(ShiptoAddress2_SalesHeader; "Sales Invoice Header"."Ship-to Address 2")
            {
            }
            column(ShiptoCity_SalesHeader; "Sales Invoice Header"."Ship-to City" + ' , ' + "Sales Invoice Header"."Ship-to Country/Region Code")
            {
            }
            column(ShiptoCountryRegionCode_SalesHeader; "Sales Invoice Header"."Ship-to Country/Region Code")
            {
            }
            column(ShiptoContact_SalesHeader; "Sales Invoice Header"."Ship-to Contact")
            {
            }
            column(ShiptoContactNo_SalesHeader; ShiptoAddress."Phone No.")
            {
            }
            column(ShiptoEmail_SalesHeader; ShiptoAddress."E-Mail")
            {
            }
            column(Email_SalesHeader; CustomerRec."E-Mail")
            {
            }
            column(CompanyTRN; 'TRN No. : ' + CompanyInformation."VAT Registration No." + ' , Email  : ' + CompanyInformation."E-Mail")
            {
            }
            column(Single_TRN; CompanyInformation."VAT Registration No.")
            {
            }
            column(ComName; CompanyInformation.Name)
            {
            }
            column(Address; CompanyInformation.Address + ' , ' + CompanyInformation."Address 2")
            {
            }
            column(Addrss2; CompanyInformation."Address 2")
            {
            }
            column(City; CompanyInformation.City + ' -' + CompanyInformation."Country/Region Code")
            {
            }
            column(CompPhone; 'Phone No. : ' + CompanyInformation."Phone No.")
            {
            }
            column(Comp_Post; CompanyInformation."Post Code")
            {
            }
            column(CompContry; CompanyInformation."Country/Region Code")
            {
            }
            column(CompEmail; CompanyInformation."E-Mail")
            {
            }
            column(CompFax; CompanyInformation."Fax No.")
            {
            }
            column(ExchangeRateAmt; ExchangeRateAmt)
            {
            }
            column(ExcRate; "Sales Invoice Header"."Currency Factor")
            {
            }
            column(WorkDescription; "Work Description")
            {
            }
            column(PaymentTermsCode; "Payment Terms Code")
            {
            }
            column(CurrencyCode; CurrencyCode)
            {
            }
            column(AmtInWord; AmtInWord[1] + ' ' + AmtInWord[2])
            {
            }
            column(AmtInWordVAt; AmtInWordVat[1] + ' ' + AmtInWordVat[2])
            {
            }
            column(VATAmt; VATAmt)
            {
            }
            column(DNNo; DNNo)
            {
            }
            column(DNDate; DNDate)
            {
            }
            column(Amount_SalesInvoiceHeader; "Sales Invoice Header".Amount)
            {
            }
            column(AmountIncludingVAT_SalesInvoiceHeader; "Sales Invoice Header"."Amount Including VAT")
            {
            }

            column(ShipmentNoArray1; ShipmentNoArray[1])
            {
            }
            column(ShipmentNoArray2; ShipmentNoArray[2])
            {
            }
            column(ShipmentNoArray3; ShipmentNoArray[3])
            {
            }
            column(ShipmentNoArray4; ShipmentNoArray[4])
            {
            }
            column(ShipmentNoArray5; ShipmentNoArray[5])
            {
            }
            column(ShipmentNoArray6; ShipmentNoArray[6])
            {
            }
            column(ShipmentNoArray7; ShipmentNoArray[7])
            {
            }
            column(ShipmentNoArray8; ShipmentNoArray[8])
            {
            }
            column(ShipmentNoArray9; ShipmentNoArray[9])
            {
            }
            column(ShipmentNoArray10; ShipmentNoArray[10])
            {
            }
            column(ShipmentNoArray11; ShipmentNoArray[11])
            {
            }
            column(ShipmentNoArray12; ShipmentNoArray[12])
            {
            }
            column(ShipmentNoArray13; ShipmentNoArray[13])
            {
            }
            column(ShipmentNoArray14; ShipmentNoArray[14])
            {
            }
            column(ShipmentNoArray15; ShipmentNoArray[15])
            {
            }
            column(ShipmentNoArray16; ShipmentNoArray[16])
            {
            }
            column(ShipmentNoArray17; ShipmentNoArray[17])
            {
            }
            column(ShipmentNoArray18; ShipmentNoArray[18])
            {
            }
            column(ShipmentNoArray19; ShipmentNoArray[19])
            {
            }
            column(ShipmentNoArray20; ShipmentNoArray[20])
            {
            }
            dataitem("Sales Invoice Line"; "Sales Invoice Line")
            {
                DataItemLink = "Document No." = FIELD("No.");
                DataItemTableView = WHERE("No." = FILTER(<> ''),
                                          Quantity = FILTER(<> 0));
                column(No_SalesLine; "Sales Invoice Line"."No.")
                {
                }
                column(Description_SalesLine; "Sales Invoice Line".Description)
                {
                }
                column(HSNCode_SalesLine; CompanyInformation.IBAN)
                {
                }
                column(UnitofMeasure_SalesLine; UOM)
                {
                }
                column(Quantity_SalesLine; "Sales Invoice Line".Quantity)
                {
                }
                column(UnitPrice_SalesLine; "Sales Invoice Line"."Unit Price")
                {
                }
                column(LineAmount_SalesLine; "Sales Invoice Line"."Line Amount")
                {
                }
                column(InvDiscountAmount_SalesLine; "Sales Invoice Line"."Inv. Discount Amount")
                {
                }
                column(LineDiscountAmount_PurchaseLine; "Line Discount Amount")
                {
                }
                column(Amount_PurchaseLine; Amount)
                {
                }
                column(VATBaseAmount_SalesInvoiceLine; "VAT Base Amount")
                {
                }
                column(VAT_SalesInvoiceLine; "VAT %")
                {
                }
                column(srno; srno)
                {
                }
                column(totvatamnt; totvatamnt)
                {
                }
                column(PartNumber; "Sales Invoice Line"."No.")
                {
                }
                column(CurrencyFactor; CurrencyFactor)
                {
                }
                column(AmtIncVat; "Sales Invoice Line"."Amount Including VAT")
                {
                }
                column(ItemVat; ItemVat)
                {
                }
                column(LineComments; LineComments)
                {
                }



                trigger OnAfterGetRecord()
                var
                // SalesShptLine: Record "Sales Shipment Line";
                // ItemLedgEntry: Record "Item Ledger Entry";
                // ValueEntry: Record "Value Entry";
                // IsDuplicate: Boolean;
                begin

                    // // j := 1 + j;
                    // // Message(Format(j));
                    // IsDuplicate := false;
                    // //Clear(SalesShpment);
                    // // Clear(ShipmentNoArray);
                    // "Sales Invoice Line".FilterPstdDocLineValueEntries(ValueEntry);
                    // if ValueEntry.FindSet() then
                    //     repeat
                    //         ItemLedgEntry.Get(ValueEntry."Item Ledger Entry No.");
                    //         if ItemLedgEntry."Document Type" = ItemLedgEntry."Document Type"::"Sales Shipment" then
                    //             if SalesShptLine.Get(ItemLedgEntry."Document No.", ItemLedgEntry."Document Line No.") then begin

                    //                 for i := 1 to 20 do begin
                    //                     if ShipmentNoArray[i] = SalesShptLine."Document No." then begin
                    //                         IsDuplicate := true;
                    //                     end;
                    //                 end;

                    //                 if not IsDuplicate then begin
                    //                     if ShipmentNoArray[j] = '' then begin
                    //                         ShipmentNoArray[j] := SalesShptLine."Document No.";
                    //                         j += 1;
                    //                     end;

                    //                 end;

                    //             end;
                    //     until ValueEntry.Next() = 0;
                    //// 


                    CLEAR(ChkPrint);
                    ChkPrint.InitTextVariable;
                    ChkPrint.FormatNoText(AmtInWord, ROUND(AmtToVend), '');



                    srno := srno + 1;

                    VATAmt := ("VAT %" * Amount) / 100;
                    totvatamnt := totvatamnt + VATAmt;
                    ItemVat := ("VAT %" * Amount) / 100;


                    CurrencyFactor := 0;
                    IF SalesHeader.GET("Document No.") THEN
                        IF SalesHeader."Currency Factor" <> 0 THEN
                            CurrencyFactor := 1 / SalesHeader."Currency Factor"
                        ELSE
                            CurrencyFactor := 1;

                    IF ItemCard.GET("Sales Invoice Line"."No.") THEN
                        UOM := ItemCard."Sales Unit of Measure"
                    ELSE
                        UOM := '';



                    //comments
                    LineComments := '';
                    SalesCmtLine.RESET;
                    //SalesCmtLine.SETRANGE("Document Type","Sales Invoice Line""Document Type");
                    SalesCmtLine.SETRANGE("No.", "Document No.");
                    SalesCmtLine.SETRANGE("Document Line No.", "Line No.");
                    IF SalesCmtLine.FINDFIRST THEN
                        REPEAT
                            LineComments := LineComments + ' ' + SalesCmtLine.Comment;
                        UNTIL SalesCmtLine.NEXT = 0;
                end;

                trigger OnPreDataItem()
                begin
                    srno := 0;
                    VATAmt := 0;
                    totvatamnt := 0;
                    ItemVat := 0;
                end;
            }

            // dataitem("Sales Shipment Header"; "Sales Shipment Header")
            // {
            //     DataItemLink = "Order No." = field("Order No.");

            //     column(ShipmentNo_; "No.") { }

            // }

            trigger OnAfterGetRecord()

            var
                SalesShptLine: Record "Sales Shipment Line";
                ItemLedgEntry: Record "Item Ledger Entry";
                ValueEntry: Record "Value Entry";
                IsDuplicate: Boolean;
                SalesInvoiceLineRec: record "Sales Invoice Line";
                j: Integer;
                i: Integer;

            begin

                j := 1;
                // Message(Format(j));

                Clear(SalesInvoiceLineRec);
                Clear(ShipmentNoArray);

                SalesInvoiceLineRec.SetRange("Document No.", "Sales Invoice Header"."No.");
                SalesInvoiceLineRec.SetRange(type, SalesInvoiceLineRec.type::Item);
                SalesInvoiceLineRec.SetFilter(Quantity, '<> %1', 0);
                if SalesInvoiceLineRec.FindSet() then begin
                    repeat
                        IsDuplicate := false;
                        SalesInvoiceLineRec.FilterPstdDocLineValueEntries(ValueEntry);
                        if ValueEntry.FindSet() then
                            repeat
                                ItemLedgEntry.Get(ValueEntry."Item Ledger Entry No.");
                                if ItemLedgEntry."Document Type" = ItemLedgEntry."Document Type"::"Sales Shipment" then
                                    if SalesShptLine.Get(ItemLedgEntry."Document No.", ItemLedgEntry."Document Line No.") then begin

                                        for i := 1 to 20 do begin
                                            if ShipmentNoArray[i] = SalesShptLine."Document No." then begin
                                                IsDuplicate := true;
                                                break;
                                            end;
                                        end;

                                        if not IsDuplicate then begin

                                            ShipmentNoArray[j] := SalesShptLine."Document No.";
                                            j += 1;
                                        end;

                                    end;
                            until ValueEntry.Next() = 0;
                    until SalesInvoiceLineRec.Next = 0;
                    // Message(Format(SalesInvoiceLineRec.Count));
                end;

                //// 

                //

                IF "Sales Invoice Header"."Order No." <> '' THEN
                    SalesOrderNo := "Sales Invoice Header"."Order No."
                ELSE
                    SalesOrderNo := "Sales Invoice Header"."Your Reference";
                IF "Currency Code" = '' THEN
                    CurrText := 'AED'
                ELSE
                    CurrText := "Currency Code";

                IF SalesPerson.GET("Sales Invoice Header"."Salesperson Code") THEN
                    IF Currency.GET("Currency Code") THEN BEGIN
                        CurrencyExchangeRate.GetLastestExchangeRate(Currency.Code, ExchangeRateDate, ExchangeRateAmt);

                    END;

                CLEAR(AmtToVend);
                SalesInvoiceLine.RESET;
                SalesInvoiceLine.SETRANGE("Document No.", "No.");
                IF SalesInvoiceLine.FINDFIRST THEN
                    REPEAT
                        AmtToVend += SalesInvoiceLine.Amount + ((SalesInvoiceLine."VAT %" * SalesInvoiceLine.Amount) / 100);
                    UNTIL SalesInvoiceLine.NEXT = 0;


                CLEAR(TotalLineAmt);
                CLEAR(TotalInvDisc);
                CLEAR(VATAmt);
                SaleLine.RESET;
                SaleLine.SETFILTER(SaleLine."Document No.", "No.");
                IF SaleLine.FINDFIRST THEN BEGIN
                    REPEAT
                        TotalLineAmt += SaleLine."Line Amount";
                        TotalInvDisc += SaleLine."Inv. Discount Amount";
                        VATAmt += (SaleLine."VAT %" * SaleLine.Amount) / 100;
                    UNTIL SaleLine.NEXT = 0;
                END;

                CLEAR(ChkPrint);
                ChkPrint.InitTextVariable;
                ChkPrint.FormatNoText(AmtInWordVat, ROUND(VATAmt), '');

                //DNNo   := '';
                DNDate := 0D;
                SSH.RESET;
                SSH.SETFILTER(SSH."Order No.", "Sales Invoice Header"."Order No.");
                IF SSH.FINDFIRST THEN BEGIN
                    IF "Sales Invoice Header"."Order No." <> '' THEN BEGIN

                        DNDate := SSH."Order Date";
                    END;
                END;
                DOrepeat := '';
                DNNo := '';
                SalesInvRec.RESET;
                SalesInvRec.SETRANGE("Document No.", "No.");
                IF SalesInvRec.FINDFIRST THEN BEGIN
                    REPEAT
                        IF DOrepeat <> SalesInvRec."Shipment No." THEN BEGIN
                            DNNo := SalesInvRec."Shipment No." + ',' + DNNo;
                            DOrepeat := SalesInvRec."Shipment No.";
                        END;
                        IF SalesInvRec."Shipment No." = '' THEN BEGIN
                            SSH.RESET;
                            SSH.SETRANGE("Order No.", SalesInvRec."Order No.");
                            IF SSH.FINDFIRST THEN
                                DNNo := SSH."No.";
                        END;

                    UNTIL SalesInvRec.NEXT = 0;

                END;

                GLSetup.GET;
                IF Currency.GET("Currency Code") THEN
                    CurrencyCode := Currency.Code
                ELSE
                    CurrencyCode := GLSetup."Local Currency Symbol";

                CLEAR(CustVATRegNo);
                CustomerRec.RESET;
                CustomerRec.SETFILTER(CustomerRec."No.", "Sell-to Customer No.");
                IF NOT CustomerRec.FINDFIRST THEN BEGIN
                    CustVATRegNo := ''
                END ELSE
                    CustVATRegNo := CustomerRec."VAT Registration No.";


                IF ShiptoAddress.GET("Sales Invoice Header"."Sell-to Customer No.") THEN
                    IF Currency.GET("Currency Code") THEN;
            end;

            trigger OnPreDataItem()
            begin
                IF Gdoc <> '' THEN
                    SETRANGE("No.", Gdoc);
            end;
        }
    }
    //////

    requestpage
    {

        layout
        {
            area(content)
            {

            }
        }

        actions
        {
        }

        trigger OnOpenPage()
        begin
            //HideLogo := FALSE;
        end;
    }

    labels
    {
    }

    trigger OnInitReport()
    begin
        CompanyInformation.GET;
        CompanyInformation.CALCFIELDS(Picture);
    end;

    var
        ShipmentNoArray: array[20] of Code[20];
        SalesShpment: record "Sales Shipment Header";
        CompanyInformation: Record 79;
        CustomerRec: Record 18;
        ShiptoAddress: Record 222;
        ChkPrint: Report 1401;
        AmtToVend: Decimal;
        AmtInWord: array[2] of Text[80];
        srno: Integer;
        Gdoc: Code[20];
        SalesInvoiceLine: Record 113;
        VATAmt: Decimal;
        TotalLineAmt: Decimal;
        TotalInvDisc: Decimal;
        totvatamnt: Decimal;
        Currency: Record 4;
        CurrencyExchangeRate: Record 330;
        ExchangeRateAmt: Decimal;
        ExchangeRateDate: Date;
        SalesHeader: Record 112;
        CurrencyFactor: Decimal;
        GLSetup: Record 98;
        CurrencyCode: Code[10];
        SaleLine: Record 113;
        CurrText: Text[10];
        SalesPerson: Record 13;
        SSH: Record 110;
        DNNo: Code[250];
        DNDate: Date;
        RespCent: Record 5714;
        CustVATRegNo: Text;
        ItemVat: Decimal;
        AmtInWordVat: array[2] of Text[80];
        ItemCard: Record 27;
        UOM: Code[20];
        SalesInvRec: Record 113;
        DOrepeat: Code[20];
        SalesOrderNo: Text[250];
        SalesCmtLine: Record 44;
        LineComments: Text[250];


    procedure SetDoc(Ldoc: Code[20])
    begin
        Gdoc := Ldoc;
    end;
}

