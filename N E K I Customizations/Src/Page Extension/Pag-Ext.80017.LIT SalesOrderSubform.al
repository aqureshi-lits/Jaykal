pageextension 80017 "LIT SalesOrderSubform" extends "Sales Order Subform"
{
    layout
    {
        // Add changes to page layout here
        addafter(Description)
        {

        }

        addafter("Location Code")
        {
            field("Salesperson Code"; Rec."Salesperson Code")
            {
                ApplicationArea = all;
            }
        }
        addafter("VAT Prod. Posting Group")
        {
            //This field is already defined in new version
            // field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
            // {
            //     ApplicationArea = all;
            // }
            // field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
            // {
            //     ApplicationArea = all;
            // }

            // field("Appl.-from Item Entry";Rec."Appl.-from Item Entry")
            // {
            //     ApplicationArea = All;
            // }
            // field("Appl.-to Item Entry";Rec."Appl.-to Item Entry")
            // {
            //     ApplicationArea = All;
            // }





            field("Job No."; Rec."Job No.")
            {
                ApplicationArea = all;
                Visible = false;
            }
            field("Job Task No."; Rec."Job Task No.")
            {
                Visible = false;
                ApplicationArea = all;
            }
            field("Job Contract Entry No."; Rec."Job Contract Entry No.")
            {
                ApplicationArea = all;
                Visible = false;
            }
        }
        modify("Line Amount")
        {
            Editable = false;
        }

        modify("Appl.-from Item Entry")
        {
            visible = true;

        }
        modify("Appl.-to Item Entry")
        {
            visible = true;
        }
        addbefore("Appl.-from Item Entry")
        {
            field("Sales Margin"; Rec."Sales Margin")
            {
                ApplicationArea = All;
            }
        }

        addafter(Quantity)
        {
            field("Outstanding Quantity"; Rec."Outstanding Quantity")
            {
                ApplicationArea = All;
            }

        }

    }

    actions
    {
        // Add changes to page actions here
    }

}