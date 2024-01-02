page 80016 "Receipt Not Invoiced"
{
    // version NAVW111.00

    Caption = 'Posted Purchase Receipt Lines';
    Editable = false;
    PageType = List;
    SourceTable = "Purch. Rcpt. Line";
    //SourceTableView = WHERE("Qty. Rcd"."Not Invoiced"=FILTER(<>0));
    SourceTableView = where("Qty. Rcd. Not Invoiced" = filter(<> 0));


    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Advanced;
                    ToolTip = 'Specifies the receipt number.';
                }
                field("Buy-from Vendor No."; Rec."Buy-from Vendor No.")
                {
                    ApplicationArea = Advanced;
                    ToolTip = 'Specifies the name of the vendor who delivered the items.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Advanced;
                    ToolTip = 'Specifies the line type.';
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = Advanced;
                    ToolTip = 'Specifies an item number that identifies the item or a general ledger account number for the general ledger account used when posting.';
                }
                field("Variant Code"; Rec."Variant Code")
                {
                    ApplicationArea = Advanced;
                    ToolTip = 'Specifies the variant of the item on the line.';
                    Visible = false;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Advanced;
                    ToolTip = 'Specifies either the name of or a description of the item or general ledger account.';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = Advanced;
                    ToolTip = 'Specifies the code for the location where the receipt line is registered.';
                    Visible = true;
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = Advanced;
                    ToolTip = 'Specifies the number of units of the item specified on the line.';
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                    ApplicationArea = Advanced;
                    ToolTip = 'Specifies how each unit of the item or resource is measured, such as in pieces or hours. By default, the value in the Base Unit of Measure field on the item or resource card is inserted.';
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = Advanced;
                    ToolTip = 'Specifies the unit of measure for the item (bottle or piece, for example).';
                    Visible = false;
                }
                field("Appl.-to Item Entry"; Rec."Appl.-to Item Entry")
                {
                    ApplicationArea = Advanced;
                    ToolTip = 'Specifies the number of the item ledger entry that the document or journal line is applied -to.';
                    Visible = false;
                }
                field("Prod. Order No."; Rec."Prod. Order No.")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies the number of the related production order.';
                }
                field("Expected Receipt Date"; Rec."Expected Receipt Date")
                {
                    ApplicationArea = Advanced;
                    ToolTip = 'Specifies the date the items were expected.';
                    Visible = false;
                }
                field("Quantity Invoiced"; Rec."Quantity Invoiced")
                {
                    ApplicationArea = Advanced;
                    ToolTip = 'Specifies how many units of the item on the line have been posted as invoiced.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Links; Links)
            {
                Visible = false;
                ApplicationArea = all;
            }
            systempart(Notes; Notes)
            {
                Visible = false;
                ApplicationArea = all;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Line")
            {
                Caption = '&Line';
                Image = Line;
                action("Show Document")
                {
                    ApplicationArea = Advanced;
                    Caption = 'Show Document';
                    Image = View;
                    ShortCutKey = 'Shift+F7';
                    ToolTip = 'Open the document that the selected line exists on.';

                    trigger OnAction()
                    begin
                        PurchRcptHeader.GET(Rec."Document No.");
                        PAGE.RUN(PAGE::"Posted Purchase Receipt", PurchRcptHeader);
                    end;
                }
                action(Dimensions)
                {
                    AccessByPermission = TableData 348 = R;
                    ApplicationArea = Dimensions;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';
                    ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.';

                    trigger OnAction()
                    begin
                        Rec.ShowDimensions;
                    end;
                }
                action("Item &Tracking Lines")
                {
                    ApplicationArea = ItemTracking;
                    Caption = 'Item &Tracking Lines';
                    Image = ItemTrackingLines;
                    ShortCutKey = 'Shift+Ctrl+I';
                    ToolTip = 'View or edit serial numbers and lot numbers that are assigned to the item on the document or journal line.';

                    trigger OnAction()
                    begin
                        Rec.ShowItemTrackingLines;
                    end;
                }
            }
        }
    }

    var
        PurchRcptHeader: Record 120;
}

