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
        addafter("External Document No.")
        {
            field("LIT Order Discount Value"; Rec."LIT Order Discount Value")
            {
                ApplicationArea = All;
            }
            // field("LIT Order Discount Amount"; Rec."LIT Order Discount Amount")
            // {
            //     ApplicationArea = All;
            // }


            field("LIT Order Amount"; Rec."LIT Order Amount")
            {
                ApplicationArea = All;
            }
            field("LIT Order Amount Incl. VAT"; Rec."LIT Order Amount Incl. VAT")
            {
                ApplicationArea = All;
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