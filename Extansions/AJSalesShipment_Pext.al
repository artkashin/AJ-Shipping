pageextension 37072407 PageExtansion132 extends "Posted Sales Shipment"
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
                        AJShippingLine: Record "AJ Shipping Line";
                        AJShippingHeader: Record "AJ Shipping Header";
                        AJShippingProcess: Codeunit "AJ Shipping Process";
                    begin
                        AJShippingLine.Reset();
                        AJShippingLine.SetRange("Source Table", AJShippingLine."Source Table"::"110");
                        AJShippingLine.SetRange("Source ID", "No.");
                        if AJShippingLine.FindFirst() then begin
                            AJShippingHeader.get(AJShippingLine."Shipping No.");
                            if Confirm('AJ Shipping Header already exists for this order \\ would you like to open it?') then
                                Page.Run(0, AJShippingHeader);
                        end
                        else
                            if Confirm('Create Shipping?', true) then begin
                                AJShippingLine."Source Table" := AJShippingLine."Source Table"::"110";
                                //AJShippingLine."Source Document Type" := AJShippingLine."Source Document Type"::;
                                AJShippingProcess.CreateShipping(AJShippingLine, RecordId())
                            end else
                                Message('Action was canceled');
                    end;
                }
            }
        }
    }
}