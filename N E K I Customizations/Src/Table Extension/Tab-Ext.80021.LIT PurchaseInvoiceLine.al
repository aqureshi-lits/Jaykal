tableextension 80021 "LIT PurchaseInvoiceLine" extends "Purch. Inv. Line"

{
    fields
    {
        field(80000; "LIT Comment"; Text[250])
        {
            Caption = 'Comment';
        }
        field(80001; "LIT Description 3"; Text[500])
        {
            Caption = 'Description 3';
            Editable = false;
            TableRelation = IF (Type = CONST(Item)) Item.Description WHERE("No." = FIELD("No.")) ELSE
            IF (Type = CONST("Fixed Asset")) "Fixed Asset".Description WHERE("No." = FIELD("No.")) ELSE
            IF (Type = CONST("G/L Account")) "G/L Account".Name WHERE("No." = FIELD("No."));
            ValidateTableRelation = false;
        }

        // N E K I

        field(80002; "Vendor Name"; Text[100])
        {
            CalcFormula = Lookup("Purch. Inv. Header"."Buy-from Vendor Name" WHERE("No." = FIELD("Document No.")));
            Editable = false;
            FieldClass = FlowField;
        }

    }
}