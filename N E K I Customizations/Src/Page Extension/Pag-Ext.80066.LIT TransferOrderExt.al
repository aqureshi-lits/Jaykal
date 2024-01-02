pageextension 80066 "LIT TransferOrderExt" extends "Transfer Order"
{
    layout
    {
        // Add changes to page layout here
        addafter(Status)
        {
            group("Remarks")
            {
                Caption = 'Remarks';
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
        modify(Post)
        {
            trigger OnBeforeAction()
            begin
                Rec.TestField("LIT Remarks");
            end;
        }
    }

}