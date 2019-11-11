pageextension 37072404 PageExtansion42 extends "Sales Order"
{
    actions
    {
        addafter("&Order Confirmation")
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
                        AJShipLine: Record "AJ Shipping Line";
                        AJShipHeader: Record "AJ Shipping Header";
                        AJShipHeaderArch: Record "AJ Shipping Header Arch.";
                        AJShipLineArch: Record "AJ Shipping Line Arch.";
                        AJShippingProcess: Codeunit "AJ Shipping Process";
                    begin
                        AJShipLineArch.Reset();
                        AJShipLineArch.SetRange("Source Table", AJShipLineArch."Source Table"::"36");
                        AJShipLineArch.SetRange("Source ID", "No.");
                        if AJShipLineArch.FindFirst() then begin
                            AJShipHeaderArch.get(AJShipLineArch."Shipping No.");
                            if Confirm('AJ Shipping Header already exists for this order \\ would you like to open it?') then
                                Page.Run(0, AJShipHeaderArch);
                        end else begin
                            AJShipLine.Reset();
                            AJShipLine.SetRange("Source Table", AJShipLine."Source Table"::"36");
                            AJShipLine.SetRange("Source ID", "No.");
                            if AJShipLine.FindFirst() then begin
                                AJShipHeader.get(AJShipLine."Shipping No.");
                                if Confirm('AJ Shipping Header already exists for this order \\ would you like to open it?') then
                                    Page.Run(0, AJShipHeader);
                            end else
                                if Confirm('Create Shipping?', true) then begin
                                    AJShipLine."Source Table" := AJShipLine."Source Table"::"36";
                                    AJShipLine."Source Document Type" := AJShipLine."Source Document Type"::Order;
                                    AJShippingProcess.CreateShipping(AJShipLine, RecordId());

                                    AJShipLine.Reset();
                                    AJShipLine.SetRange("Source Table", AJShipLine."Source Table"::"36");
                                    AJShipLine.SetRange("Source ID", "No.");
                                    if AJShipLine.FindFirst() then begin
                                        AJShipHeader.Get(AJShipLine."Shipping No.");
                                        Page.Run(0, AJShipHeader);
                                    end;
                                end else
                                    Message('Action was canceled');
                        end;
                    end;
                }
            }
        }
    }
}