pageextension 80015 "LIT SalesInvoice" extends "Sales Invoice"
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

        addafter("Assigned User ID")
        {
            field("Posting No. Series"; Rec."Posting No. Series")
            {
                ApplicationArea = all;
            }

            field("Posting No."; Rec."Posting No.")
            {
                ApplicationArea = all;
            }
        }

        addafter(General)
        {
            group("Other Invoicing Details")
            {

                group("Service Description")
                {


                }

                group("Contract Refrence")
                {

                }
            }
        }



        addafter("Sell-to Customer Name")
        {
            field("Sales Type"; Rec."Sales Type")
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