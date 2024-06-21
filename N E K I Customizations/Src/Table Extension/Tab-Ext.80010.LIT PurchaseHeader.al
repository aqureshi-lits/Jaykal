tableextension 80010 "LIT PurchaseHeader" extends "Purchase Header"
{

    fields
    {

        // Add changes to table fields here
        field(80000; "LIT Importance Type"; Option)
        {
            Caption = 'Importance Type';
            OptionCaption = ' ,High,Medium,Low';
            OptionMembers = ,High,Medium,Low;
        }
        field(80001; "LIT Remarks"; Text[250])
        {
            Caption = 'Remarks';
        }
        field(80002; "Decalration No."; Code[20])
        {
            Caption = 'Decalration No.';
        }
        field(80003; "Decalration Date"; Date)
        {
            Caption = 'Decalration Date';
        }

        field(80004; "Prepared By"; text[50])
        {
            Caption = 'Prepared By';
        }

        field(80005; "Approved By"; text[50])
        {
            Caption = 'Approved By';
        }

        field(80006; "Driver Name"; text[50])
        {
            Caption = 'Driver Name';
        }

        field(80007; "Purchase Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Purchase Local,Purchase Import';
            OptionMembers = " ","Purchase Local","Purchase Import";
        }

        modify("Vendor Invoice No.")
        {
            trigger OnBeforeValidate()
            var
                myInt: Integer;
                TblPurchHeader: Record "Purchase Header";
            begin
                TblPurchHeader.Reset();
                TblPurchHeader.SetRange(TblPurchHeader."Document Type", TblPurchHeader."Document Type"::Order);
                TblPurchHeader.SetRange(TblPurchHeader."Vendor Invoice No.", Rec."Vendor Invoice No.");
                if TblPurchHeader.FindSet() then begin
                    IF NOT CONFIRM('%1 Vendor Invoice No. is already exist!, Do want to continue?', FALSE, TblPurchHeader."Vendor Invoice No.") THEN
                        ERROR('')
                    ELSE
                        EXIT;
                end;

            end;
        }
    }

}

