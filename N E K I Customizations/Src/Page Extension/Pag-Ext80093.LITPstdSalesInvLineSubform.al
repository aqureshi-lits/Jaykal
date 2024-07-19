pageextension 80093 "Pstd Sales Inv Line Subform" extends "Posted Sales Invoice Subform"
{
    layout
    {
        // Add changes to page layout here
        addafter("Unit of Measure Code")
        {
            field("Sales Margin"; (Rec."Unit Price" - Rec."Unit Cost (LCY)"))
            {
                ApplicationArea = All;
                Caption = 'Sales Margin';
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