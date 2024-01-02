tableextension 80040 "LIT TransferShipmentHeader" extends "Transfer Shipment Header"
{
    fields
    {
        // Add changes to table fields here
        field(80000; "LIT Remarks"; Text[250])
        {
            Caption = 'Remarks';
            Editable = false;
        }
    }

}