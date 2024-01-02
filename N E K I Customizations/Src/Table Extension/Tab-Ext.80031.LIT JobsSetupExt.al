tableextension 80031 "LIT JobsSetupExt" extends "Jobs Setup"
{
    fields
    {
        // Add changes to table fields here
        // field(80000; "Job Default Dimension"; Code[20])
        // {
        //     Caption = 'Job Default Dimension';
        //     TableRelation = Dimension."Code";
        // }
        field(80000; "LIT CreateSales Quote Job Nos."; Option)
        {
            Caption = 'Create Sales Quote Job Nos.';
            OptionMembers = "From Job No. Series","Same as Sales Quote No.","From Your Reference";
        }

    }
}

