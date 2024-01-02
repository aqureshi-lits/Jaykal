report 80066 "Pending Order Summary"
{
    // version Firoz

    DefaultLayout = RDLC;
    RDLCLayout = './Src/Layout/RGS Reports/Pending Order Summary.rdlc';

    dataset
    {
        dataitem("Purchase Line"; "Purchase Line")
        {
            DataItemTableView = SORTING("Document Type", "Buy-from Vendor No.")
                                ORDER(Ascending)
                                WHERE("Document Type" = CONST(Order),
                                      "Outstanding Quantity" = FILTER(> 0));
            RequestFilterFields = "Buy-from Vendor No.", "Order Date";
            column(CompName; CompName)
            {
            }
            column(SysDate; WORKDATE)
            {
            }
            column(VEndor_no; PH."Buy-from Vendor No.")
            {
            }
            column(Vend_Name; PH."Buy-from Vendor Name")
            {
            }
            column(Order_No; PH."No.")
            {
            }
            column(Order_Date; PH."Order Date")
            {
            }
            column(Vendor_OrderNo; PH."Vendor Order No.")
            {
            }
            column(PaperType; "Purchase Line"."No.")
            {
            }
            column(GSM; PH."No.")
            {
            }
            column(ItemNo; "Purchase Line"."No.")
            {
            }
            column(Line_Quantity; "Purchase Line".Quantity)
            {
            }
            column(QuantityReceived_PurchaseLine; "Purchase Line"."Quantity Received")
            {
            }
            column(OutstandingQuantity_PurchaseLine; "Purchase Line"."Outstanding Quantity")
            {
            }
            column(Direct_Unit_Cost; "Purchase Line"."Direct Unit Cost")
            {
            }
            column(LCNo_PurchaseHeader; PH."No.")
            {
            }
            column(UnitofMeasure_PurchaseLine; "Purchase Line"."Unit of Measure")
            {
            }
            column(UnitofMeasureCode_PurchaseLine; "Purchase Line"."Unit of Measure Code")
            {
            }
            column(CURR_CODE; CURR_CODE)
            {
            }
            column(AllFilters; AllFilters)
            {
            }
            column(ItemDesc; "Purchase Line".Description)
            {
            }
            column(VendName; VendRec.Name)
            {
            }

            trigger OnAfterGetRecord()
            begin
                AllFilters := "Purchase Line".GETFILTERS;
                PH.GET("Document Type", "Document No.");

                compInfo.GET;
                CompName := compInfo.Name;


                PH.RESET;
                PH.SETRANGE(PH."No.", "Document No.");
                IF PH.FINDFIRST THEN BEGIN
                    CURR_CODE := PH."Currency Code";
                END ELSE BEGIN
                    CURR_CODE := '';
                END;
                IF VendRec.GET("Purchase Line"."Buy-from Vendor No.") THEN;
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
        PH: Record "38";
        compInfo: Record "79";
        CompName: Text[100];
        CURR_CODE: Code[20];
        AllFilters: Text[100];
        VendRec: Record "23";
}

