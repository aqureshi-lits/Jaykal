report 80041 "LIT Purchase Order 2"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Src/Layout/Purchase Order 2.rdl';
    Caption = 'Purchase Order';
    PreviewMode = PrintLayout;

    dataset
    {
        dataitem(DataItem1; "Purchase Header")
        {
            DataItemTableView = WHERE("Document Type" = CONST(Order));
            RequestFilterFields = "No.";
            column(CompPic; CompanyInformation.Picture)
            {
            }
            column(CompanyTRN; 'TRN ' + CompanyInformation."VAT Registration No." + ' , Email  : ' + CompanyInformation."E-Mail")
            {
            }
            column(ComName; CompanyInformation.Name)
            {
            }
            // column(Address; CompanyInformation.Address + ' , ' + CompanyInformation."Address 2")
            // {
            // }
            column(Address; CompanyInformation.Address)
            {
            }
            column(Addrss2; CompanyInformation."Address 2")
            {
            }
            column(City; CompanyInformation.City)
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
            column(Comp_Country; Comp_Country)
            {
            }
            column(Single_TRN; 'TRN ' + CompanyInformation."VAT Registration No.")
            {
            }
            column(CompFax; CompanyInformation."Fax No.")
            {
            }
            column(No_PurchaseHeader; "No.")
            {
            }
            column(BuyfromVendorNo_PurchaseHeader; "Buy-from Vendor No.")
            {
            }
            column(BuyfromVendorName_PurchaseHeader; "Buy-from Vendor Name")
            {
            }
            column(BuyfromVendorName2_PurchaseHeader; "Buy-from Vendor Name 2")
            {
            }
            column(BuyfromAddress_PurchaseHeader; "Buy-from Address")
            {
            }
            column(BuyfromAddress2_PurchaseHeader; "Buy-from Address 2")
            {
            }
            column(BuyfromCity_PurchaseHeader; "Buy-from City" + ' , ' + "Buy-from Country/Region Code")
            {
            }
            column(BuyfromContact_PurchaseHeader; "Buy-from Contact")
            {
            }
            column(BuyfromContactNo_PurchaseHeader; VendRec."Phone No.")
            {
            }
            column(BuyfromPostCode_PurchaseHeader; "Buy-from Post Code")
            {
            }
            column(BuyfromCounty_PurchaseHeader; "Buy-from County")
            {
            }
            column(BuyfromCountryRegionCode_PurchaseHeader; "Buy-from Country/Region Code")
            {
            }
            column(DocumentDate_PurchaseHeader; "Document Date")
            {
            }
            column(PostingDate_PurchaseHeader; "Posting Date")
            {
            }
            column(ExpectedReceiptDate_PurchaseHeader; "Expected Receipt Date")
            {
            }
            column(PaymentTermsCode_PurchaseHeader; "Payment Terms Code")
            {
            }
            column(PurchaserCode_PurchaseHeader; "Purchaser Code")
            {
            }
            column(PurchaserName; PurchaserName)
            {
            }
            column(YourRef; "Your Reference")
            {
            }
            column(CurrencyCode_PurchaseHeader; CurrText)
            {
            }
            column(AmtInWord; AmtInWord[1] + ' ' + AmtInWord[2])
            {
            }
            column(YoureRefNo; "Your Reference")
            {
            }
            column(VATRegistrationNo_PurchaseHeader; "VAT Registration No.")
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
            column(QuoteNo; "Quote No.")
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
            //Added by FA
            column(PaymentDes; PaymentDes) { }
            dataitem(DataItem9; "Purchase Line")
            {
                DataItemLink = "Document No." = FIELD("No.");
                column(srno; srno)
                {
                }
                column(PartNo_PurchaseLine; "No.")
                {
                }
                column(Description_PurchaseLine; Description)
                {
                }
                column(Description3_PurcLine; "LIT Description 3")
                {
                }
                column(ItemRec_Description3; ItemRec."LIT Description 3")
                {
                }
                column(ExpectedReceiptDate_PurchaseLine; "Expected Receipt Date")
                {
                }
                column(Quantity_PurchaseLine; Quantity)
                {
                }
                column(UnitofMeasure_PurchaseLine; "Unit of Measure")
                {
                }
                column(DirectUnitCost_PurchaseLine; "Direct Unit Cost")
                {
                }
                column(VAT_PurchaseLine; "VAT %")
                {
                }
                column(LineAmount_PurchaseLine; "Line Amount")
                {
                }
                column(LineDiscountAmount_PurchaseLine; "Line Discount Amount")
                {
                }
                column(VATBaseAmount_PurchaseLine; "VAT Base Amount")
                {
                }
                column(totvatamnt; totvatamnt)
                {
                }
                column(SubTotal; ("Line Amount") - ("Inv. Discount Amount"))
                {
                }
                column(InvDiscountAmount_PurchaseLine; "Inv. Discount Amount")
                {
                }
                column(GrandTotal; "Line Amount" - "Inv. Discount Amount" + "VAT Base Amount")
                {
                }
                column(Comment; "LIT Comment")
                {
                }
                column(VAT_Prod__Posting_Group; "VAT Prod. Posting Group") { }
                column(Type; Type)
                {
                }
                dataitem(DataItem35; "Purch. Comment Line")
                {
                    DataItemLink = "Document Type" = FIELD("Document Type"),
                                   "No." = FIELD("Document No."),
                                   "Document Line No." = FIELD("Line No.");
                    column(Pcomment; Comment)
                    {
                    }
                }

                trigger OnAfterGetRecord()
                begin
                    CLEAR(ChkPrint);
                    if Type <> Type::" " then
                        srno := srno + 1;


                    ChkPrint.InitTextVariable;
                    ChkPrint.FormatNoText(AmtInWord, ROUND(TotalLineAmt) - (TotalInvDisc) + (VATAmt), "Currency Code");

                    IF ItemRec.Get("No.") THEN begin
                    end;

                end;

                trigger OnPreDataItem()
                begin
                    srno := 0;
                end;
            }

            trigger OnAfterGetRecord()
            var
                PaymentTerms: Record "Payment Terms";
            begin
                if PaymentTerms.get(DataItem1."Payment Terms Code") then
                    PaymentDes := PaymentTerms.Description;

                IF "Currency Code" = '' THEN
                    CurrText := 'AED'
                ELSE
                    CurrText := "Currency Code";

                IF VendRec.GET("Buy-from Vendor No.") THEN
                    IF LocationRec.GET("Location Code") THEN BEGIN
                        Name_Deliv := LocationRec.Name;
                        Add_Del := LocationRec.Address;
                        Add2_Del := LocationRec."Address 2";
                        PhoneNo_Del := LocationRec."Phone No.";
                    END;

                IF SalesPurc_Rec.GET("Purchaser Code") THEN
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
                    SETRANGE("No.", Gdoc);
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
    var
        Country_Region: Record "Country/Region";
    begin
        CompanyInformation.GET;
        CompanyInformation.CALCFIELDS(Picture);
        if Country_Region.Get(CompanyInformation."Country/Region Code") then
            Comp_Country := Country_Region.Name;
    end;

    var
        Comp_Country: Text[50];
        PaymentDes: Text[100];
        CompanyInformation: Record 79;
        ChkPrint: Report Check;
        AmtInWord: array[2] of Text[80];
        srno: Integer;
        Gdoc: Code[20];
        VATAmt: Decimal;
        totvatamnt: Decimal;
        VendRec: Record 23;
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
        ItemRec: Record 27;

    procedure SetDoc(Ldoc: Code[20])
    begin
        Gdoc := Ldoc;
    end;
}

