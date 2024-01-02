table 80005 "LIT Item Group"
{
    Caption = 'Item Group';
    DataCaptionFields = Code;
    LookupPageID = "LIT Item group";
    DrillDownPageId = "LIT Item group";


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
