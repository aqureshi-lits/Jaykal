tableextension 80013 "LIT ItemJournalLine" extends "Item Journal Line"

{
    fields
    {
        field(80000; "LIT Remarks"; Text[250])
        {
            Caption = 'Remarks';
            Editable = true;

        }
        modify("Item No.")
        {
            trigger OnAfterValidate()
            var
                myInt: Integer;
                InventoryPostingGroup: Record "Inventory Setup";
            begin
                Clear(InventoryPostingGroup);
                InventoryPostingGroup.Get();
                InventoryPostingGroup.TestField("LIT AdjGenBusPostingGroup");
                InventoryPostingGroup.TestField("LIT AdjGenProdPostingGroup");
                Validate("Gen. Bus. Posting Group", InventoryPostingGroup."LIT AdjGenBusPostingGroup");
                Validate("Gen. Prod. Posting Group", InventoryPostingGroup."LIT AdjGenProdPostingGroup");
                Validate("Location Code", InventoryPostingGroup."LIT AdjLocation");
                // Rec.Insert(true);
            end;
        }
    }
}