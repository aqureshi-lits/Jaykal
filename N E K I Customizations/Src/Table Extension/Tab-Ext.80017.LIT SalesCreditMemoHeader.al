tableextension 80017 "LIT SalesCreditMemoHeader" extends "Sales Cr.Memo Header"


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

    }

}