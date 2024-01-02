tableextension 80023 "LIT PurchaseCreditMemoLine" extends "Purch. Cr. Memo Line"

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

    }
}