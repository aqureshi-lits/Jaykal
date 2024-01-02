pageextension 80032 "LIT PostedSalesShipment" extends "Posted Sales Shipment"
{
    layout
    {
        // Add changes to page layout here
        addafter("Order No.")
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
    }

    actions
    {
        // Add changes to page actions here
    }

}