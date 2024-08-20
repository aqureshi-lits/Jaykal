pageextension 80012 "LIT ItemJournal" extends "Item Journal"
{
    layout
    {
        // Add changes to page layout here
        addafter("Location Code")
        {
            field(Remarks; Rec."LIT Remarks")
            {
                ApplicationArea = all;
            }
        }
        addafter("Item No.")
        {
            // field("Item Reference No."; Rec."Item Reference No.")
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