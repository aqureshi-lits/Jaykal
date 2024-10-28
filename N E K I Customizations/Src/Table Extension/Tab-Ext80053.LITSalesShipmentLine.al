tableextension 80053 "LIT Sales Shipment Line" extends "Sales Shipment Line"
{
    fields
    {
        field(80002; "LIT Order Amount"; Decimal)
        {
            Caption = 'Order Amount';
            DataClassification = ToBeClassified;
        }
        field(80003; "LIT Order Amount Incl. VAT"; Decimal)
        {
            Caption = 'Order Amount Incl. VAT';
            DataClassification = ToBeClassified;
        }
        field(80004; "LIT Order Line Discount %"; Decimal)
        {
            Caption = 'Order Line Discount %';
            DataClassification = ToBeClassified;
        }
        field(80005; "LIT Order Unit Price"; Decimal)
        {
            Caption = 'Order Unit Price';
            DataClassification = ToBeClassified;
        }
    }
}
