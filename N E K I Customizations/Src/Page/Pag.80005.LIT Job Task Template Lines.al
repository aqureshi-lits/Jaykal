page 80005 "LIT Job Task Template Lines"
{
    ApplicationArea = All;
    Caption = 'Job Task Template Lines';
    PageType = List;
    SourceTable = "Job Task Template";
    UsageCategory = Lists;
    SaveValues = true;
    DataCaptionFields = "Template No.";

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                IndentationColumn = DescriptionIndent;
                IndentationControls = Description;
                ShowCaption = false;
                field("Template No."; Rec."Template No.")
                {
                    ApplicationArea = Jobs;
                    Style = Strong;
                    StyleExpr = StyleIsStrong;
                    ToolTip = 'Specifies the number of the related job.';
                    Visible = false;
                }
                field("Job Task Template No."; Rec."Job Task Template No.")
                {
                    ApplicationArea = Jobs;
                    Style = Strong;
                    StyleExpr = StyleIsStrong;
                    ToolTip = 'Specifies the number of the related job task.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Jobs;
                    Style = Strong;
                    StyleExpr = StyleIsStrong;
                    ToolTip = 'Specifies a description of the job task. You can enter anything that is meaningful in describing the task. The description is copied and used in descriptions on the job planning line.';
                }
                field("Job Task Type"; Rec."Job Task Type")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the purpose of the account. Newly created accounts are automatically assigned the Posting account type, but you can change this. Choose the field to select one of the following five options:';
                }
                field(Totaling; Rec.Totaling)
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies an interval or a list of job task numbers.';
                }
                field("Job Posting Group"; Rec."Job Posting Group")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the job posting group of the task.';
                }
                field("WIP-Total"; Rec."WIP-Total")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the job tasks you want to group together when calculating Work In Process (WIP) and Recognition.';
                }
                field("WIP Method"; Rec."WIP Method")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the name of the Work in Process calculation method that is associated with a job. The value in this field comes from the WIP method specified on the job card.';
                }
            }
        }
    }
    trigger OnAfterGetRecord()
    begin
        DescriptionIndent := Rec.Indentation;
        StyleIsStrong := Rec."Job Task Type" <> Rec."Job Task Type"::Posting;
    end;

    // trigger OnNewRecord(BelowxRec: Boolean)
    // begin
    //     ClearTempDim;
    // end;

    var
        [InDataSet]
        DescriptionIndent: Integer;
        [InDataSet]
        StyleIsStrong: Boolean;
}
