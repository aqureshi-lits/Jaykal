table 80009 "Purchase Document header"
{
    Caption = 'Purchase Document header';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Document Type"; Option)
        {
            OptionMembers = Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order";
        }
        field(2; "No."; Code[20])
        {
        }
        field(3; "Order Date"; Date)
        {
        }
        field(6; "Buy-from Vendor No."; Code[20])
        {
        }
        field(7; "Buy-from Vendor Name"; Text[50])
        {
            Caption = 'Buy-from Vendor Name';
            TableRelation = Vendor;
            ValidateTableRelation = false;

            trigger OnValidate()
            var
                Vendor: Record 23;
            begin
            end;
        }
        field(8; "Buy-from Vendor Name 2"; Text[50])
        {
            Caption = 'Buy-from Vendor Name 2';
        }
        field(9; "Buy-from Address"; Text[50])
        {
            Caption = 'Buy-from Address';
        }
        field(10; "Buy-from Address 2"; Text[50])
        {
            Caption = 'Buy-from Address 2';
        }
        field(11; "Buy-from City"; Text[30])
        {
            Caption = 'Buy-from City';
            TableRelation = IF ("Buy-from Country/Region Code" = CONST('')) "Post Code".City
            ELSE
            IF ("Buy-from Country/Region Code" = FILTER(<> '')) "Post Code".City WHERE("Country/Region Code" = FIELD("Buy-from Country/Region Code"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            //     Caption = 'Buy-from City';
            //     TableRelation = if ("Buy-from Country/Region Code" = const('')) "Post Code".City
            //     else
            //     if ("Buy-from Country/Region Code" = filter(<> '')) "Post Code".City where("Country/Region Code" = field("Buy-from Country/Region Code"));
            //     ValidateTableRelation = false;
        }
        field(12; "Buy-from Contact"; Text[50])
        {
            Caption = 'Buy-from Contact';

            trigger OnLookup()
            var
                Contact: Record 5050;
            begin
            end;
        }
        field(14; "Buy-from Post Code"; Code[20])
        {
            Caption = 'Buy-from Post Code';
            TableRelation = IF ("Buy-from Country/Region Code" = CONST('')) "Post Code"
            ELSE
            IF ("Buy-from Country/Region Code" = FILTER(<> '')) "Post Code" WHERE("Country/Region Code" = FIELD("Buy-from Country/Region Code"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(15; "Buy-from County"; Text[30])
        {
            Caption = 'Buy-from County';
        }
        field(16; "Buy-from Country/Region Code"; Code[10])
        {
            Caption = 'Buy-from Country/Region Code';
            TableRelation = "Country/Region";
        }
    }

    keys
    {
        key(Key1; "Document Type")
        {
        }
    }

    fieldgroups
    {
    }
}
