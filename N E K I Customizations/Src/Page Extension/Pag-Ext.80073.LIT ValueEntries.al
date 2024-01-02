pageextension 80073 "LIT ValueEntries" extends "Value Entries"
{
    layout
    {
        // Add changes to page layout here
        addafter(Description)
        {
            field(Remarks; Rec."LIT Remarks")
            {
                ApplicationArea = All;
                Editable = false;
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