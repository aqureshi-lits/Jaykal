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

        addafter("Posting Date")
        {
            field("Posting No."; Rec."Posting No.")
            {
                ApplicationArea = All;
            }

            field("Posting No. Series"; Rec."Posting No. Series")
            {
                ApplicationArea = All;
            }

        }







    }


    actions
    {
        // Add changes to page actions here
    }

}