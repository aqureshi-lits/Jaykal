tableextension 80026 "LIT VATStatementLine" extends "VAT Statement Line"
{
    fields
    {
        // Add changes to table fields here
        field(80000; "LIT Amount Type 2"; Option)
        {
            Caption = 'Amount Type 2';
            OptionCaption = ' ,Amount,Base,Unrealized Amount,Unrealized Base';
            OptionMembers = ,Amount,Base,"Unrealized Amount","Unrealized Base";
        }
    }

    var
        myInt: Integer;
}


