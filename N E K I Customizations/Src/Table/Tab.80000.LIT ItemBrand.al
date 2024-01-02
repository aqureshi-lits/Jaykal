table 80000 "LIT ITEM BRAND"
{
    Caption = 'Item Brand';
    DataCaptionFields = Code;
    LookupPageID = "LIT Item Brand";
    DrillDownPageId = "LIT Item Brand";
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
