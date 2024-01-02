pageextension 80081 "LIT Item Categories Ext." extends "Item Categories"
{
    layout { }
    actions
    {
        addlast(Navigation)
        {
            action("Dimensions")
            {
                ApplicationArea = All;
                Caption = 'Dimensions';
                Image = Dimensions;
                RunObject = Page "Default Dimensions";
                RunPageLink = "Table ID" = CONST(5722),
                                  "No." = FIELD("Code"), "Dimension Code" = const('ItemCategory');
                ShortCutKey = 'Alt+D';
                ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.';
                trigger onaction()
                var
                    myInt: Integer;
                begin

                end;
            }
        }
        addafter(Category_Category4)
        {
            group(CategoryCategory4)
            {
                Caption = 'Navigate', Comment = 'Generated from the PromotedActionCategories property index 3.';
                actionref(Dimensions_Promoted; Dimensions)
                {
                }
            }

        }
    }
}
