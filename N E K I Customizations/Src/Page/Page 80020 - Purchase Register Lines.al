page 80020 "Purchase Register Lines"
{
    // version NAVW113.00

    Caption = 'Purchase Register Lines';
    Editable = false;
    PageType = List;
    SourceTable = 123;
    SourceTableView = WHERE(Amount = FILTER(<> 0));

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field("Document No."; rec."Document No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the document number.';
                }
                field("Posting Date"; rec."Posting Date")
                {
                    ApplicationArea = all;
                }
                field(Month; Month_Var)
                {
                    ApplicationArea = all;
                }
                field(Year; Year_Var)
                {
                    ApplicationArea = all;
                }
                field("Order No."; rec."Order No.")
                {
                    ApplicationArea = all;
                }
                field("Order Date"; PODate)
                {
                    ApplicationArea = all;
                }
                field("Gen. Bus. Posting Group"; rec."Gen. Bus. Posting Group")
                {
                    ApplicationArea = all;
                }
                field("Buy-from Vendor No."; rec."Buy-from Vendor No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the name of the vendor who delivered the items.';
                }
                field(Name; Name_Var)
                {
                    ApplicationArea = all;
                }
                field(Country; Country_Var)
                {
                    ApplicationArea = all;
                }
                field(City; City_Var)
                {
                    ApplicationArea = all;
                }
                field(Description; rec.Description)
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies either the name of, or a description of, the item or general ledger account.';
                }
                field("Gen. Prod. Posting Group"; rec."Gen. Prod. Posting Group")
                {
                    ApplicationArea = all;
                }
                field("Item Category Code"; rec."Item Category Code")
                {
                    ApplicationArea = all;
                }
                field("Unit of Measure Code"; rec."Unit of Measure Code")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies how each unit of the item or resource is measured, such as in pieces or hours. By default, the value in the Base Unit of Measure field on the item or resource card is inserted.';
                }
                field("Unit of Measure"; rec."Unit of Measure")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the name of the item or resource''s unit of measure, such as piece or hour.';
                }
                field("Direct Unit Cost"; rec."Direct Unit Cost")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the cost of one unit of the selected item or resource.';
                }
                field("Unit Cost (LCY)"; rec."Unit Cost (LCY)")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the cost, in LCY, of one unit of the item or resource on the line.';
                }
                field("Unit Price (LCY)"; rec."Unit Price (LCY)")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the price, in LCY, of one unit of the item or resource. You can enter a price manually or have it entered according to the Price/Profit Calculation field on the related card.';
                }
                field(Amount; rec.Amount * CurrencyFactor)
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the line''s net amount.';
                }
                field("Amount Inc. VAT"; rec."Amount Including VAT" * CurrencyFactor)
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the net amount, including VAT, for this line.';
                }
                field(Quantity; rec.Quantity)
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the quantity posted from the line.';
                }
                field(Type; rec.Type)
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the line type.';
                }
                field("No."; rec."No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
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
                    ApplicationArea = Basic, Suite;
                    Caption = 'Show Document';
                    Image = View;
                    ShortCutKey = 'Shift+F7';
                    ToolTip = 'Open the document that the selected line exists on.';

                    trigger OnAction()
                    begin
                        PurchInvHeader.GET(rec."Document No.");
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
                        rec.ShowDimensions;
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
                        rec.ShowItemTrackingLines;
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    var
        PurchInvHeader: Record 122;
        PODate: Date;
        Name_Var: Text[60];
        Country_Var: Code[20];
        City_Var: Text[20];
        Header_Rec: Record 122;
        Vend_Rec: Record 23;
        Currency_Code: Code[20];
        CurrencyFactor: Decimal;
    begin
        //PODate:=0D;
        Name_Var := '';
        Country_Var := '';
        City_Var := '';
        Currency_Code := '';
        CurrencyFactor := 0;

        Header_Rec.RESET;
        Header_Rec.SETRANGE("No.", rec."Document No.");
        IF Header_Rec.FINDFIRST THEN BEGIN
            PODate := Header_Rec."Order Date";
            Name_Var := Header_Rec."Buy-from Vendor Name";
            Currency_Code := Header_Rec."Currency Code";
            Month_Var := DATE2DMY(rec."Posting Date", 2);
            Year_Var := DATE2DMY(rec."Posting Date", 3);
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

