pageextension 80053 "LIT JobsSetup" extends "Jobs Setup"
{
    layout
    {
        // Add changes to page layout here

        addafter("Job WIP Nos.")
        {
            field("Create Sales Job Nos. Using"; Rec."LIT CreateSales Quote Job Nos.")
            {
                ApplicationArea = all;
                ToolTip = 'This specifies how system will pick the Job No. for jobs which will convert from Sales Quotes. The Job No. can be picked from its No. Series set up on this page. Job No. can also be same as the sourcing Sales Quote No. Moreover, the Job Nos. can be set to manual. In this case the Your Reference field on Sales Quote will be used as Job No.';
            }
        }
    }

    actions
    {
        addfirst(Navigation)
        {
            action("Job Templates")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Job Templates';
                Enabled = true;
                Image = Job;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Navigate to the job templtes page.';
                RunObject = Page "LIT Job Template List";
            }
        }


    }

}