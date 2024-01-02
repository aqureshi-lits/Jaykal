report 80007 "LIT PostGoodsReceiptNote-IAX"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Src/Layout/Posted Goods Receipt Note -IAX.rdlc';
    Caption = 'Posted Goods Receipt Note -IAX';
    PreviewMode = PrintLayout;

    dataset
    {
        dataitem(DataItem1; "Purch. Rcpt. Header")
        {
            DataItemTableView = SORTING("No.")
                                ORDER(Ascending);
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
            column(RUNDATE; WORKDATE)
            {
            }
            column(TRNNO; TRNNO)
            {
            }
            column(Phone_Vend; Phone_Vend)
            {
            }
            column(Email_Vend; Email_Vend)
            {
            }
            column(Add1_Vend; Add1_Vend + ' ,' + ' ,' + City_Vend + ' ,' + CountryVar)
            {
            }
            column(Add2_Vend2; Add2_Vend2)
            {
            }
            column(City_Vend; City_Vend)
            {
            }
            column(PostCode_Vend; PostCode_Vend)
            {
            }
            column(CountryVar; CountryVar)
            {
            }
            column(CountryName; CountryName)
            {
            }
            column(BuyfromVendorName_PurchRcptHeader; "Buy-from Vendor Name")
            {
            }
            column(BuyfromAddress_PurchRcptHeader; "Buy-from Address")
            {
            }
            column(BuyfromAddress2_PurchRcptHeader; "Buy-from Address 2")
            {
            }
            column(BuyfromCity_PurchRcptHeader; "Buy-from City" + ' , ' + "Buy-from Country/Region Code")
            {
            }
            column(BuyfromCountry_PurchRcptHeader; "Buy-from Country/Region Code")
            {
            }
            column(BuyfromPostCode_PurchRcptHeader; "Buy-from Post Code")
            {
            }
            column(No_PurchRcptHeader; "No.")
            {
            }
            column(PostingDate_PurchRcptHeader; "Posting Date")
            {
            }
            column(OrderNo_PurchRcptHeader; "Order No.")
            {
            }
            column(OrderDate_PurchRcptHeader; "Order Date")
            {
            }
            column(DocumentDate_PurchRcptHeader; "Document Date")
            {
            }
            column(VendorShipmentNo_PurchRcptHeader; "Vendor Shipment No.")
            {
            }
            column(VendorOrderNo_PurchRcptHeader; "Vendor Order No.")
            {
            }
            column(YourReference_PurchRcptHeader; "Your Reference")
            {
            }
            column(Remarks_PurchRcptHeader; "LIT Remarks")
            {
            }
            column(PurchaserName; PurchaserRec.Name)
            {
            }

            column(Prepared_By; "Prepared By")
            {

            }

            column(Approved_By; "Approved By")
            {

            }

            column(Driver_Name; "Driver Name")

            {

            }


            dataitem(DataItem1000000002; "Purch. Rcpt. Line")
            {
                DataItemLink = "Document No." = FIELD("No.");
                DataItemTableView = SORTING("Document No.", "Line No.")
                                    ORDER(Ascending)
                                    WHERE(Quantity = FILTER(<> 0),
                                          Type = FILTER(<> ' '));
                column(No_PurchRcptLine; "No.")
                {
                }
                column(Description_PurchRcptLine; Description)
                {
                }
                column(Description3_PurcLine; "LIT Description 3")
                {
                }
                column(Quantity_PurchRcptLine; Quantity)
                {
                }
                column(UnitofMeasureCode_PurchRcptLine; "Unit of Measure Code")
                {
                }
                column(DirectUnitCost_PurchRcptLine; "Direct Unit Cost")
                {
                }
                column(Amt_PurchRcptLine; AMT)
                {
                }
                column(ItemCountryCode; ItemRec."Country/Region of Origin Code")
                {
                }
                column(SlNo; SlNo)
                {
                }
                column(Location; "Location Code")
                {
                }
                column(BinCode; "Bin Code")
                {
                }
                column(JobNo; "Job No.")
                {
                }

                trigger OnAfterGetRecord()
                begin
                    SlNo += 1;
                    AMT := Quantity * "Direct Unit Cost";

                    IF ItemRec.GET("No.") THEN begin

                    end;
                end;

                trigger OnPreDataItem()
                begin
                    SlNo := 0;
                end;
            }

            trigger OnAfterGetRecord()
            begin
                /*ST.RESET;
                ST.SETRANGE(ST.Code,State);
                IF ST.FINDFIRST THEN BEGIN
                  STATEDESC := ST.Description;
                END;
                */
                IF VendorRec.GET("Buy-from Vendor No.") THEN BEGIN
                    TRNNO := VendorRec."VAT Registration No.";
                    Phone_Vend := VendorRec."Phone No.";
                    Email_Vend := VendorRec."E-Mail";
                    Add1_Vend := VendorRec.Address;
                    Add2_Vend2 := VendorRec."Address 2";
                    City_Vend := VendorRec.City;
                    PostCode_Vend := VendorRec."Post Code";
                    CountryVar := VendorRec."Country/Region Code";
                    IF CountryRec.GET(CountryVar) THEN
                        CountryName := CountryRec.Name;
                END;

                IF PurchaserRec.GET("Purchaser Code") THEN begin

                end;

            end;
        }
    }

    requestpage
    {

        SaveValues = true;

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
        AMT: Decimal;
        VendorRec: Record 23;
        TRNNO: Code[30];
        SlNo: Integer;
        Phone_Vend: Code[20];
        Email_Vend: Text[50];
        Add1_Vend: Text[100];
        Add2_Vend2: Text[60];
        City_Vend: Code[40];
        PostCode_Vend: Code[40];
        CountryVar: Code[10];
        CountryRec: Record 9;
        CountryName: Text[50];
        PurchaserRec: Record 13;
        ItemRec: Record 27;
        CompanyInformation: Record 79;


}

