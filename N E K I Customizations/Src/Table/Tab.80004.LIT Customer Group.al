table 80004 "LIT Customer Group"
{
    Caption = 'Customer Group';
    DataCaptionFields = Code;
    LookupPageID = "LIT Customer Group";
    DrillDownPageId = "LIT Customer Group";
    fields
    {
        field(80001; "Code"; Code[20])
        {
            Caption = 'Code';
            DataClassification = ToBeClassified;
        }
        field(80002; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }
}
