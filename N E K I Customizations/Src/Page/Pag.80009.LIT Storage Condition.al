page 80009 "LIT Storage Condition"
{
    ApplicationArea = All;
    Caption = 'Storage Condition';
    PageType = List;
    SourceTable = "LIT Storage Condition";
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
                field(Temperature; Rec."Temperature (C)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Temperature (C) field.';
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
                RunPageLink = "Table ID" = CONST(80006),
                                  "No." = FIELD("Code"), "Dimension Code" = const('STORAGECONDITION');
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
