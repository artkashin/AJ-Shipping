codeunit 37072400 "AJ Shipping InstallCodeunit"
{ // TODO Change IT
    Subtype = Install;

    var

    trigger OnInstallAppPerCompany();
    var
        myAppInfo: ModuleInfo;
    begin
        NavApp.GetCurrentModuleInfo(myAppInfo); // Get info about the currently executing module

        if myAppInfo.DataVersion() = Version.Create(0, 0, 0, 0) then // A 'DataVersion' of 0.0.0.0 indicates a 'fresh/new' install
            HandleFreshInstall()
        else
            HandleReinstall(); // If not a fresh install, then we are Re-installing the same version of the extension
    end;

    local procedure HandleFreshInstall();
    var
        NoSeries: Record "No. Series";
        NoSeriesLine: Record "No. Series Line";
        AjShippingSetup: Record "AJE Shipping Log Setup";
    begin
        NoSeries.Init();
        NoSeries.Code := 'AJ-SHIP';
        NoSeries.Description := 'AJ shippings';
        NoSeries."Default Nos." := true;
        if NoSeries.Insert() then;

        NoSeriesLine.Init();
        NoSeriesLine."Series Code" := 'AJ-SHIP';
        NoSeriesLine."Line No." := 10000;
        NoSeriesLine."Starting No." := 'SP-0000001';
        NoSeriesLine."Ending No." := 'SP-9999999';
        if NoSeriesLine.Insert() then;


        NoSeries.Init();
        NoSeries.Code := 'AJ-ARCH';
        NoSeries.Description := 'AJ archive shippings';
        NoSeries."Default Nos." := true;
        if NoSeries.Insert() then;

        NoSeriesLine.Init();
        NoSeriesLine."Series Code" := 'AJ-ARCH';
        NoSeriesLine."Line No." := 10000;
        NoSeriesLine."Starting No." := 'SA-0000001';
        NoSeriesLine."Ending No." := 'SA-9999999';
        if NoSeriesLine.Insert() then;


        AjShippingSetup.Init();
        AjShippingSetup."B2C Shipping" := true;
        AjShippingSetup."Shipping Log No. Series" := 'AJ-SHIP';
        AjShippingSetup."Arch. Shipping Log No. Series" := 'AJ-ARCH';
        AjShippingSetup."Weight Option" := AjShippingSetup."Weight Option"::Default;
        AjShippingSetup."Domestic Country Code" := 'US';
        AjShippingSetup."Post Order with Archive" := true;
        AjShippingSetup."Download Label After Recieved" := true;
        if AjShippingSetup.Insert() then;

        InitNoSeries();
    end;

    local procedure HandleReinstall();
    begin
        // Do work needed when reinstalling the same version of this extension back on this tenant.
        // Some possible usages:
        // - Service callback/telemetry indicating that extension was reinstalled
        // - Data 'patchup' work, for example, detecting if new 'base' records have been changed while you have been working 'offline'.
        // - Setup 'welcome back' messaging for next user access.
    end;

    procedure InitNoSeries()
    begin
        CreateNoSeries('AJW-ORD', 'AJ Web orders', true);
        CreateNoSeriesLines('AJW-ORD', 'WEB-0000001', 'WEB-9999999');

        CreateNoSeries('AJ-WAR', 'AJ Web service warehouses', true);
        CreateNoSeriesLines('AJ-WAR', 'WAR-0001', 'WAR-9999');
    end;


    procedure CreateNoSeries(SeriesCode: Code[20]; Description: Text[100]; IsDefault: Boolean)
    var
        NoSeries: Record "No. Series";
    begin
        NoSeries.Init();
        NoSeries.Code := SeriesCode;
        NoSeries.Description := Description;
        NoSeries."Default Nos." := IsDefault;
        if NoSeries.Insert() then;
    end;

    procedure CreateNoSeriesLines(SeriesCode: Code[20]; StartingNo: Code[20]; EndingNo: Code[20])
    var
        NoSeriesLine: Record "No. Series Line";
    begin
        NoSeriesLine.Init();
        NoSeriesLine."Series Code" := SeriesCode;
        NoSeriesLine."Line No." := 10000;
        NoSeriesLine."Starting No." := StartingNo;
        NoSeriesLine."Ending No." := EndingNo;
        if NoSeriesLine.Insert() then;
    end;

    procedure CreateAJESetup()
    var
        AjWebSetup: Record "AJE Shipping Setup";
    begin
        AjWebSetup.Init();
        AjWebSetup."Web Shipping No. Series" := 'AJW-ORD';
        AjWebSetup."Web Warehouse No. Series" := 'AJ-WAR';
        AjWebSetup."Warehouse Ret. Address Matches" := true;
        if AjWebSetup.Insert() then;
    end;
}