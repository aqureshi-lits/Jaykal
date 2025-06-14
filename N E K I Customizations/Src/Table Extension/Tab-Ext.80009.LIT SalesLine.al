tableextension 80009 "LIT SalesLine" extends "Sales Line" //OriginalId
{
    fields
    {
        field(80001; "Sales Margin"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'MAQ IAX Added 06-12-2020';
            Editable = false;
        }

        field(80002; "Order Date"; Date)
        {
            CalcFormula = lookup("Sales Header"."Order Date" where("Document Type" = field("Document Type"),
                                                                      "No." = field("Document No.")));
            Caption = 'Order Date';
            FieldClass = FlowField;
        }

        field(80003; "Salesperson Code"; Code[20])
        {
            CalcFormula = lookup("Sales Header"."Salesperson Code" where("Document Type" = field("Document Type"),
                                                                      "No." = field("Document No.")));
            Caption = 'Salesperson Code';
            FieldClass = FlowField;
        }

        modify("Unit Price")
        {
            trigger OnAfterValidate()
            var
                myInt: Integer;
            begin
                rec."Sales Margin" := Rec."Unit Price" - rec."Unit Cost (LCY)";
                //  rec.Modify(true);
            end;
        }
        modify("Unit Cost")
        {
            trigger OnAfterValidate()
            var
                myInt: Integer;
            begin
                rec."Sales Margin" := Rec."Unit Price" - rec."Unit Cost (LCY)";
                // rec.Modify(true);
            end;
        }
        modify("Unit Cost (LCY)")
        {
            trigger OnAfterValidate()
            var
                myInt: Integer;
            begin
                rec."Sales Margin" := Rec."Unit Price" - rec."Unit Cost (LCY)";
                //rec.Modify(true);
            end;
        }

        modify(Quantity)
        {
            trigger OnAfterValidate()
            var
                myInt: Integer;
            begin
                rec."Sales Margin" := Rec."Unit Price" - rec."Unit Cost (LCY)";
                // rec.Modify(true);
            end;
        }

        field(80004; "External Document No."; Code[35])
        {
            CalcFormula = lookup("Sales Header"."External Document No." where("Document Type" = field("Document Type"),
                                                                      "No." = field("Document No.")));
            Caption = 'External Document No.';
            FieldClass = FlowField;
        }

    }
    // trigger OnBeforeModify()
    // var
    //     SalesHeader: Record "Sales Header";
    //     Job: Record Job;
    // begin
    //     if Rec."Document Type" = Rec."Document Type"::Quote then
    //         if SalesHeader.Get(SalesHeader."Document Type"::Quote, Rec."Document No.") then
    //             if SalesHeader."Job No." <> '' then
    //                 if Job.Get(SalesHeader."Job No.") then
    //                     Error('Sales Quote cannot be modified as a Job against this dcoument is already created. Either delete the Job or create a new Sales Quote as a copy of this Sales Quote.');
    // end;

    // trigger OnAfterModify()
    // var
    //     myInt: Integer;
    // begin
    //     rec."Sales Margin" := Rec."Unit Price" - rec."Unit Cost (LCY)";
    //           //  rec.Modify(true);
    // end;
}