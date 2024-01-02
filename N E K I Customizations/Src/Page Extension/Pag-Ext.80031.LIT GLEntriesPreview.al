pageextension 80031 "LIT GLEntriesPreview" extends "G/L Entries Preview"
{
    layout
    {
        // Add changes to page layout here
        addafter(Amount)
        {
            field(Remarks; Rec."LIT Remarks")
            {
                ApplicationArea = All;
            }
            field("Check No."; Rec."LIT Check No.")
            {
                ApplicationArea = All;
            }
            field("Check Date"; Rec."LIT Check Date")
            {
                ApplicationArea = All;
            }
            field(Comment; Rec.Comment)
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