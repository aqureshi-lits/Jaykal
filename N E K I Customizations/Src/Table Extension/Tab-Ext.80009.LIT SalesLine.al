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

        modify("Unit Price")
        {
            trigger OnAfterValidate()
            var
                myInt: Integer;
            begin
                rec."Sales Margin" := Rec."Unit Price" - rec."Unit Cost (LCY)";
                rec.Modify(true);
            end;
        }
        modify("Unit Cost")
        {
            trigger OnAfterValidate()
            var
                myInt: Integer;
            begin
                rec."Sales Margin" := Rec."Unit Price" - rec."Unit Cost (LCY)";
                rec.Modify(true);
            end;
        }
        modify("Unit Cost (LCY)")
        {
            trigger OnAfterValidate()
            var
                myInt: Integer;
            begin
                rec."Sales Margin" := Rec."Unit Price" - rec."Unit Cost (LCY)";
                rec.Modify(true);
            end;
        }

        modify(Quantity)
        {
            trigger OnAfterValidate()
            var
                myInt: Integer;
            begin
                rec."Sales Margin" := Rec."Unit Price" - rec."Unit Cost (LCY)";
                rec.Modify(true);
            end;
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
}