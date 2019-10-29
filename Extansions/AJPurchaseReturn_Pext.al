pageextension 37072405 PageExtansion6640 extends "Purchase Return Order"
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
                    begin
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
                                AJShippingLine."Source Document Type" := AJShippingLine."Source Document Type"::"Return Order";

                                AJShippingProcess.CreateShipping(AJShippingLine, RecordId())
                            end else
                                Message('Action was canceled');

                    end;
                }
            }
        }
    }
}