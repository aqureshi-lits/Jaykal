tableextension 80003 "LIT CustLedgerEntry" extends "Cust. Ledger Entry"

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

        field(50003; PDC; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50004; "PDC Bank Account Entry No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(50005; "PDC Value Date"; Date)
        {
            CalcFormula = Lookup("Bank Account Ledger Entry"."Posting Date" WHERE("Entry No." = FIELD("PDC Bank Account Entry No.")));
            FieldClass = FlowField;
        }
        field(50006; "PDC Bank No."; Code[20])
        {
            CalcFormula = Lookup("Bank Account Ledger Entry"."Bank Account No." WHERE("Entry No." = FIELD("PDC Bank Account Entry No.")));
            FieldClass = FlowField;
        }
        field(50007; "Cheque No."; Integer)
        {
            CalcFormula = Lookup("Bank Account Ledger Entry"."Entry No." WHERE("Document No." = FIELD("Document No.")));
            Description = 'AS';
            Editable = false;
            FieldClass = FlowField;
        }
        // field(50020; Remarks; Text[100])
        // {
        //     Description = 'MAQ IAX Added 27-07-2019.';
        //     Editable = false;
        // }
        // field(50021; "Check No."; Code[20])
        // {
        //     Description = 'MAQ IAX Added 27-07-2019.';
        //     Editable = false;
        // }
        // field(50022; "Check Date"; Date)
        // {
        //     Description = 'MAQ IAX Added 27-07-2019.';
        //     Editable = false;
        // }
        // field(50023; "Customer Name"; Text[50])
        // {
        //     CalcFormula = Lookup(Customer.Name WHERE("No." = FIELD("Customer No.")));
        //     Description = 'MAQ IAX Added 21-10-2020.';
        //     Editable = false;
        //     FieldClass = FlowField;
        // } // WAJ 12 Dec 23
        field(50024; "Country/Region Code"; Text[30])
        {
            CalcFormula = Lookup(Customer."Country/Region Code" WHERE("No." = FIELD("Customer No.")));
            Description = 'MAQ IAX Added 21-10-2020.';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50025; City; Text[30])
        {
            CalcFormula = Lookup(Customer.City WHERE("No." = FIELD("Customer No.")));
            Description = 'MAQ IAX Added 21-10-2020.';
            Editable = false;
            FieldClass = FlowField;
        }
    }

    var




}

