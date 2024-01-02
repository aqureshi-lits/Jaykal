pageextension 80033 "LIT PostedSalesInvoice" extends "Posted Sales Invoice"
{
    layout
    {
        // Add changes to page layout here
        addafter(Closed)
        {
            group("Remarks")
            {
                Caption = 'Remarks';
            }
            field(Remark; Rec."LIT Remarks")
            {
                ApplicationArea = All;
                MultiLine = true;
                Importance = Additional;
            }
        }
        addafter(General)
        {
            group("Other Invoicing Details")
            {

                group("Service Description")
                {

                }
                group("Contract Refrence")
                {

                }
            }
        }

        modify("External Document No.")
        {
            Caption = 'LPO No.';
        }

        addafter("External Document No.")
        {
            field("Requested Delivery Date"; Rec."Requested Delivery Date")
            {
                ApplicationArea = all;
            }
        }
    }


    actions
    {
        // Add changes to page actions here
    }

}