tableextension 80020 "LIT PurchaseInvoiceHeader" extends "Purch. Inv. Header"


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
        field(80002; "Decalration No."; Code[20])
        {
            Caption = 'Decalration No.';
            Editable = false;
        }
        field(80003; "Decalration Date"; Date)
        {
            Caption = 'Decalration Date';
            Editable = false;
        }

        field(80004; "Prepared By"; text[50])
        {
            Caption = 'Prepared By';
            Editable = false;
        }

        field(80005; "Approved By"; text[50])
        {
            Caption = 'Approved By';
            Editable = false;
        }

        field(80006; "Driver Name"; text[50])
        {
            Caption = 'Driver Name';
            Editable = false;
        }

        // N E K I

        field(80007; "Purchase Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Purchase Local,Purchase Import';
            OptionMembers = " ","Purchase Local","Purchase Import";
        }

    }

}