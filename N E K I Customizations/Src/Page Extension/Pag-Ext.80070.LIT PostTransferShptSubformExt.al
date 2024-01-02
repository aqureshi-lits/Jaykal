pageextension 80070 "LIT PostTransferShptSubformExt" extends "Posted Transfer Shpt. Subform"
{
    layout
    {
        // Add changes to page layout here
        addafter("Shipping Time")
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