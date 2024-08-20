tableextension 80039 "LIT TransferLine" extends "Transfer Line"
{
    fields
    {
        // Add changes to table fields here
        field(80000; "LIT Gen. Bus. Posting Group"; Code[20])
        {
            Caption = 'Gen. Bus. Posting Group';
            TableRelation = "Gen. Business Posting Group";
        }


        modify("Item No.")
        {     //    VALIDATE("Gen. Bus. Posting Group", 'TRANSFER MATERIAL');
              //   Validate("Gen. Prod. Posting Group", 'TRANSFER MATERIAL');

            trigger OnAfterValidate()
            var
                myInt: Integer;
                InventoryPostingGroup: Record "Inventory Setup";
            begin
                Clear(InventoryPostingGroup);
                InventoryPostingGroup.Get();
                InventoryPostingGroup.TestField("LIT AdjGenBusPostingGroup");
                InventoryPostingGroup.TestField("LIT AdjGenProdPostingGroup");
                Validate("LIT Gen. Bus. Posting Group", InventoryPostingGroup."LIT TransGenBusPostingGroup");
                Validate("Gen. Prod. Posting Group", InventoryPostingGroup."LIT TransGenProdPostingGroup");

            end;
        }
    }



}