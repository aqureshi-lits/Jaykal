report 80081 "LIT Supplier Aging Report"
{
    DefaultLayout = RDLC;
    // RDLCLayout = './KelvinControlCustomization/Layout/ADL AR Aging Report - MAQ.rdl';
    PreviewMode = PrintLayout;

    dataset
    {
        dataitem("Vendor Ledger Entry"; "Vendor Ledger Entry")
        {
            //DataItemTableView = WHERE(Open = FILTER(true));
            RequestFilterFields = "Vendor No.", "Posting Date", "Vendor Posting Group", Open;
            column(CustomerNo_CustLedgerEntry; "Vendor Ledger Entry"."Vendor No.")
            {
            }
            column(PostingDate_CustLedgerEntry; "Vendor Ledger Entry"."Posting Date")
            {
            }
            column(DocumentDate_CustLedgerEntry; "Vendor Ledger Entry"."Document Date")
            {
            }
            column(DocumentType_CustLedgerEntry; "Vendor Ledger Entry"."Document Type")
            {
            }
            column(DocumentNo_CustLedgerEntry; "Vendor Ledger Entry"."Document No.")
            {
            }
            column(Description_CustLedgerEntry; "Vendor Ledger Entry".Description)
            {
            }
            column(CurrencyCode_CustLedgerEntry; "Vendor Ledger Entry"."Currency Code")
            {
            }
            column(Amount_CustLedgerEntry; "Vendor Ledger Entry".Amount)
            {
            }
            column(AmountLCY_CustLedgerEntry; "Vendor Ledger Entry"."Amount (LCY)")
            {
            }
            column(RemainingAmount_CustLedgerEntry; "Vendor Ledger Entry"."Remaining Amount")
            {
            }
            column(Remaining_Amt___LCY_CustLedgerEntry; "Vendor Ledger Entry"."Remaining Amt. (LCY)")
            {
            }
            column(Original_Amount; "Original Amount")
            {
            }
            column(Original_Amt___LCY_; "Original Amt. (LCY)")
            {
            }
            column(CustomerPostingGroup_CustLedgerEntry; "Vendor Ledger Entry"."Vendor Posting Group")
            {
            }
            column(GlobalDimension1Code_CustLedgerEntry; "Vendor Ledger Entry"."Global Dimension 1 Code")
            {
            }
            column(GlobalDimension2Code_CustLedgerEntry; "Vendor Ledger Entry"."Global Dimension 2 Code")
            {
            }
            column(Open_CustLedgerEntry; "Vendor Ledger Entry".Open)
            {
            }
            column(DueDate_CustLedgerEntry; "Vendor Ledger Entry"."Due Date")
            {
            }
            column(ExternalDocumentNo_CustLedgerEntry; "Vendor Ledger Entry"."External Document No.")
            {
            }
            column(OriginalAmount_CustLedgerEntry; "Vendor Ledger Entry"."Original Amount")
            {
            }
            column(Remarks_CustLedgerEntry; "Vendor Ledger Entry"."LIT Remarks")
            {
            }
            // column(ProjectName_CustLedgerEntry; "Cust. Ledger Entry"."ADL Project Name")
            // {
            // }
            // column(ADLCustomerName_CustLedgerEntry; "Cust. Ledger Entry"."ADL Customer Name")
            // {
            // }
            column(ADLDueDate; ADLDueDate)
            {
            }
            column(ADLAgeBucket; ADLAgeBucket)
            {
            }
            column(OrignalAmount; OrignalAmount)
            {
            }
            column(Remainingmount; Remainingmount)
            {
            }
            column(PreAssignedNo; PreAssignedNo)
            {
            }
            trigger OnPreDataItem()
            var
                myInt: Integer;
            begin
                IF DateFilter = 0D THEN
                    ERROR('Please select the Aging as of Date');
                SetRange("Posting Date", 0D, DateFilter);
            end;

            trigger OnAfterGetRecord()
            var
                SalesInvoiceHeader: Record "Sales Invoice Header";

            begin
                CLEAR(ADLDueDate);
                CLEAR(ADLAgeBucket);

                ADLDueDate := (DateFilter - "Vendor Ledger Entry"."Posting Date");

                //IF([@[Due Days]]<30, "0-30",
                //IF(AND([@[Due Days]]>30, [@[Due Days]]<61),"31-60",
                //IF(AND([@[Due Days]]>60, [@[Due Days]]<91),"61-90",
                //IF(AND([@[Due Days]]>90, [@[Due Days]]<121),"91-120",
                //IF([@[Due Days]]>120,">120","")))))


                IF ADLDueDate <= 30 THEN BEGIN
                    ADLAgeBucket := '0-30'
                END ELSE
                    IF (ADLDueDate > 30) AND (ADLDueDate <= 60) THEN BEGIN
                        ADLAgeBucket := '31-60'
                    END ELSE
                        IF (ADLDueDate > 60) AND (ADLDueDate <= 90) THEN BEGIN
                            ADLAgeBucket := '61-90'
                        END ELSE
                            IF (ADLDueDate > 91) AND (ADLDueDate <= 120) THEN BEGIN
                                ADLAgeBucket := '91-120'
                            END ELSE
                                IF (ADLDueDate > 120) AND (ADLDueDate <= 180) THEN BEGIN
                                    ADLAgeBucket := '121-180'
                                END
                                ELSE
                                    IF (ADLDueDate > 180) AND (ADLDueDate <= 240) THEN BEGIN
                                        ADLAgeBucket := '181-365'

                                    END
                                    ELSE
                                        IF (ADLDueDate > 240) THEN BEGIN
                                            ADLAgeBucket := 'Above 240 days'

                                        END;
                // PreAssignedNo := '';
                // SalesInvoiceHeader.SetRange("No.", "Vendor Ledger Entry"."Document No.");
                // if SalesInvoiceHeader.Find('-') then
                //     PreAssignedNo := SalesInvoiceHeader."Pre-Assigned No.";

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

    var
        ADLDueDate: Decimal;

        ADLAgeBucket: Text[250];
        DateFilter: Date;
        OrignalAmount: Boolean;
        Remainingmount: Boolean;
        PreAssignedNo: Code[20];
        v: Report 322;
}


