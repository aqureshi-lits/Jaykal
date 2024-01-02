tableextension 80052 FixAssetExt extends "Fixed Asset"
{
    fields
    {
        field(80000; "Registration Expiry Date"; Date)
        {
            DataClassification = ToBeClassified;
            Description = 'iAX.frz.01 13-12-2018';
        }
        field(80001; "Insurance Expiry Date"; Date)
        {
            DataClassification = ToBeClassified;
            Description = 'iAX.frz.01 13-12-2018';
        }
    }
}
