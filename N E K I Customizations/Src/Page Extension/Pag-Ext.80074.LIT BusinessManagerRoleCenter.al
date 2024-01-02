pageextension 80074 "LIT BusinessManagerRoleCenter" extends "Business Manager Role Center"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
        addafter(GeneralJournals)
        {


            group(PDC)
            {
                Caption = 'PDC';
                // Image = Journals;
                // ToolTip = 'Post financial transactions, manage budgets, analyze G/L  data, and prepare financial statements.';
                action("PDC Journal")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'PDC Journal';
                    Image = Journal;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "General Journal Batches";
                    RunPageView = WHERE("Template Type" = CONST(General),
                                        Recurring = CONST(false));
                    //    ToolTip = 'Post financial transactions directly to general ledger accounts and other accounts, such as bank, customer, vendor, and employee accounts. Posting with a general journal always creates entries on general ledger accounts. This is true even when, for example, you post a journal line to a customer account, because an entry is posted to a general ledger receivables account through a posting group.';
                }
            }
        }
    }

    var
        myInt: Integer;



}

