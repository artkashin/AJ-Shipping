/*codeunit 37072404 "AJ Shipping Event Subscriber"
{
    EventSubscriberInstance = StaticAutomatic;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnBeforePostSalesDoc', '', true, true)]
    procedure FindShipment(VAR SalesHeader: Record "Sales Header")
    var
        AJShipmentLine: Record "AJ Shipping Log Line";
    begin
        AJShipmentLine.Reset();
        AJShipmentLine.SetRange("Source ID", SalesHeader."No.");
        if AJShipmentLine.FindFirst() then
            Error('You have non archived Shipment');
        

    end;
}
*/