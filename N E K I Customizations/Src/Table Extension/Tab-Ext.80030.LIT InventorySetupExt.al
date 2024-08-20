tableextension 80030 "LIT InventorySetupExt" extends "Inventory Setup"
{
    fields
    {
        // Add changes to table fields here
        // field(80000; "Item Default Dimension"; Code[20])
        // {
        //     Caption = 'Item Default Dimension';
        //     TableRelation = Dimension."Code";
        // }
        field(80001; "LIT AdjGenProdPostingGroup"; Code[20])
        {
            Caption = 'Gen. Prod. Posting Group';
            TableRelation = "Gen. Product Posting Group";
        }
        field(80002; "LIT AdjGenBusPostingGroup"; Code[20])
        {
            Caption = 'Gen. Bus. Posting Group';
            TableRelation = "Gen. Business Posting Group";
        }
        field(80003; "LIT AdjLocation"; Code[20])
        {
            Caption = 'Location';
            TableRelation = Location;
        }

        field(80004; "LIT TransGenProdPostingGroup"; Code[20])
        {
            Caption = 'Gen. Prod. Posting Group';
            TableRelation = "Gen. Product Posting Group";
        }
        field(80005; "LIT TransGenBusPostingGroup"; Code[20])
        {
            Caption = 'Gen. Bus. Posting Group';
            TableRelation = "Gen. Business Posting Group";
        }
        field(80006; "LIT TransLocation"; Code[20])
        {
            Caption = 'Location';
            TableRelation = Location;
        }
    }
}