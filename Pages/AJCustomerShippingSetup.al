page 37072405 "AJ Customer Shipping Setup"
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
                field("Shipping No. Series"; Type)
                {
                    ApplicationArea = All;
                }
                field("B2C Shipping"; "Customer No.")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}