report 80086 "LIT CustomerOutstandingAmount"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Src/Layout/Finance Report Layout/CustomerOutStanding.rdlc';
    Caption = 'Customer OutStanding Amount';
    PreviewMode = PrintLayout;

    dataset
    {
        dataitem(DataItem1; "Customer")
        {
            // DataItemTableView = WHERE("Document Type" = CONST(Order));
            RequestFilterFields = "No.";
            column(Picture_CompanyInformation; CompanyInformation.Picture)
            {
            }
            column(CityandCountry; 'P.O. BOX. No. : ' + CompanyInformation."Post Code" + ', ' + CompanyInformation.City + ' - ' + CompanyInformation."Country/Region Code")
            {
            }
            column(CompPic; CompanyInformation.Picture)
            {
            }
            column(CompanyTRN; 'TRN No. : ' + CompanyInformation."VAT Registration No." + ' , Email  : ' + CompanyInformation."E-Mail")
            {
            }
            column(Single_TRN; 'TRN:' + CompanyInformation."VAT Registration No.")
            {
            }
            column(Email; CompanyInformation."Home Page")
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
            column(City; CompanyInformation.City + ' -' + CompanyInformation."Country/Region Code")
            {
            }
            column(CompPhone; 'Tel No. : ' + CompanyInformation."Phone No.")
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
            column(Vendor_Code; "No.")
            {
            }
            column(Vendor_Name; Name)
            {
            }
            // column(BuyfromVendorNo_PurchaseHeader; "Buy-from Vendor No.")
            // {
            // }
            // column(BuyfromVendorName_PurchaseHeader; "Buy-from Vendor Name")
            // {
            // }
            // column(BuyfromVendorName2_PurchaseHeader; "Buy-from Vendor Name 2")
            // {
            // }
            // column(BuyfromAddress_PurchaseHeader; "Buy-from Address")
            // {
            // }
            // column(BuyfromAddress2_PurchaseHeader; "Buy-from Address 2")
            // {
            // }
            // column(BuyfromCity_PurchaseHeader; "Buy-from City" + ' , ' + "Buy-from Country/Region Code")
            // {
            // }
            // column(BuyfromContact_PurchaseHeader; "Buy-from Contact")
            // {
            // }
            // column(BuyfromContactNo_PurchaseHeader; VendRec."Phone No.")
            // {
            // }
            // column(BuyfromPostCode_PurchaseHeader; "Buy-from Post Code")
            // {
            // }
            // column(BuyfromCounty_PurchaseHeader; "Buy-from County")
            // {
            // }
            // column(BuyfromCountryRegionCode_PurchaseHeader; "Buy-from Country/Region Code")
            // {
            // }
            // column(DocumentDate_PurchaseHeader; "Document Date")
            // {
            // }
            // column(PostingDate_PurchaseHeader; "Posting Date")
            // {
            // }
            // column(ExpectedReceiptDate_PurchaseHeader; "Expected Receipt Date")
            // {
            // }
            column(PaymentTermsCode_PurchaseHeader; "Payment Terms Code")
            {
            }
            // column(PurchaserCode_PurchaseHeader; "Purchaser Code")
            // {
            // }
            column(PurchaserName; PurchaserName)
            {
            }
            // column(YourRef; "Your Reference")
            // {
            // }
            column(CurrencyCode_PurchaseHeader; CurrText)
            {
            }
            column(AmtInWord; AmtInWord[1] + ' ' + AmtInWord[2])
            {
            }
            // column(YoureRefNo; "Your Reference")
            // {
            // }
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
            column(PhoneNo_Email; PhoneNo_Email)
            {
            }

            // column(QuoteNo; "Quote No.")
            // {
            // }
            column(VendorEmail; VendRec."E-Mail")
            {
            }
            column(VATAmt; VATAmt)
            {
            }
            // column(Remarks_PurchaseHeader; Remarks)
            // {
            // }

            // column(Shortcut_Dimension_1_Code; "Shortcut Dimension 1 Code")
            // {
            // }
            column(Shipment_Method_Code; "Shipment Method Code")
            {
            }
            column(Prices_Including_VAT; "Prices Including VAT")
            {
            }
            column(AsOfDate; AsOfDate)
            {
            }

            column(BankAccount; BankAccount)
            {
            }

            column(Bank_Name; BankRec.Name)
            {
            }
            column(Bank_BranchNo; BankRec."Bank Branch No.")
            {
            }
            column(Bank_AccountNo; BankRec."Bank Account No.")
            {
            }
            column(Bank_IBAN; BankRec.IBAN)
            {
            }
            // column(Bank_Beneficiary; BankRec.benef)
            // {
            // }

            column(Bank_Name2; BankRec."Name 2")
            {
            }
            column(Bank_SWIFTCode; BankRec."SWIFT Code")
            {
            }

            column(Bank_Currency; BankRec."Currency Code")
            {
            }

            dataitem(DataItem9; "Cust. Ledger Entry")
            {

                DataItemLink = "Customer No." = FIELD("No.");
                RequestFilterFields = "Date Filter";
                DataItemTableView = sorting("Document Date") order(ascending) where(Open = const(true));
                column(VendorPostingDate; "Document Date")
                {
                }
                // column(VendorPostingDate; "Posting Date")
                // {
                // }
                column(Document_Type; "Document Type")
                {
                }
                column(Document_No_; "Document No.")
                {
                }
                column(Description; Description)
                {
                }
                column(External_Document_No_; "External Document No.")
                {
                }
                column(Original_Amt___LCY_; "Original Amt. (LCY)")
                {
                }
                column(Debit_Amount__LCY_; "Debit Amount (LCY)")
                {
                }
                column(Credit_Amount__LCY_; "Credit Amount (LCY)")
                {
                }
                column(Currency_Code; "Currency Code")
                {
                }
                column(Remaining_Amt; "Remaining Amount")
                {
                }
                column(Remaining_Amt___LCY_; "Remaining Amt. (LCY)")
                {
                }
                column(OverDueDays; OverDueDays)
                {
                }
                column(Due_Date; "Due Date")
                {
                }
                column(Payment_Method_Code; "Payment Method Code")
                {
                }
                column(srno; srno)
                {
                }

                column(Remarks; GLEntry."LIT Remarks")
                {
                }
                column(Shiptoname; Shiptoname) { }
                column(Posting_Date; "Posting Date")
                { }
                column(OpenBalanceDate; OpenBalanceDate)
                { }
                column(OutStandingDate; OutStandingDate)
                { }
                // column(PartNo_PurchaseLine; "No.")
                // {
                // }
                // // column(Description_PurchaseLine; Description)
                // // {
                // // }
                // column(Description3_PurcLine; "Description 3")
                // {
                // }
                // column(ItemRec_Description3; ItemRec."Description 3")
                // {
                // }
                // column(ExpectedReceiptDate_PurchaseLine; "Expected Receipt Date")
                // {
                // }
                // column(Quantity_PurchaseLine; Quantity)
                // {
                // }
                // column(UnitofMeasure_PurchaseLine; "Unit of Measure")
                // {
                // }
                // column(DirectUnitCost_PurchaseLine; "Direct Unit Cost")
                // {
                // }
                // column(VAT_PurchaseLine; "VAT %")
                // {
                // }
                // column(LineAmount_PurchaseLine; "Line Amount")
                // {
                // }
                // column(LineDiscountAmount_PurchaseLine; "Line Discount Amount")
                // {
                // }
                // column(VATBaseAmount_PurchaseLine; "VAT Base Amount")
                // {
                // }
                // column(totvatamnt; totvatamnt)
                // {
                // }
                // column(SubTotal; ("Line Amount") - ("Inv. Discount Amount"))
                // {
                // }
                // column(InvDiscountAmount_PurchaseLine; "Inv. Discount Amount")
                // {
                // }
                // column(GrandTotal; "Line Amount" - "Inv. Discount Amount" + "VAT Base Amount")
                // {
                // }
                // column(Comment; Comment)
                // {
                // }
                // column(Type; Type)
                // {
                // }
                // column(Amount; Amount)
                // {
                // }
                // column(PackingInfo; ItemRec.Packing)
                // {
                // }
                // dataitem(DataItem35; "Purch. Comment Line")
                // {
                //     DataItemLink = "Document Type" = FIELD("Document Type"),
                //                    "No." = FIELD("Document No."),
                //                    "Document Line No." = FIELD("Line No.");
                //     column(Pcomment; Comment)
                //     {
                //     }
                // }

                trigger OnAfterGetRecord()
                var
                    DateFilter: Date;
                    SalesInvoiceHeader: Record "Sales Invoice Header";
                    SalesCreditHeader: Record "Sales Cr.Memo Header";

                begin
                    CLEAR(ChkPrint);

                    // if Type <> Type::" " then
                    srno := srno + 1;


                    IF PricesIncludingVAT = true then begin
                        ChkPrint.InitTextVariable;
                        ChkPrint.FormatNoText(AmtInWord, ROUND(TotAmount) - (TotalInvDisc) + ROUND(VATAmt), "Currency Code");
                    end
                    else begin
                        ChkPrint.InitTextVariable;
                        ChkPrint.FormatNoText(AmtInWord, ROUND(TotalLineAmt) - (TotalInvDisc) + (VATAmt), "Currency Code");
                    end;
                    // OverDueDays := DataItem9."Posting Date" - AsOfDate;
                    // comment 6 June 2024
                    //OverDueDays := AsOfDate - DataItem9."Posting Date";
                    // comment 6 June 2024

                    // add nnew code 6 June 2024
                    DueDays := Today - DataItem9."Due Date";

                    if DueDays > 0 then begin
                        OverDueDays := Today - DataItem9."Due Date";
                    end
                    else begin
                        OverDueDays := 0;
                    end;

                    // add nnew code 6 June 2024
                    // ItemRec.Reset();
                    // ItemRec.SetRange("No.", "No.");
                    // if ItemRec.FindSet() then;
                    Shiptoname := '';
                    IF DataItem9."Document Type" = DataItem9."Document Type"::Invoice then begin
                        SalesInvoiceHeader.Reset();
                        SalesInvoiceHeader.SetRange("No.", DataItem9."Document No.");
                        if SalesInvoiceHeader.FindSet() then begin
                            if SalesInvoiceHeader."Ship-to Code" <> '' then
                                Shiptoname := SalesInvoiceHeader."Ship-to Name";
                        end
                    end
                    else
                        if DataItem9."Document Type" = DataItem9."Document Type"::"Credit Memo" then begin
                            SalesCreditHeader.Reset();
                            SalesCreditHeader.SetRange("No.", DataItem9."Document No.");
                            if SalesCreditHeader.FindSet() then begin
                                if SalesCreditHeader."Ship-to Code" <> '' then
                                    Shiptoname := SalesCreditHeader."Ship-to Name";
                            end
                        end;
                    GLEntry.Reset();
                    GLEntry.SetRange("Document No.", DataItem9."Document No.");
                    GLEntry.SetRange("Document Type", DataItem9."Document Type");
                    if GLEntry.FindSet() then begin

                    end;
                    //iif(Fields!Posting_Date.Value <= Fields!OpenBalanceDate.Value, 
                    //Fields!VendorPostingDate.Value, Fields!Posting_Date.Value)

                    Clear(OutStandingDate);
                    if ("Posting Date" <= OpenBalanceDate) then begin
                        OutStandingDate := DataItem9."Document Date";
                    end
                    else begin
                        OutStandingDate := DataItem9."Posting Date";
                    end;
                end;

                trigger OnPreDataItem()
                begin
                    srno := 0;
                    SetFilter("Posting Date", '<=%1', AsOfDate);
                    OpenBalanceDate := 20240331D;
                end;
            }

            trigger OnAfterGetRecord()
            var
                CustRec: Record Customer;
                CompanyInfo: Record "Company Information";
                CustomerLedgerEntry2: Record "Cust. Ledger Entry";


            begin

                PricesIncludingVAT := "Prices Including VAT";
                IF "Currency Code" = '' THEN
                    CurrText := 'AED'
                ELSE
                    CurrText := "Currency Code";


                IF BankRec.GET(BankAccount) THEN BEGIN
                END;


                // IF VendRec.GET("Buy-from Vendor No.") THEN begin
                //     if Dataitem1."Ship-to Name" = '' then begin
                //         CompanyInfo.Get();
                //         Name_Deliv := CompanyInfo.Name;
                //         Add_Del := CompanyInfo."Address";
                //         Add2_Del := CompanyInfo."Address 2";
                //         PhoneNo_Del := CompanyInfo."Phone No.";
                //         PhoneNo_Email := CompanyInfo."E-Mail";
                //     end
                //     else begin
                //         Name_Deliv := Dataitem1."Ship-to Name";
                //         Add_Del := Dataitem1."Ship-to Address";
                //         Add2_Del := Dataitem1."Ship-to Address 2";
                //         // PhoneNo_Del := Dataitem1."Lit Shift to Phone No";
                //         // PhoneNo_Email := Dataitem1."Lit Shift to Email";
                //     end;

                // end;



                //     
                // IF LocationRec.GET("Location Code") THEN BEGIN
                //     Name_Deliv := LocationRec.Name;
                //     Add_Del := LocationRec.Address;
                //     Add2_Del := LocationRec."Address 2";
                //     PhoneNo_Del := LocationRec."Phone No.";
                //     PhoneNo_Email := LocationRec."E-Mail";
                // END
                // else
                //     IF DataItem1."Lit Shift to Phone No" <> '' then begin
                //         Name_Deliv := DataItem1."Ship-to Name";
                //         Add_Del := DataItem1."Ship-to Address";
                //         Add2_Del := DataItem1."Ship-to Address";
                //         PhoneNo_Del := "Lit Shift to Phone No";
                //         PhoneNo_Email := "Lit Shift to Phone No";
                //     end
                //     else begin
                //         CompanyInfo.Get();
                //         Name_Deliv := CompanyInfo.Name;
                //         Add_Del := CompanyInfo.Address;
                //         Add2_Del := CompanyInfo."Address 2";
                //         PhoneNo_Del := CompanyInfo."Phone No.";
                //         PhoneNo_Email := CompanyInfo."E-Mail";
                //     end;

                // PhoneNo_Del := "ship to p";
                // PhoneNo_Email := "ship to email";

                // IF LocationRec.GET("customer  Code") THEN BEGIN
                //     Name_Deliv := LocationRec.Name;
                //     Add_Del := LocationRec.Address;
                //     Add2_Del := LocationRec."Address 2";
                //     PhoneNo_Del := LocationRec."Phone No.";
                //     PhoneNo_Email := LocationRec."E-Mail";
                // END;

                // IF SalesPurc_Rec.GET("Purchaser Code") THEN
                //     PurchaserName := SalesPurc_Rec.Name;

                // CLEAR(TotalLineAmt);
                // CLEAR(TotalInvDisc);
                // Clear(TotAmount);
                // CLEAR(VATAmt);
                // PurchLine.RESET;
                // PurchLine.SETRANGE(PurchLine."Document Type", "Document Type");
                // PurchLine.SETFILTER(PurchLine."Document No.", "No.");
                // IF PurchLine.FINDFIRST THEN BEGIN
                //     REPEAT
                //         TotalLineAmt += PurchLine."Line Amount";
                //         TotAmount += PurchLine."Amount";
                //         TotalInvDisc += PurchLine."Inv. Discount Amount";
                //         VATAmt += (PurchLine."VAT %" * PurchLine.Amount) / 100;
                //     UNTIL PurchLine.NEXT = 0;
                // END;



            end;

            trigger OnPreDataItem()
            begin
                Name_Deliv := '';
                Add_Del := '';
                Add2_Del := '';
                PhoneNo_Del := '';
                PhoneNo_Email := '';
                IF Gdoc <> '' THEN
                    SETRANGE("No.", Gdoc);
            end;
        }
    }

    requestpage
    {
        SaveValues = true;
        layout
        {
            area(content)
            {
                group("General")
                {
                    Caption = 'As Of Date';
                    field(AsOfDate; AsOfDate)
                    {
                        ApplicationArea = All;
                        Caption = 'As Of Date';
                        trigger OnValidate()
                        var
                            myInt: Integer;
                        begin

                        end;
                    }
                }
                group("Bank Account")
                {
                    field("Bank Code"; BankAccount)
                    {
                        ApplicationArea = All;
                        Caption = 'Bank Code';
                        TableRelation = "Bank Account"."No.";
                    }
                }

            }
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
        GLEntry: Record "G/L Entry";
        Shiptoname: Text;
        OverDueDays: Decimal;
        DueDays: Decimal;
        AsOfDate: Date;
        BankRec: Record 270;
        BankAccount: Code[20];
        CompanyInformation: Record 79;
        ChkPrint: Report Check;
        AmtInWord: array[2] of Text[80];
        PricesIncludingVAT: Boolean;
        srno: Integer;
        OpenBalanceDate: Date;
        OutStandingDate: Date;
        Gdoc: Code[20];
        VATAmt: Decimal;
        totvatamnt: Decimal;
        VendRec: Record 23;
        LocationRec: Record 14;
        Name_Deliv: Text[60];
        Add_Del: Text[50];
        Add2_Del: Text[50];
        PhoneNo_Del: Text[50];
        PhoneNo_Email: Text[80];
        SalesPurc_Rec: Record 13;
        PurchaserName: Text[40];
        PurchLine: Record 39;
        TotalLineAmt: Decimal;
        TotAmount: Decimal;
        TotalInvDisc: Decimal;
        CurrText: Text[10];
        ItemRec: Record 27;

    procedure SetDoc(Ldoc: Code[20])
    begin
        Gdoc := Ldoc;
    end;
}



