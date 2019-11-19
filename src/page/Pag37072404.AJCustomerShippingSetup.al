page 37072404 "AJ Customer Shipping Setup"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "AJ Customer Shipping Setup";
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