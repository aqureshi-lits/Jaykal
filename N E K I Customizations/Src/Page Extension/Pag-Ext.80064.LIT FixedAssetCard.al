pageextension 80064 "LIT FixedAssetCard" extends "Fixed Asset Card"
{
    layout
    {
        // Add changes to page layout here
        addafter("No.")
        {
            // field("No. 2"; Rec."LIT No. 2")
            // {
            //     ApplicationArea = all;
            // }

        }
        addafter(Description)
        {
            field("Description 2"; Rec."Description 2")
            {
                ApplicationArea = all;
            }
            // field("Description 3"; Rec."LIT Description 3")
            // {
            //     MultiLine = true;
            //     ApplicationArea = all;
            // }
            // field("Item No."; Rec."LIT Item No.")
            // {
            //     ApplicationArea = all;
            // }
            field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
            {
                ApplicationArea = all;
            }
            field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
            {
                ApplicationArea = all;
            }
        }
        addafter("FA Subclass Code")
        {
            field("FA Posting Group"; Rec."FA Posting Group")
            {
                ApplicationArea = all;
            }
            // field("Original FA No."; Rec."LIT Original FA No.")
            // {
            //     ApplicationArea = all;
            // }
        }

        addlast(General)
        {
            field("Registration Expiry Date"; Rec."Registration Expiry Date")
            {
                ApplicationArea = all;
            }

            field("Insurance Expiry Date"; Rec."Insurance Expiry Date")
            {
                ApplicationArea = all;
            }

        }

    }

    actions
    {
        // Add changes to page actions here
    }

}