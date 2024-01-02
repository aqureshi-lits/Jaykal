codeunit 80001 "LIT Dimensions Management"
{

    EventSubscriberInstance = StaticAutomatic;

    trigger OnRun()
    var
    // Edi: record "Default dimension"
    begin

    end;

    // [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterInitDefaultDimensionSources', '', false, false)]
    // local procedure OnAfterInitDefaultDimensionSources(var SalesLine: Record "Sales Line"; var DefaultDimSource: List of [Dictionary of [Integer, Code[20]]]; FieldNo: Integer)
    // var
    //     DimMgt: Codeunit DimensionManagement;
    // begin
    //     DimMgt.AddDimSource(DefaultDimSource, Database::Item, SalesLine."No.", FieldNo = SalesLine.Fieldno("No."));
    // end;

    //Adding Shortcut Dimensions from GL Setup
    // [EventSubscriber(ObjectType::Table, Database::"Default Dimension", 'OnBeforeOnModify', '', false, false)]
    // procedure OnBeforeOnModify(var DefaultDimension: Record "Default Dimension"; var DimensionManagement: Codeunit DimensionManagement; var IsHandled: Boolean)
    // var
    //     GLSetup: Record "General Ledger Setup";
    // begin
    //     GLSetup.Get();
    //     if DefaultDimension."Dimension Code" = GLSetup."Shortcut Dimension 3 Code" then
    //         DefaultDimension.UpdateGlobalDimCode(3, 27, DefaultDimension."No.", DefaultDimension."Dimension Value Code");
    // end;

    // [EventSubscriber(ObjectType::Table, Database::"Default Dimension", 'OnUpdateItemGlobalDimCodeOnBeforeItemModify', '', false, false)]
    // local procedure OnUpdateItemGlobalDimCodeOnBeforeItemModify(var Item: Record Item; NewDimValue: Code[20]; GlobalDimCodeNo: Integer)
    // begin
    //     case GlobalDimCodeNo of
    //         3:
    //             Item.ShortcutDim3Code := NewDimValue;
    //     end;

    // end;





}
