page 80002 "LIT Job Template List"
{
    AdditionalSearchTerms = 'project templates';
    ApplicationArea = Jobs;
    Caption = 'Job Templates';
    CardPageID = "LIT Job Template Card";
    Editable = false;
    PageType = List;
    PromotedActionCategories = 'New,Process,Report,Navigate,Job,Prices & Discounts';
    SourceTable = "LIT Job Template";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
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
        }
    }
}
