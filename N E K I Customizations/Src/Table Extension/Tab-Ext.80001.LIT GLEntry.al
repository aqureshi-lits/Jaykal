tableextension 80001 "LIT GLEntry" extends "G/L Entry"


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

        //Fields from NEKI Customization
        field(80003; Import; Code[20])
        {
            CalcFormula = Lookup("Purch. Inv. Header"."Gen. Bus. Posting Group" WHERE("No." = FIELD("Document No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(80004; "Import CRM"; Code[20])
        {
            CalcFormula = Lookup("Purch. Cr. Memo Hdr."."Gen. Bus. Posting Group" WHERE("No." = FIELD("Document No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(80005; Remarks; Text[100])
        {
            DataClassification = ToBeClassified;
            Description = 'MAQ IAX Added 27-07-2019.';
            Editable = false;
        }
        field(80006; "Check No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'MAQ IAX Added 27-07-2019.';
            Editable = false;
        }
        field(50022; "Check Date"; Date)
        {
            DataClassification = ToBeClassified;
            Description = 'MAQ IAX Added 27-07-2019.';
            Editable = false;
        }

    }

}