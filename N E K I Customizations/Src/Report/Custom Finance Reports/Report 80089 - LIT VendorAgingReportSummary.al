report 80089 "LIT VendorAgingReportSummary"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Src/Layout/Finance Report Layout/Vendor Aging Report.rdl';
    PreviewMode = PrintLayout;
    Caption = 'Vendor Aging Report Summary';
    dataset
    {
        dataitem(Vendor; Vendor)
        {
            RequestFilterFields = "No.";
            column(No_; "No.") { }
            column(Name; Name) { }
            column(Remainingmount; Remainingmount) { }
            column(OrignalAmount; OrignalAmount) { }
            column(Payment_Terms_Code; "Payment Terms Code") { }

            dataitem(AgingBucketLoop; Integer)
            {
                column(ArrayAmount; ArrayAmount[BucketEnum.AsInteger() + 1]) { }
                column(BucketEnum; BucketEnum) { }
                column(Number; Number) { }

                trigger OnafterGetRecord()
                var
                    myInt: Integer;
                    VendorLedgerEntry: Record "Vendor Ledger Entry";
                begin
                    AssignValueToLeaveTypeEnum(BucketEnum, Number);
                    //0-30
                    if BucketEnum = BucketEnum::"1-30" then begin

                        VendorLedgerEntry.Reset();
                        VendorLedgerEntry.SetRange("Vendor No.", Vendor."No.");
                        // VendorLedgerEntry.SetRange("Posting Date", DateFilter);
                        if VendorLedgerEntry.FindSet() then begin
                            repeat begin
                                Case AgingBy of
                                    AgingBy::"Document Date":
                                        ADLDueDate := (DateFilter - VendorLedgerEntry."Document Date");
                                    AgingBy::"Posting Date":
                                        ADLDueDate := (DateFilter - VendorLedgerEntry."Posting Date");
                                    AgingBy::"Due Date":
                                        ADLDueDate := (DateFilter - VendorLedgerEntry."Due Date");
                                End;

                                IF ADLDueDate <= 30 THEN BEGIN
                                    // ADLAgeBucket := '0-30'
                                    if Remainingmount = true then begin
                                        VendorLedgerEntry.CalcFields("Remaining Amt. (LCY)");
                                        ArrayAmount[BucketEnum.AsInteger() + 1] += VendorLedgerEntry."Remaining Amt. (LCY)";
                                    end else
                                        if OrignalAmount = true then begin
                                            VendorLedgerEntry.CalcFields("Original Amt. (LCY)");
                                            ArrayAmount[BucketEnum.AsInteger() + 1] += VendorLedgerEntry."Original Amt. (LCY)";
                                        end

                                END
                            end until VendorLedgerEntry.Next() = 0;
                        end
                    end;
                    //31-60

                    if BucketEnum = BucketEnum::"31-60" then begin

                        VendorLedgerEntry.Reset();
                        VendorLedgerEntry.SetRange("Vendor No.", Vendor."No.");
                        // VendorLedgerEntry.SetRange("Posting Date", DateFilter);
                        if VendorLedgerEntry.FindSet() then begin
                            repeat begin
                                Case AgingBy of
                                    AgingBy::"Document Date":
                                        ADLDueDate := (DateFilter - VendorLedgerEntry."Document Date");
                                    AgingBy::"Posting Date":
                                        ADLDueDate := (DateFilter - VendorLedgerEntry."Posting Date");
                                    AgingBy::"Due Date":
                                        ADLDueDate := (DateFilter - VendorLedgerEntry."Due Date");
                                End;
                                IF (ADLDueDate > 30) AND (ADLDueDate <= 60) THEN BEGIN
                                    // ADLAgeBucket := '0-30'
                                    if Remainingmount = true then begin
                                        VendorLedgerEntry.CalcFields("Remaining Amt. (LCY)");
                                        ArrayAmount[BucketEnum.AsInteger() + 1] += VendorLedgerEntry."Remaining Amt. (LCY)";
                                    end else
                                        if OrignalAmount = true then begin
                                            VendorLedgerEntry.CalcFields("Original Amt. (LCY)");
                                            ArrayAmount[BucketEnum.AsInteger() + 1] += VendorLedgerEntry."Original Amt. (LCY)";
                                        end

                                END
                            end until VendorLedgerEntry.Next() = 0;
                        end
                    end;

                    //61-90
                    if BucketEnum = BucketEnum::"61-90" then begin

                        VendorLedgerEntry.Reset();
                        VendorLedgerEntry.SetRange("Vendor No.", Vendor."No.");
                        // VendorLedgerEntry.SetRange("Posting Date", DateFilter);
                        if VendorLedgerEntry.FindSet() then begin
                            repeat begin
                                Case AgingBy of
                                    AgingBy::"Document Date":
                                        ADLDueDate := (DateFilter - VendorLedgerEntry."Document Date");
                                    AgingBy::"Posting Date":
                                        ADLDueDate := (DateFilter - VendorLedgerEntry."Posting Date");
                                    AgingBy::"Due Date":
                                        ADLDueDate := (DateFilter - VendorLedgerEntry."Due Date");
                                End;
                                IF (ADLDueDate > 61) AND (ADLDueDate <= 90) THEN BEGIN
                                    // ADLAgeBucket := '0-30'
                                    if Remainingmount = true then begin
                                        VendorLedgerEntry.CalcFields("Remaining Amt. (LCY)");
                                        ArrayAmount[BucketEnum.AsInteger() + 1] += VendorLedgerEntry."Remaining Amt. (LCY)";
                                    end else
                                        if OrignalAmount = true then begin
                                            VendorLedgerEntry.CalcFields("Original Amt. (LCY)");
                                            ArrayAmount[BucketEnum.AsInteger() + 1] += VendorLedgerEntry."Original Amt. (LCY)";
                                        end
                                END
                            end until VendorLedgerEntry.Next() = 0;
                        end
                    end;
                    //91-120
                    if BucketEnum = BucketEnum::"91-120" then begin

                        VendorLedgerEntry.Reset();
                        VendorLedgerEntry.SetRange("Vendor No.", Vendor."No.");
                        // VendorLedgerEntry.SetRange("Posting Date", DateFilter);
                        if VendorLedgerEntry.FindSet() then begin
                            repeat begin
                                Case AgingBy of
                                    AgingBy::"Document Date":
                                        ADLDueDate := (DateFilter - VendorLedgerEntry."Document Date");
                                    AgingBy::"Posting Date":
                                        ADLDueDate := (DateFilter - VendorLedgerEntry."Posting Date");
                                    AgingBy::"Due Date":
                                        ADLDueDate := (DateFilter - VendorLedgerEntry."Due Date");
                                End;
                                IF (ADLDueDate > 91) AND (ADLDueDate <= 120) THEN BEGIN
                                    // ADLAgeBucket := '0-30'
                                    if Remainingmount = true then begin
                                        VendorLedgerEntry.CalcFields("Remaining Amt. (LCY)");
                                        ArrayAmount[BucketEnum.AsInteger() + 1] += VendorLedgerEntry."Remaining Amt. (LCY)";
                                    end else
                                        if OrignalAmount = true then begin
                                            VendorLedgerEntry.CalcFields("Original Amt. (LCY)");
                                            ArrayAmount[BucketEnum.AsInteger() + 1] += VendorLedgerEntry."Original Amt. (LCY)";
                                        end
                                END
                            end until VendorLedgerEntry.Next() = 0;
                        end
                    end;
                    //121-180
                    if BucketEnum = BucketEnum::"121-180" then begin

                        VendorLedgerEntry.Reset();
                        VendorLedgerEntry.SetRange("Vendor No.", Vendor."No.");
                        // VendorLedgerEntry.SetRange("Posting Date", DateFilter);
                        if VendorLedgerEntry.FindSet() then begin
                            repeat begin
                                Case AgingBy of
                                    AgingBy::"Document Date":
                                        ADLDueDate := (DateFilter - VendorLedgerEntry."Document Date");
                                    AgingBy::"Posting Date":
                                        ADLDueDate := (DateFilter - VendorLedgerEntry."Posting Date");
                                    AgingBy::"Due Date":
                                        ADLDueDate := (DateFilter - VendorLedgerEntry."Due Date");
                                End;
                                IF (ADLDueDate > 121) AND (ADLDueDate <= 180) THEN BEGIN
                                    // ADLAgeBucket := '0-30'
                                    if Remainingmount = true then begin
                                        VendorLedgerEntry.CalcFields("Remaining Amt. (LCY)");
                                        ArrayAmount[BucketEnum.AsInteger() + 1] += VendorLedgerEntry."Remaining Amt. (LCY)";
                                    end else
                                        if OrignalAmount = true then begin
                                            VendorLedgerEntry.CalcFields("Original Amt. (LCY)");
                                            ArrayAmount[BucketEnum.AsInteger() + 1] += VendorLedgerEntry."Original Amt. (LCY)";
                                        end
                                END
                            end until VendorLedgerEntry.Next() = 0;
                        end
                    end;

                    //181-210
                    if BucketEnum = BucketEnum::"181-210" then begin

                        VendorLedgerEntry.Reset();
                        VendorLedgerEntry.SetRange("Vendor No.", Vendor."No.");
                        // VendorLedgerEntry.SetRange("Posting Date", DateFilter);
                        if VendorLedgerEntry.FindSet() then begin
                            repeat begin
                                Case AgingBy of
                                    AgingBy::"Document Date":
                                        ADLDueDate := (DateFilter - VendorLedgerEntry."Document Date");
                                    AgingBy::"Posting Date":
                                        ADLDueDate := (DateFilter - VendorLedgerEntry."Posting Date");
                                    AgingBy::"Due Date":
                                        ADLDueDate := (DateFilter - VendorLedgerEntry."Due Date");
                                End;
                                IF (ADLDueDate > 181) AND (ADLDueDate <= 210) THEN BEGIN
                                    // ADLAgeBucket := '0-30'
                                    if Remainingmount = true then begin
                                        VendorLedgerEntry.CalcFields("Remaining Amt. (LCY)");
                                        ArrayAmount[BucketEnum.AsInteger() + 1] += VendorLedgerEntry."Remaining Amt. (LCY)";
                                    end else
                                        if OrignalAmount = true then begin
                                            VendorLedgerEntry.CalcFields("Original Amt. (LCY)");
                                            ArrayAmount[BucketEnum.AsInteger() + 1] += VendorLedgerEntry."Original Amt. (LCY)";
                                        end
                                END
                            end until VendorLedgerEntry.Next() = 0;
                        end
                    end;

                    //210-240
                    if BucketEnum = BucketEnum::"210-240" then begin

                        VendorLedgerEntry.Reset();
                        VendorLedgerEntry.SetRange("Vendor No.", Vendor."No.");
                        // VendorLedgerEntry.SetRange("Posting Date", DateFilter);
                        if VendorLedgerEntry.FindSet() then begin
                            repeat begin
                                Case AgingBy of
                                    AgingBy::"Document Date":
                                        ADLDueDate := (DateFilter - VendorLedgerEntry."Document Date");
                                    AgingBy::"Posting Date":
                                        ADLDueDate := (DateFilter - VendorLedgerEntry."Posting Date");
                                    AgingBy::"Due Date":
                                        ADLDueDate := (DateFilter - VendorLedgerEntry."Due Date");
                                End;
                                IF (ADLDueDate > 210) AND (ADLDueDate <= 240) THEN BEGIN
                                    // ADLAgeBucket := '0-30'
                                    if Remainingmount = true then begin
                                        VendorLedgerEntry.CalcFields("Remaining Amt. (LCY)");
                                        ArrayAmount[BucketEnum.AsInteger() + 1] += VendorLedgerEntry."Remaining Amt. (LCY)";
                                    end else
                                        if OrignalAmount = true then begin
                                            VendorLedgerEntry.CalcFields("Original Amt. (LCY)");
                                            ArrayAmount[BucketEnum.AsInteger() + 1] += VendorLedgerEntry."Original Amt. (LCY)";
                                        end
                                END
                            end until VendorLedgerEntry.Next() = 0;
                        end
                    end;

                    //240
                    if BucketEnum = BucketEnum::"240 Above" then begin

                        VendorLedgerEntry.Reset();
                        VendorLedgerEntry.SetRange("Vendor No.", Vendor."No.");
                        // VendorLedgerEntry.SetFilter("Posting Date", '<=%1', DateFilter);
                        if VendorLedgerEntry.FindSet() then begin
                            repeat begin
                                Case AgingBy of
                                    AgingBy::"Document Date":
                                        ADLDueDate := (DateFilter - VendorLedgerEntry."Document Date");
                                    AgingBy::"Posting Date":
                                        ADLDueDate := (DateFilter - VendorLedgerEntry."Posting Date");
                                    AgingBy::"Due Date":
                                        ADLDueDate := (DateFilter - VendorLedgerEntry."Due Date");
                                End;
                                IF (ADLDueDate > 240) THEN BEGIN
                                    // ADLAgeBucket := '0-30'
                                    if Remainingmount = true then begin
                                        VendorLedgerEntry.CalcFields("Remaining Amt. (LCY)");
                                        ArrayAmount[BucketEnum.AsInteger() + 1] += VendorLedgerEntry."Remaining Amt. (LCY)";
                                    end else
                                        if OrignalAmount = true then begin
                                            VendorLedgerEntry.CalcFields("Original Amt. (LCY)");
                                            ArrayAmount[BucketEnum.AsInteger() + 1] += VendorLedgerEntry."Original Amt. (LCY)";
                                        end
                                END
                            end until VendorLedgerEntry.Next() = 0;
                        end
                    end;

                end;

                trigger OnPredataitem()
                var
                    myInt: Integer;
                begin
                    SetRange(Number, 1, 8);
                    if (DateFilter = 0D) then
                        ERROR('Please select the Aging as of Date');
                    if (AgingBy = AgingBy::" ") then
                        Error('Please Select Aging By');
                    if (Remainingmount = false) And (OrignalAmount = true) then
                        Error('Please Select Remaining Amount either Orignal Amount');
                end;
            }
            trigger OnAftergetrecord()
            var
                myInt: Integer;
            begin
                Clear(ArrayAmount);
            end;

            trigger OnPredataitem()
            var
                myInt: Integer;
            begin
                Clear(ArrayAmount);
            end;
        }
        // dataitem("Vendor Ledger Entry"; "Vendor Ledger Entry")
        // {
        //     //DataItemTableView = WHERE(Open = FILTER(true));
        //     RequestFilterFields = "Vendor No.", "Posting Date", "Vendor Posting Group", Open;
        //     column(CustomerNo_CustLedgerEntry; "Vendor Ledger Entry"."Vendor No.")
        //     {
        //     }
        //     column(PostingDate_CustLedgerEntry; "Vendor Ledger Entry"."Posting Date")
        //     {
        //     }
        //     column(DocumentDate_CustLedgerEntry; "Vendor Ledger Entry"."Document Date")
        //     {
        //     }
        //     column(DocumentType_CustLedgerEntry; "Vendor Ledger Entry"."Document Type")
        //     {
        //     }
        //     column(DocumentNo_CustLedgerEntry; "Vendor Ledger Entry"."Document No.")
        //     {
        //     }
        //     column(Description_CustLedgerEntry; "Vendor Ledger Entry".Description)
        //     {
        //     }
        //     column(CurrencyCode_CustLedgerEntry; "Vendor Ledger Entry"."Currency Code")
        //     {
        //     }
        //     column(Amount_CustLedgerEntry; "Vendor Ledger Entry".Amount)
        //     {
        //     }
        //     column(AmountLCY_CustLedgerEntry; "Vendor Ledger Entry"."Amount (LCY)")
        //     {
        //     }
        //     column(RemainingAmount_CustLedgerEntry; "Vendor Ledger Entry"."Remaining Amount")
        //     {
        //     }
        //     column(Remaining_Amt___LCY_CustLedgerEntry; "Vendor Ledger Entry"."Remaining Amt. (LCY)")
        //     {
        //     }
        //     column(Original_Amount; "Original Amount")
        //     {
        //     }
        //     column(Original_Amt___LCY_; "Original Amt. (LCY)")
        //     {
        //     }
        //     column(CustomerPostingGroup_CustLedgerEntry; "Vendor Ledger Entry"."Vendor Posting Group")
        //     {
        //     }
        //     column(GlobalDimension1Code_CustLedgerEntry; "Vendor Ledger Entry"."Global Dimension 1 Code")
        //     {
        //     }
        //     column(GlobalDimension2Code_CustLedgerEntry; "Vendor Ledger Entry"."Global Dimension 2 Code")
        //     {
        //     }
        //     column(Open_CustLedgerEntry; "Vendor Ledger Entry".Open)
        //     {
        //     }
        //     column(DueDate_CustLedgerEntry; "Vendor Ledger Entry"."Due Date")
        //     {
        //     }
        //     column(ExternalDocumentNo_CustLedgerEntry; "Vendor Ledger Entry"."External Document No.")
        //     {
        //     }
        //     column(OriginalAmount_CustLedgerEntry; "Vendor Ledger Entry"."Original Amount")
        //     {
        //     }
        //     column(Remarks_CustLedgerEntry; "Vendor Ledger Entry".Remarks)
        //     {
        //     }
        //     // column(ProjectName_CustLedgerEntry; "Cust. Ledger Entry"."ADL Project Name")
        //     // {
        //     // }
        //     // column(ADLCustomerName_CustLedgerEntry; "Cust. Ledger Entry"."ADL Customer Name")
        //     // {
        //     // }
        //     column(ADLDueDate; ADLDueDate)
        //     {
        //     }
        //     column(ADLAgeBucket; ADLAgeBucket)
        //     {
        //     }
        //     column(OrignalAmount; OrignalAmount)
        //     {
        //     }
        //     column(Remainingmount; Remainingmount)
        //     {
        //     }
        //     column(PreAssignedNo; PreAssignedNo)
        //     {
        //     }
        //     trigger OnPreDataItem()
        //     var
        //         myInt: Integer;
        //     begin
        //         IF DateFilter = 0D THEN
        //             ERROR('Please select the Aging as of Date');
        //         SetRange("Posting Date", 0D, DateFilter);
        //     end;

        //     trigger OnAfterGetRecord()
        //     var
        //         SalesInvoiceHeader: Record "Sales Invoice Header";

        //     begin
        //         CLEAR(ADLDueDate);
        //         CLEAR(ADLAgeBucket);

        //         ADLDueDate := (DateFilter - "Vendor Ledger Entry"."Posting Date");

        //         //IF([@[Due Days]]<30, "0-30",
        //         //IF(AND([@[Due Days]]>30, [@[Due Days]]<61),"31-60",
        //         //IF(AND([@[Due Days]]>60, [@[Due Days]]<91),"61-90",
        //         //IF(AND([@[Due Days]]>90, [@[Due Days]]<121),"91-120",
        //         //IF([@[Due Days]]>120,">120","")))))


        //         IF ADLDueDate <= 30 THEN BEGIN
        //             ADLAgeBucket := '0-30'
        //         END ELSE
        //             IF (ADLDueDate > 30) AND (ADLDueDate <= 60) THEN BEGIN
        //                 ADLAgeBucket := '31-60'
        //             END ELSE
        //                 IF (ADLDueDate > 60) AND (ADLDueDate <= 90) THEN BEGIN
        //                     ADLAgeBucket := '61-90'
        //                 END ELSE
        //                     IF (ADLDueDate > 91) AND (ADLDueDate <= 120) THEN BEGIN
        //                         ADLAgeBucket := '91-120'
        //                     END ELSE
        //                         IF (ADLDueDate > 120) AND (ADLDueDate <= 180) THEN BEGIN
        //                             ADLAgeBucket := '121-180'
        //                         END
        //                         ELSE
        //                             IF (ADLDueDate > 180) AND (ADLDueDate <= 240) THEN BEGIN
        //                                 ADLAgeBucket := '181-365'

        //                             END
        //                             ELSE
        //                                 IF (ADLDueDate > 240) THEN BEGIN
        //                                     ADLAgeBucket := 'Above 240 days'

        //                                 END;
        //         // PreAssignedNo := '';
        //         // SalesInvoiceHeader.SetRange("No.", "Vendor Ledger Entry"."Document No.");
        //         // if SalesInvoiceHeader.Find('-') then
        //         //     PreAssignedNo := SalesInvoiceHeader."Pre-Assigned No.";

        //     end;

        // }
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {

                group("Aging as of Date")
                {
                    field(OrignalAmount; OrignalAmount)
                    {
                        ApplicationArea = All;
                        Caption = 'By Orignal Amount';
                        ShowMandatory = true;
                        trigger OnValidate()
                        var
                            myInt: Integer;
                        begin
                            if OrignalAmount = true then
                                Remainingmount := false;
                        end;

                    }
                    field(Remainingmount; Remainingmount)
                    {
                        ApplicationArea = All;
                        Caption = 'By Remaining Amount';
                        ShowMandatory = true;
                        trigger OnValidate()
                        var
                            myInt: Integer;
                        begin
                            if Remainingmount = true then
                                OrignalAmount := false;
                        end;
                    }
                    field("As of Date"; DateFilter)
                    {
                        ApplicationArea = all;
                        Caption = 'As of Date';
                    }
                    field(AgingBy; AgingBy)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Aging by';
                        OptionCaption = ',Due Date,Posting Date,Document Date';
                        ToolTip = 'Specifies if the aging will be calculated from the due date, the posting date, or the document date.';
                    }
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }
    local procedure AssignValueToLeaveTypeEnum(var BucketEnum: Enum "LIT Bucket Enum"; Number: Integer)
    begin
        case Number of
            1:
                BucketEnum := BucketEnum::"1-30";
            2:
                BucketEnum := BucketEnum::"31-60";
            3:
                BucketEnum := BucketEnum::"61-90";
            4:
                BucketEnum := BucketEnum::"91-120";
            5:
                BucketEnum := BucketEnum::"121-180";
            6:
                BucketEnum := BucketEnum::"181-210";
            7:
                BucketEnum := BucketEnum::"210-240";
            8:
                BucketEnum := BucketEnum::"240 Above";

        end;
    end;

    var
        ADLDueDate: Decimal;

        ADLAgeBucket: Text[250];
        ArrayAmount: array[9] of Decimal;
        DateFilter: Date;
        OrignalAmount: Boolean;
        Remainingmount: Boolean;
        PreAssignedNo: Code[20];
        v: Report 322;
        BucketEnum: Enum "LIT Bucket Enum";
        AgingBy: Option " ","Due Date","Posting Date","Document Date";
}


