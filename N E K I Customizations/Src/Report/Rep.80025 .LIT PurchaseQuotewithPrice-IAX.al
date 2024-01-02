report 80025 "LIT PurchaseQuotewithPrice-IAX"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Src/Layout/Purchase Quote with Price-IAX.rdlc';
    Caption = 'Purchase Quote with Price-IAX';
    PreviewMode = PrintLayout;

    dataset
    {
        dataitem(DataItem1; "Purchase Header")
        {
            DataItemTableView = WHERE("Document Type" = CONST(Quote));
            RequestFilterFields = "No.";
            column(Picture_CompanyInformation; CompanyInformation.Picture)
            {
            }
            column(ComName; CompanyInformation.Name)
            {
            }
            column(Address; CompanyInformation.Address)
            {
            }
            column(Addrss2; CompanyInformation."Address 2")
            {
            }
            column(City; CompanyInformation.City)
            {
            }
            column(CompanyTRN; CompanyInformation."VAT Registration No.")
            {
            }
            column(CityandCountry; 'P.O. BOX. No. : ' + CompanyInformation."Post Code" + ', ' + CompanyInformation.City + ' - ' + CompanyInformation."Country/Region Code")
            {
            }
            column(CompPhone; 'Tel No. : ' + CompanyInformation."Phone No.")
            {
            }
            column(CompFax; 'Fax No. : ' + CompanyInformation."Fax No.")
            {
            }
            column(Comp_Post; 'P.O. BOX. No. : ' + CompanyInformation."Post Code")
            {
            }
            column(CompEmail; 'Email : ' + CompanyInformation."E-Mail")
            {
            }
            column(Single_TRN; 'TRN # : ' + CompanyInformation."VAT Registration No.")
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
            column(CurrencyCode_PurchaseHeader; "Currency Code")
            {
            }
            column(AmtInWord; AmtInWord[1] + ' ' + AmtInWord[2])
            {
            }
            column(YoureRefNo; "Your Reference")
            {
            }
            column(VendorOrderNo_PurchaseHeader; "Vendor Order No.")
            {
            }
            column(VendorShipmentNo_PurchaseHeader; "Vendor Shipment No.")
            {
            }
            column(VendorInvoiceNo_PurchaseHeader; "Vendor Invoice No.")
            {
            }
            column(VendorCrMemoNo_PurchaseHeader; "Vendor Cr. Memo No.")
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
            column(Email_Del; Email_Del)
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
            column(Remarks_PurchaseHeader; "LIT Remarks")
            {
            }

            dataitem(DataItem9; "Purchase Line")
            {
                DataItemLink = "Document No." = FIELD("No."),
                               "Document Type" = FIELD("Document Type");
                column(srno; srno)
                {
                }
                column(PartNo_PurchaseLine; "No." + ' ' + "Variant Code")
                {
                }
                column(Variant_Code; "Variant Code")
                {
                }
                column(Description_PurcLine; Description)
                {
                }
                column(Description3_PurcLine; "LIT Description 3")
                {
                }
                column(Shortcut_Dimension_1_Code; "Shortcut Dimension 1 Code")
                {
                }
                column(Shortcut_Dimension_2_Code; "Shortcut Dimension 2 Code")
                {
                }
                column(Dimension_Set_ID; "Dimension Set ID")
                {
                }
                column(Description_PurchaseLine; Description + ' ' + ItemRec."Description 2" + ' ' + ItemRec."LIT Description 3")
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
                column(EquipmentID; EquipmentID)
                {
                }
                column(ContractNo; ContractNo)
                {
                }

                column(Comment; "LIT Comment")
                {
                }


                trigger OnAfterGetRecord()
                begin
                    CLEAR(ChkPrint);
                    srno := srno + 1;


                    ChkPrint.InitTextVariable;
                    ChkPrint.FormatNoText(AmtInWord, ROUND(TotalLineAmt) - (TotalInvDisc) + (VATAmt), "Currency Code");

                    IF ItemRec.Get("No.") THEN begin
                    end;

                    GLSetup.Get();
                    DSERec.Reset;
                    DSERec.SetRange("Dimension Set ID", "Dimension Set ID");
                    DSERec.SetRange("Dimension Code", GLSetup."Shortcut Dimension 6 Code");
                    IF DSERec.FindFirst THEN begin
                        ContractNo := DSERec."Dimension Value Code";
                        // Message(DSERec."Dimension Value Code");
                    end;

                    DSERec.Reset;
                    DSERec.SetRange("Dimension Set ID", "Dimension Set ID");
                    DSERec.SetRange("Dimension Code", GLSetup."Shortcut Dimension 5 Code");
                    IF DSERec.FindFirst THEN begin
                        EquipmentID := DSERec."Dimension Value Code";
                        //   Message(DSERec."Dimension Value Code");
                    end;

                end;

                trigger OnPreDataItem()
                begin
                    srno := 0;
                end;
            }

            trigger OnAfterGetRecord()
            begin
                IF "Currency Code" = '' THEN
                    CurrText := 'USD'
                ELSE
                    CurrText := "Currency Code";

                IF VendRec.GET("Buy-from Vendor No.") THEN
                    IF LocationRec.GET("Location Code") THEN BEGIN
                        Name_Deliv := LocationRec.Name;
                        Add_Del := LocationRec.Address;
                        Add2_Del := LocationRec."Address 2";
                        PhoneNo_Del := LocationRec."Phone No.";
                        Email_Del := LocationRec."E-Mail";
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
    begin
        CompanyInformation.GET;
        CompanyInformation.CALCFIELDS(Picture);
    end;

    var
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
        Email_Del: Text[30];
        SalesPurc_Rec: Record 13;
        PurchaserName: Text[40];
        PurchLine: Record 39;
        TotalLineAmt: Decimal;
        TotalInvDisc: Decimal;
        CurrText: Text[10];
        ItemRec: Record 27;
        GLSetup: Record 98;
        DSERec: Record 480;
        ContractNo: Code[20];
        EquipmentID: Code[20];

    procedure SetDoc(Ldoc: Code[20])
    begin
        Gdoc := Ldoc;
    end;
}

