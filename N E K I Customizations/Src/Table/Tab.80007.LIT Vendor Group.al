table 80007 "LIT Vendor Group"
{
    Caption = 'Vendor Group';
    DataCaptionFields = Code;
    LookupPageID = "LIT Vendor Group";
    DrillDownPageId = "LIT Vendor Group";

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
