tableextension 80005 "LIT VendorLedgerEntry" extends "Vendor Ledger Entry"

{
    fields
    {
        field(80000; "LIT Remarks"; Text[250])
        {
            Caption = 'Remarks';
            Editable = false;
        }
        field(80001; "LIT Check No."; Code[20])
        {
            Caption = 'Check No.';
            Editable = false;
        }
        field(80002; "LIT Check Date"; Date)
        {
            Caption = 'Check Date';
            Editable = false;
        }

        // N E K I 

        field(80003; PDC; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(80004; "PDC Bank Account Entry No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(80005; "PDC Value Date"; Date)
        {
            CalcFormula = Lookup("Bank Account Ledger Entry"."Posting Date" WHERE("Entry No." = FIELD("PDC Bank Account Entry No.")));
            FieldClass = FlowField;
        }
        field(80006; "PDC Bank No."; Code[20])
        {
            CalcFormula = Lookup("Bank Account Ledger Entry"."Bank Account No." WHERE("Entry No." = FIELD("PDC Bank Account Entry No.")));
            FieldClass = FlowField;
        }
        field(80007; "Cheque Bank No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(80008; "Cheque No."; Integer)
        {
            CalcFormula = Lookup("Bank Account Ledger Entry"."Entry No." WHERE("Document No." = FIELD("Document No.")));
            Description = 'AS';
            Editable = false;
            FieldClass = FlowField;
        }
        field(80020; Remarks; Text[100])
        {
            Description = 'MAQ IAX Added 27-07-2019.';
            Editable = false;
        }
        field(80021; "Check No."; Code[20])
        {
            Description = 'MAQ IAX Added 27-07-2019.';
            Editable = false;
        }
        field(80022; "Check Date"; Date)
        {
            Description = 'MAQ IAX Added 27-07-2019.';
            Editable = false;
        }
    }

}