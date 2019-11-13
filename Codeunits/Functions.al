codeunit 37072404 "AJ Shipping Functions"
{
    procedure GetHarmCommodityCode(ItemNo: Code[20]) HarmCommodityCode: code[20]
    var
        Item: Record Item;
    begin
        Item.Get(ItemNo);
        Item.TestField("Harmonized Commodity Code");
        HarmCommodityCode := Item."Harmonized Commodity Code";

        OnAfterGetHarmCommodityCodeFunction(Item, HarmCommodityCode);
        exit;
    end;

    procedure GetItemOriginOfCountry(ItemNo: Code[20]) CountryOfOriginCode: Code[10];
    var
        Item: Record Item;
    begin
        Item.Get(ItemNo);
        Item.TestField("Country Of Origin");
        CountryOfOriginCode := Item."Country Of Origin";

        OnAfterGetItemOriginOfCountryFunction(Item, CountryOfOriginCode);
        exit;
    end;

    [IntegrationEvent(true, false)]
    local procedure OnAfterGetHarmCommodityCodeFunction(var Item: Record Item; var HarmCommodityCode: Code[20])
    begin
    end;

    [IntegrationEvent(true, false)]
    local procedure OnAfterGetItemOriginOfCountryFunction(var Item: Record Item; var CountryOfOriginCode: Code[10])
    begin
    end;
}