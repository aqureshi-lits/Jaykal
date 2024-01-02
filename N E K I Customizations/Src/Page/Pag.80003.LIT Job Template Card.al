page 80003 "LIT Job Template Card"
{
    Caption = 'Job Template Card';
    PageType = Document;
    SourceTable = "LIT Job Template";
    RefreshOnActivate = true;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                    ApplicationArea = All;
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.';
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.';
                    ApplicationArea = All;
                }
            }
            part(JobTaskTemplateLines; "LIT Job Task Temp. Line Subfrm")
            {
                ApplicationArea = Jobs;
                Caption = 'Tasks';
                SubPageLink = "Template No." = FIELD("No.");
                SubPageView = SORTING("Job Task Template No.")
                              ORDER(Ascending);
                UpdatePropagation = Both;
            }
        }
    }
}
