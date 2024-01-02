pageextension 80071 "LIT PostedTransferReceiptExt" extends "Posted Transfer Receipt"
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