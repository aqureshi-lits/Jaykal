pageextension 80079 "LIT Vendor List Ext" extends "Vendor List"
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
        addafter("Purchaser Code")
        {
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

        // addafter("LIT Vendor GROUP")
        // {

        // }


    }
    actions
    {
        // Add changes to page actions here
        addafter("Financial Management")
        {
            group("Custom Finance Reports")
            {
                Caption = 'Custom Finance Reports';
                Image = Report;
                action("Vendor Ledger Entry")
                {
                    ApplicationArea = All;
                    Caption = 'Vendor Ledger Entry';
                    Image = "Report";
                    // Promoted = true;
                    // PromotedCategory = Process;
                    RunObject = Report "LIT Vendor Ledger Entry Report";
                    // ToolTip = 'View detailed information about usage and sales of each resource. The Resource Statistics window shows both the units of measure and the corresponding amounts.';

                }
                action("Vendor Outstanding Amount")
                {
                    ApplicationArea = All;
                    Caption = 'Vendor Outstanding Amount';
                    Image = "Report";
                    // Promoted = true;
                    // PromotedCategory = Process;
                    RunObject = Report "LIT Vendor OutStanding Amount";
                    // ToolTip = 'View detailed information about usage and sales of each resource. The Resource Statistics window shows both the units of measure and the corresponding amounts.';

                }
                action("Vendor Aging Report")
                {
                    ApplicationArea = All;
                    Caption = 'Vendor Aging Report';
                    Image = "Report";
                    // Promoted = true;
                    // PromotedCategory = Process;
                    RunObject = Report "LIT VendorAgingSummaryReport";
                    // ToolTip = 'View detailed information about usage and sales of each resource. The Resource Statistics window shows both the units of measure and the corresponding amounts.';

                }
            }

        }
    }
}
