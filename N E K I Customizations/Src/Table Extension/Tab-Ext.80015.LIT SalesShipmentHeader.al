tableextension 80015 "LIT SalesShipmentHeader" extends "Sales Shipment Header"


{
    fields
    {
        field(80000; "LIT Importance Type"; Option)
        {
            Caption = 'Importance Type';
            OptionCaption = ' ,High,Medium,Low';
            OptionMembers = ,High,Medium,Low;
            Editable = false;
        }
        field(80001; "LIT Remarks"; Text[250])
        {
            Caption = 'Remarks';
            Editable = false;
        }

        // N E K I

        field(80004; "Sales Type"; Option)
        {
            DataClassification = ToBeClassified;
            Description = '//Frz 060118';
            OptionCaption = ' ,Sales Local,Sales Export';
            OptionMembers = " ","Sales Local","Sales Export";
        }

        field(80005; "LIT Order Amount"; Decimal)
        {
            Caption = 'Order Amount';
            FieldClass = FlowField;
            CalcFormula = sum("Sales Shipment Line"."LIT Order Amount" where("Document No." = field("No.")));
        }
        field(80006; "LIT Order Amount Incl. VAT"; Decimal)
        {
            Caption = 'Order Amount Incl. VAT';
            FieldClass = FlowField;
            CalcFormula = sum("Sales Shipment Line"."LIT Order Amount Incl. VAT" where("Document No." = field("No.")));
        }
        field(80007; "LIT Order Discount Value"; Decimal)
        {
            Caption = 'Order Discount Value';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        // field(80008; "LIT Order Discount Amount"; Decimal)
        // {
        //     Caption = 'Order Discount Amount';
        //     DataClassification = ToBeClassified;
        //     Editable = false;
        // }

    }

}