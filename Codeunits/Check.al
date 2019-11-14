codeunit 37072403 "AJ Shipping Check"
{
    procedure AllowSalesReturnShipping() Allow: Boolean
    var
    begin
        AJSHippingSetup.Get();
        Allow := AJSHippingSetup."Allow Crt. Return Sales Orders";
    end;

    procedure AllowPurchaseShipping() Allow: Boolean
    var
    begin
        AJSHippingSetup.Get();
        Allow := AJSHippingSetup."Allow Crt. Not Purchase Return";
    end;

    procedure PossibleGetLines(AJShippingHeader: Record "AJ Shipping Header")
    var
    begin
        if not AJShippingHeader."B2C Shipping" then
            Error('You cannot add lines to this shipment, because this document is created within the B2C');
    end;

    procedure CheckMultiLocationsForPurchase(PurchaseHeader: Record "Purchase Header")
    var
        PurchaseLine: Record "Purchase Line";
        LineLocation: Code[10];
    begin
        PurchaseHeader.TestField("Location Code");
        PurchaseLine.Reset();
        PurchaseLine.SetRange("Document Type", PurchaseHeader."Document Type");
        PurchaseLine.SetRange("Document No.", PurchaseHeader."No.");
        if PurchaseLine.FindSet() then begin
            LineLocation := PurchaseLine."Location Code";
            repeat
                if (PurchaseLine."Location Code" <> LineLocation)
                or (PurchaseLine."Location Code" <> PurchaseHeader."Location Code") then
                    Error('Shipment cannot be created, select 1 дщсфешщт сщву for header and all lines');
            until PurchaseLine.Next() = 0;
        end;
    end;

    procedure ReadyForArchive(AJShipHeader: Record "AJ Shipping Header")
    var
    begin
        //AJShipHeader.TestField("");
        AJSHippingSetup.Get();
    end;

    procedure AddLineInShippingAllowed(AJShipLine: Record "AJ Shipping Line")
    var
        AJShipHeader: Record "AJ Shipping Header";
    begin
        AJSHippingSetup.Get();
        AJShipHeader.Get(AJShipLine."Shipping No.");
        if AJShipHeader."B2C Shipping" and not (AJSHippingSetup."Allow Add Lines With B2C") then
            Error('You cannot add lines to this document, because the setting "Allow Add Lines With B2C" in AJ Shipping Setup is not enabled');
    end;

    procedure CheckMultiLocationsForSales(SalesHeader: Record "Sales Header")
    var
        SalesLine: Record "Sales Line";
        LineLocation: Code[10];
    begin
        SalesHeader.TestField("Location Code");

        SalesLine.Reset();
        SalesLine.SetRange("Document Type", SalesHeader."Document Type");
        SalesLine.SetRange("Document No.", SalesHeader."No.");
        if SalesLine.FindSet() then begin
            LineLocation := SalesLine."Location Code";
            repeat
                if (SalesLine."Location Code" <> LineLocation)
                or (SalesLine."Location Code" <> SalesHeader."Location Code") then
                    Error('Shipment cannot be created, select 1 Loaction code for header and all lines');
            until SalesLine.Next() = 0;
        end;
    end;

    procedure CheckTransferBeforaCreateShipping(TransferHeader: Record "Transfer Header")
    var
        TransferLine: Record "Transfer Line";
    begin
        TransferHeader.TestField("Transfer-from Code");
        //TransferLine.Reset();
        //TransferLine.SetRange("Document No.", TransferHeader."No.");
        //if TransferLine.IsEmpty() then
        //Error('Creating a Shipping is forbidden, you have no Lines');
    end;

    procedure CheckMultiLocationsForSalesShipment(SalesShpHeader: Record "Sales Shipment Header")
    var
        SalesShpLine: Record "Sales Shipment Line";
        LineLocation: Code[10];
    begin
        SalesShpLine.Reset();
        SalesShpLine.SetRange("Document No.", SalesShpHeader."No.");
        if SalesShpLine.FindSet() then begin
            LineLocation := SalesShpLine."Location Code";
            repeat
                if (SalesShpLine."Location Code" <> LineLocation)
                or (SalesShpLine."Location Code" <> SalesShpHeader."Location Code") then
                    Error('Shipment cannot be created, select 1 Loaction code for header and all lines');
            until SalesShpLine.Next() = 0;
        end;
    end;

    var
        AJSHippingSetup: Record "AJ Shipping Setup";
}