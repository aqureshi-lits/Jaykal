pageextension 80047 "LIT VATStatement" extends "VAT Statement"
{
    layout
    {
        // Add changes to page layout here
        addafter("Amount Type")
        {
            field("Amount Type 2"; Rec."LIT Amount Type 2")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies if the VAT statement line shows the VAT amounts or the base amounts on which the VAT is calculated.';
            }
        }

    }

    actions
    {
        // Add changes to page actions here
        addafter("VAT &Statement")
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





                action("VAT Statement with Base Amount")
                {
                    ApplicationArea = All;
                    Caption = 'VAT Statement with Base Amount';
                    Ellipsis = true;
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Print the information in the window. A print request window opens where you can specify what to include on the print-out.';

                    trigger OnAction()
                    var
                        VATStmtLine: Record 256;
                    begin

                        VATStmtLine.SETRANGE("Statement Template Name", Rec."Statement Template Name");
                        VATStmtLine.SETRANGE("Statement Name", Rec."Statement Name");
                        REPORT.RUN(Report::"LIT VATStatementwithBaseAmount", TRUE, FALSE, VATStmtLine);

                    end;
                }



            }





        }

    }
}