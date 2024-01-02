pageextension 80080 "LIT Customer Card Ext" extends "Customer Card"
{
    layout
    {
        addafter(Name)
        {
            field("LIT Arabic Name"; Rec."LIT Arabic Name")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the Arabic Name that the item belongs to. Arabic Name also contain any assigned item attributes.';
            }
        }
        addafter(TotalSales2)
        {
            field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
            {
                ApplicationArea = all;
                // Caption = 'Project';
            }

            field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
            {
                ApplicationArea = all;
                // Caption = 'Customer Group';
            }
            field("LIT Customer GROUP"; Rec."LIT Customer GROUP")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the Customer Group that the item belongs to. Customer Group also contain any assigned item attributes.';
            }
        }

        addafter(General)
        {
            field("Trade License Expiry Date"; Rec."Trade License Expiry Date")
            {
                ApplicationArea = all;
            }

            field("Established Date"; Rec."Established Date")
            {
                ApplicationArea = all;
            }


        }


    }
    actions
    {
        //Adding Action Events

    }
}
