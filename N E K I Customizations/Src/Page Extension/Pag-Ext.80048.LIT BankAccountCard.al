pageextension 80048 "LIT BankAccountCard" extends "Bank Account Card"
{
    layout
    {
        // Add changes to page layout here
        addafter(Name)
        {
            field("Name 2"; Rec."Name 2")
            {
                ApplicationArea = All;
                Importance = Promoted;
                ToolTip = 'Specifies the name 2 of the bank where you have the bank account.';
            }

        }
    }

    actions
    {
        // Add changes to page actions here
    }

}