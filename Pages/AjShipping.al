page 37072402 "AJ Shipping"
{
    PageType = Document;
    PopulateAllFields = true;
    RefreshOnActivate = true;
    SourceTable = "AJ Shipping Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Shipping No."; "Shipping No.")
                {
                    ApplicationArea = All;
                }
                field("Ship Date"; "Ship Date")
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    var
                        dtm: DateTime;
                    begin
                        //vadimb 08162018 >
                        Evaluate(dtm, Format("Latest Ship Date", 9));
                        if "Ship Date" > DT2Date(dtm) then
                            Message('Latest Ship date is ' + Format(DT2Date(dtm)));
                    end;
                }
            }
            group("Ship-from")
            {
                field("Ship-from Location Code"; "Ship-from Location Code")
                {
                    ApplicationArea = All;
                }
                field("Ship-from Name"; "Ship-from Name")
                {
                    ApplicationArea = All;
                }
                field("Ship-from Company"; "Ship-from Company")
                {
                    ApplicationArea = All;
                }
                field("Ship-from Address 1"; "Ship-from Address 1")
                {
                    ApplicationArea = All;
                }
                field("Ship-from Address 2"; "Ship-from Address 2")
                {
                    ApplicationArea = All;
                }
                field("Ship-from Address 3"; "Ship-from Address 3")
                {
                    ApplicationArea = All;
                }
                field("Ship-from City"; "Ship-from City")
                {
                    ApplicationArea = All;
                }
                field("Ship-from Zip"; "Ship-from Zip")
                {
                    ApplicationArea = All;
                }
                field("Ship-from State"; "Ship-from State")
                {
                    ApplicationArea = All;
                }
                field("Ship-from Country"; "Ship-from Country Code")
                {
                    ApplicationArea = All;
                }
                field("Ship-from Phone"; "Ship-from Phone")
                {
                    ApplicationArea = All;
                }
                field("Ship-from E-mail"; "Ship-from E-mail")
                {
                    ApplicationArea = All;
                }
                field("Ship-from Verified"; "Ship-from Verified")
                {
                    ApplicationArea = All;
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
                    trigger OnValidate()
                    begin
                        Modify();
                    end;
                }
                field("Ship-To Customer Address 3"; "Ship-To Customer Address 3")
                {
                    ApplicationArea = All;
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
                    trigger OnValidate()
                    begin
                        Modify();
                    end;
                }
                field("Ship-To Customer Phone"; "Ship-To Customer Phone")
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        Modify();
                    end;
                }
                field("Ship-To E-mail"; "Ship-To E-mail")
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        Modify();
                    end;
                }
                field("Ship-To Address Verified"; "Ship-To Address Verified")
                {
                    ApplicationArea = All;
                }
            }

            part(Control1000000043; "AJ Shipping Subform")
            {
                ApplicationArea = All;
                SubPageLink = "Shipping No." = field("Shipping No.");
            }
            group("Weight characteristics")
            {
                field(AJWOH_PrdWgt; "Shp. Product Weight")
                {
                    ApplicationArea = All;
                    Caption = 'Product Weight';
                }

                field(AJWOH_PrdDim; "Shp. Product Weight Unit")
                {
                    ApplicationArea = All;

                }
                field(AJWOH_PrdW; "Shp. Product Width")
                {
                    ApplicationArea = All;
                    Caption = 'Product Width';
                }
                field(AJWOH_PrdL; "Shp. Product Length")
                {
                    ApplicationArea = All;
                    Caption = 'Product Lenght';
                }
                field(AJWOH_PrdH; "Shp. Product Height")
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
            group("Archive")
            {
                action("Move to Archive")
                {
                    ApplicationArea = All;
                    Promoted = false;
                    Caption = 'Move to Archive';
                    trigger OnAction()
                    begin
                        AJShippingProcess.MoveToArchive(Rec);
                        Message('The document was moved to the archive');
                    end;
                }
            }
            group("Filling")
            {
                action("Get Sales Header")
                {
                    ApplicationArea = All;
                    Promoted = false;
                    Caption = 'Get Lines From Sales Hader';
                    trigger OnAction()
                    var
                        AJShippingLine: Record "AJ Shipping Line";
                        SalesList: Page "Sales List";
                    begin
                        AJShippingLine."Shipping No." := Rec."Shipping No.";
                        SalesList.SetLookupForAJShipping(AJShippingLine);
                        SalesList.LookupMode(true);
                        SalesList.RunModal();
                        Message('Done');
                    end;
                }
                action("Get Purchase Header")
                {
                    ApplicationArea = All;
                    Promoted = false;
                    Caption = 'Get Lines From Purchase Hader';
                    trigger OnAction()
                    var
                        AJShippingLine: Record "AJ Shipping Line";
                        PurchList: Page "Purchase List";
                    begin
                        AJShippingLine."Shipping No." := Rec."Shipping No.";
                        PurchList.SetLookupForAJShipping(AJShippingLine);
                        PurchList.LookupMode(true);
                        PurchList.RunModal();
                        Message('Done');
                    end;
                }
                action("Get Sales Ship Header")
                {
                    ApplicationArea = All;
                    Promoted = false;
                    Caption = 'Get Lines From Sales Shipment Hader';
                    trigger OnAction()
                    var
                        AJShippingLine: Record "AJ Shipping Line";
                        SalesShipmet: Page "Posted Sales Shipment";
                    begin
                        AJShippingLine."Shipping No." := Rec."Shipping No.";
                        SalesShipmet.SetLookupForAJShipping(AJShippingLine);
                        SalesShipmet.LookupMode(true);
                        SalesShipmet.RunModal();
                        Message('Done');
                    end;
                }
                action("Get Sales Inv Header")
                {
                    ApplicationArea = All;
                    Promoted = false;
                    Caption = 'Get Lines From Purchase Hader';
                    trigger OnAction()
                    var
                        AJShippingLine: Record "AJ Shipping Line";
                        SalesInvoice: Page "Posted Sales Invoice";
                    begin
                        AJShippingLine."Shipping No." := Rec."Shipping No.";
                        SalesInvoice.SetLookupForAJShipping(AJShippingLine);
                        SalesInvoice.LookupMode(true);
                        SalesInvoice.RunModal();
                        Message('Done');
                    end;
                }
            }
        }
    }
    var
        AJShippingProcess: Codeunit "AJ Fill Shipping Process";
}

