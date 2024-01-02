tableextension 80007 "LIT ItemLedgerEntry" extends "Item Ledger Entry"


{
    fields
    {
        field(80000; "LIT Remarks"; Text[250])
        {
            Caption = 'Remarks';
            Editable = false;
        }

        field(80001; "Item Desc"; Text[250])
        {
            CalcFormula = Lookup(Item.Description WHERE("No." = FIELD("Item No.")));
            FieldClass = FlowField;
        }

    }

}