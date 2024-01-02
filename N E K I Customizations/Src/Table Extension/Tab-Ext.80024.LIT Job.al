tableextension 80024 "LIT Job" extends Job
{

    fields
    {
        field(80000; "LIT No. 2"; code[20])
        {
            Caption = 'No. 2';
        }
        field(80001; "LIT Remarks"; Text[250])
        {
            Caption = 'Remarks';
        }
        field(80002; "LIT Sales Quote No."; Code[20])
        {
            Caption = 'Sales Quote No.';
            DataClassification = ToBeClassified;
            Editable = false;
        }


        modify("Bill-to Customer No.")
        {
            trigger OnAfterValidate()
            var
                JobDescription: Text[50];
                GeneralLedgerSetup: Record "General Ledger Setup";
            begin
                // //MAQ IAX Added 19-07-2020 Start.                
                // JobsSetup.GET;
                // JobsSetup.TESTFIELD("Job Default Dimension");
                // if not DimensionValue.Get(JobsSetup."Job Default Dimension", "No.") then begin
                //     DimensionValue.INIT;
                //     DimensionValue."Dimension Code" := JobsSetup."Job Default Dimension";
                //     DimensionValue.Code := "No.";
                //     //DimensionValue.Name := Description;
                //     JobDescription := CopyStr(Description, 1, 50);
                //     DimensionValue.Name := JobDescription;
                //     //DimensionValue."Global Dimension No." := 2; //Optional
                //     GeneralLedgerSetup.Get();
                //     if GeneralLedgerSetup."Global Dimension 1 Code" = JobsSetup."Job Default Dimension" then
                //         DimensionValue."Global Dimension No." := 1;
                //     if GeneralLedgerSetup."Global Dimension 2 Code" = JobsSetup."Job Default Dimension" then
                //         DimensionValue."Global Dimension No." := 2;
                //     if GeneralLedgerSetup."Shortcut Dimension 3 Code" = JobsSetup."Job Default Dimension" then
                //         DimensionValue."Global Dimension No." := 3;
                //     if GeneralLedgerSetup."Shortcut Dimension 4 Code" = JobsSetup."Job Default Dimension" then
                //         DimensionValue."Global Dimension No." := 4;
                //     if GeneralLedgerSetup."Shortcut Dimension 5 Code" = JobsSetup."Job Default Dimension" then
                //         DimensionValue."Global Dimension No." := 5;
                //     if GeneralLedgerSetup."Shortcut Dimension 6 Code" = JobsSetup."Job Default Dimension" then
                //         DimensionValue."Global Dimension No." := 6;
                //     if GeneralLedgerSetup."Shortcut Dimension 7 Code" = JobsSetup."Job Default Dimension" then
                //         DimensionValue."Global Dimension No." := 7;
                //     if GeneralLedgerSetup."Shortcut Dimension 8 Code" = JobsSetup."Job Default Dimension" then
                //         DimensionValue."Global Dimension No." := 8;
                //     DimensionValue.INSERT;
                // end;

                // if not DefaultDim.Get(DATABASE::Job, "No.", JobsSetup."Job Default Dimension") then begin
                //     DefaultDim.INIT;
                //     DefaultDim."Table ID" := DATABASE::Job;
                //     DefaultDim."No." := "No.";
                //     DefaultDim."Dimension Code" := JobsSetup."Job Default Dimension";
                //     DefaultDim."Dimension Value Code" := "No.";
                //     DefaultDim."Value Posting" := DefaultDim."Value Posting"::"Same Code";
                //     DefaultDim.INSERT;
                // end;
                // //MAQ IAX Added 19-07-2020 End.                
            end;
        }

    }

    trigger OnAfterModify()
    begin
        // //MAQ IAX Added 17-05-2020 START.
        // JobsSetup.GET;
        // IF DimensionValue.GET(JobsSetup."Job Default Dimension", "No.") THEN BEGIN
        //     DimensionValue.Name := Description;
        //     DimensionValue.MODIFY;
        // END;
        // //MAQ IAX Added 17-05-2020 END.
    end;

    var
        DimensionValue: record 349;
        DefaultDim: Record 352;
        JobsSetup: Record 315;
        UserSetup: Record 91;
}