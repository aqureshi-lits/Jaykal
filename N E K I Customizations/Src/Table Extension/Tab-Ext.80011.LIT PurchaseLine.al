tableextension 80011 "LIT PurchaseLine" extends "Purchase Line"

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
        field(80002; "LIT Buy-from Vendor Name"; Text[100])
        {
            Caption = 'Buy-from Vendor Name';
            FieldClass = FlowField;
            CalcFormula = Lookup("Purchase Header"."Buy-from Vendor Name" WHERE("Document Type" = FIELD("Document Type"), "No." = FIELD("Document No."), "Buy-from Vendor No." = FIELD("Buy-from Vendor No.")));
            Editable = false;
        }


    }

}