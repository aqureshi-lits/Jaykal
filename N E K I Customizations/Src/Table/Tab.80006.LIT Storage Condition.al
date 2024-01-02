table 80006 "LIT Storage Condition"
{
    Caption = 'Storage Condition';
    DataCaptionFields = Code;
    LookupPageID = "LIT Storage Condition";
    DrillDownPageId = "LIT Storage Condition";


    fields
    {
        field(80001; Code; Code[20])
        {
            Caption = 'Code';
            DataClassification = ToBeClassified;
        }
        field(80002; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
        field(80003; "Temperature (C)"; Text[100])
        {
            Caption = 'Temperature (C)';
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
