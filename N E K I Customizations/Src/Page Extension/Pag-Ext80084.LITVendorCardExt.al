pageextension 80084 "LIT Vendor Card Ext." extends "Vendor Card"
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
            field("LIT Vendor GROUP"; Rec."LIT Vendor GROUP")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the Vendor Group that the item belongs to. Vendor Group also contain any assigned item attributes.';
            }

            field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
            {
                ApplicationArea = all;
            }

            field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
            {
                ApplicationArea = all;

            }

        }
    }
}
