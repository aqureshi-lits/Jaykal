report 80032 "LIT VATTransactionDetail 02"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Src/Layout/VAT Transaction Detail 02.rdlc';
    Caption = 'VAT Transaction Detail 02';
    Description = 'VAT Transaction Detail 02';
    PreviewMode = PrintLayout;
    UsageCategory = ReportsAndAnalysis;

    dataset
    {
        dataitem("VAT Entry"; "VAT Entry")
        {
            RequestFilterFields = "Document No.", "Gen. Prod. Posting Group", Closed, Type, "Posting Date", "Entry No.";
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
            column(PostingDate_VATEntry; "VAT Entry"."Posting Date")
            {
            }
            column(Document_Date; "Document Date")
            {
            }
            column(DocumentNo_VATEntry; "VAT Entry"."Document No.")
            {
            }
            column(DocumentType_VATEntry; "VAT Entry"."Document Type")
            {
            }
            column(Closed_VATEntry; "VAT Entry".Closed)
            {
            }
            column(VATCalculationType_VATEntry; "VAT Entry"."VAT Calculation Type")
            {
            }
            column(BilltoPaytoNo_VATEntry; "VAT Entry"."Bill-to/Pay-to No.")
            {
            }
            column(Type_VATEntry; "VAT Entry".Type)
            {
            }
            column(Base_VATEntry; "VAT Entry".Base)
            {
            }
            column(Amount_VATEntry; "VAT Entry".Amount)
            {
            }
            column(VATRegistrationNo_VATEntry; "VAT Entry"."VAT Registration No.")
            {
            }
            column(VATBusPostingGroup_VATEntry; "VAT Entry"."VAT Bus. Posting Group")
            {
            }
            column(VATProdPostingGroup_VATEntry; "VAT Entry"."VAT Prod. Posting Group")
            {
            }
            column(ExternalDocumentNo_VATEntry; "VAT Entry"."External Document No.")
            {
            }
            column(VendorName; VendorName)
            {
            }
            column(CustName; CustName)
            {
            }
            column(PurchRemarks; PurchRemarks)
            {
            }
            column(SalesRemarks; SalesRemarks)
            {
            }
            column(PurchInvDate; PurchInvDate)
            {
            }
            column(PurchCRMDate; PurchCRMDate)
            {
            }
            column(PurchCrmQty_PurchCrmQty; PurchInvQty + PurchCrmQty)
            {
            }
            column(Period; 'Period: ' + Period)
            {
            }
            column(Reportingperiod; 'From ' + FORMAT(StartDate) + ' To ' + FORMAT(EndDate))
            {
            }
            column(CurrencyCode; CurrencyCode)
            {
            }
            column(CurrExcRate; CurrExcRate)
            {
            }
            column(PageCaption; PageCaptionLbl)
            {
            }
            column(TodayFormatted; FORMAT(TODAY, 0, 4))
            {
            }


            trigger OnPreDataItem()
            begin

                IF CompanyInformation.GET() THEN
                    CompanyInformation.CALCFIELDS(Picture);

                IF StartDate = 0D THEN
                    ERROR('Please enter the start date.');

                IF EndDate = 0D THEN
                    ERROR('Please enter the end date.');

                IF CurrencyCode = '' then
                    Error('Please select the currency code');

                IF CurrExcRate = 0 then
                    Error('Please enter the currency exchange rate');



            end;


            trigger OnAfterGetRecord()
            begin
                CLEAR(VendorName);
                CLEAR(CustName);
                CLEAR(PurchRemarks);
                CLEAR(SalesRemarks);
                CLEAR(PurchInvQty);
                CLEAR(PurchCrmQty);
                Clear(PurchInvDate);
                Clear(PurchCRMDate);

                //         Message('%1 CurrExcRate and %2 CurrencyCode', FORMAT(CurrExcRate), CurrencyCode);

                "VAT Entry".SETFILTER("VAT Entry"."Posting Date", '%1..%2', StartDate, EndDate);

                Period := "VAT Entry".GETFILTER("Posting Date");

                VendLedger.RESET;
                VendLedger.SETRANGE("Document No.", "VAT Entry"."Document No.");
                VendLedger.SETRANGE("Vendor No.", "VAT Entry"."Bill-to/Pay-to No.");
                IF VendLedger.FINDFIRST THEN BEGIN
                    VendorName := VendLedger."Vendor Name";
                    PurchRemarks := VendLedger."LIT Remarks";
                END;

                CustLedger.RESET;
                CustLedger.SETRANGE("Document No.", "VAT Entry"."Document No.");
                CustLedger.SETRANGE(CustLedger."Customer No.", "VAT Entry"."Bill-to/Pay-to No.");
                IF CustLedger.FINDFIRST THEN BEGIN
                    CustName := CustLedger."Customer Name";
                    SalesRemarks := CustLedger."LIT Remarks";
                END;

                PurchInvHead.RESET;
                PurchInvHead.SETRANGE("No.", "VAT Entry"."Document No.");
                PurchInvHead.SETRANGE("Buy-from Vendor No.", "VAT Entry"."Bill-to/Pay-to No.");
                IF PurchInvHead.FINDFIRST THEN BEGIN
                    PurchInvDate := PurchInvHead."Posting Date";
                END;

                PurchCRMHead.RESET;
                PurchCRMHead.SETRANGE("No.", "VAT Entry"."Document No.");
                PurchCRMHead.SETRANGE("Buy-from Vendor No.", "VAT Entry"."Bill-to/Pay-to No.");
                IF PurchCRMHead.FINDFIRST THEN BEGIN
                    PurchCRMDate := PurchCRMHead."Posting Date";
                END;


                PurchInvLine.RESET;
                PurchInvLine.SETRANGE("Document No.", "VAT Entry"."Document No.");
                PurchInvLine.SETRANGE("Buy-from Vendor No.", "VAT Entry"."Bill-to/Pay-to No.");
                IF PurchInvLine.FINDFIRST THEN BEGIN
                    REPEAT
                        PurchInvQty += PurchInvLine.Quantity;
                    UNTIL PurchInvLine.NEXT = 0;
                END;

                PurchCrmLine.RESET;
                PurchCrmLine.SETRANGE("Document No.", "VAT Entry"."Document No.");
                PurchCrmLine.SETRANGE("Buy-from Vendor No.", "VAT Entry"."Bill-to/Pay-to No.");
                IF PurchCrmLine.FINDFIRST THEN BEGIN
                    REPEAT
                        PurchCrmQty += PurchCrmLine.Quantity;
                    UNTIL PurchCrmLine.NEXT = 0;
                END;
            end;


        }
    }



    requestpage
    {
        Caption = 'Period';
        Description = 'Period';
        SaveValues = true;

        layout
        {
            area(content)
            {
                Description = 'Period';
                group(Period)
                {

                    field("Report in Currency"; CurrencyCode)
                    {
                        TableRelation = Currency.Code;
                        Caption = 'Report in Currency';
                        ApplicationArea = all;

                    }
                    field("Currency Exchange Rate"; CurrExcRate)
                    {
                        Caption = 'Currency Exchange Rate';
                        ApplicationArea = all;
                        DecimalPlaces = 5 : 5;
                    }
                    field("Start Date"; StartDate)
                    {
                        Caption = 'Start Date';
                        ApplicationArea = all;
                    }
                    field("End Date"; EndDate)
                    {
                        Caption = 'End Date';
                        ApplicationArea = all;

                    }

                }

            }


        }

        trigger OnOpenPage()
        begin
            //    CurrencyCode := 'AED';
            //    CurrExcRate := 3.6725;
        end;

    }




    var
        CompanyInformation: Record 79;
        VendLedger: Record 25;
        CustLedger: Record 21;
        VendorName: Text[100];
        CustName: Text[100];
        PurchRemarks: Text[250];
        SalesRemarks: Text[250];
        PurchInvQty: Decimal;
        PurchCrmQty: Decimal;
        PurchInvDate: Date;
        PurchCRMDate: Date;
        PurchInvHead: Record 122;
        PurchCrmHead: Record 124;
        PurchInvLine: Record 123;
        PurchCrmLine: Record 125;
        Period: Text[100];
        StartDate: Date;
        EndDate: Date;
        CurrencyCode: Code[20];
        CurrExcRate: Decimal;
        CurrExcRateRec: Record 330;
        PageCaptionLbl: Label 'Page';





}

