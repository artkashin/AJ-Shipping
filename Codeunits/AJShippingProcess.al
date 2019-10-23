codeunit 37072400 "AJ Shipping Process"
{
    procedure MoveToArchive(AJShipHeader: Record "AJ Shipping Header")
    var
        AJShipLine: Record "AJ Shipping Line";
        AJShipHeaderArch: Record "AJ Shipping Header Arch.";
        AJShipLineArch: Record "AJ Shipping Line Arch.";
    begin
        AJShipHeaderArch.Init();
        AJShipHeaderArch.TransferFields(AJShipHeader);
        AJShipHeaderArch."Created DateTime" := CurrentDateTime();
        AJShipHeaderArch.Insert(true);

        AJShipLine.SetRange("Shipping No.", AJShipHeader."Shipping No.");
        if AJShipLine.FindSet() then
            repeat
                AJShipLineArch.Init();
                AJShipLineArch.TransferFields(AJShipLine);
                AJShipLineArch.Insert();
            until AJShipLine.Next() = 0;

        AJShipHeader.Delete(true);
    end;

    procedure CreateShipping(SalesHeader: Record "Sales Header")
    begin
        AJShipSetup.Get();
        if AJShipSetup."B2C Shipping" then
            CreateBCShipping(SalesHeader);
    end;

    local procedure CreateBCShipping(SalesHeader: Record "Sales Header")
    var
        AJShipHeader: Record "AJ Shipping Header";
        AJShipLine: Record "AJ Shipping Line";
        AJFilShippingProcess: Codeunit "AJ Fill Shipping Process";
    begin

        AJShipHeader.Init();
        AJShipHeader."Ship Date" := Today();
        AJShipHeader."Created DateTime" := CurrentDateTime();
        AJShipHeader.Insert(true);

        // Add shipping line
        AJFilShippingProcess.CreateLineFromSalesHeader(SalesHeader, AJShipHeader, AJShipLine);

        // Populate hedaer fields from line
        AJFilShippingProcess.PopulateShippingHeaderFromLine(AJShipLine);

        if Confirm('Shipping is created \\Do you want to open Shipping document?', true) then
            Page.Run(0, AJShipHeader);
    end;

    var
        AJShipSetup: Record "AJ Shipping Setup";
}