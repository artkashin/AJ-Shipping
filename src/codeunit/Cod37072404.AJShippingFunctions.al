codeunit 37072404 "AJ Shipping Functions"
{
    procedure GetLocations(AJWebService: Record "AJE Web Service")
    var
        Location: Record Location;
        AJWebWarehouses: Record "AJE WS Warehouse";
    begin
        Location.Reset();
        if Location.FindSet() then
            repeat
                AJWebWarehouses.Reset();
                AJWebWarehouses.SetRange("Web Service Code", AJWebService.Code);
                AJWebWarehouses.SetRange("Location Code", Location.Code);
                if AJWebWarehouses.IsEmpty() then
                    CreateWarehouseFromLocation(AJWebService.Code, Location);
            until Location.Next() = 0;
    end;

    local procedure CreateWarehouseFromLocation(WebServiceCode: Code[10]; Location: Record Location)
    var
        AJWebWarehouses: Record "AJE WS Warehouse";
        CompanyInfo: Record "Company Information";
    begin
        CompanyInfo.Get();
        with AJWebWarehouses do begin
            Init();
            "Web Service Code" := WebServiceCode;
            Validate("Location Code", Location.Code);
            Insert(true);
        end;
    end;

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