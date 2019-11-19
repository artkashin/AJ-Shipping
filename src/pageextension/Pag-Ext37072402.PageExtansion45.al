pageextension 37072402 "PageExtansion45" extends "Sales List"
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
        FromSalesHeader: Record "Sales Header";
        AJShippingHeader: Record "AJ Shipping Header";
        AJFillShippingLine: Codeunit "AJ Fill Shipping Process";
        AJShippingCheck: Codeunit "AJ Shipping Check";
        HaveBadDocuments: Boolean;
    begin
        if LookupforAJShipping and (CloseAction = Action::LookupOK) then begin
            AJShippingHeader.Get(AJShippingLine."Shipping No.");

            FromSalesHeader.Copy(Rec);
            CurrPage.SetSelectionFilter(FromSalesHeader);
            HaveBadDocuments := false;
            if FromSalesHeader.FindSet() then
                repeat
                    if (FromSalesHeader."Document Type" = FromSalesHeader."Document Type"::"Return Order") and
                    (not AJShippingCheck.AllowSalesReturnShipping()) then
                        HaveBadDocuments := true
                    else begin
                        Clear(AJFillShippingLine);
                        AJFillShippingLine.CreateLineFromSalesHeader(FromSalesHeader.RecordId(), AJShippingHeader, AJShippingLine);
                    end;
                until FromSalesHeader.Next() = 0;

            if HaveBadDocuments then
                Message('Lines with a document type "Return Order" were not inserted, because the corresponding setting is not enabled in AJ Shipping Setup')
        end;
    end;
}