pageextension 80017 "LIT SalesOrderSubform" extends "Sales Order Subform"
{
    layout
    {
        // Add changes to page layout here
        addafter(Description)
        {

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

    }

    actions
    {
        // Add changes to page actions here
    }

}