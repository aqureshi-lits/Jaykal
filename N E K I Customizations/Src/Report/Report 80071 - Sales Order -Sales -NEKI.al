report 80071 "Sales Order -Sales"
{
    // version Firoz

    DefaultLayout = RDLC;
    RDLCLayout = './Src/Layout/RGS Reports/Sales Order -Sales.rdlc';

    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            RequestFilterFields = "Order Date", "Salesperson Code";
            column(OrderDate; "Sales Header"."Order Date")
            {
            }
            column(DocDate; "Sales Header"."Document Date")
            {
            }
            column(SalesPerson; "Sales Header"."Salesperson Code")
            {
            }
            dataitem("Sales Line"; "Sales Line")
            {
                DataItemLink = "Document No." = FIELD("No.");
                DataItemTableView = SORTING("Document Type", "Document No.", "Line No.")
                                    ORDER(Ascending)
                                    WHERE("Document Type" = CONST(Order),
                                          Quantity = FILTER(<> 0));
                column(CompName; CompName)
                {
                }
                column(SysDate; WORKDATE)
                {
                }
                column(VEndor_no; PH."Sell-to Customer No.")
                {
                }
                column(Vend_Name; PH."Sell-to Customer Name")
                {
                }
                column(Order_No; PH."No.")
                {
                }
                column(Order_Date; PH."Order Date")
                {
                }
                column(Vendor_OrderNo; PH."External Document No.")
                {
                }
                column(PaperType; "Sales Line"."No.")
                {
                }
                column(GSM; PH."No.")
                {
                }
                column(ItemNo; "Sales Line"."No.")
                {
                }
                column(Line_Quantity; "Sales Line".Quantity)
                {
                }
                column(QuantityReceived_PurchaseLine; "Sales Line"."Quantity Shipped")
                {
                }
                column(OutstandingQuantity_PurchaseLine; "Sales Line"."Outstanding Quantity")
                {
                }
                column(Direct_Unit_Cost; "Sales Line"."Unit Price")
                {
                }
                column(LCNo_PurchaseHeader; PH."No.")
                {
                }
                column(UnitofMeasure_PurchaseLine; "Sales Line"."Unit of Measure")
                {
                }
                column(UnitofMeasureCode_PurchaseLine; "Sales Line"."Unit of Measure Code")
                {
                }
                column(CURR_CODE; CURR_CODE)
                {
                }
                column(AllFilters; AllFilters)
                {
                }
                column(ItemDesc; "Sales Line".Description)
                {
                }
                column(VendName; VendRec.Name)
                {
                }
                column(AmountIncVat; "Sales Line"."Amount Including VAT")
                {
                }
                column(OutStandingAmount; "Sales Line"."Outstanding Amount")
                {
                }
                column(ShippedAmmount; "Sales Line"."Amount Including VAT" - "Sales Line"."Outstanding Amount")
                {
                }

                trigger OnAfterGetRecord()
                begin
                    AllFilters := "Sales Line".GETFILTERS;
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
                    IF VendRec.GET("Sales Line"."Sell-to Customer No.") THEN;
                end;
            }
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
        PH: Record 36;
        compInfo: Record 79;
        CompName: Text[100];
        CURR_CODE: Code[20];
        AllFilters: Text[100];
        VendRec: Record 18;
}

