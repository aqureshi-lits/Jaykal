report 80051 "LIT Update Sales Shipment"
{
    ApplicationArea = All;
    Caption = 'LIT - Update Sales Shipments';
    UsageCategory = Administration;
    ProcessingOnly = true;
    Permissions = tabledata "Sales Shipment Line" = RIMD, tabledata "Sales Shipment Header" = RIMD;

    dataset
    {
        dataitem(SalesShipmentHeaderdt; "Sales Shipment Header")
        {

            dataitem(SalesShipmentLinedt; "Sales Shipment Line")
            {
                DataItemTableView = where(Quantity = filter(<> 0));
                DataItemLink = "Document No." = field("No.");

                trigger OnAfterGetRecord()
                var
                    myInt: Integer;
                begin
                    SalesLine.Reset();
                    SalesLine.SetRange("Document Type", SalesLine."Document Type"::Order);
                    SalesLine.SetRange("Document No.", SalesShipmentLinedt."Order No.");
                    SalesLine.SetRange("Line No.", SalesShipmentLinedt."Order Line No.");
                    SalesLine.SetRange("No.", SalesShipmentLinedt."No.");
                    if SalesLine.FindSet() then begin

                        SalesHeader.Reset();
                        SalesHeader.SetRange("Document Type", SalesLine."Document Type");
                        SalesHeader.SetRange("No.", SalesLine."Document No.");
                        if SalesHeader.FindSet() then begin

                            if SalesHeader."Prices Including VAT" = true then begin

                                Clear(LineDiscountPercent);
                                Clear(LineDiscountAmount);
                                if SalesLine."Line Discount Amount" > 0 then begin
                                    LineDiscountAmount := Round((Abs(SalesLine."Unit Price" / SalesLine."Line Discount %")), 0.01, '>');
                                end;

                                Clear(VATAmount);
                                // VATAmount := Round((Abs(SalesLine."Unit Price" - LineDiscountAmount) * (SalesLine."VAT %" / 100)), 0.01, '>');
                                VATAmount := Abs(SalesLine."Unit Price" - LineDiscountAmount) * (SalesLine."VAT %" / 100);

                                SalesShipmentLinedt."LIT Order Unit Price" := SalesLine."Unit Price";
                                SalesShipmentLinedt."LIT Order Amount" := Abs(SalesShipmentLinedt.Quantity) * (Abs(SalesLine."Unit Price" - LineDiscountAmount) - Abs(VATAmount));//Abs(SalesLineGet.Amount);
                                SalesShipmentLinedt."LIT Order Amount Incl. VAT" := Abs(SalesShipmentLinedt.Quantity) * Abs(SalesLine."Unit Price" - LineDiscountAmount);//Abs(SalesLineGet."Amount Including VAT");
                                SalesShipmentLinedt.Modify(true);
                            end
                            else begin

                                Clear(LineDiscountPercent);
                                Clear(LineDiscountAmount);
                                if SalesLine."Line Discount Amount" > 0 then begin
                                    LineDiscountAmount := Round((Abs(SalesLine."Unit Price" / SalesLine."Line Discount %")), 0.01, '>');
                                end;

                                Clear(VATAmount);
                                // VATAmount := Round((Abs(SalesLine."Unit Price" - LineDiscountAmount) * (SalesLine."VAT %" / 100)), 0.01, '>');
                                VATAmount := Abs(SalesLine."Unit Price" - LineDiscountAmount) * (SalesLine."VAT %" / 100);

                                SalesShipmentLinedt."LIT Order Unit Price" := SalesLine."Unit Price";
                                SalesShipmentLinedt."LIT Order Amount" := Abs(SalesShipmentLinedt.Quantity) * Abs(SalesLine."Unit Price" - LineDiscountAmount);//Abs(SalesLineGet.Amount);
                                SalesShipmentLinedt."LIT Order Amount Incl. VAT" := Abs(SalesShipmentLinedt.Quantity) * (Abs(SalesLine."Unit Price" - LineDiscountAmount) + Abs(VATAmount));//Abs(SalesLineGet."Amount Including VAT");
                                SalesShipmentLinedt.Modify(true);
                            end;

                        end;

                        // SalesShipmentLinedt."LIT Order Amount" := SalesLine.Amount;
                        // SalesShipmentLinedt."LIT Order Amount Incl. VAT" := SalesLine."Amount Including VAT";
                        // SalesShipmentLinedt.Modify(true);

                    end;
                end;
            }

            trigger OnAfterGetRecord()
            var
                myInt: Integer;
            begin

                SalesHeader.Reset();
                SalesHeader.SetRange("No.", SalesShipmentHeaderdt."Order No.");
                if SalesHeader.FindSet() then begin
                    if (SalesShipmentHeaderdt."LIT Order Discount Value" = 0) and (SalesHeader."Invoice Discount Value" > 0) then begin
                        SalesShipmentHeaderdt."LIT Order Discount Value" := SalesHeader."Invoice Discount Value";
                        SalesShipmentHeaderdt.Modify(true);
                    end;
                end;

            end;

        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }

    var
        SalesLine: Record "Sales Line";
        SalesHeader: Record "Sales Header";
        VATAmount: Decimal;
        LineDiscountPercent: Decimal;
        LineDiscountAmount: Decimal;
}
