report 80056 "Purchase Documents"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Src/Layout/RGS Reports/Purchase Documents.rdlc';

    dataset
    {
        dataitem("Purchase Document header"; "Purchase Document header")
        {
            UseTemporary = true;
            column(DocumentType_PurchaseDocumentHeaderTemp; "Purchase Document header"."Document Type")
            {
            }
            column(No_PurchaseDocumentHeaderTemp; "Purchase Document header"."No.")
            {
            }
            column(OrderDate_PurchaseDocumentHeaderTemp; "Purchase Document header"."Order Date")
            {
            }
            column(BuyfromVendorNo_PurchaseDocumentHeaderTemp; "Purchase Document header"."Buy-from Vendor No.")
            {
            }
            column(BuyfromVendorName_PurchaseDocumentHeaderTemp; "Purchase Document header"."Buy-from Vendor Name")
            {
            }
            column(BuyfromVendorName2_PurchaseDocumentHeaderTemp; "Purchase Document header"."Buy-from Vendor Name 2")
            {
            }
            column(BuyfromAddress_PurchaseDocumentHeaderTemp; "Purchase Document header"."Buy-from Address")
            {
            }
            column(BuyfromAddress2_PurchaseDocumentHeaderTemp; "Purchase Document header"."Buy-from Address 2")
            {
            }
            column(BuyfromCity_PurchaseDocumentHeaderTemp; "Purchase Document header"."Buy-from City")
            {
            }
            column(BuyfromContact_PurchaseDocumentHeaderTemp; "Purchase Document header"."Buy-from Contact")
            {
            }
            column(BuyfromPostCode_PurchaseDocumentHeaderTemp; "Purchase Document header"."Buy-from Post Code")
            {
            }
            column(BuyfromCounty_PurchaseDocumentHeaderTemp; "Purchase Document header"."Buy-from County")
            {
            }
            column(BuyfromCountryRegionCode_PurchaseDocumentHeaderTemp; "Purchase Document header"."Buy-from Country/Region Code")
            {
            }
            column(CompInfo_Picture; CompInfo.Picture)
            {
            }
            column(Com_Name; CompInfo.Name)
            {
            }
            dataitem(PurchaseDocumentLine; PurchaseDocumentLine)
            {
                UseTemporary = true;
                column(LineNo_PurchaseDocumentLineTemp; PurchaseDocumentLine."Line No.")
                {
                }
                column(Type_PurchaseDocumentLineTemp; PurchaseDocumentLine.Type)
                {
                }
                column(No_PurchaseDocumentLineTemp; PurchaseDocumentLine."No.")
                {
                }
                column(LocationCode_PurchaseDocumentLineTemp; PurchaseDocumentLine."Location Code")
                {
                }
                column(Description_PurchaseDocumentLineTemp; PurchaseDocumentLine.Description)
                {
                }
                column(Description2_PurchaseDocumentLineTemp; PurchaseDocumentLine."Description 2")
                {
                }
                column(UnitofMeasure_PurchaseDocumentLineTemp; PurchaseDocumentLine."Unit of Measure")
                {
                }
                column(Quantity_PurchaseDocumentLineTemp; PurchaseDocumentLine.Quantity)
                {
                }
                column(DirectUnitCost_PurchaseDocumentLineTemp; PurchaseDocumentLine."Direct Unit Cost")
                {
                }
                column(UnitCostLCY_PurchaseDocumentLineTemp; PurchaseDocumentLine."Unit Cost (LCY)")
                {
                }
                column(VAT_PurchaseDocumentLineTemp; PurchaseDocumentLine."VAT %")
                {
                }
                column(LineDiscount_PurchaseDocumentLineTemp; PurchaseDocumentLine."Line Discount %")
                {
                }
                column(LineDiscountAmount_PurchaseDocumentLineTemp; PurchaseDocumentLine."Line Discount Amount")
                {
                }
                column(Amount_PurchaseDocumentLineTemp; PurchaseDocumentLine.Amount)
                {
                }
                column(AmountIncludingVAT_PurchaseDocumentLineTemp; PurchaseDocumentLine."Amount Including VAT")
                {
                }
            }
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPreReport()
    begin
        CompInfo.GET();
        CompInfo.CALCFIELDS(Picture);
        IF PurchaseHeader.GET(PurchaseHeader."Document Type"::Order, DocumentNo) THEN BEGIN
            "Purchase Document header"."Document Type" := PurchaseHeader."Document Type";
            "Purchase Document header"."No." := PurchaseHeader."No.";
            "Purchase Document header"."Order Date" := PurchaseHeader."Order Date";
            "Purchase Document header"."Buy-from Vendor No." := PurchaseHeader."Buy-from Vendor No.";
            "Purchase Document header"."Buy-from Vendor Name" := PurchaseHeader."Buy-from Vendor Name";
            "Purchase Document header"."Buy-from Vendor Name 2" := PurchaseHeader."Buy-from Vendor Name 2";
            "Purchase Document header"."Buy-from Address" := PurchaseHeader."Buy-from Address";
            "Purchase Document header"."Buy-from Address 2" := PurchaseHeader."Buy-from Address 2";
            "Purchase Document header"."Buy-from City" := PurchaseHeader."Buy-from City";
            "Purchase Document header"."Buy-from County" := PurchaseHeader."Buy-from County";
            "Purchase Document header".INSERT();

            PurchaseLine.SETRANGE("Document Type", PurchaseLine."Document Type"::Order);
            PurchaseLine.SETRANGE("Document No.", DocumentNo);
            IF PurchaseLine.FINDFIRST THEN
                REPEAT BEGIN
                    PurchaseDocumentLine."Document Type" := PurchaseLine.Type;
                    PurchaseDocumentLine."Document No." := PurchaseLine."Document No.";
                    PurchaseDocumentLine."Line No." := PurchaseLine."Line No.";
                    PurchaseDocumentLine.Type := PurchaseLine.Type;
                    PurchaseDocumentLine."No." := PurchaseLine."No.";
                    PurchaseDocumentLine."Location Code" := PurchaseLine."Location Code";
                    PurchaseDocumentLine.Description := PurchaseLine.Description;
                    PurchaseDocumentLine."Description 2" := PurchaseLine."Description 2";
                    PurchaseDocumentLine."Unit of Measure" := PurchaseLine."Unit of Measure";
                    PurchaseDocumentLine.Quantity := PurchaseLine.Quantity;
                    PurchaseDocumentLine."Direct Unit Cost" := PurchaseLine."Direct Unit Cost";
                    PurchaseDocumentLine."Unit Cost (LCY)" := PurchaseLine."Unit Cost (LCY)";
                    PurchaseDocumentLine."VAT %" := PurchaseLine."VAT %";
                    PurchaseDocumentLine."Line Discount %" := PurchaseLine."Line Discount %";
                    PurchaseDocumentLine."Line Discount Amount" := PurchaseLine."Line Discount Amount";
                    PurchaseDocumentLine.Amount := PurchaseLine.Amount;
                    PurchaseDocumentLine."Amount Including VAT" := PurchaseLine."Amount Including VAT";
                    PurchaseDocumentLine.INSERT();
                END
                UNTIL PurchaseLine.NEXT = 0;
        END
        ELSE
            IF PurchaseHeaderArchive.GET(PurchaseHeaderArchive."Document Type"::Order, DocumentNo, 1, VersionNo) THEN BEGIN
                "Purchase Document header"."Document Type" := PurchaseHeaderArchive."Document Type";
                "Purchase Document header"."No." := PurchaseHeaderArchive."No.";
                "Purchase Document header"."Order Date" := PurchaseHeaderArchive."Order Date";
                "Purchase Document header"."Buy-from Vendor No." := PurchaseHeaderArchive."Buy-from Vendor No.";
                "Purchase Document header"."Buy-from Vendor Name" := PurchaseHeaderArchive."Buy-from Vendor Name";
                "Purchase Document header"."Buy-from Vendor Name 2" := PurchaseHeaderArchive."Buy-from Vendor Name 2";
                "Purchase Document header"."Buy-from Address" := PurchaseHeaderArchive."Buy-from Address";
                "Purchase Document header"."Buy-from Address 2" := PurchaseHeaderArchive."Buy-from Address 2";
                "Purchase Document header"."Buy-from City" := PurchaseHeaderArchive."Buy-from City";
                "Purchase Document header"."Buy-from County" := PurchaseHeaderArchive."Buy-from County";
                "Purchase Document header".INSERT();

                PurchaseLineArchive.SETRANGE("Document Type", PurchaseLine."Document Type"::Order);
                PurchaseLineArchive.SETRANGE("Document No.", DocumentNo);
                PurchaseLineArchive.SETRANGE("Doc. No. Occurrence", 1);
                PurchaseLineArchive.SETRANGE("Version No.", VersionNo);
                IF PurchaseLineArchive.FINDFIRST THEN
                    REPEAT BEGIN
                        PurchaseDocumentLine."Document Type" := PurchaseLineArchive."Document Type";
                        PurchaseDocumentLine."Document No." := PurchaseLineArchive."Document No.";
                        PurchaseDocumentLine."Line No." := PurchaseLineArchive."Line No.";
                        PurchaseDocumentLine.Type := PurchaseLineArchive.Type;
                        PurchaseDocumentLine."No." := PurchaseLineArchive."No.";
                        PurchaseDocumentLine."Location Code" := PurchaseLineArchive."Location Code";
                        PurchaseDocumentLine.Description := PurchaseLineArchive.Description;
                        PurchaseDocumentLine."Description 2" := PurchaseLineArchive."Description 2";
                        PurchaseDocumentLine."Unit of Measure" := PurchaseLineArchive."Unit of Measure";
                        PurchaseDocumentLine.Quantity := PurchaseLineArchive.Quantity;
                        PurchaseDocumentLine."Direct Unit Cost" := PurchaseLineArchive."Direct Unit Cost";
                        PurchaseDocumentLine."Unit Cost (LCY)" := PurchaseLineArchive."Unit Cost (LCY)";
                        PurchaseDocumentLine."VAT %" := PurchaseLineArchive."VAT %";
                        PurchaseDocumentLine."Line Discount %" := PurchaseLineArchive."Line Discount %";
                        PurchaseDocumentLine."Line Discount Amount" := PurchaseLineArchive."Line Discount Amount";
                        PurchaseDocumentLine.Amount := PurchaseLineArchive.Amount;
                        PurchaseDocumentLine."Amount Including VAT" := PurchaseLineArchive."Amount Including VAT";
                        PurchaseDocumentLine.INSERT();
                    END
                    UNTIL PurchaseLineArchive.NEXT = 0;
            END;
    end;

    var
        PurchaseHeader: Record 38;
        PurchaseLine: Record 39;
        PurchaseHeaderArchive: Record 5109;
        PurchaseLineArchive: Record 5110;
        DocumentNo: Code[20];
        VersionNo: Integer;
        CompInfo: Record 79;

    procedure SetParameters(l_DocumentNo: Code[20]; l_VersionNo: Integer)
    begin
        DocumentNo := l_DocumentNo;
        VersionNo := l_VersionNo;
    end;
}

