pageextension 37072404 PageExtansion42 extends "Sales Order"
{
    actions
    {
        addlast("&Order Confirmation")
        {
            group("AJ Shipping")
            {

                action("Create AJ Shipping")
                {
                    Caption = 'Create AJ Shipping';
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
                        AJShippingLine.SetRange("Source Table", AJShippingLine."Source Table"::"36");
                        AJShippingLine.SetRange("Source ID", "No.");
                        if AJShippingLine.FindFirst() then begin
                            AJShippingHeader.get(AJShippingLine."Shipping No.");
                            if Confirm('AJ Shipping Header already exists for this order \\ would you like to open it?') then
                                Page.Run(0, AJShippingHeader);
                        end
                        else
                            if Confirm('Create Aj Shipping?', true) then
                                AJShippingProcess.CreateShipping(Rec)
                            else
                                Message('Action was canceled');

                    end;
                }
            }
        }
    }
}