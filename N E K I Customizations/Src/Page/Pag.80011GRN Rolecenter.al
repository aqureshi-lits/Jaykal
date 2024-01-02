page 80011 "Purchase Receiving"
{
    PageType = RoleCenter;
    Caption = 'Purchase Receiving';

    layout
    {
        area(RoleCenter)
        {

        }
    }

    actions
    {
        area(Creation)
        {

        }
        area(Processing)
        {
            group(New)
            {

            }
            group("AppNameSomeProcess Group")
            {

            }
            group("AppName Reports")
            {

            }
        }
        area(Reporting)
        {


        }
        area(Embedding)
        {

        }
        area(Sections)
        {
            group(Action41)
            {
                Caption = 'Purchasing';
                Image = AdministrationSalesPurchases;
                ToolTip = 'Manage purchase invoices and credit memos. Maintain vendors and their history.';
                action(Purchase_VendorList)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Vendors';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Vendor List";
                    ToolTip = 'View or edit detailed information for the vendors that you trade with. From each vendor card, you can open related information, such as purchase statistics and ongoing orders, and you can define special prices and line discounts that the vendor grants you if certain conditions are met.';
                }

                action("<Page Purchase Orders>")
                {
                    ApplicationArea = Suite;
                    Caption = 'Purchase Orders';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Purchase Order List";
                    ToolTip = 'Create purchase orders to mirror sales documents that vendors send to you. This enables you to record the cost of purchases and to track accounts payable. Posting purchase orders dynamically updates inventory levels so that you can minimize inventory costs and provide better customer service. Purchase orders allow partial receipts, unlike with purchase invoices, and enable drop shipment directly from your vendor to your customer. Purchase orders can be created automatically from PDF or image files from your vendors by using the Incoming Documents feature.';
                }

                action("<Page Posted Purchase Receipts>")
                {
                    ApplicationArea = Suite;
                    Caption = 'Posted Purchase Receipts';
                    RunObject = Page "Posted Purchase Receipts";
                    ToolTip = 'Open the list of posted purchase receipts.';
                }

            }
        }
    }

    var
        Page: page 9022;
}
