pageextension 80065 "LIT FixedAssetList" extends "Fixed Asset List"
{
    layout
    {
        // Add changes to page layout here
        addafter("No.")
        {
            // field("No. 2"; Rec."LIT No. 2")
            // {
            //     ApplicationArea = all;
            // }
        }
        addafter(Description)
        {
            // field("Description 3"; Rec."LIT Description 3")
            // {
            //     ApplicationArea = all;
            // }
            // field("Item No."; Rec."LIT Item No.")
            // {
            //     ApplicationArea = all;
            // }
            field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
            {
                ApplicationArea = all;
            }
            field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
            {
                ApplicationArea = all;
            }
            // field("FA Book Value"; Rec."LIT FA Book Value")
            // {
            //     ApplicationArea = all;
            // }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

}