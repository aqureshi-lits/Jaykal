tableextension 80016 "LIT SalesInvoiceHeader" extends "Sales Invoice Header"


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


        field(80003; "Requested Delivery Date"; Date)
        {
            CalcFormula = Lookup("Sales Shipment Header"."Requested Delivery Date" WHERE("Order No." = FIELD("Order No.")));
            Description = '//Frz 170119';
            Editable = false;
            FieldClass = FlowField;
        }

        field(80004; "Sales Type"; Option)
        {
            DataClassification = ToBeClassified;
            Description = '//Frz 060118';
            OptionCaption = ' ,Sales Local,Sales Export';
            OptionMembers = " ","Sales Local","Sales Export";
        }

    }

}