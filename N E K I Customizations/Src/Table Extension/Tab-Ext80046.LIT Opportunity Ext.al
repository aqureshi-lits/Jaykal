tableextension 80046 "LIT Opportunity Ext" extends Opportunity
{
    trigger OnAfterInsert()
    var
        MarketingSetup: Record "Marketing Setup";
        DimensionValue: Record "Dimension Value";
    begin
    end;

    trigger OnAfterModify()
    var
        DimensionValue: Record "Dimension Value";
        MarketingSetup: Record "Marketing Setup";
    begin

    end;


}
