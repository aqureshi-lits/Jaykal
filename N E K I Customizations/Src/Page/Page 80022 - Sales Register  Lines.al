page 80022 "Sales Register  Lines"
{
    // version NAVW113.00

    Caption = 'Sales Register  Lines';
    Editable = false;
    PageType = List;
    SourceTable = 113;
    SourceTableView = WHERE(Amount = FILTER(<> 0));

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field(SalesPerson; SalesPersonCode)
                {
                    ApplicationArea = all;
                }
                field("Sell-to Customer No."; Rec."Sell-to Customer No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the number of the customer.';
                }
                field(Name; Name_Var)
                {
                    ApplicationArea = all;
                }
                field(City; City_Var)
                {
                    ApplicationArea = all;
                }
                field(Country; Country_Var)
                {
                    ApplicationArea = all;
                }
                field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
                {
                    ApplicationArea = all;
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the document number.';
                }
                field("Posting Date"; Rec."Posting Date")
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
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the name of the item or general ledger account, or some descriptive text.';
                }
                field("Item Category Code"; Rec."Item Category Code")
                {
                    ApplicationArea = all;
                }
                field(Quantity; Rec.Quantity)
                {

                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the number of units of the item specified on the line.';
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = all;
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                    ApplicationArea = all;
                }
                field("Customer PO"; CustomerPO)
                {
                    ApplicationArea = all;
                }
                field("Order No."; Rec."Order No.")
                {
                    ApplicationArea = all;
                }
                field("SO Date"; PODate)
                {
                    ApplicationArea = all;
                }
                field("Delivery Order No"; DeliveryNo)
                {
                    ApplicationArea = all;
                }
                field("Delivery Date"; DeliveryDate)
                {
                    ApplicationArea = all;
                }
                field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
                {
                    ApplicationArea = all;
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the price of one unit of the item or resource. You can enter a price manually or have it entered according to the Price/Profit Calculation field on the related card.';
                }
                field("Unit Cost"; Rec."Unit Cost")
                {
                    ApplicationArea = all;
                }
                field(Margin; Margin)
                {
                    ApplicationArea = all;
                }
                field("Margin %"; Margin_Perc)
                {
                    ApplicationArea = all;
                    Caption = 'Margin %';
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
                    Visible = false;
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the line type.';
                }
                field("Unit Cost (LCY)"; Rec."Unit Cost (LCY)")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the cost, in LCY, of one unit of the item or resource on the line.';
                    Visible = false;
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
                        SalesInvHeader.GET(Rec."Document No.");
                        PAGE.RUN(PAGE::"Posted Sales Invoice", SalesInvHeader);
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
        //PODate:=0D;
        Margin := Rec."Unit Price" - Rec."Unit Cost";

        IF Margin <> 0 THEN
            Margin_Perc := ROUND(Margin / Rec."Unit Price" * 100, 0.1)
        ELSE
            Margin_Perc := 0;



        Name_Var := '';
        Country_Var := '';
        City_Var := '';
        Currency_Code := '';
        CurrencyFactor := 0;

        Month_Var := 0;
        Year_Var := 0;
        CustomerPO := '';
        DeliveryNo := '';
        DeliveryDate := 0D;
        SalesPersonCode := '';


        Header_Rec.RESET;
        Header_Rec.SETRANGE("No.", Rec."Document No.");
        IF Header_Rec.FINDFIRST THEN BEGIN
            PODate := Header_Rec."Order Date";
            Name_Var := Header_Rec."Sell-to Customer Name";
            Currency_Code := Header_Rec."Currency Code";
            Month_Var := DATE2DMY(Rec."Posting Date", 2);
            Year_Var := DATE2DMY(Rec."Posting Date", 3);
            CustomerPO := Header_Rec."External Document No.";
            DeliveryNo := '';
            DeliveryDate := Header_Rec."Shipment Date";
            SalesPersonCode := Header_Rec."Salesperson Code";


            IF Vend_Rec.GET(Header_Rec."Sell-to Customer No.") THEN BEGIN
                City_Var := Vend_Rec.City;
            END;
            Country_Var := Vend_Rec."Country/Region Code";
            IF Header_Rec."Currency Factor" <> 0 THEN
                CurrencyFactor := 1 / Header_Rec."Currency Factor"
            ELSE
                CurrencyFactor := 1;
        END;



        /*
        PODateDate
        Name_VarText60
        Country_VarCode20
        City_VarText20
        Currency_CodeCode20
        CurrencyFactorDecimal
        */

    end;

    var
        SalesInvHeader: Record 112;
        PODate: Date;
        Name_Var: Text[60];
        Country_Var: Code[30];
        City_Var: Text[30];
        Header_Rec: Record 112;
        Vend_Rec: Record 18;
        Currency_Code: Code[30];
        CurrencyFactor: Decimal;
        SalesPersonCode: Code[30];
        Month_Var: Integer;
        Year_Var: Integer;
        CustomerPO: Code[60];
        DeliveryNo: Code[50];
        DeliveryDate: Date;
        Margin: Decimal;
        Margin_Perc: Decimal;
}

