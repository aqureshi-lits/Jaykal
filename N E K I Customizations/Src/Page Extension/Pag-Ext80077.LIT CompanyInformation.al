pageextension 80077 "LIT CompanyInformation" extends "Company Information"
{
    layout
    {
        addbefore("Bank Name")
        {
            field("Name 2"; rec."Name 2")
            {
                ApplicationArea = all;
                Caption = 'Account Name';
            }


        }

        addafter(Picture)
        {
            field("Group Medical Ins. Expiry Date"; Rec."Group Medical Ins. Expiry Date")
            {
                ApplicationArea = all;
            }
        }
    }
}
