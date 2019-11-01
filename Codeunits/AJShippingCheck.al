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

    var
        AJSHippingSetup: Record "AJ Shipping Setup";
}