page 80007 "LIT Customer Group"
{
    ApplicationArea = All;
    Caption = 'Customer Group';
    PageType = List;
    SourceTable = "LIT Customer Group";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Code"; Rec."Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
            }
        }

    }
    actions
    {
        area(Processing)
        {
            action(Dimensions)
            {
                ApplicationArea = All;
                Caption = 'Dimensions';
                Image = Dimensions;
                RunObject = Page "Default Dimensions";
                RunPageLink = "Table ID" = CONST(80004),
                                  "No." = FIELD("Code"), "Dimension Code" = const('CUSTOMERGROUP');
                ShortCutKey = 'Alt+D';
                ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.';
                trigger onaction()
                var
                    myInt: Integer;
                begin

                end;
            }
        }
    }
    var
        v: Page "Customer Card";
}
