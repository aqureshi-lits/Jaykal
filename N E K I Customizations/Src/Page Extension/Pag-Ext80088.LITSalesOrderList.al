pageextension 80088 SalesOrderListExt extends "Sales Order List"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
        addafter("&Order Confirmation")
        {

            action("Sales Order - Sales")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Sales Order - Summary Report';
                Image = Print;

                trigger OnAction()
                var
                    myInt: Integer;
                    ItemInfo: Record Item;
                    EmpLedgRpt: Report "Sales Order -Sales";
                    EmpInfo: Record "Sales Header";
                    SalesHeader: Record "Sales Header";
                begin
                    SalesHeader.Reset();
                    SalesHeader.SetRange("Document Type", Rec."Document Type"::Order);
                    SalesHeader.SetRange("No.", Rec."No.");
                    SalesHeader.SetRange("Order Date", Rec."Order Date");
                    SalesHeader.SetRange("Salesperson Code", Rec."Salesperson Code");
                    if SalesHeader.FindSet() then begin
                        Report.RunModal(Report::"Sales Order -Sales", true, false, SalesHeader);
                    end;
                end;

            }
        }

    }

    var
        myInt: Integer;
}