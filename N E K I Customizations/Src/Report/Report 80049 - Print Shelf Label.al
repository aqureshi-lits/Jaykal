report 80049 "LIT Item Barcode Shelf"
{
    ApplicationArea = All;
    Caption = 'Item Barcode Shelf Labels';
    DefaultLayout = RDLC;
    UsageCategory = Tasks;
    RDLCLayout = './Src/Layout/LIT Item Barcode Shelf.rdl';
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

            column(Unit_Price1; SalesPriceline."Unit Price")
            {

            }

            column(UOM; SalesPriceline."Unit of Measure Code")
            {

            }

            column(Base_Unit_of_Measure; "Base Unit of Measure")
            {

            }

            // dataitem("Price List Line"; "Price List Line")
            // {
            //     RequestFilterFields = "Price List Code", "Unit of Measure Code";
            //     DataItemLink = "Product No." = FIELD("No."), "Unit of Measure Code" = field("Base Unit of Measure");

            //     // column(Unit_Price1; "Unit Price")
            //     // {

            //     // }
            // }


            trigger OnAfterGetRecord()
            var
                //BARCODE SYMBOLOGY DECLARATION
                BarcodeStr: Code[20];
            begin
                UnitPrice := 0;
                Clear(SalesPriceline);
                //SalesPriceline.Get('S00003');

                // SalesPriceHead.SetFilter(Status, 'Active')
                // SalesPriceHead.FindFirst() then begin

                // end;
                // SalesPriceHead.SetFilter(Status, 'Active');
                // SalesPriceHead.SetFilter("Allow Updating Defaults", 'True');
                // if SalesPriceHead.FindFirst() then begin
                //     PriceCOde := SalesPriceHead.Code;
                // end;

                //yeh hardcode kyn kia hua ha???
                SalesPriceline.SetFilter(SalesPriceline."Price List Code", PriceListCode);
                SalesPriceline.SetRange(SalesPriceline."Product No.", Item."No.");
                SalesPriceline.SetFilter(SalesPriceline."Starting Date", '<%1', Today);
                SalesPriceline.SetRange(SalesPriceline."Unit of Measure Code", BaseUOM);
                SalesPriceline.SetFilter(SalesPriceline."Ending Date", '>%1', Today);
                //SalesPriceline.SetFilter(end, '>%1', Today);
                if SalesPriceline.FindFirst() then begin
                    UnitPrice := SalesPriceline."Unit Price";

                end;


                ItemRef.SetRange("Item No.", "No.");
                ItemRef.SetRange("Unit of Measure", BaseUOM);
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
        SaveValues = true;
        layout
        {
            area(content)
            {

                group("Price Filter")

                {
                    field(BaseUOM; BaseUOM)
                    {
                        ApplicationArea = all;
                        Caption = 'Unit Of Measure';
                        TableRelation = "Unit of Measure".Code;
                    }

                    field(PriceListCode; PriceListCode)
                    {
                        ApplicationArea = all;
                        Caption = 'Sales Price List';
                        TableRelation = "Price List Header"."Code";
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
        ItemRef: Record "Item Reference";

        SalesPriceHead: Record "Price List Header";

        SalesPriceline: Record "Price List Line";

        UnitPrice: Decimal;
        BaseUOM: code[10];
        PriceListCode: Code[20];


    trigger OnInitReport()
    var
        myInt: Integer;
    begin
        // SalesPriceline.Get('S00003');
        // BaseUOM := rec."Base Unit of Measure"
        PriceListCode := 'S00003';

    end;

}
