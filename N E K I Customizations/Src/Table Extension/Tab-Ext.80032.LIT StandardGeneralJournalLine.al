tableextension 80032 "LIT StandardGeneralJournalLine" extends "Standard General Journal Line"
{

    fields
    {
        // Add changes to table fields here
        modify("Account No.")
        {
            TableRelation = IF ("Account Type" = CONST(Employee)) Employee WHERE(Status = CONST(Active));
        }
        modify("Bal. Account No.")
        {
            TableRelation = IF ("Bal. Account Type" = CONST(Employee)) Employee WHERE(Status = CONST(Active));
        }


    }

}