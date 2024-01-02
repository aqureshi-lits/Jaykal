pageextension 80025 "LIT JobCard" extends "Job Card"
{
    layout
    {
        // Add changes to page layout here
        addafter("No.")
        {
            field("No. 2"; Rec."LIT No. 2")
            {
                ApplicationArea = all;
            }
        }
        addafter("Project Manager")
        {
            field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
            {
                ApplicationArea = all;
            }
            field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
            {
                ApplicationArea = all;
            }

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
        addafter("Your Reference")
        {
            field("Sales Quote No."; Rec."LIT Sales Quote No.")
            {
                ApplicationArea = Jobs;
                Importance = Additional;
                Tooltip = 'Specifies the sales quotation no. using which, this job card is created.';
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
    }


    actions
    {
        // Add changes to page actions here
        addafter(SalesInvoicesCreditMemos)
        {
            action("Sales Quote")
            {
                ApplicationArea = Jobs;
                Caption = 'Sales Quote';
                Image = Quote;
                Promoted = true;
                PromotedCategory = Category6;
                ToolTip = 'View sales quote that is related to the selected job.';
                trigger OnAction()
                var
                    SalesHeader: Record "Sales Header";
                begin
                    if Rec."LIT Sales Quote No." = '' then
                        Error('No sales quote document found against this job.');
                    if SalesHeader.Get(SalesHeader."Document Type"::Quote, Rec."LIT Sales Quote No.") then
                        Page.Run(Page::"Sales Quote", SalesHeader);
                end;
            }
        }
    }

}