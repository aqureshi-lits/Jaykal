tableextension 80004 "LIT Vendor" extends "Vendor"

{
    fields
    {
        field(80001; "LIT Vendor Group"; Code[20])
        {
            TableRelation = "LIT Vendor Group".Code;
            Caption = 'Vendor Group Code';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                Recref: RecordRef;
                Dimensionvalue: Record "Dimension Value";

            begin
                //Need to update with business segment

                DefaultDim.Reset();
                DefaultDim.SetRange("Table ID", Database::Vendor);
                DefaultDim.SetRange("No.", Rec."No.");
                // DefaultDim.SetRange("No.", Rec."Item Category Code");
                DefaultDim.SetRange("Dimension Code", 'VENDORGROUP');
                if DefaultDim.FindSet() then begin
                    DefaultDim."Table ID" := DATABASE::Vendor;
                    DefaultDim."No." := Rec."No.";
                    DefaultDim."Dimension Code" := 'VENDORGROUP';
                    DefaultDim."Dimension Value Code" := Rec."LIT Vendor Group";
                    DefaultDim."Value Posting" := DefaultDim."Value Posting"::"Same Code";
                    DefaultDim.Modify();
                end
                else begin
                    DefaultDim."Table ID" := DATABASE::Vendor;
                    DefaultDim."No." := Rec."No.";
                    DefaultDim."Dimension Code" := 'VENDORGROUP';
                    DefaultDim."Dimension Value Code" := Rec."LIT Vendor Group";
                    if DefaultDim.INSERT() then;
                    DefaultDim."Value Posting" := DefaultDim."Value Posting"::"Same Code";
                    DefaultDim.Modify();
                end;
            end;
            // end;

        }
        field(80002; "LIT Arabic Name"; Text[100])
        {
            Caption = 'Arabic Name';
            DataClassification = ToBeClassified;
        }
        // N E K I

        // field(80003; PDC; Boolean)
        // {
        //     DataClassification = ToBeClassified;
        // }
        // field(80004; "PDC Bank Account Entry No."; Integer)
        // {
        //     DataClassification = ToBeClassified;
        // }
        // field(80005; "PDC Value Date"; Date)
        // {
        //     CalcFormula = Lookup("Bank Account Ledger Entry"."Posting Date" WHERE("Entry No." = FIELD("PDC Bank Account Entry No.")));
        //     FieldClass = FlowField;
        // }
        // field(80006; "PDC Bank No."; Code[20])
        // {
        //     CalcFormula = Lookup("Bank Account Ledger Entry"."Bank Account No." WHERE("Entry No." = FIELD("PDC Bank Account Entry No.")));
        //     FieldClass = FlowField;
        // }
        // field(80007; "Cheque Bank No."; Code[20])
        // {
        //     DataClassification = ToBeClassified;
        // }
        // field(50007; "Cheque No."; Integer)
        // {
        //     //CalcFormula = Lookup("Bank Account Ledger Entry"."Entry No." WHERE("Document No." = FIELD("Document No.")));
        //     //CalcFormula = Lookup("Bank Account Ledger Entry"."Entry No." WHERE("No." = FIELD("Document No."))); // WAJ 12 Dec
        //     Description = 'AS';
        //     Editable = false;
        //     //FieldClass = FlowField;
        // }
        // field(80020; Remarks; Text[100])
        // {
        //     Description = 'MAQ IAX Added 27-07-2019.';
        //     Editable = false;
        // }
        // field(80021; "Check No."; Code[20])
        // {
        //     Description = 'MAQ IAX Added 27-07-2019.';
        //     Editable = false;
        // }
        // field(80022; "Check Date"; Date)
        // {
        //     Description = 'MAQ IAX Added 27-07-2019.';
        //     Editable = false;
        // }
        field(80003; "LIT No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = ToBeClassified;
        }

    }

    trigger OnAfterInsert()
    var
        VendorName: Text[50];
        myInt: Integer;
    begin

    end;

    trigger OnAfterModify()
    var
        VendorName: Text[50];
        myInt: Integer;
    begin

    end;

    var
        UserSetup: Record 91;
        DimensionValue: Record 349;
        DefaultDim: Record 352;
        PurchSetup: Record 312;

}