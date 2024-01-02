pageextension 80078 "LIT Customer List Ext" extends "Customer List"
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
        addafter("Customer Posting Group")
        {
            field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
            {
                ApplicationArea = all;
                Caption = 'Project';
            }

            field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
            {
                ApplicationArea = all;
                Caption = 'Customer Group';
            }
            field("LIT Customer GROUP"; Rec."LIT Customer GROUP")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the Customer Group that the item belongs to. Product Brand Code also contain any assigned item attributes.';
            }
        }

        addafter(Control1)
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
        addafter(FinanceReports)
        {
            group("Custom Finance Reports")
            {
                Caption = 'Custom Finance Reports';
                Image = "Report";
                action("Customer Ledger Entry")
                {
                    ApplicationArea = All;
                    Caption = 'Customer Ledger Entry';
                    Image = "Report";
                    // Promoted = true;
                    // PromotedCategory = Process;
                    RunObject = Report "LIT Customer Ledger Entry";
                    // ToolTip = 'View detailed information about usage and sales of each resource. The Resource Statistics window shows both the units of measure and the corresponding amounts.';

                }
                action("Customer Outstanding Amount")
                {
                    ApplicationArea = All;
                    Caption = 'Customer Outstanding Amount';
                    Image = "Report";
                    // Promoted = true;
                    // PromotedCategory = Process;
                    RunObject = Report "LIT CustomerOutstandingAmount";
                    // ToolTip = 'View detailed information about usage and sales of each resource. The Resource Statistics window shows both the units of measure and the corresponding amounts.';

                }
                action("Customer Aging")
                {
                    ApplicationArea = All;
                    Caption = 'Customer Aging Report';
                    Image = "Report";
                    // Promoted = true;
                    // PromotedCategory = Process;
                    RunObject = Report "LIT Customer Aging Report 2";
                    // ToolTip = 'View detailed information about usage and sales of each resource. The Resource Statistics window shows both the units of measure and the corresponding amounts.';

                }
            }

        }
    }
}
