pageextension 80008 "LIT ItemCard" extends "Item Card"
{
    layout
    {
        // Add changes to page layout here
        addafter("No.")
        {
            field("No. 2"; Rec."No. 2")
            {
                ApplicationArea = All;
                Importance = Standard;
                ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                Visible = true;
            }
        }
        addafter(Description)
        {
            field("LIT Arabic Description"; Rec."LIT Arabic Description")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the Arabic Description.';
            }
        }
        addafter("Item Category Code")
        {
            field("LIT ITEM BRAND"; Rec."LIT ITEM BRAND")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the Item Brand that the item belongs to. Item Brand also contain any assigned item attributes.';
            }
            field("LIT ITEM GROUP"; Rec."LIT ITEM GROUP")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the Item Group that the item belongs to. Product Item Group also contain any assigned item attributes.';
            }
            field("LIT Storage Condition"; Rec."LIT Storage Condition")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the Storage Condition that the item belongs to. Storage Condition also contain any assigned item attributes.';
            }

            field(Packing; Rec.Packing)
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the Packing Information for the item.';
            }
        }

        addafter(Description)
        {
            // field("Description 2"; Rec."Description 2")
            // {
            //     ApplicationArea = All;
            //     ShowMandatory = true;
            //     ToolTip = 'Specifies a description 2 of the item.';
            //     Visible = true;
            // }
            field("Description 3"; Rec."LIT Description 3")
            {
                ApplicationArea = All;
                ShowMandatory = true;
                ToolTip = 'Specifies a description 3 of the item.';
                Visible = true;
                MultiLine = true;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
        addafter(AdjustInventory)
        {
            action("Print Labels")
            {
                Caption = 'Print Label';
                ApplicationArea = All;
                Ellipsis = true;
                Image = BarCode;
                // Promoted = true;
                // PromotedCategory = Category4;
                // PromotedOnly = true;
                ToolTip = 'Print the label containing barcode of the item.';
                trigger OnAction()
                var
                    Item: Record Item;
                    ItemBarcodeLabels: Report "LIT Item Barcode Labels";
                begin
                    Item := Rec;
                    Item.SetRecFilter();
                    ItemBarcodeLabels.SetTableView(Item);
                    ItemBarcodeLabels.Run();
                end;
            }

            action("Print Labels-1")
            {
                Caption = 'Print Label-1';
                ApplicationArea = All;
                Ellipsis = true;
                Image = BarCode;
                // Promoted = true;
                // PromotedCategory = Category4;
                // PromotedOnly = true;
                ToolTip = 'Print the label containing barcode of the item.';
                trigger OnAction()
                var
                    Item: Record Item;
                    "PrintLabel1": Report "LIT Item Barcode Label-1";
                begin
                    // // Item := Rec;
                    // // printLabel1.GetItemBaseUnitOfMeasure(Rec."No.");
                    // // Item.SetRecFilter();
                    // // PrintLabel1.SetTableView(Item);
                    // // PrintLabel1.RunModal();

                    // // PrintLabel1.GetItemBaseUnitOfMeasure(Rec."No.");

                    // PrintLabel1.UseRequestPage(true);
                    // PrintLabel1.GetItemBaseUnitOfMeasure(Rec."No.");

                    // PrintLabel1.Run();

                    Item := Rec;
                    Item.SetRecFilter();
                    printLabel1.SetTableView(Item);
                    printLabel1.Run();


                    // Item.RESET;
                    // Item.SETFILTER(Item."No.", Rec."No.");
                    // PrintLabel1.GetITEMBaseUOM(Rec."No.");
                    // //Item.SetRange(PrintLabel1.GetITEMBaseUOM(), Rec."Base Unit of Measure");
                    // Item.SETFILTER(Item."Unit of Measure Filter", Rec."Base Unit of Measure");
                    // REPORT.RUNMODAL(80067, TRUE, FALSE, Item);
                end;
            }

            action("Print Shelf Label")
            {
                Caption = 'Print Shelf Label';
                ApplicationArea = All;
                Ellipsis = true;
                Image = BarCode;
                // Promoted = true;
                // PromotedCategory = Category4;
                // PromotedOnly = true;
                ToolTip = 'Print the label containing Shelf barcode of the item.';
                trigger OnAction()
                var
                    Item: Record Item;
                    PrintShelfLabel: Report "LIT Item Barcode Shelf";
                begin
                    Item := Rec;
                    Item.SetRecFilter();
                    PrintShelfLabel.SetTableView(Item);
                    PrintShelfLabel.Run();

                    // Item.RESET;
                    // Item.SETFILTER(Item."No.", Rec."No.");
                    // //Item.SETFILTER(Item."Base Unit of Measure", Rec."Base Unit of Measure");
                    // REPORT.RUNMODAL(80068, TRUE, FALSE, Item);
                end;
            }

            action("Print Shelf Promo")
            {
                Caption = 'Print Shelf Promo';
                ApplicationArea = All;
                Ellipsis = true;
                Image = BarCode;
                // Promoted = true;
                // PromotedCategory = Category4;
                // PromotedOnly = true;
                ToolTip = 'Print the label containing Shelf Promo barcode of the item.';
                trigger OnAction()
                var
                    Item: Record Item;
                    PrintShelfPromo: Report "LIT Item Barcode Shelf(Promo)";
                begin
                    Item := Rec;
                    Item.SetRecFilter();
                    PrintShelfPromo.SetTableView(Item);
                    PrintShelfPromo.Run();
                end;
            }

            action("Item Re&ferences1")
            {
                AccessByPermission = tabledata "Item Reference" = R;
                ApplicationArea = Suite, ItemReferences;
                Caption = 'Item Re&ferences';
                Image = Change;
                RunObject = Page "Item Reference Entries";
                RunPageLink = "Item No." = FIELD("No.");
                ToolTip = 'Set up a customer''s or vendor''s own identification of the item. Item references to the customer''s item number means that the item number is automatically shown on sales documents instead of the number that you use.';
            }
        }

        addafter(Category_Category6)
        {
            group(CategoryCategory5)
            {
                Caption = 'Item Labels', Comment = 'Generated from the PromotedActionCategories property index 3.';
                actionref("PrintLabels"; "Print Labels")
                {
                }

                actionref("Print Labels1"; "Print Labels-1")
                {
                }

                actionref("Print ShelfLabel"; "Print Shelf Label")
                {
                }

                actionref("Print ShelfPromo"; "Print Shelf Promo")
                {
                }

                actionref("Item Re&ferences_1"; "Item Re&ferences1")
                {
                }


            }

        }
    }

}