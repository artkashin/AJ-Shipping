pageextension 37072411 "PageExtansion5752" extends "Posted Transfer Shipments"
{
    var
        AJShippingLine: Record "AJ Shipping Line";
        LookupforAJShipping: Boolean;

    procedure SetLookupForAJShipping(AJShippingLine2: Record "AJ Shipping Line")
    begin
        LookupforAJShipping := true;
        AJShippingLine := AJShippingLine2;
    end;

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    var
        FromTransferHeader: Record "Transfer Shipment Header";
        AJShippingHeader: Record "AJ Shipping Header";
        AJFillShippingLine: Codeunit "AJ Fill Shipping Process";
    begin
        if LookupforAJShipping and (CloseAction = Action::LookupOK) then begin
            AJShippingHeader.Get(AJShippingLine."Shipping No.");
            FromTransferHeader.Copy(Rec);
            CurrPage.SetSelectionFilter(FromTransferHeader);
            if FromTransferHeader.FindSet() then
                repeat
                    Clear(AJFillShippingLine);
                    AJFillShippingLine.CreateLineFromTransferShpHeader(FromTransferHeader.RecordId(), AJShippingHeader, AJShippingLine);
                until FromTransferHeader.Next() = 0;
        end;
    end;
}