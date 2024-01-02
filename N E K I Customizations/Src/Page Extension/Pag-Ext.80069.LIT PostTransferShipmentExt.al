pageextension 80069 "LIT PostTransferShipmentExt" extends "Posted Transfer Shipment"
{
    layout
    {
        // Add changes to page layout here
        addafter("Shortcut Dimension 2 Code")
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
    }

    actions
    {
        // Add changes to page actions here
    }

}