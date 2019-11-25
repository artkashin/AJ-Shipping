page 37072403 "AJ Shipping Log Subform"
{
    DeleteAllowed = true;
    PageType = ListPart;
    SourceTable = "AJ Shipping Log Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Source Type"; "Source Type")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                }
                field("Source Document Type"; "Source Document Type")
                {
                    ApplicationArea = All;
                    Editable = "Source Type" = "Source Type"::"BC Document";
                    ShowMandatory = true;
                }
                field("Source Table"; "Source Table")
                {
                    ApplicationArea = All;
                    Editable = "Source Type" = "Source Type"::"BC Document";
                    ShowMandatory = true;
                }
                field("Source ID"; "Source ID")
                {
                    ApplicationArea = All;
                    Editable = "Source Type" <> "Source Type"::Other;
                    ShowMandatory = true;
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

    actions
    {
        area(processing)
        {
            action("Populate Header from Line")
            {
                ApplicationArea = All;
                Promoted = false;
                Caption = 'Populate Header from Line';
                trigger OnAction()
                var
                    AJFillShippingLine: Codeunit "AJ Fill Shipping Process";
                begin
                    if "Source Table" <> 0 then
                        AJFillShippingLine.PopulateShippingHeaderFromLine(Rec, false)
                    else
                        Error('This is empty line');
                end;
            }
        }
    }
}
