pageextension 80092 PstdSalesCrMemoLines extends "Posted Sales Credit Memo Lines"
{
    layout
    {
        // Add changes to page layout here
        addafter("Sell-to Customer No.")
        {
            field(CustName; CustName)
            {
                ApplicationArea = All;
                Caption = 'Sell-to Customer Name';
            }
        }

    }

    actions
    {
        // Add changes to page actions here
    }
    trigger OnAfterGetRecord()
    var
        myInt: Integer;
    begin
        Customer.Reset();
        Customer.SetRange("No.", Rec."Sell-to Customer No.");
        if Customer.FindSet() then begin
            CustName := Customer.Name;
        end;
    end;

    var
        myInt: Integer;
        Customer: Record Customer;
        CustName: Text[100];
}