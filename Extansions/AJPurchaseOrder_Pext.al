pageextension 37072406 PageExtansion50 extends "Purchase Order"
{
    actions
    {
        addafter(Warehouse)
        {
            group("AJ Shipping")
            {
                action("Create Shipping")
                {
                    Caption = 'Create Shipping';
                    Image = Shipment;
                    Promoted = true;
                    PromotedCategory = Process;
                    ApplicationArea = all;
                    trigger OnAction()
                    var
                        AJShippingLine: Record "AJ Shipping Line";
                        AJShippingHeader: Record "AJ Shipping Header";
                        AJShippingProcess: Codeunit "AJ Shipping Process";
                        AJShippingCheck: Codeunit "AJ Shipping Check";
                    begin
                        if not AJShippingCheck.AllowPurchaseShipping() then
                            Error('You cannot create Shipping, because the corresponding setting is not enabled in AJ Shipping Setup');

                        AJShippingLine.Reset();
                        AJShippingLine.SetRange("Source Table", AJShippingLine."Source Table"::"38");
                        AJShippingLine.SetRange("Source ID", "No.");
                        if AJShippingLine.FindFirst() then begin
                            AJShippingHeader.get(AJShippingLine."Shipping No.");
                            if Confirm('AJ Shipping Header already exists for this order \\ would you like to open it?') then
                                Page.Run(0, AJShippingHeader);
                        end
                        else
                            if Confirm('Create Shipping?', true) then begin
                                AJShippingLine."Source Table" := AJShippingLine."Source Table"::"38";
                                AJShippingLine."Source Document Type" := AJShippingLine."Source Document Type"::"Order";

                                AJShippingProcess.CreateShipping(AJShippingLine, RecordId())
                            end else
                                Message('Action was canceled');
                    end;
                }
            }
        }
    }
}