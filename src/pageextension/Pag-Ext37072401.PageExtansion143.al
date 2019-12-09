pageextension 37072401 "PageExtansion143" extends "Posted Sales Invoices"
{
    var
        AJShippingLine: Record "AJE Shipping Log Line";
        LookupforAJShipping: Boolean;

    procedure SetLookupForAJShipping(AJShippingLine2: Record "AJE Shipping Log Line")
    begin
        LookupforAJShipping := true;
        AJShippingLine := AJShippingLine2;
    end;

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    var
        FromSalesInvHeader: Record "Sales Invoice Header";
        AJShippingHeader: Record "AJE Shipping Log";
        AJFillShippingLine: Codeunit "AJ Fill Shipping Process";
    begin
        if LookupforAJShipping and (CloseAction = Action::LookupOK) then begin
            AJShippingHeader.Get(AJShippingLine."Shipping No.");
            FromSalesInvHeader.Copy(Rec);
            CurrPage.SetSelectionFilter(FromSalesInvHeader);
            if FromSalesInvHeader.FindSet() then
                repeat
                    Clear(AJFillShippingLine);
                    AJFillShippingLine.CreateLineFromSalesInvHeader(FromSalesInvHeader.RecordId(), AJShippingHeader, AJShippingLine);
                until FromSalesInvHeader.Next() = 0;
        end;
    end;
}