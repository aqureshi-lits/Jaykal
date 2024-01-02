tableextension 80002 "LIT Customer" extends "Customer"

{
    fields
    {
        /*
        field(50000; Remarks; Text[250])
        {
            Caption = 'Remarks';
        }
        */
        field(80001; "LIT Customer Group"; Code[20])
        {
            TableRelation = "LIT Customer Group".Code;
            Caption = 'Customer Group Code';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                Recref: RecordRef;
                Dimensionvalue: Record "Dimension Value";

            begin
                //Need to update with business segment

                DefaultDim.Reset();
                DefaultDim.SetRange("Table ID", Database::Customer);
                DefaultDim.SetRange("No.", Rec."No.");
                // DefaultDim.SetRange("No.", Rec."Item Category Code");
                DefaultDim.SetRange("Dimension Code", 'CUSTOMERGROUP');
                if DefaultDim.FindSet() then begin
                    DefaultDim."Table ID" := DATABASE::Customer;
                    DefaultDim."No." := Rec."No.";
                    DefaultDim."Dimension Code" := 'CUSTOMERGROUP';
                    DefaultDim."Dimension Value Code" := Rec."LIT Customer Group";
                    DefaultDim."Value Posting" := DefaultDim."Value Posting"::"Same Code";
                    DefaultDim.Modify();
                end
                else begin
                    DefaultDim."Table ID" := DATABASE::Customer;
                    DefaultDim."No." := Rec."No.";
                    DefaultDim."Dimension Code" := 'CUSTOMERGROUP';
                    DefaultDim."Dimension Value Code" := Rec."LIT Customer Group";
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

        //  N E K I

        field(80003; "Trade License Expiry Date"; Date)
        {
            DataClassification = ToBeClassified;
            Description = 'iAX.frz.01 13-12-2018';
        }
        field(80004; "Established Date"; Date)
        {
            DataClassification = ToBeClassified;
            Description = 'iAX.frz.30 04-12-2019 As per email by Mr. Uday';
        }


    }


    trigger OnAfterInsert()
    var
        CustName: Text[50];
        myInt: Integer;
    begin

    end;

    trigger OnAfterModify()
    var
        CustName: Text[50];
        myInt: Integer;
    begin

    end;

    var
        UserSetup: Record 91;
        DimensionValue: Record 349;
        DefaultDim: Record 352;
        SalesSetup: Record 311;

}