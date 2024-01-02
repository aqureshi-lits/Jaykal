pageextension 80023 "LIT PurchaseOrderSubform" extends "Purchase Order Subform"
{
    layout
    {
        // Add changes to page layout here
        addafter(Description)
        {

            field("Description 3"; Rec."LIT Description 3")
            {
                ApplicationArea = all;
            }
            field(Comment; Rec."LIT Comment")
            {
                ApplicationArea = all;
            }

        }
        addafter("Job Line Type")
        {
            //These fields are already defined in new version
            // field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
            // {
            //     ApplicationArea = all;
            // }
            // field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
            // {
            //     ApplicationArea = all;
            // }
            // field("VAT Bus. Posting Group"; Rec."VAT Bus. Posting Group")
            // {
            //     ApplicationArea = all;
            // }

        }

        modify("Item Reference No.")
        {
            Visible = true;
        }

        modify("Line Amount")
        {
            Editable = false;
        }

    }



    actions
    {
        // Add changes to page actions here
    }



}