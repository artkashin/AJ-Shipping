table 37072403 "AJE Customer Ship. Log Setup"
{

    fields
    {
        field(1; "Type"; Option)
        {
            OptionMembers = Customer,"All Customers";
            trigger OnValidate()
            begin
                if Type = Type::"All Customers" then
                    "Customer No." := '';
            end;
        }
        field(2; "Customer No."; Code[20])
        {
            TableRelation = Customer;
            trigger OnValidate()
            begin
                if "Customer No." <> '' then
                    TestField(Type, type::Customer);
            end;
        }
    }

    keys
    {
        key(Key1; Type, "Customer No.")
        {
            Clustered = true;
        }
    }
}