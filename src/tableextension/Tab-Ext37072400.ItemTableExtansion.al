tableextension 37072400 "ItemTableExtansion" extends "Item"
{
    fields
    {
        field(37072400; "Country Of Origin"; Code[10])
        {
            TableRelation = "Country/Region";
        }
        field(37072405; "Harmonized Commodity Code"; Code[20])
        {
        }
    }
}