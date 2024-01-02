tableextension 80027 "LIT BankAccountLedgerEntry" extends "Bank Account Ledger Entry"


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

        field(80003; "Cust. PDC Entry No."; Integer)
        {
            DataClassification = ToBeClassified;
            //TableRelation = "Cust. Ledger Entry"."Entry No." WHERE("Entry No." = FIELD("PDC Bank Account Entry No."));// WAJ 12 Dec 23
        }
        field(80004; "PDC Customer No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer."No.";
        }
        field(80005; "PDC Customer Name"; Text[100])
        {
            CalcFormula = Lookup(Customer.Name WHERE("No." = FIELD("PDC Customer No.")));
            FieldClass = FlowField;
        }
        field(80006; "Vendor PDC Entry No."; Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Vendor Ledger Entry"."Entry No." WHERE("Entry No." = FIELD("Vendor PDC Entry No."));
        }
        field(80007; "PDC Vendor No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor."No.";
        }
        field(80008; "PDC Vendor Name"; Text[100])
        {
            CalcFormula = Lookup(Vendor.Name WHERE("No." = FIELD("PDC Vendor No.")));
            FieldClass = FlowField;
        }
        field(80009; "Cheque No."; Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'AS';
        }
        field(80020; Remarks; Text[100])
        {
            Description = 'MAQ IAX Added 27-07-2019.';
            Editable = false;
        }
        field(80021; "Check No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'MAQ IAX Added 27-07-2019.';
            Editable = false;
        }
        field(80022; "Check Date"; Date)
        {
            DataClassification = ToBeClassified;
            Description = 'MAQ IAX Added 27-07-2019.';
            Editable = false;
        }
    }

}