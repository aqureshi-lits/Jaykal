pageextension 80013 "LIT SalesQuote" extends "Sales Quote"
{
    layout
    {
        // Add changes to page layout here
        addafter(Status)
        {
            group("Remarks")
            {
                Caption = 'Remarks';
            }
            field(Remark; Rec."LIT Remarks")
            {
                ApplicationArea = All;
                MultiLine = true;
                Importance = Additional;
            }
        }
        addafter("Requested Delivery Date")
        {
            field("Job Template Code"; Rec."LIT Job Template Code")
            {
                ApplicationArea = Basic, Suite;
                Importance = Promoted;
                ToolTip = 'Specifies the Job Template to be used while converting this Sales Quote into a Job Card.';
            }
            field("Job No."; Rec."LIT Job No.")
            {
                ApplicationArea = Basic, Suite;
                ToolTip = 'Specifies the Job created against this Sales Quote.';
            }
        }

        addafter("Sell-to Customer Name")
        {
            field("Sales Type"; Rec."Sales Type")
            {
                ApplicationArea = all;
            }

            // field("Requested Delivery Date"; Rec."Requested Delivery Date")
            // {
            //     ApplicationArea = all;
            // }
        }
    }

    actions
    {
        addbefore(MakeOrder)
        {
            action(MakeJob)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Make &Job';
                Enabled = true;
                Image = MakeOrder;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Convert the sales quote to a Job (Project).';

                AboutTitle = 'When a quote gets accepted';
                AboutText = 'When your customer is ready to buy, you can turn quotes into Job.';

                trigger OnAction()
                var
                    SalesReceivablesSetup: Record "Sales & Receivables Setup";
                    Job: Record Job;
                    JobTemplate: Record "LIT Job Template";
                    JobTaskTemplate: Record "Job Task Template";
                    SalesLine: Record "Sales Line";
                    ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    JobPlanningLineLineType: Enum "Job Planning Line Line Type";
                    JobPlanningLineType: Enum "Job Planning Line Type";
                    JobTaskLineNo: Integer;
                begin
                    Rec.TestField("Document Type", Rec."Document Type"::Quote);
                    if not ConfirmConvertToJob(Rec) then
                        exit;
                    if ApprovalsMgmt.PrePostApprovalCheckSales(Rec) then begin
                        Rec.TestField("LIT Job Template Code");
                        JobTemplate.Get(Rec."LIT Job Template Code");
                        JobTemplate.TestField(Status, JobTemplate.Status::Active);
                        if Rec."LIT Job No." <> '' then
                            if Job.Get(Rec."LIT Job No.") then
                                Error('Job cannot be created as a Job against this dcoument already exists. Either delete the existing Job or create a new Sales Quote.')
                            else
                                Rec."LIT Job No." := '';
                        Clear(job);
                        Job.Init();
                        // Job."No." := Rec."Your Reference";
                        Job."No." := GetJobNo();
                        Job.Insert();

                        if Rec."LIT Remarks" = '' then
                            Job.Validate(Description, 'Sales Contract')
                        else
                            Job.Validate(Description, Rec."LIT Remarks");
                        Job.Validate("Bill-to Customer No.", Rec."Sell-to Customer No.");
                        Job."LIT Sales Quote No." := Rec."No.";
                        Job.Modify();
                        if Rec."Shortcut Dimension 1 Code" <> '' then
                            Job."Global Dimension 1 Code" := Rec."Shortcut Dimension 1 Code";
                        if Rec."Shortcut Dimension 2 Code" <> '' then
                            Job."Global Dimension 2 Code" := Rec."Shortcut Dimension 2 Code";
                        Job.Modify();
                        JobTaskLineNo := 10000;
                        //CreateJobTaskLine(Job."No.", '10000', 'Sales', JobTaskType::"Begin-Total");
                        JobTaskTemplate.SetRange("Template No.", Rec."LIT Job Template Code");
                        if JobTaskTemplate.FindSet() then
                            repeat
                                CreateJobTaskLine(Job."No.", JobTaskTemplate."Job Task Template No.", JobTaskTemplate.Description, JobTaskTemplate."Job Task Type");
                                case JobTaskTemplate."Sales Line Type" of
                                    JobTaskTemplate."Sales Line Type"::Item:
                                        begin
                                            SalesLine.Reset();
                                            SalesLine.SetRange("Document No.", rec."No.");
                                            SalesLine.SetRange("Document Type", rec."Document Type");
                                            SalesLine.SetRange(Type, SalesLine.Type::Item);
                                            if SalesLine.FindSet() then
                                                repeat
                                                    CreateJobPlanningLine(Job."No.",
                                                                          JobTaskTemplate."Job Task Template No.",
                                                                          SalesLine."Line No.",
                                                                          JobPlanningLineLineType::"Both Budget and Billable",
                                                                          Rec."Document Date",
                                                                          JobPlanningLineType::Item,
                                                                          SalesLine."No.",
                                                                          SalesLine."Location Code",
                                                                          SalesLine.Quantity,
                                                                          SalesLine."Unit of Measure Code",
                                                                          SalesLine."Unit Cost",
                                                                          SalesLine."Unit Price",
                                                                           SalesLine."Currency Code");
                                                until SalesLine.Next() = 0;
                                        end;
                                    JobTaskTemplate."Sales Line Type"::"G/L Account":
                                        begin
                                            SalesLine.Reset();
                                            SalesLine.SetRange("Document No.", rec."No.");
                                            SalesLine.SetRange("Document Type", rec."Document Type");
                                            SalesLine.SetRange(Type, SalesLine.Type::"G/L Account");
                                            if SalesLine.FindSet() then
                                                repeat
                                                    CreateJobPlanningLine(Job."No.",
                                                                          JobTaskTemplate."Job Task Template No.",
                                                                          SalesLine."Line No.",
                                                                          JobPlanningLineLineType::"Both Budget and Billable",
                                                                          Rec."Document Date",
                                                                          JobPlanningLineType::"G/L Account",
                                                                          SalesLine."No.",
                                                                          SalesLine."Location Code",
                                                                          SalesLine.Quantity,
                                                                          SalesLine."Unit of Measure Code",
                                                                          SalesLine."Unit Cost",
                                                                          SalesLine."Unit Price",
                                                                          SalesLine."Currency Code");
                                                until SalesLine.Next() = 0;
                                        end;
                                    JobTaskTemplate."Sales Line Type"::"Charge (Item)":
                                        begin

                                        end;
                                    JobTaskTemplate."Sales Line Type"::"Fixed Asset":
                                        begin

                                        end;
                                    JobTaskTemplate."Sales Line Type"::Resource:
                                        begin
                                            SalesLine.Reset();
                                            SalesLine.SetRange("Document No.", rec."No.");
                                            SalesLine.SetRange("Document Type", rec."Document Type");
                                            SalesLine.SetRange(Type, SalesLine.Type::Resource);
                                            if SalesLine.FindSet() then
                                                repeat
                                                    CreateJobPlanningLine(Job."No.",
                                                                          JobTaskTemplate."Job Task Template No.",
                                                                          SalesLine."Line No.",
                                                                          JobPlanningLineLineType::"Both Budget and Billable",
                                                                          Rec."Document Date",
                                                                          JobPlanningLineType::Resource,
                                                                          SalesLine."No.",
                                                                          SalesLine."Location Code",
                                                                          SalesLine.Quantity,
                                                                          SalesLine."Unit of Measure Code",
                                                                          SalesLine."Unit Cost",
                                                                          SalesLine."Unit Price",
                                                                          SalesLine."Currency Code");
                                                until SalesLine.Next() = 0;
                                        end;
                                end;
                            until JobTaskTemplate.Next() = 0;
                        SalesReceivablesSetup.Get();
                        if SalesReceivablesSetup."LIT Del. Quote on Job Convert" then
                            Rec.Delete()
                        else begin
                            Rec."LIT Job No." := Job."No.";
                            Rec.Modify(false);
                            CurrPage.Update();
                        end;
                        ShowCreatedJob(Job);

                        // Message('Job has been created with the following details. Job No. : %1', Job."No.");
                    end;
                end;
            }
        }
        addafter("C&ontact")
        {
            action("J&ob")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'J&ob';
                Image = Job;
                Promoted = true;
                PromotedCategory = Category11;
                ToolTip = 'View or edit detailed information about the Job against this quotation.';
                trigger OnAction()
                var
                    Job: Record Job;
                begin
                    if Rec."LIT Job No." = '' then
                        Error('No Job found against this Sales Quotation.');
                    if Job.Get(Rec."LIT Job No.") then
                        Page.Run(Page::"Job Card", Job);
                end;
            }
        }
    }
    local procedure CreateJobTaskLine(JobNo: Code[20]; JobTaskNo: Code[20]; JobDescription: Text; JobTaskType: Enum "Job Task Type")
    var
        JobTask: Record "Job Task";
    begin
        JobTask.Init();
        JobTask."Job No." := JobNo;
        JobTask."Job Task No." := JobTaskNo;
        JobTask.Description := JobDescription;
        JobTask."Job Task Type" := JobTaskType;
        if not JobTask.Insert() then
            JobTask.Modify();
    end;

    local procedure CreateJobPlanningLine(JobNo: Code[20];
                                          JobTaskNo: Code[20];
                                          JobPlanningLineNo: Integer;
                                          JobPlanningLineLineType: Enum "Job Planning Line Line Type";
                                          PlanningDate: Date;
                                          Type: Enum "Job Planning Line Type";
                                          "No.": Code[20];
                                          LocationCode: Code[10];
                                          Quantity: Decimal;
                                          UnitofMeasureCode: Code[10];
                                          UnitCost: Decimal;
                                          UnitPrice: Decimal;
                                          CurrencyCode: Code[20])
    var
        JobPlanningLine: Record "Job Planning Line";
    begin
        JobPlanningLine.Init();
        JobPlanningLine."Job No." := JobNo;
        JobPlanningLine."Job Task No." := JobTaskNo;
        JobPlanningLine."Line No." := JobPlanningLineNo;
        JobPlanningLine.Validate("Line Type", JobPlanningLineLineType);
        JobPlanningLine.Validate("Planning Date", PlanningDate);
        JobPlanningLine.Validate(Type, Type);
        JobPlanningLine.Validate("No.", "No.");
        if LocationCode <> '' then
            JobPlanningLine."Location Code" := LocationCode;
        if Quantity <> 0 then
            JobPlanningLine.Validate(Quantity, Quantity);
        if UnitofMeasureCode <> '' then
            JobPlanningLine.Validate("Unit of Measure Code", UnitofMeasureCode);
        if UnitCost <> 0 then
            JobPlanningLine.Validate("Unit Cost", UnitCost);
        if UnitPrice <> 0 then
            JobPlanningLine.Validate("Unit Price", UnitPrice);
        if CurrencyCode <> '' then
            JobPlanningLine.Validate("Currency Code", CurrencyCode);
        if not JobPlanningLine.Insert(true) then
            JobPlanningLine.Modify();
    end;

    local procedure GetJobNo(): Code[20]
    var
        JobsSetup: Record "Jobs Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
    begin
        if not JobsSetup.Get() then
            exit('');
        case JobsSetup."LIT CreateSales Quote Job Nos." of
            JobsSetup."LIT CreateSales Quote Job Nos."::"From Job No. Series":
                begin
                    JobsSetup.TestField("Job Nos.");
                    exit(NoSeriesManagement.GetNextNo(JobsSetup."Job Nos.", Today, true));
                end;
            JobsSetup."LIT CreateSales Quote Job Nos."::"Same as Sales Quote No.":
                begin
                    Rec.TestField("No.");
                    exit(Rec."No.");
                end;
            JobsSetup."LIT CreateSales Quote Job Nos."::"From Your Reference":
                begin
                    Rec.TestField("Your Reference");
                    exit(Rec."Your Reference")
                end;
        end;
    end;

    local procedure ConfirmConvertToJob(SalesHeader: Record "Sales Header") Result: Boolean
    var
        ConfirmConvertToJobQst: Label 'Do you want to convert the quote to a job?';
    begin
        if GuiAllowed then
            if not Confirm(ConfirmConvertToJobQst, false) then
                exit(false);

        exit(true);
    end;

    local procedure ShowCreatedJob(var Job: Record Job)
    var
        OfficeMgt: Codeunit "Office Management";
        JobPage: Page "Job Card";
        OpenPage: Boolean;
        OpenNewJobQst: Label 'The quote has been converted to job %1. Do you want to open the new job?', Comment = '%1 = No. of the new job card.';
    begin
        if GuiAllowed() then
            if OfficeMgt.AttachAvailable then
                OpenPage := true
            else
                OpenPage := Confirm(StrSubstNo(OpenNewJobQst, Job."No."), true);
        if OpenPage then begin
            Clear(JobPage);
            JobPage.SetRecord(Job);
            JobPage.Run();
        end;
    end;
}