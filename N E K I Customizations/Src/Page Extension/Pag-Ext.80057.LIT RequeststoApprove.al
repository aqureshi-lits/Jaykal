pageextension 80057 "LIT RequeststoApprove" extends "Requests to Approve"
{
    layout
    {
        // Add changes to page layout here
        addafter(ToApprove)
        {
            field("Document No."; Rec."Document No.")
            {
                ApplicationArea = all;

            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}