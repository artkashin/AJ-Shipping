pageextension 37072412 "PageExtansion5743" extends "Posted Transfer Shipment"
{
    actions
    {
        addafter("&Shipment")
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
                        AJShippingLine: Record "AJE Shipping Log Line";
                        AJShippingHeader: Record "AJE Shipping Log";
                        AJShippingHeaderArch: Record "AJE Shipping Log Arch.";
                        AJShipLineArch: Record "AJ Shipping Log Line Arch.";
                        AJShippingProcess: Codeunit "AJ Shipping Process";
                    begin
                        AJShipLineArch.Reset();
                        AJShipLineArch.SetRange("Source Table", AJShipLineArch."Source Table"::"5740");
                        AJShipLineArch.SetRange("Source ID", "No.");
                        if AJShipLineArch.FindFirst() then begin
                            AJShippingHeaderArch.get(AJShipLineArch."Shipping No.");
                            if Confirm('AJ Shipping Log already exists for this order \\ would you like to open it?') then
                                Page.Run(0, AJShippingHeaderArch);
                        end else begin
                            AJShippingLine.Reset();
                            AJShippingLine.SetRange("Source Table", AJShippingLine."Source Table"::"5740");
                            AJShippingLine.SetRange("Source ID", "No.");
                            if AJShippingLine.FindFirst() then begin
                                AJShippingHeader.get(AJShippingLine."Shipping No.");
                                if Confirm('AJ Shipping Log already exists for this order \\ would you like to open it?') then
                                    Page.Run(0, AJShippingHeader);
                            end
                            else
                                if Confirm('Create Shipping?', true) then begin
                                    AJShippingLine."Source Table" := AJShippingLine."Source Table"::"5740";
                                    AJShippingLine."Source Document Type" := AJShippingLine."Source Document Type"::Order;

                                    AJShippingProcess.CreateShipping(AJShippingLine, RecordId())
                                end else
                                    Message('Action was canceled');
                        end;
                    end;
                }
            }
        }
    }
}