
pageextension 80042 "LIT PostedGeneralJournal" extends "Posted General Journal"
{
    layout
    {
        // Add changes to page layout here
        addbefore(Description)
        {

            field("External Document No."; Rec."External Document No.")
            {
                ApplicationArea = all;
            }
            field("Payment Method Code"; Rec."Payment Method Code")
            {
                ApplicationArea = all;
            }


        }
        addafter("Deferral Code")
        {
            field(Remarks; Rec."LIT Remarks")
            {
                ApplicationArea = all;
            }
            field("Check No."; Rec."LIT Check No.")
            {

                ApplicationArea = all;
            }
            field("Check Date"; Rec."LIT Check Date")
            {
                ApplicationArea = all;
            }
            field(Comment; Rec.Comment)
            {
                ApplicationArea = all;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

}
