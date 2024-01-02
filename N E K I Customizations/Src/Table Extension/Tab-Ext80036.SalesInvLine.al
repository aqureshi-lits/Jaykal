tableextension 80036 SalesInvLine extends "Sales Invoice Line"
{
    fields
    {
        field(80001; "Customer Name"; Text[100])
        {
            CalcFormula = Lookup("Sales Invoice Header"."Sell-to Customer Name" WHERE("No." = FIELD("Document No.")));
            Editable = false;
            FieldClass = FlowField;
        }
    }
}
