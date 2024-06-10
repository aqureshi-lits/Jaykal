pageextension 80091 SalesInvLine extends "Posted Sales Invoice Subform"
{
    layout
    {
        // Add changes to page layout here
        addafter(Quantity)
        {
            field("Sell-to Customer No."; Rec."Sell-to Customer No.")
            {
                ApplicationArea = All;
            }
            field("Document No."; Rec."Document No.")
            {
                ApplicationArea = All;
            }
            field("Posting Date"; Rec."Posting Date")
            {
                ApplicationArea = All;
            }
            field("Item Category Code"; Rec."Item Category Code")
            {
                ApplicationArea = All;
            }
            field("Unit Cost"; Rec."Unit Cost")
            {
                ApplicationArea = All;
            }
            field(CustName; CustName)
            {
                ApplicationArea = All;
                Caption = 'Sell-to Customer Name';
            }
            field(CustCity; CustCity)
            {
                ApplicationArea = All;
                Caption = 'Sell-to Customer City';
            }
            field(CustCountry; CustCountry)
            {
                ApplicationArea = All;
                Caption = 'Sell-to Customer Country';
            }
            field(OrderNo; OrderNo)
            {
                ApplicationArea = All;
                Caption = 'Order No.';
            }
            field(OrderDate; OrderDate)
            {
                ApplicationArea = All;
                Caption = 'Order Date';
            }
            field(SalesPerson; SalesPerson)
            {
                ApplicationArea = All;
                Caption = 'Sales Person';
            }
            field(ExternalDocumentNo; ExternalDocumentNo)
            {
                ApplicationArea = All;
                Caption = 'External Document No.';
            }
            field("Sales Margin"; Rec."Sales Margin")
            {
                ApplicationArea = All;
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
        SalesInvHdr.Reset();
        SalesInvHdr.SetRange("No.", Rec."Document No.");
        if SalesInvHdr.FindSet() then begin
            CustName := SalesInvHdr."Sell-to Customer Name";
            CustCity := SalesInvHdr."Sell-to City";
            CustCountry := SalesInvHdr."Sell-to County";
            OrderNo := SalesInvHdr."Order No.";
            OrderDate := SalesInvHdr."Order Date";
            SalesPerson := SalesInvHdr."Salesperson Code";
            ExternalDocumentNo := SalesInvHdr."External Document No.";
            // DeliveryOrderNo
            // DeliveryDate
            // Margin 
        end;
    end;

    var
        myInt: Integer;
        SalesInvHdr: Record "Sales Invoice Header";
        CustName: Text[100];
        CustCity: Text[30];
        CustCountry: Text[30];
        OrderNo: Code[20];
        OrderDate: Date;
        SalesPerson: Code[20];
        DeliveryOrderNo: Code[20];
        DeliveryDate: Date;
        Margin: Text[50];
        ExternalDocumentNo: Text[50];

}