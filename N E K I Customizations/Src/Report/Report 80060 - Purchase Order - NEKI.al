report 80060 "Purchase Order - IAX"
{
    // version IAX Frz

    DefaultLayout = RDLC;
    RDLCLayout = './Src/Layout/RGS Reports/Purchase Order - IAX.rdlc';
    PreviewMode = PrintLayout;

    dataset
    {
        dataitem("Purchase Header"; "Purchase Header")
        {
            DataItemTableView = WHERE("Document Type" = CONST(Order));
            RequestFilterFields = "No.";
            column(CompPic; CompanyInformation.Picture)
            {
            }
            column(CompanyTRN; 'TRN No. : ' + CompanyInformation."VAT Registration No." + ' , Email  : ' + CompanyInformation."E-Mail")
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
            column(CompPhone; 'Phone No. : ' + CompanyInformation."Phone No." + ', Fax No. : ' + CompanyInformation."Fax No.")
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
            column(No_PurchaseHeader; "Purchase Header"."No.")
            {
            }
            column(BuyfromVendorNo_PurchaseHeader; "Purchase Header"."Buy-from Vendor No.")
            {
            }
            column(BuyfromVendorName_PurchaseHeader; "Purchase Header"."Buy-from Vendor Name")
            {
            }
            column(BuyfromVendorName2_PurchaseHeader; "Purchase Header"."Buy-from Vendor Name 2")
            {
            }
            column(BuyfromAddress_PurchaseHeader; "Purchase Header"."Buy-from Address")
            {
            }
            column(BuyfromAddress2_PurchaseHeader; "Purchase Header"."Buy-from Address 2")
            {
            }
            column(BuyfromCity_PurchaseHeader; "Purchase Header"."Buy-from City" + ' , ' + "Purchase Header"."Buy-from Country/Region Code")
            {
            }
            column(BuyfromContact_PurchaseHeader; "Purchase Header"."Buy-from Contact")
            {
            }
            column(BuyfromContactNo_PurchaseHeader; VendRec."Phone No.")
            {
            }
            column(BuyfromPostCode_PurchaseHeader; "Purchase Header"."Buy-from Post Code")
            {
            }
            column(BuyfromCounty_PurchaseHeader; "Purchase Header"."Buy-from County")
            {
            }
            column(BuyfromCountryRegionCode_PurchaseHeader; "Purchase Header"."Buy-from Country/Region Code")
            {
            }
            column(DocumentDate_PurchaseHeader; "Purchase Header"."Document Date")
            {
            }
            column(PostingDate_PurchaseHeader; "Purchase Header"."Posting Date")
            {
            }
            column(ExpectedReceiptDate_PurchaseHeader; "Purchase Header"."Expected Receipt Date")
            {
            }
            column(PaymentTermsCode_PurchaseHeader; "Purchase Header"."Payment Terms Code")
            {
            }
            column(PurchaserCode_PurchaseHeader; "Purchase Header"."Purchaser Code")
            {
            }
            column(PurchaserName; PurchaserName)
            {
            }
            column(YourRef; "Purchase Header"."Your Reference")
            {
            }
            column(CurrencyCode_PurchaseHeader; CurrText)
            {
            }
            column(AmtInWord; AmtInWord[1] + ' ' + AmtInWord[2])
            {
            }
            column(YoureRefNo; "Purchase Header"."Your Reference")
            {
            }
            column(VATRegistrationNo_PurchaseHeader; "Purchase Header"."VAT Registration No.")
            {
            }
            column(Name_Deliv; Name_Deliv)
            {
            }
            column(Add_Del; Add_Del)
            {
            }
            column(Add2_Del; Add2_Del)
            {
            }
            column(PhoneNo_Del; PhoneNo_Del)
            {
            }
            column(QuoteNo; "Purchase Header"."Quote No.")
            {
            }
            column(VendorEmail; VendRec."E-Mail")
            {
            }
            column(VATAmt; VATAmt)
            {
            }
            column(Remarks_PurchaseHeader; CompanyInformation."Ship-to County")
            {
            }
            dataitem("Purchase Line"; "Purchase Line")
            {
                DataItemLink = "Document No." = FIELD("No.");
                column(srno; srno)
                {
                }
                column(PartNo_PurchaseLine; "Purchase Line"."No.")
                {
                }
                column(Description_PurchaseLine; "Purchase Line".Description)
                {
                }
                column(ExpectedReceiptDate_PurchaseLine; "Purchase Line"."Expected Receipt Date")
                {
                }
                column(Quantity_PurchaseLine; "Purchase Line".Quantity)
                {
                }
                column(UnitofMeasure_PurchaseLine; "Purchase Line"."Unit of Measure")
                {
                }
                column(DirectUnitCost_PurchaseLine; "Purchase Line"."Direct Unit Cost")
                {
                }
                column(VAT_PurchaseLine; "Purchase Line"."VAT %")
                {
                }
                column(LineAmount_PurchaseLine; "Purchase Line"."Line Amount")
                {
                }
                column(LineDiscountAmount_PurchaseLine; "Purchase Line"."Line Discount Amount")
                {
                }
                column(VATBaseAmount_PurchaseLine; "Purchase Line"."VAT Base Amount")
                {
                }
                column(totvatamnt; totvatamnt)
                {
                }
                column(SubTotal; ("Purchase Line"."Line Amount") - ("Purchase Line"."Inv. Discount Amount"))
                {
                }
                column(InvDiscountAmount_PurchaseLine; "Purchase Line"."Inv. Discount Amount")
                {
                }
                column(GrandTotal; "Purchase Line"."Line Amount" - "Purchase Line"."Inv. Discount Amount" + "Purchase Line"."VAT Base Amount")
                {
                }
                dataitem("Purch. Comment Line"; "Purch. Comment Line")
                {
                    DataItemLink = "Document Type" = FIELD("Document Type"),
                                   "No." = FIELD("Document No."),
                                   "Document Line No." = FIELD("Line No.");
                    column(Pcomment; "Purch. Comment Line".Comment)
                    {
                    }
                }

                trigger OnAfterGetRecord()
                begin
                    CLEAR(ChkPrint);
                    srno := srno + 1;


                    ChkPrint.InitTextVariable;
                    ChkPrint.FormatNoText(AmtInWord, ROUND(TotalLineAmt) - (TotalInvDisc) + (VATAmt), "Purchase Header"."Currency Code");
                end;

                trigger OnPreDataItem()
                begin
                    srno := 0;
                end;
            }

            trigger OnAfterGetRecord()
            begin


                IF "Currency Code" = '' THEN
                    CurrText := 'AED'
                ELSE
                    CurrText := "Currency Code";

                IF VendRec.GET("Purchase Header"."Buy-from Vendor No.") THEN
                    IF LocationRec.GET("Purchase Header"."Location Code") THEN BEGIN
                        Name_Deliv := LocationRec.Name;
                        Add_Del := LocationRec.Address;
                        Add2_Del := LocationRec."Address 2";
                        PhoneNo_Del := LocationRec."Phone No.";
                    END;

                IF SalesPurc_Rec.GET("Purchase Header"."Purchaser Code") THEN
                    PurchaserName := SalesPurc_Rec.Name;

                CLEAR(TotalLineAmt);
                CLEAR(TotalInvDisc);
                CLEAR(VATAmt);
                PurchLine.RESET;
                PurchLine.SETRANGE(PurchLine."Document Type", "Document Type");
                PurchLine.SETFILTER(PurchLine."Document No.", "No.");
                IF PurchLine.FINDFIRST THEN BEGIN
                    REPEAT
                        TotalLineAmt += PurchLine."Line Amount";
                        TotalInvDisc += PurchLine."Inv. Discount Amount";
                        VATAmt += (PurchLine."VAT %" * PurchLine.Amount) / 100;
                    UNTIL PurchLine.NEXT = 0;
                END;
            end;

            trigger OnPreDataItem()
            begin
                IF Gdoc <> '' THEN
                    "Purchase Header".SETRANGE("Purchase Header"."No.", Gdoc);
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

    trigger OnInitReport()
    begin
        CompanyInformation.GET;
        CompanyInformation.CALCFIELDS(Picture);
    end;

    var
        CompanyInformation: Record 79;
        ChkPrint: Report 1401;
        AmtToVend: Decimal;
        AmtInWord: array[2] of Text[80];
        srno: Integer;
        Gdoc: Code[20];
        VATAmt: Decimal;
        totvatamnt: Decimal;
        VendRec: Record 23;
        TRNno: Code[30];
        LocationRec: Record 14;
        Name_Deliv: Text[60];
        Add_Del: Text[50];
        Add2_Del: Text[50];
        PhoneNo_Del: Code[20];
        SalesPurc_Rec: Record 13;
        PurchaserName: Text[40];
        PurchLine: Record 39;
        TotalLineAmt: Decimal;
        TotalInvDisc: Decimal;
        CurrText: Text[10];
        RespCent: Record 5714;

    procedure SetDoc(Ldoc: Code[20])
    begin
        Gdoc := Ldoc;
    end;
}

