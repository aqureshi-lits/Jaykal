pageextension 80046 "LIT VATEntries" extends "VAT Entries"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
        addafter("&Navigate")
        {
            group(Report)

            {

                action("VAT Trans Details 01")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'VAT Trans Details 01';
                    Ellipsis = true;
                    Image = VATLedger;
                    Promoted = true;
                    PromotedCategory = Report;
                    PromotedIsBig = true;
                    RunObject = Report "LIT VATTransactionDetail 01";
                }
                action("VAT Trans Details 02")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'VAT Trans Details 02';
                    Ellipsis = true;
                    Image = VATLedger;
                    Promoted = true;
                    PromotedCategory = Report;
                    PromotedIsBig = true;
                    RunObject = Report "LIT VATTransactionDetail 02";
                }
            }

        }
    }

    var
        myInt: Integer;
}