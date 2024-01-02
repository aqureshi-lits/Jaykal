tableextension 80042 "LIT TransferReceiptHeader" extends "Transfer Receipt Header"
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