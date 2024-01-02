tableextension 80022 "LIT PurchaseCreditMemoHeader" extends "Purch. Cr. Memo Hdr."

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

        // field(80004; "Prepared By"; text[50])
        // {
        //     Caption = 'Prepared By';
        // }

        // field(80005; "Approved By"; text[50])
        // {
        //     Caption = 'Decalration Date';
        // }

        // field(80006; "Driver Name"; text[50])
        // {
        //     Caption = 'Driver Name';
        // }

    }

}