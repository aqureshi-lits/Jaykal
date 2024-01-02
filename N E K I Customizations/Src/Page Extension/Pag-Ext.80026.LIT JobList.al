pageextension 80026 "LIT JobList" extends "Job List"
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

    }

    actions
    {
        // Add changes to page actions here
        addafter("&Job")
        {




        }
    }

}