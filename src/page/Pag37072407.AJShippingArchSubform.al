page 37072407 "AJ Shipping Arch. Subform"
{
    DeleteAllowed = true;
    PageType = ListPart;
    SourceTable = "AJ Shipping Log Line Arch.";
    Editable = false;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Source Type"; "Source Type")
                {
                    ApplicationArea = All;
                }
                field("Source Document Type"; "Source Document Type")
                {
                    ApplicationArea = All;
                }
                field("Source Table"; "Source Table")
                {
                    ApplicationArea = All;
                }
                field("Source ID"; "Source ID")
                {
                    ApplicationArea = All;
                }
                field(Description; Description)
                {
                    ApplicationArea = All;
                }
                field(Quantity; Quantity)
                {
                    ApplicationArea = All;
                }
                field("Product Weight"; "Product Weight")
                {
                    ApplicationArea = All;
                }
                field("Product Width"; "Product Width")
                {
                    ApplicationArea = All;
                }
                field("Product Length"; "Product Length")
                {
                    ApplicationArea = All;
                }
                field("Product Height"; "Product Height")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
