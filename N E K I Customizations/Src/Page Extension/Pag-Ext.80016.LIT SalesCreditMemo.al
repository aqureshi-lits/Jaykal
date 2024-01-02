pageextension 80016 "LIT SalesCreditMemo" extends "Sales Credit Memo"
{
    layout
    {
        // Add changes to page layout here
        addafter("Applies-to ID")
        {
            group("Remarks")
            {
                Caption = 'Remarks';
            }

            field("Sales Type"; Rec."Sales Type")
            {
                ApplicationArea = all;
            }
            field(Remark; Rec."LIT Remarks")
            {
                ApplicationArea = All;
                MultiLine = true;
                Importance = Additional;
            }


        }



    }


    actions
    {
        // Add changes to page actions here
    }

}