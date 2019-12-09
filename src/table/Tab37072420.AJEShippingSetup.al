table 37072420 "AJE Shipping Setup"
{
    fields
    {
        field(1; ID; Code[10])
        {
            DataClassification = CustomerContent;
        }
        field(3; "Web Shipping No. Series"; Code[20])
        {
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(5; "Web Warehouse No. Series"; Code[20])
        {
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(70; "Warehouse Ret. Address Matches"; Boolean)
        {
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(Key1; ID)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

