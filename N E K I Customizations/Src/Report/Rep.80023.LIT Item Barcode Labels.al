report 80023 "LIT Item Barcode Labels"
{
    ApplicationArea = All;
    Caption = 'Item Barcode Labels';
    DefaultLayout = RDLC;
    UsageCategory = Tasks;
    RDLCLayout = './Src/Layout/Item Barcode Labels.rdl';
    dataset
    {
        dataitem(Item; Item)
        {
            column(No; "No.")
            {
            }
            column(No2; "No. 2")
            {
            }
            column(Description; Description)
            {
            }
            column(Description2; "Description 2")
            {
            }
            column(Barcode; EncodedText)
            {
            }
            trigger OnAfterGetRecord()
            var
                //BARCODE SYMBOLOGY DECLARATION
                BarcodeStr: Code[20];
            begin
                BarcodeFontProvider := Enum::"Barcode Font Provider"::IDAutomation1D;         //FONT PROVIDER IDAUTOMATION
                BarcodeSymbology := Enum::"Barcode Symbology"::Code39;                        //SIMBOLOGY - "CODE 39" in this case
                BarcodeStr := Item."No.";
                BarcodeFontProvider.ValidateInput(BarcodeStr, BarcodeSymbology);              //VALIDATE INPUT DATA - NOT MANDATORY
                EncodedText := BarcodeFontProvider.EncodeFont(BarcodeStr, BarcodeSymbology);
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }
    var
        BarcodeSymbology: Enum "Barcode Symbology";
        BarcodeFontProvider: Interface "Barcode Font Provider";
        EncodedText: Text;
}
