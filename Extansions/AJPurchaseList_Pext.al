pageextension 37072400 PageExtansion54 extends "Purchase List"
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
        FromPurchaseHeader: Record "Purchase Header";
        AJShippingHeader: Record "AJ Shipping Header";
        AJFillShippingLine: Codeunit "AJ Fill Shipping Process";
        AJShippingCheck: Codeunit "AJ Shipping Check";
        HaveBadDocuments: Boolean;
    begin
        if LookupforAJShipping and (CloseAction = Action::LookupOK) then begin
            AJShippingHeader.Get(AJShippingLine."Shipping No.");
            FromPurchaseHeader.Copy(Rec);
            CurrPage.SetSelectionFilter(FromPurchaseHeader);
            if FromPurchaseHeader.FindSet() then begin
                if (FromPurchaseHeader."Document Type" <> FromPurchaseHeader."Document Type"::"Return Order") and
                (not AJShippingCheck.AllowPurchaseShipping()) then
                    HaveBadDocuments := true
                else
                    repeat
                        Clear(AJFillShippingLine);
                        AJFillShippingLine.CreateLineFromPurchaseHeader(FromPurchaseHeader.RecordId(), AJShippingHeader, AJShippingLine);
                    until FromPurchaseHeader.Next() = 0;
                if HaveBadDocuments then
                    Message('Lines with a document type other than the "Order" were not inserted, because the corresponding setting is not enabled in AJ Shipping Setup');
            end;
            Message('Done');
        end;
    end;
}