tableextension 80043 "LIT TransferReceiptLine" extends "Transfer Receipt Line"
{
    fields
    {
        // Add changes to table fields here
        field(80000; "LIT Gen. Bus. Posting Group"; Code[20])
        {
            Caption = 'Gen. Bus. Posting Group';
            TableRelation = "Gen. Business Posting Group";
            Editable = false;
        }
    }

}