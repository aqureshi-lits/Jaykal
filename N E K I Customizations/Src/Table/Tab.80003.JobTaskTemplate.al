table 80003 "Job Task Template"
{
    Caption = 'Job Task Template';
    DataClassification = ToBeClassified;
    DrillDownPageID = "LIT Job Task Template Lines";
    LookupPageID = "LIT Job Task Template Lines";

    fields
    {
        field(80001; "Template No."; Code[20])
        {
            Caption = 'Template No.';
            DataClassification = ToBeClassified;
        }
        field(80002; "Job Task Template No."; Code[20])
        {
            Caption = 'Job Task No.';
            NotBlank = true;

            trigger OnValidate()
            var
                JobTemplate: Record "LIT Job Template";
                Cust: Record Customer;
                IsHandled: Boolean;
            begin
                IsHandled := false;
                if IsHandled then
                    exit;

                if "Job Task Template No." = '' then
                    exit;
                JobTemplate.Get("Template No.");
            end;
        }
        field(80003; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(80004; "Job Task Type"; Enum "Job Task Type")
        {
            Caption = 'Job Task Type';

            trigger OnValidate()
            begin
                if "Job Task Type" <> "Job Task Type"::Posting then begin
                    "Job Posting Group" := '';
                    if "WIP-Total" = "WIP-Total"::Excluded then
                        "WIP-Total" := "WIP-Total"::" ";
                end;

                Totaling := '';
            end;
        }
        field(80006; "WIP-Total"; Option)
        {
            Caption = 'WIP-Total';
            OptionCaption = ' ,Total,Excluded';
            OptionMembers = " ",Total,Excluded;
        }
        field(80007; "Job Posting Group"; Code[20])
        {
            Caption = 'Job Posting Group';
            TableRelation = "Job Posting Group";

            trigger OnValidate()
            begin
                if "Job Posting Group" <> '' then
                    TestField("Job Task Type", "Job Task Type"::Posting);
            end;
        }
        field(80009; "WIP Method"; Code[20])
        {
            Caption = 'WIP Method';
            TableRelation = "Job WIP Method".Code WHERE(Valid = CONST(true));

            trigger OnValidate()
            begin
                if "WIP Method" <> '' then
                    TestField("WIP-Total", "WIP-Total"::Total);
            end;
        }
        field(800019; "Posting Date Filter"; Date)
        {
            Caption = 'Posting Date Filter';
            FieldClass = FlowFilter;
        }
        field(800020; "Planning Date Filter"; Date)
        {
            Caption = 'Planning Date Filter';
            FieldClass = FlowFilter;
        }
        field(800021; Totaling; Text[250])
        {
            Caption = 'Totaling';
            TableRelation = "Job Task Template"."Job Task Template No." WHERE("Template No." = FIELD("Template No."));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnValidate()
            begin
                if Totaling <> '' then
                    if not ("Job Task Type" in ["Job Task Type"::Total, "Job Task Type"::"End-Total"]) then
                        FieldError("Job Task Type");
                Validate("WIP-Total");
            end;
        }
        field(800022; "New Page"; Boolean)
        {
            Caption = 'New Page';
        }
        field(800023; "No. of Blank Lines"; Integer)
        {
            BlankZero = true;
            Caption = 'No. of Blank Lines';
            MinValue = 0;
        }
        field(800024; Indentation; Integer)
        {
            Caption = 'Indentation';
            MinValue = 0;
        }
        field(800025; "Sales Line Type"; Enum "Sales Line Type")
        {
            Caption = 'Sales Line Type';
            trigger OnValidate()
            var
                JobTaskTemplate: Record "Job Task Template";
            begin
                if Rec."Sales Line Type" <> Rec."Sales Line Type"::" " then begin
                    JobTaskTemplate.SetRange("Template No.", Rec."Template No.");
                    JobTaskTemplate.SetRange("Sales Line Type", Rec."Sales Line Type");
                    if JobTaskTemplate.FindFirst() then
                        Error('The Sales Line Type is already selected on another task of this Job Template. One Sales Line Type can only be used once. Identification fields: Sale Line Type %1', Rec."Sales Line Type");
                end;
            end;
        }
    }

    keys
    {
        key(Key1; "Template No.", "Job Task Template No.")
        {
            Clustered = true;
        }
        key(Key2; "Job Task Template No.")
        {
        }
    }
}
