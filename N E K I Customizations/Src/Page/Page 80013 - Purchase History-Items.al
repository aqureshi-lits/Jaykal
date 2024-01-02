page 80013 "Purchase History-Items"
{
    // version NAVW113.00

    Caption = 'Posted Purchase Invoice Lines';
    Editable = false;
    PageType = List;
    SourceTable = "Purch. Inv. Line";

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                }
                field(Month; Month_Var)
                {
                    ApplicationArea = All;
                }
                field(Year; Year_Var)
                {
                    ApplicationArea = All;
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the document number.';
                }
                field("Buy-from Vendor No."; Rec."Buy-from Vendor No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the name of the vendor who delivered the items.';
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    ApplicationArea = All;
                }
                field(Country; Country_Var)
                {
                    ApplicationArea = All;
                }
                field(City; City_Var)
                {
                    ApplicationArea = All;
                }
                field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
                {
                    ApplicationArea = All;
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the line type.';
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies either the name of, or a description of, the item or general ledger account.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the quantity posted from the line.';
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies how each unit of the item or resource is measured, such as in pieces or hours. By default, the value in the Base Unit of Measure field on the item or resource card is inserted.';
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the name of the item or resource''s unit of measure, such as piece or hour.';
                }
                field("Item Category Code"; Rec."Item Category Code")
                {
                    ApplicationArea = All;
                }
                field("Direct Unit Cost"; Rec."Direct Unit Cost")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the cost of one unit of the selected item or resource.';
                }
                field("Unit Cost (LCY)"; Rec."Unit Cost (LCY)")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the cost, in LCY, of one unit of the item or resource on the line.';
                }
                field("Unit Price (LCY)"; Rec."Unit Price (LCY)")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the price, in LCY, of one unit of the item or resource. You can enter a price manually or have it entered according to the Price/Profit Calculation field on the related card.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the line''s net amount.';
                }
                field("Amount Including VAT"; Rec."Amount Including VAT")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the net amount, including VAT, for this line.';
                }
            }
        }
        area(factboxes)
        {
            systempart(links; Links)
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
                    ApplicationArea = Basic, Suite;
                    Caption = 'Show Document';
                    Image = View;
                    ShortCutKey = 'Shift+F7';
                    ToolTip = 'Open the document that the selected line exists on.';

                    trigger OnAction()
                    begin
                        PurchInvHeader.GET(Rec."Document No.");
                        PAGE.RUN(PAGE::"Posted Purchase Invoice", PurchInvHeader);
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

    trigger OnAfterGetRecord()
    begin
        Name_Var := '';
        Country_Var := '';
        City_Var := '';
        Currency_Code := '';
        CurrencyFactor := 0;

        Header_Rec.RESET;
        Header_Rec.SETRANGE("No.", Rec."Document No.");
        IF Header_Rec.FINDFIRST THEN BEGIN
            PODate := Header_Rec."Order Date";
            Name_Var := Header_Rec."Buy-from Vendor Name";
            Currency_Code := Header_Rec."Currency Code";
            Month_Var := DATE2DMY(Header_Rec."Posting Date", 2);
            Year_Var := DATE2DMY(Header_Rec."Posting Date", 3);
            IF Vend_Rec.GET(Header_Rec."Pay-to Vendor No.") THEN BEGIN
                City_Var := Vend_Rec.City;
                Country_Var := Vend_Rec."Country/Region Code";
            END;
            Country_Var := Vend_Rec."Country/Region Code";
            IF Header_Rec."Currency Factor" <> 0 THEN
                CurrencyFactor := 1 / Header_Rec."Currency Factor"
            ELSE
                CurrencyFactor := 1;
        END;
    end;

    var
        PurchInvHeader: Record 122;
        PODate: Date;
        Name_Var: Text[60];
        Country_Var: Code[25];
        City_Var: Text[25];
        Header_Rec: Record 122;
        Vend_Rec: Record 23;
        Currency_Code: Code[25];
        CurrencyFactor: Decimal;
        Month_Var: Integer;
        Year_Var: Integer;
}

