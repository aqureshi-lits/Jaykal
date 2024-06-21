tableextension 80008 "LIT SalesHeader" extends "Sales Header"
{
    fields
    {
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
        field(80002; "LIT Job Template Code"; Code[20])
        {
            Caption = 'Job Template Code';
            TableRelation = "LIT Job Template" where(Status = const(Active));
            DataClassification = ToBeClassified;
        }
        field(80003; "LIT Job No."; Code[20])
        {
            Caption = 'Job No.';
            DataClassification = ToBeClassified;
            Editable = false;
        }

        field(80004; "Sales Type"; Option)
        {
            DataClassification = ToBeClassified;
            Description = '//Frz 060118';
            OptionCaption = ' ,Sales Local,Sales Export,Sales FOC';
            OptionMembers = " ","Sales Local","Sales Export","Sales FOC";
        }

        modify("External Document No.")
        {
            trigger OnBeforeValidate()
            var
                myInt: Integer;
                TblSalesHeader: Record "Sales Header";
            begin
                TblSalesHeader.Reset();
                TblSalesHeader.SetRange(TblSalesHeader."Document Type", TblSalesHeader."Document Type"::Order);
                TblSalesHeader.SetRange(TblSalesHeader."External Document No.", Rec."External Document No.");
                if TblSalesHeader.FindSet() then begin
                    IF NOT CONFIRM('%1 LPO No. is already exist!, Do want to continue?', FALSE, TblSalesHeader."External Document No.") THEN
                        ERROR('')
                    ELSE
                        EXIT;
                end;

            end;
        }
    }


}