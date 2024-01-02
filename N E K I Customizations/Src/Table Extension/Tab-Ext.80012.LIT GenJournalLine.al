tableextension 80012 "LIT GenJournalLine" extends "Gen. Journal Line"


{
    fields
    {
        field(80000; "LIT Remarks"; Text[250])
        {
            Caption = 'Remarks';
        }
        field(80001; "LIT Check No."; Code[20])
        {
            Caption = 'Check No.';
        }
        field(80002; "LIT Check Date"; Date)
        {
            Caption = 'Check Date';
        }

        // N E K I 

        field(80006; PDC; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(80007; "PDC Customer No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer."No.";
        }
        field(80008; "Cust. PDC Entry No."; Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Cust. Ledger Entry"."Entry No." WHERE("Customer No." = FIELD("PDC Customer No."),
                                                                    PDC = CONST(true));
        }
        field(80009; "PDC Vendor No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor."No.";
        }
        field(80010; "Vendor PDC Entry No."; Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Vendor Ledger Entry"."Entry No." WHERE("Vendor No." = FIELD("PDC Vendor No."),
                                                                     PDC = CONST(true));
        }
        field(80011; "Cheque Bank No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Bank Account"."No.";
        }
        field(80012; "Cheque No"; Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'AS';
        }
        field(80020; Remarks; Text[100])
        {
            DataClassification = ToBeClassified;
            Description = 'MAQ IAX Added 27-07-2019.';
        }
        field(80021; "Check No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'MAQ IAX Added 27-07-2019.';
        }
        field(80022; "Check Date"; Date)
        {
            DataClassification = ToBeClassified;
            Description = 'MAQ IAX Added 27-07-2019.';
        }


    }

}