report 80048 "LIT Item Barcode Label-1"
{
    ApplicationArea = All;
    Caption = 'Item Barcode Labels-1';
    DefaultLayout = RDLC;
    UsageCategory = Tasks;
    RDLCLayout = './Src/Layout/LIT Item Barcode Label-1.rdl';
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
            trigger OnAfterGetRecord()
            var
                //BARCODE SYMBOLOGY DECLARATION
                BarcodeStr: Code[20];
            begin
                UOMCode := Item."Base Unit of Measure";
                BaseUOM := Item."Base Unit of Measure";
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

            trigger OnPreDataItem()
            var
                myInt: Integer;
            begin

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
                        // trigger onvalidate()
                        // var
                        //     myInt: Integer;
                        // begin
                        //     UOMCode := UOMCode;
                        // end;

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
        BaseUOM: code[10];
        UOMCode: Code[30];

        R: Report "Item Price List";

    procedure GetITEMBaseUOM(ItemNo: Code[30]): Code[20]
    var
        itemRec: Record Item;


    begin
        // UOMCode := '';
        itemRec.SetRange(itemRec."No.", ItemNo);
        if itemRec.FindFirst() then
            UOMCode := itemRec."Base Unit of Measure";



    end;

    PROCEDURE GetItemBaseUnitOfMeasure(ItemNo: Code[20]): Text[10];
    VAR
        Item1: Record Item;
    BEGIN
        Item1.GET(ItemNo);
        UOMCode := Item1."Base Unit of Measure";
        // Message('C');
        EXIT(Item1."Base Unit of Measure");

        // 
    END;

    trigger OnInitReport()
    var
        myInt: Integer;
    begin
        // GetITEMBaseUOM(Item."No.");
        // BaseUOM := UOMCode;
        // Message('A');

    end;

    trigger OnPreReport()
    var
        myInt: Integer;
    begin

        // Message('B');
        // GetITEMBaseUOM(Item."No.");
        // BaseUOM := UOMCode;
    end;
}
