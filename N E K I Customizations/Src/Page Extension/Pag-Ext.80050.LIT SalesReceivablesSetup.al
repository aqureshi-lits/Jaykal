pageextension 80050 "LIT SalesReceivablesSetup" extends "Sales & Receivables Setup"
{
    layout
    {
        // Add changes to page layout here
        addafter("Disable Search by Name")
        {
            field("Delete Quote on Job Convert"; Rec."LIT Del. Quote on Job Convert")
            {
                ApplicationArea = all;
                Importance = Promoted;
                ToolTip = 'Specifies if a Sales Quote will automatically be deleted when converted into a Job Card.';
            }
        }

    }

    actions
    {
        // Add changes to page actions here
    }

}