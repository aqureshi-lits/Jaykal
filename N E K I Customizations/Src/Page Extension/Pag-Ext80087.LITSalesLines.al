pageextension 80087 "LIT Sales Lines" extends "Sales Lines"
{
    layout
    {

        addbefore(Quantity)
        {
            field("Appl.-from Item Entry"; Rec."Appl.-from Item Entry")
            {
                ApplicationArea = All;
            }
            field("Appl.-to Item Entry"; Rec."Appl.-to Item Entry")
            {
                ApplicationArea = All;
            }



            field("Sales Margin"; Rec."Sales Margin")
            {
                ApplicationArea = All;
            }
        }
        addafter(Quantity)
        {
            // field("Qty. to Ship"; Rec."Qty. to Ship")
            // {
            //     ApplicationArea = All;
            // }
            // field("Outstanding Quantity"; Rec."Outstanding Quantity")
            // {
            //     ApplicationArea = All;
            // }


            field("Qty. to Invoice"; Rec."Qty. to Invoice")
            {
                ApplicationArea = All;
            }
            field("Qty. Invoiced (Base)"; Rec."Qty. Invoiced (Base)")
            {
                ApplicationArea = All;
            }
            field("Qty. to Assemble to Order"; Rec."Qty. to Assemble to Order")
            {
                ApplicationArea = All;
            }



        }
        addafter("Qty. to Ship")
        {
            field("Qty. Shipped (Base)"; Rec."Qty. Shipped (Base)")
            {
                ApplicationArea = All;
            }
            field("Qty. Shipped Not Invoiced"; Rec."Qty. Shipped Not Invoiced")
            {
                ApplicationArea = All;
            }


        }
        modify("Qty. to Ship")
        {
            Visible = true;
        }

        moveafter("Outstanding Quantity"; Quantity)
    }
}
