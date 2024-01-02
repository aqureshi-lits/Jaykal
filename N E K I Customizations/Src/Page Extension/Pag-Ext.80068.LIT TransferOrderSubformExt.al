pageextension 80068 "LIT TransferOrderSubformExt" extends "Transfer Order Subform"
{
    layout
    {
        // Add changes to page layout here
        addafter("Receipt Date")
        {
            field("Gen. Bus. Posting Group"; Rec."LIT Gen. Bus. Posting Group")
            {
                ApplicationArea = All;
                Caption = 'Gen. Bus. Posting Group';
            }
            field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
            {
                ApplicationArea = All;
                Caption = 'Gen. Prod. Posting Group';
            }

        }
    }

    actions
    {
        // Add changes to page actions here
    }

}