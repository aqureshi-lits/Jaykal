pageextension 80043 "LIT JobJournalExt" extends "Job Journal"
{
    layout
    {
        // Add changes to page layout here

    }

    actions
    {
        // Add changes to page actions here
        modify("P&ost")
        {
            trigger OnBeforeAction()
            begin
                // IF UserSetup.GET(USERID) THEN
                //     IF UserSetup."Allow Job Journal Post" = FALSE THEN BEGIN
                //         ERROR('You do not have permission to post this journal. Please contact your system administrator...');
                //     END
            end;
        }
        modify("Post and &Print")
        {
            trigger OnBeforeAction()
            begin
                // IF UserSetup.GET(USERID) THEN
                //     IF UserSetup."Allow Job Journal Post" = FALSE THEN BEGIN
                //         ERROR('You do not have permission to post this journal. Please contact your system administrator...');
                //     END
            end;
        }
    }
    var
        UserSetup: Record 91;
}