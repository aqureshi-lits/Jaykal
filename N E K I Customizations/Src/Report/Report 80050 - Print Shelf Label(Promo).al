report 80050 "LIT Item Barcode Shelf(Promo)"
{
    ApplicationArea = All;
    Caption = 'Item Barcode Shelf Promo';
    DefaultLayout = RDLC;
    UsageCategory = Tasks;
    RDLCLayout = './Src/Layout/LIT Item Barcode Shelf-Promo.rdl';
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

            column(LIT_Arabic_Description; "LIT Arabic Description")
            {

            }

            column(Was; Was)
            {

            }

            column(now; now)
            {

            }
            trigger OnAfterGetRecord()
            var
                //BARCODE SYMBOLOGY DECLARATION
                BarcodeStr: Code[20];
            begin
                ItemRef.SetRange("Item No.", "No.");
                if ItemRef.FindSet() then begin
                    BarcodeFontProvider := Enum::"Barcode Font Provider"::IDAutomation1D;         //FONT PROVIDER IDAUTOMATION
                    BarcodeSymbology := Enum::"Barcode Symbology"::Code39;                        //SIMBOLOGY - "CODE 39" in this case
                    BarcodeStr := ItemRef."Reference No.";
                    BarcodeFontProvider.ValidateInput(BarcodeStr, BarcodeSymbology);              //VALIDATE INPUT DATA - NOT MANDATORY
                    EncodedText := BarcodeFontProvider.EncodeFont(BarcodeStr, BarcodeSymbology);


                end
                else begin
                    BarcodeFontProvider := Enum::"Barcode Font Provider"::IDAutomation1D;         //FONT PROVIDER IDAUTOMATION
                    BarcodeSymbology := Enum::"Barcode Symbology"::Code39;                        //SIMBOLOGY - "CODE 39" in this case
                    BarcodeStr := Item."No.";
                    BarcodeFontProvider.ValidateInput(BarcodeStr, BarcodeSymbology);              //VALIDATE INPUT DATA - NOT MANDATORY
                    EncodedText := BarcodeFontProvider.EncodeFont(BarcodeStr, BarcodeSymbology);
                end;
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group("Promo Price")
                {
                    field(Was; Was)
                    {
                        ApplicationArea = all;
                        Caption = 'Was Price';
                    }

                    field(now; now)
                    {
                        ApplicationArea = all;
                        Caption = 'Now Price';

                    }
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

        Was: Decimal;
        now: Decimal;

        ItemRef: Record "Item Reference";
}
