tableextension 80028 "LIT SalesReceivablesSetupExt" extends "Sales & Receivables Setup"
{
    fields
    {
        // Add changes to table fields here
        // field(80000; "Customer Default Dimension"; Code[20])
        // {
        //     Caption = 'Customer Default Dimension';
        //     TableRelation = Dimension."Code";
        // }
        field(80000; "LIT Del. Quote on Job Convert"; Boolean)
        {
            Caption = 'Delete Quote on Job Convert';
        }

    }

}