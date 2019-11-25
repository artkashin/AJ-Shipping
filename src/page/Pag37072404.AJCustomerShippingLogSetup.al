page 37072404 "AJ Customer Shipping Log Setup"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "AJ Customer Shipping Log Setup";
    layout
    {
        area(Content)
        {
            repeater(group)
            {
                field(Type; Type)
                {
                    ApplicationArea = All;
                }
                field("Customer No."; "Customer No.")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}