report 80009 "LIT Purchase Credit Memo - IAX"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Src/Layout/Purchase Credit Memo - IAX.rdlc';
    Caption = 'Purchase Credit Memo - IAX';
    PreviewMode = PrintLayout;

    dataset
    {
        dataitem(DataItem1; "Purch. Cr. Memo Hdr.")
        {
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
            column(Email; CompanyInformation."Home Page")
            {
            }
            column(Single_TRN; 'TRN # : ' + CompanyInformation."VAT Registration No.")
            {
            }
            column(No_PurchCrMemoHdr; "No.")
            {
            }
            column(BuyfromVendorNo_PurchCrMemoHdr; "Buy-from Vendor No.")
            {
            }
            column(BuyfromVendorName_PurchCrMemoHdr; "Buy-from Vendor Name")
            {
            }
            column(BuyfromVendorName2_PurchCrMemoHdr; "Buy-from Vendor Name 2")
            {
            }
            column(BuyfromAddress_PurchCrMemoHdr; "Buy-from Address")
            {
            }
            column(BuyfromAddress2_PurchCrMemoHdr; "Buy-from Address 2")
            {
            }
            column(BuyfromCity_PurchCrMemoHdr; "Buy-from City" + ' , ' + "Buy-from Country/Region Code")
            {
            }
            column(BuyfromContact_PurchCrMemoHdr; "Buy-from Contact")
            {
            }
            column(BuyfromCounty_PurchCrMemoHdr; "Buy-from County")
            {
            }
            column(BuyfromCountryRegionCode_PurchCrMemoHdr; "Buy-from Country/Region Code")
            {
            }
            column(BuyfromContactNo_PurchCrMemoHdr; VendRec."Phone No.")
            {
            }
            column(PostingDate_PurchCrMemoHdr; "Posting Date")
            {
            }
            column(ExpectedReceiptDate_PurchCrMemoHdr; "Expected Receipt Date")
            {
            }
            column(DocumentDate_PurchCrMemoHdr; "Document Date")
            {
            }
            column(PurchaserName; PurchaserName)
            {
            }
            column(YourReference_PurchCrMemoHdr; "Your Reference")
            {
            }
            column(VendorCrMemoNo_PurchCrMemoHdr; "Vendor Cr. Memo No.")
            {
            }
            column(CurrencyCode_PurchCrMemoHdr; CurrText)
            {
            }
            column(VATRegistrationNo_PurchCrMemoHdr; "VAT Registration No.")
            {
            }
            column(AmtInWord; AmtInWord[1] + ' ' + AmtInWord[2])
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
            column(VendorEmail; VendRec."E-Mail")
            {
            }
            column(VATAmt; VATAmt)
            {
            }
            column(Remarks_PurchCrMemoHdr; "LIT Remarks")
            {
            }
            dataitem(DataItem9; "Purch. Cr. Memo Line")
            {
                DataItemLink = "Document No." = FIELD("No.");
                DataItemTableView = WHERE(Type = FILTER(<> ' '));
                column(srno; srno)
                {
                }
                column(No_PurchCrMemoLine; "No.")
                {
                }
                column(Description_PurchCrMemoLine; Description)
                {
                }
                column(Description3_PurcLine; "LIT Description 3")
                {
                }
                column(UnitofMeasure_PurchCrMemoLine; "Unit of Measure")
                {
                }
                column(Quantity_PurchCrMemoLine; Quantity)
                {
                }
                column(DirectUnitCost_PurchCrMemoLine; "Direct Unit Cost")
                {
                }
                column(VAT_PurchCrMemoLine; "VAT %")
                {
                }
                column(LineAmount_PurchCrMemoLine; "Line Amount")
                {
                }
                column(InvDiscountAmount_PurchCrMemoLine; "Inv. Discount Amount")
                {
                }
                column(totvatamnt; totvatamnt)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    CLEAR(ChkPrint);
                    srno := srno + 1;


                    ChkPrint.InitTextVariable;
                    ChkPrint.FormatNoText(AmtInWord, ROUND(TotalLineAmt) - (TotalInvDisc) + (VATAmt), CurrText);
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
                    END;

                IF SalesPurc_Rec.GET("Purchaser Code") THEN
                    PurchaserName := SalesPurc_Rec.Name;

                CLEAR(TotalLineAmt);
                CLEAR(TotalInvDisc);
                CLEAR(VATAmt);
                PurchCRMLine.RESET;
                PurchCRMLine.SETFILTER(PurchCRMLine."Document No.", "No.");
                IF PurchCRMLine.FINDFIRST THEN BEGIN
                    REPEAT
                        TotalLineAmt += PurchCRMLine."Line Amount";
                        TotalInvDisc += PurchCRMLine."Inv. Discount Amount";
                        VATAmt += (PurchCRMLine."VAT %" * PurchCRMLine.Amount) / 100;
                    UNTIL PurchCRMLine.NEXT = 0;
                END;
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
        PurchCRMLine: Record 125;
        TotalLineAmt: Decimal;
        TotalInvDisc: Decimal;
        CurrText: Text[10];
}

