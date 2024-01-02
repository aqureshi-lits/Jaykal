report 80057 "Goods Receipt Note"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Src/Layout/RGS Reports/Goods Receipt Note.rdlc';

    dataset
    {
        dataitem("Company Information"; "Company Information")
        {
            column(Name_CompanyInformation; "Company Information".Name)
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
            column(City; CompanyInformation.City + ' -' + CompanyInformation."Post Code" + ' -' + CompanyInformation.County)
            {
            }
            column(CompPhone; 'Phone No. : ' + CompanyInformation."Phone No." + ', Fax No. : ' + CompanyInformation."Fax No.")
            {
            }
            column(Comp_Post; CompanyInformation."Post Code")
            {
            }
            column(CompContry; CompanyInformation.County)
            {
            }
            column(CompEmail; CompanyInformation."E-Mail")
            {
            }
            column(CompFax; CompanyInformation."Fax No.")
            {
            }
            column(Picture_RespCent; CompanyInformation.Picture)
            {
            }
            dataitem("Purch. Rcpt. Header"; "Purch. Rcpt. Header")
            {
                DataItemTableView = SORTING("No.")
                                    ORDER(Ascending);
                RequestFilterFields = "No.";
                column(SYSDATE; WORKDATE)
                {
                }
                column(BuyfromVendorName_PurchRcptHeader; "Purch. Rcpt. Header"."Buy-from Vendor Name")
                {
                }
                column(BuyfromAddress_PurchRcptHeader; "Purch. Rcpt. Header"."Buy-from Address")
                {
                }
                column(BuyfromAddress2_PurchRcptHeader; "Purch. Rcpt. Header"."Buy-from Address 2")
                {
                }
                column(BuyfromCity_PurchRcptHeader; "Purch. Rcpt. Header"."Buy-from City")
                {
                }
                column(BuyfromPostCode_PurchRcptHeader; "Purch. Rcpt. Header"."Buy-from Post Code")
                {
                }
                column(No_PurchRcptHeader; "Purch. Rcpt. Header"."No.")
                {
                }
                column(PostingDate_PurchRcptHeader; "Purch. Rcpt. Header"."Posting Date")
                {
                }
                column(OrderNo_PurchRcptHeader; "Purch. Rcpt. Header"."Order No.")
                {
                }
                column(OrderDate_PurchRcptHeader; "Purch. Rcpt. Header"."Order Date")
                {
                }
                column(DocumentDate_PurchRcptHeader; "Purch. Rcpt. Header"."Document Date")
                {
                }
                column(VendorShipmentNo_PurchRcptHeader; "Purch. Rcpt. Header"."Vendor Shipment No.")
                {
                }
                column(VendorOrderNo_PurchRcptHeader; "Purch. Rcpt. Header"."Vendor Order No.")
                {
                }
                dataitem("Purch. Rcpt. Line"; "Purch. Rcpt. Line")
                {
                    DataItemLink = "Document No." = FIELD("No.");
                    DataItemTableView = SORTING("Document No.", "Line No.")
                                        ORDER(Ascending)
                                        WHERE(Quantity = FILTER(<> 0));
                    column(No_PurchRcptLine; "Purch. Rcpt. Line"."No.")
                    {
                    }
                    column(Description_PurchRcptLine; "Purch. Rcpt. Line".Description)
                    {
                    }
                    column(Quantity_PurchRcptLine; "Purch. Rcpt. Line".Quantity)
                    {
                    }
                    column(UnitofMeasureCode_PurchRcptLine; "Purch. Rcpt. Line"."Unit of Measure Code")
                    {
                    }
                    column(DirectUnitCost_PurchRcptLine; "Purch. Rcpt. Line"."Direct Unit Cost")
                    {
                    }
                    column(Amt_PurchRcptLine; AMT)
                    {
                    }
                    column(CURRDESC; 'Amount In ' + CURRDESC)
                    {
                    }
                    column(cnt; cnt)
                    {
                    }
                    column(VatBaseAmt; "Purch. Rcpt. Line"."VAT Base Amount")
                    {
                    }
                    column(Vat_Perc; "Purch. Rcpt. Line"."VAT %")
                    {
                    }

                    trigger OnAfterGetRecord()
                    begin
                        ItemRec.GET("No.");
                        ItemDesc := ItemRec.Description;

                        AMT := "Purch. Rcpt. Line".Quantity * "Purch. Rcpt. Line"."Direct Unit Cost";


                        CURRNCY.RESET;
                        CURRNCY.SETRANGE(CURRNCY.Code, "Purch. Rcpt. Line"."Currency Code");
                        IF CURRNCY.FINDFIRST THEN BEGIN
                            CURRDESC := CURRNCY.Code;
                        END ELSE BEGIN
                            CURRDESC := 'DHS';
                        END;
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

                end;
            }

            trigger OnPreDataItem()
            begin
                CompanyInformation.GET;
                CompanyInformation.CALCFIELDS(Picture);
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

    var
        AMT: Decimal;
        NTWT: Decimal;
        TOTALQTY: Decimal;
        DIFFWT: Decimal;
        ItemRec: Record "27";
        ItemDesc: Text;
        CURRNCY: Record "4";
        CURRDESC: Text[20];
        ITEM_VARIANT: Record "5401";
        cnt: Integer;
        TotalCount: Integer;
        CompanyInformation: Record "79";
}

