table 80002 "LIT Job Template"
{
    Caption = 'Job Template';
    DataClassification = ToBeClassified;
    DataCaptionFields = "No.", Name;
    DrillDownPageID = "LIT Job Template List";
    LookupPageID = "LIT Job Template List";

    fields
    {
        field(80001; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = ToBeClassified;
        }
        field(80002; Name; Text[100])
        {
            Caption = 'Name';
            DataClassification = ToBeClassified;
        }
        field(80003; Status; Option)
        {
            Caption = 'Status';
            DataClassification = ToBeClassified;
            OptionMembers = ,Active,Inactive;
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
    trigger OnDelete()
    var
        JobTaskTemplate: Record "Job Task Template";
    begin
        JobTaskTemplate.SetRange("Template No.", Rec."No.");
        if JobTaskTemplate.FindSet() then
            JobTaskTemplate.DeleteAll();
    end;
}
