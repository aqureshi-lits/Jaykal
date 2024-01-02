page 80004 "LIT Job Task Temp. Line Subfrm"
{
    Caption = 'Job Task Template Line Subform';
    PageType = ListPart;
    SourceTable = "Job Task Template";
    DataCaptionFields = "Template No.";
    SaveValues = true;

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
                    ApplicationArea = Basic, Suite, Jobs;
                    Style = Strong;
                    StyleExpr = StyleIsStrong;
                    ToolTip = 'Specifies the number of the related job.';
                    Visible = false;
                }
                field("Job Task Template No."; Rec."Job Task Template No.")
                {
                    ApplicationArea = Basic, Suite, Jobs;
                    Style = Strong;
                    StyleExpr = StyleIsStrong;
                    ToolTip = 'Specifies the number of the related job task.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic, Suite, Jobs;
                    Style = Strong;
                    StyleExpr = StyleIsStrong;
                    ToolTip = 'Specifies a description of the job task. You can enter anything that is meaningful in describing the task. The description is copied and used in descriptions on the job planning line.';
                }
                field("Job Task Type"; Rec."Job Task Type")
                {
                    ApplicationArea = Basic, Suite, Jobs;
                    ToolTip = 'Specifies the purpose of the account. Newly created accounts are automatically assigned the Posting account type, but you can change this. Choose the field to select one of the following five options:';
                }
                field("Sales Line Type"; Rec."Sales Line Type")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the Sales Line Type corresponding to this Job Task Tamplate Line.';
                }
                field(Totaling; Rec.Totaling)
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies an interval or a list of job task numbers.';
                    Visible = false;
                }
                field("Job Posting Group"; Rec."Job Posting Group")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the job posting group of the task.';
                    Visible = false;
                }
                field("WIP-Total"; Rec."WIP-Total")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the job tasks you want to group together when calculating Work In Process (WIP) and Recognition.';
                    Visible = false;
                }
                field("WIP Method"; Rec."WIP Method")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the name of the Work in Process calculation method that is associated with a job. The value in this field comes from the WIP method specified on the job card.';
                    Visible = false;
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
