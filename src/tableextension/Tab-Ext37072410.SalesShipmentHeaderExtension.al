tableextension 37072410 "SalesShipmentHeaderExtension" extends "Sales Shipment Header"
{
    fields
    {
        field(37072400; "AJ Shipping Status"; Option)
        {
            OptionMembers = "",Archived;
            OptionCaption = ' ,Archived';
        }
        field(37072401; "AJ Shipping No."; Code[20])
        {
            TableRelation = "AJ Shipping Log";
        }
        field(37072402; "AJ Shipping No. Arch."; Code[20])
        {
            TableRelation = "AJ Shipping Log Arch.";
        }
    }
}
