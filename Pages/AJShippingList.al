page 37072401 "AJ Shipping List"
{
    CardPageID = "AJ Shipping Card";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = "AJ Shipping Header";
    SourceTableView = ORDER(Descending)
                      WHERE("Document Type" = CONST(Order));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Total Quantity"; "Total Quantity")
                {
                    ApplicationArea = All;
                }
                field("No."; "No.")
                {
                    ApplicationArea = All;
                }
                field("Ship Date"; "Ship Date")
                {
                    ApplicationArea = All;
                }
                field("Created DateTime"; "Created DateTime")
                {
                    ApplicationArea = All;
                }
                field("Ship-To Address Verified"; "Ship-To Address Verified")
                {
                    ApplicationArea = All;
                }
                field("Ship-To Customer Name"; "Ship-To Customer Name")
                {
                    ApplicationArea = All;
                }
                field("Ship-To Company"; "Ship-To Company")
                {
                    ApplicationArea = All;
                }
                field("Ship-To Customer Zip"; "Ship-To Customer Zip")
                {
                    ApplicationArea = All;
                }
                field("Ship-To Customer Country"; "Ship-To Customer Country")
                {
                    ApplicationArea = All;
                }
                field("Ship-To Customer State"; "Ship-To Customer State")
                {
                    ApplicationArea = All;
                }
                field("Ship-To Customer City"; "Ship-To Customer City")
                {
                    ApplicationArea = All;
                }
                field("Ship-To Customer Address 1"; "Ship-To Customer Address 1")
                {
                    ApplicationArea = All;
                }
                field("Ship-To Customer Address 2"; "Ship-To Customer Address 2")
                {
                    ApplicationArea = All;
                }
                field("Ship-To Customer Phone"; "Ship-To Customer Phone")
                {
                    ApplicationArea = All;
                }
            }
            group("Weight characteristics")
            {
                Visible = false;
                field(AJWOH_PrdWgt; "Product Weight")
                {
                    ApplicationArea = All;
                    Caption = 'Product Weight';
                }
                field(AJWOH_PrdW; "Product Width")
                {
                    ApplicationArea = All;
                    Caption = 'Product Width';
                }
                field(AJWOH_PrdL; "Product Length")
                {
                    ApplicationArea = All;
                    Caption = 'Product Lenght';
                }
                field(AJWOH_PrdH; "Product Height")
                {
                    ApplicationArea = All;
                    Caption = 'Product Height';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("Web Services")
            {
                Caption = 'Web Services';
            }
        }
    }

}

