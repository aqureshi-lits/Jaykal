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

    }

}