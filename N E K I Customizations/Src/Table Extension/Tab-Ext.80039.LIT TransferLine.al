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
        {
            trigger OnAfterValidate()
            begin
                //    VALIDATE("Gen. Bus. Posting Group", 'TRANSFER MATERIAL');
                //   Validate("Gen. Prod. Posting Group", 'TRANSFER MATERIAL');
            end;
        }
    }



}