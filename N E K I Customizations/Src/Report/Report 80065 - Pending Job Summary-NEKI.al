report 80065 "Pending Job Summary"
{
    // version Frz

    DefaultLayout = RDLC;
    RDLCLayout = './Src/Layout/RGS Reports/Pending Job Summary.rdlc';

    dataset
    {
        dataitem("Sales Line"; "Sales Line")
        {
            DataItemTableView = SORTING("Document Type", "Document No.", "Line No.")
                                ORDER(Ascending)
                                WHERE("Document Type" = FILTER(Order));
            //RequestFilterFields = Field63011;
            column(COM_NAME; COMINFO.Name)
            {
            }
            column(COM_PIC; COMINFO.Picture)
            {
            }
            column(ORDERDATE; MAXDATE)
            {
            }
            column(QTYORDERED; QTYORDERED)
            {
            }
            column(QTYSHIPPED; QTYSHIPPED)
            {
            }
            column(QTY_OUTSTANDING; QTY_OUTSTANDING)
            {
            }
            column(OUSTANDING_AMT; OUSTANDING_AMT)
            {
            }
            column(MAXDATE; MAXDATE)
            {
            }
            column(RUNDATE; WORKDATE)
            {
            }
            column(allfilters; allfilters)
            {
            }

            trigger OnAfterGetRecord()
            begin
                COMINFO.GET;
                COMINFO.CALCFIELDS(COMINFO.Picture);

                QTYORDERED := 0;
                QTYSHIPPED := 0;
                QTY_OUTSTANDING := 0;
                OUSTANDING_AMT := 0;


                QTYORDERED := QTYORDERED + "Sales Line".Quantity;
                QTYSHIPPED := QTYSHIPPED + "Sales Line"."Quantity Shipped";
                QTY_OUTSTANDING := QTY_OUTSTANDING + "Sales Line"."Outstanding Quantity";
                OUSTANDING_AMT := OUSTANDING_AMT + "Sales Line"."Outstanding Amount";
            end;

            trigger OnPreDataItem()
            begin
                //MAXDATE :=GETRANGEMAX("Sales Line".re;
                allfilters := "Sales Line".GETFILTERS;
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
        COMINFO: Record "79";
        MAXDATE: Date;
        SALES_LINES: Record "37";
        QTYORDERED: Decimal;
        QTYSHIPPED: Decimal;
        QTY_OUTSTANDING: Decimal;
        OUSTANDING_AMT: Decimal;
        allfilters: Text;
}

