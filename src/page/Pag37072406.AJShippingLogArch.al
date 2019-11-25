page 37072406 "AJ Shipping Log Arch."
{
    PageType = Document;
    PopulateAllFields = true;
    RefreshOnActivate = true;
    SourceTable = "AJ Shipping Log Arch.";
    Editable = false;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Shipping No."; "No.")
                {
                    ApplicationArea = All;
                }
                field("Ship Date"; "Ship Date")
                {
                    ApplicationArea = All;
                }
            }
            group("Ship-from")
            {
                field("Ship-from Location Code"; "Ship-from Location Code")
                {
                    ApplicationArea = All;
                    Importance = Additional;
                }
                field("Ship-from Name"; "Ship-from Name")
                {
                    ApplicationArea = All;
                }
                field("Ship-from Company"; "Ship-from Company")
                {
                    ApplicationArea = All;
                    Importance = Additional;
                }
                field("Ship-from Address 1"; "Ship-from Address 1")
                {
                    ApplicationArea = All;
                }
                field("Ship-from Address 2"; "Ship-from Address 2")
                {
                    ApplicationArea = All;
                    Importance = Additional;
                }
                field("Ship-from Address 3"; "Ship-from Address 3")
                {
                    ApplicationArea = All;
                    Importance = Additional;
                }
                field("Ship-from City"; "Ship-from City")
                {
                    ApplicationArea = All;
                    Importance = Additional;
                }
                field("Ship-from Zip"; "Ship-from Zip")
                {
                    ApplicationArea = All;
                    Importance = Additional;
                }
                field("Ship-from State"; "Ship-from State")
                {
                    ApplicationArea = All;
                    Importance = Additional;
                }
                field("Ship-from Country"; "Ship-from Country Code")
                {
                    ApplicationArea = All;
                    Importance = Additional;
                }
                field("Ship-from Phone"; "Ship-from Phone")
                {
                    ApplicationArea = All;
                    Importance = Additional;
                }
                field("Ship-from E-mail"; "Ship-from E-mail")
                {
                    ApplicationArea = All;
                    Importance = Additional;
                }
                field("Ship-from Verified"; "Ship-from Verified")
                {
                    ApplicationArea = All;
                    Importance = Additional;
                }
            }
            group("Ship-To")
            {
                field("Ship-To Customer Name"; "Ship-To Customer Name")
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        Modify();
                    end;
                }
                field("Ship-To Company"; "Ship-To Company")
                {
                    ApplicationArea = All;
                    Importance = Additional;
                    trigger OnValidate()
                    begin
                        Modify();
                    end;
                }
                field("Ship-To Customer Address 1"; "Ship-To Customer Address 1")
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        Modify();
                    end;
                }
                field("Ship-To Customer Address 2"; "Ship-To Customer Address 2")
                {
                    ApplicationArea = All;
                    Importance = Additional;
                    trigger OnValidate()
                    begin
                        Modify();
                    end;
                }
                field("Ship-To Customer Address 3"; "Ship-To Customer Address 3")
                {
                    ApplicationArea = All;
                    Importance = Additional;
                    trigger OnValidate()
                    begin
                        Modify();
                    end;
                }
                field("Ship-To Customer City"; "Ship-To Customer City")
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        Modify();
                    end;
                }
                field("Ship-To Customer Zip"; "Ship-To Customer Zip")
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        Modify();
                    end;
                }
                field("Ship-To Customer State"; "Ship-To Customer State")
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        Modify();
                    end;
                }
                field("Ship-To Customer Country"; "Ship-To Customer Country")
                {
                    ApplicationArea = All;
                    Importance = Additional;
                    trigger OnValidate()
                    begin
                        Modify();
                    end;
                }
                field("Ship-To Customer Phone"; "Ship-To Customer Phone")
                {
                    ApplicationArea = All;
                    Importance = Additional;
                    trigger OnValidate()
                    begin
                        Modify();
                    end;
                }
                field("Ship-To E-mail"; "Ship-To E-mail")
                {
                    ApplicationArea = All;
                    Importance = Additional;
                    trigger OnValidate()
                    begin
                        Modify();
                    end;
                }
                field("Ship-To Address Verified"; "Ship-To Address Verified")
                {
                    ApplicationArea = All;
                    Importance = Additional;
                }
            }
            group("Weight characteristics")
            {
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
            part(Control1000000043; "AJ Shipping Arch. Subform")
            {
                ApplicationArea = All;
                Caption = 'Lines';
                SubPageLink = "Shipping No." = field("No.");
            }
        }
    }
}