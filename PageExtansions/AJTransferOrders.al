pageextension 37072410 PageExtansion5742 extends "Transfer Orders"
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
        FromTransferHeader: Record "Transfer Header";
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
                    AJFillShippingLine.CreateLineFromTransferHeader(FromTransferHeader.RecordId(), AJShippingHeader, AJShippingLine);
                until FromTransferHeader.Next() = 0;
        end;
    end;
}