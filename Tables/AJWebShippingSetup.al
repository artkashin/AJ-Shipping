table 37072400 "AJ Shipping Setup"
{

    fields
    {
        field(1; ID; Code[10])
        {
        }
        field(2; "Shipping No. Series"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(10; "B2C Shipping"; Boolean)
        {
        }
        field(15; "Allow Crt. Return Sales Orders"; Boolean)
        {
        }
        field(20; "Allow Crt. Not Purchase Return"; Boolean)
        {
        }
        field(25; "Allow Add Lines With B2C"; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; ID)
        {
            Clustered = true;
        }
    }
}

