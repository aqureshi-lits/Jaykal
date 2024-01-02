report 80099 "Inventory Location Wise"
{
    // version frz

    DefaultLayout = RDLC;
    RDLCLayout = './Src/Layout/RGS Reports/Inventory Location Wise.rdlc';

    dataset
    {
        dataitem("Company Information"; "Company Information")
        {
            column(Sys_Date; WORKDATE)
            {
            }
            column(CompName; "Company Information".Name)
            {
            }
            column(CompPic; "Company Information".Picture)
            {
            }
        }
        dataitem("Item Ledger Entry"; "Item Ledger Entry")
        {
            DataItemTableView = SORTING("Item No.")
                                WHERE("Location Code" = FILTER(<> ''));
            RequestFilterFields = "Posting Date";
            column(MaxDate; MaxDate)
            {
            }
            column(Item_No; "Item No.")
            {
            }
            column(QTY; Quantity)
            {
            }
            column(ILEQuantity; Quantity)
            {
            }
            column(Location; "Item Ledger Entry"."Location Code")
            {
            }
            column(ItemNo; "Item Ledger Entry"."Item No.")
            {
            }
            column(ItemDesc; Item.Description)
            {
            }
            column(ItemCategary; "Item Ledger Entry"."Item Category Code")
            {
            }
            column(UOM; Item."Base Unit of Measure")
            {
            }

            trigger OnAfterGetRecord()
            begin
                MaxDate := "Item Ledger Entry".GETFILTER("Item Ledger Entry"."Posting Date");
                IF Item.GET("Item No.") THEN;
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
        MaxDate: Text[100];
        Item: Record 27;
        ItemValue: Decimal;
}

