tableextension 80006 "LIT Item" extends "Item"

{

    fields
    {

        field(80000; "LIT Description 3"; Text[250])
        {
            Caption = 'Description 3';

        }

        field(80001; "LIT ITEM BRAND"; Code[20])
        {
            TableRelation = "LIT ITEM BRAND".Code;
            Caption = 'Item Brand Code';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                Recref: RecordRef;
                Dimensionvalue: Record "Dimension Value";
            begin
                // DimensionValue.GET('ITEMCATEGORY', Rec."No.");
                // // Recref := Rec;
                DefaultDim.Reset();
                DefaultDim.SetRange("Table ID", Database::Item);
                DefaultDim.SetRange("No.", Rec."No.");
                // DefaultDim.SetRange("No.", Rec."Item Category Code");
                DefaultDim.SetRange("Dimension Code", 'ITEMBRAND');
                if DefaultDim.FindSet() then begin
                    DefaultDim."Table ID" := DATABASE::Item;
                    DefaultDim."No." := Rec."No.";
                    DefaultDim."Dimension Code" := 'ITEMBRAND';
                    DefaultDim."Dimension Value Code" := Rec."LIT ITEM BRAND";
                    DefaultDim."Value Posting" := DefaultDim."Value Posting"::"Same Code";
                    DefaultDim.Modify();
                end
                else begin
                    DefaultDim."Table ID" := DATABASE::Item;
                    DefaultDim."No." := Rec."No.";
                    DefaultDim."Dimension Code" := 'ITEMBRAND';
                    DefaultDim."Dimension Value Code" := Rec."LIT ITEM BRAND";
                    if DefaultDim.INSERT() then;
                    DefaultDim."Value Posting" := DefaultDim."Value Posting"::"Same Code";
                    DefaultDim.Modify();
                end;
            end;
            // end;
        }

        modify("Item Category Code")
        {
            trigger OnAfterValidate()
            var
                Recref: RecordRef;
                Dimensionvalue: Record "Dimension Value";
            // ItemCategory: Record "Item Category" temporary;
            begin
                // DimensionValue.GET('ITEMCATEGORY', Rec."No.");
                // // Recref := Rec;
                DefaultDim.Reset();
                DefaultDim.SetRange("Table ID", Database::Item);
                DefaultDim.SetRange("No.", Rec."No.");
                // DefaultDim.SetRange("No.", Rec."Item Category Code");
                DefaultDim.SetRange("Dimension Code", 'ITEMCATEGORY');
                if DefaultDim.FindSet() then begin
                    DefaultDim."Table ID" := DATABASE::Item;
                    DefaultDim."No." := Rec."No.";
                    DefaultDim."Dimension Code" := 'ITEMCATEGORY';
                    DefaultDim."Dimension Value Code" := Rec."Item Category Code";
                    DefaultDim."Value Posting" := DefaultDim."Value Posting"::"Same Code";
                    DefaultDim.Modify();
                end
                else begin
                    DefaultDim."Table ID" := DATABASE::Item;
                    DefaultDim."No." := Rec."No.";
                    DefaultDim."Dimension Code" := 'ITEMCATEGORY';
                    DefaultDim."Dimension Value Code" := Rec."Item Category Code";
                    if DefaultDim.INSERT() then;
                    DefaultDim."Value Posting" := DefaultDim."Value Posting"::"Same Code";
                    DefaultDim.Modify();
                end;
            end;
        }
        field(80003; "LIT Business Segment"; Code[20])
        {
            // TableRelation = "LIT Business Segment".Code;
            Caption = 'Business Segment Code';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                Recref: RecordRef;
                // ProductBrandRec: Record "LIT Product Brand";
                Dimensionvalue: Record "Dimension Value";

            begin
                //Need to update with business segment

                // Recref.GetTable(Rec);
                // // ProductBrandRec.Get(Rec."Product Brand Code");
                // // DimensionValue.INIT;
                // // DimensionValue."Dimension Code" := InvSetup."Item Default Dimension";
                // // DimensionValue.Code := Rec."Product Brand Code";
                // // // ItemDescription := CopyStr(Description, 1, 50);
                // // //DimensionValue.Name := "Description";
                // // // DimensionValue.Name := ItemDescription;
                // // //DimensionValue."Global Dimension No." := 1;                 //MAQ IAX Commented 04-08-2020
                // // DimensionValue.INSERT;
                // Dimensionvalue.Get(Rec."Product Brand Code");
                // DefaultDim.INIT;
                // DefaultDim."Table ID" := Recref.Number;
                // DefaultDim."No." := Rec."No.";
                // DefaultDim."Dimension Code" := Rec."Product Brand Code";
                // DefaultDim."Dimension Value Code" := "No.";
                // DefaultDim."Value Posting" := DefaultDim."Value Posting"::"Same Code";
                // if DefaultDim.INSERT() then
                //     DefaultDim.Modify();
            end;
            // end;
        }

        field(80004; "LIT ITEM GROUP"; Code[20])
        {
            TableRelation = "LIT Item Group".Code;
            Caption = 'Item Group Code';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                Recref: RecordRef;
                Dimensionvalue: Record "Dimension Value";
            begin
                // DimensionValue.GET('ITEMCATEGORY', Rec."No.");
                // // Recref := Rec;
                DefaultDim.Reset();
                DefaultDim.SetRange("Table ID", Database::Item);
                DefaultDim.SetRange("No.", Rec."No.");
                // DefaultDim.SetRange("No.", Rec."Item Category Code");
                DefaultDim.SetRange("Dimension Code", 'ITEMGROUP');
                if DefaultDim.FindSet() then begin
                    DefaultDim."Table ID" := DATABASE::Item;
                    DefaultDim."No." := Rec."No.";
                    DefaultDim."Dimension Code" := 'ITEMGROUP';
                    DefaultDim."Dimension Value Code" := Rec."LIT ITEM GROUP";
                    DefaultDim."Value Posting" := DefaultDim."Value Posting"::"Same Code";
                    DefaultDim.Modify();
                end
                else begin
                    DefaultDim."Table ID" := DATABASE::Item;
                    DefaultDim."No." := Rec."No.";
                    DefaultDim."Dimension Code" := 'ITEMGROUP';
                    DefaultDim."Dimension Value Code" := Rec."LIT ITEM GROUP";
                    if DefaultDim.INSERT() then;
                    DefaultDim."Value Posting" := DefaultDim."Value Posting"::"Same Code";
                    DefaultDim.Modify();
                end;
            end;
            // end;
        }
        field(80005; "LIT Arabic Description"; Text[250])
        {
            Caption = 'Arabic Description';
            DataClassification = ToBeClassified;
        }
        field(80006; "LIT Storage Condition"; Code[20])
        {
            TableRelation = "LIT Storage Condition".Code;
            Caption = 'Storage Condition Code';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                // // Recref := Rec;
                DefaultDim.Reset();
                DefaultDim.SetRange("Table ID", Database::Item);
                DefaultDim.SetRange("No.", Rec."No.");
                // DefaultDim.SetRange("No.", Rec."Item Category Code");
                DefaultDim.SetRange("Dimension Code", 'STORAGECONDITION');
                if DefaultDim.FindSet() then begin
                    DefaultDim."Table ID" := DATABASE::Item;
                    DefaultDim."No." := Rec."No.";
                    DefaultDim."Dimension Code" := 'STORAGECONDITION';
                    DefaultDim."Dimension Value Code" := Rec."LIT Storage Condition";
                    DefaultDim."Value Posting" := DefaultDim."Value Posting"::"Same Code";
                    DefaultDim.Modify();
                end
                else begin
                    DefaultDim."Table ID" := DATABASE::Item;
                    DefaultDim."No." := Rec."No.";
                    DefaultDim."Dimension Code" := 'STORAGECONDITION';
                    DefaultDim."Dimension Value Code" := Rec."LIT Storage Condition";
                    if DefaultDim.INSERT() then;
                    DefaultDim."Value Posting" := DefaultDim."Value Posting"::"Same Code";
                    DefaultDim.Modify();
                end;
            end;
        }
        field(80007; "Packing"; Code[30])
        {
            Caption = 'Packing';
            DataClassification = ToBeClassified;

        }
        field(80008; "LIT No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = ToBeClassified;
            // FieldClass = FlowField;
            // CalcFormula = lookup(item."No." where("No." = field("No.")));
            // Editable = false;
        }
        field(80009; "Qty to Order"; Decimal)
        {
            Caption = 'Qty to Order';
            // DataClassification = ToBeClassified;

        }

    }

    fieldgroups
    {
        addlast(DropDown; Inventory, "LIT Description 3")
        {

        }



    }

    trigger OnAfterInsert()
    var

    begin

    end;

    trigger OnAfterModify()
    var

    begin

    end;

    var
        UserSetup: Record 91;
        DimensionValue: Record 349;
        DefaultDim: Record 352;
        InvSetup: Record 313;


}