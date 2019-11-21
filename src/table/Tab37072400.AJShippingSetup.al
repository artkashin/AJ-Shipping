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
        field(3; "Arch. Shipping No. Series"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(5; "Domestic Country Code"; Code[10])
        {
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
        field(30; "Move to Arch. After Print"; Boolean)
        {
        }
        field(35; "Change Ship Date in Order"; Boolean)
        {
        }
        field(40; "Weight Option"; Option)
        {
            OptionCaption = 'Default,Scalemanagement,Calculated';
            OptionMembers = Default,Scalemanagement,Calculated;
        }
        field(45; "Post Order with Archive"; Boolean)
        {
        }
        field(50; "Download Label After Recieved"; Boolean)
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

