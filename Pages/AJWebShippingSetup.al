page 37072400 "AJ Shipping Setup"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "AJ Shipping Setup";
    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Shipping No. Series"; "Shipping No. Series")
                {
                    ApplicationArea = All;

                }
                field("B2C Shipping"; "B2C Shipping")
                {
                    ApplicationArea = All;
                }
                field("Allow Crt. Not Purchase Return"; "Allow Crt. Not Purchase Return")
                {
                    ApplicationArea = All;
                }
                field("Allow Crt. Return Sales Orders"; "Allow Crt. Return Sales Orders")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
        }
    }
}