tableextension 37072404 "TransferHeaderTableExtension" extends "Transfer Header"
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
            TableRelation = "AJE Shipping Log";
        }
        field(37072402; "AJ Shipping No. Arch."; Code[20])
        {
            TableRelation = "AJE Shipping Log Arch.";
        }
    }
}
