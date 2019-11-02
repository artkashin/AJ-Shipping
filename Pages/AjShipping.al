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
            part(Control1000000043; "AJ Shipping Subform")
            {
                ApplicationArea = All;
                Caption = 'Lines';
                SubPageLink = "Shipping No." = field("Shipping No.");
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
                    Promoted = true;
                    PromotedCategory = Process;
                    Image = Archive;
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
                    Caption = 'Get Lines From Sales';
                    trigger OnAction()
                    var
                        AJShippingLine: Record "AJ Shipping Line";
                        SalesHeader: Record "Sales Header";
                        SalesList: Page "Sales List";
                    begin
                        AJShippingCheck.AddLineInShippingAllowed();
                        AJShippingLine."Shipping No." := Rec."Shipping No.";
                        SalesHeader.Reset();
                        SalesHeader.SetFilter("Document Type", '<>%1|<>%2', SalesHeader."Document Type"::"Credit Memo", SalesHeader."Document Type"::Quote);
                        SalesList.SetTableView(SalesHeader);
                        SalesList.SetLookupForAJShipping(AJShippingLine);
                        SalesList.LookupMode(true);
                        SalesList.RunModal();
                    end;
                }
                action("Get Sales Ship Header")
                {
                    ApplicationArea = All;
                    Promoted = false;
                    Caption = 'Get Lines From Sales Shipments';
                    trigger OnAction()
                    var
                        AJShippingLine: Record "AJ Shipping Line";
                        SalesShipmet: Page "Posted Sales Shipments";
                    begin
                        AJShippingCheck.AddLineInShippingAllowed();
                        AJShippingLine."Shipping No." := Rec."Shipping No.";
                        SalesShipmet.SetLookupForAJShipping(AJShippingLine);
                        SalesShipmet.LookupMode(true);
                        SalesShipmet.RunModal();
                    end;
                }
                action("Get Purchase Header")
                {
                    ApplicationArea = All;
                    Promoted = false;
                    Caption = 'Get Lines From Purchases';
                    trigger OnAction()
                    var
                        AJShippingLine: Record "AJ Shipping Line";
                        PurchList: Page "Purchase List";
                    begin
                        AJShippingCheck.AddLineInShippingAllowed();
                        AJShippingLine."Shipping No." := Rec."Shipping No.";
                        PurchList.SetLookupForAJShipping(AJShippingLine);
                        PurchList.LookupMode(true);
                        PurchList.RunModal();
                    end;
                }
                action("Get Transfer Orders")
                {
                    ApplicationArea = All;
                    Promoted = false;
                    Caption = 'Get Lines From Transfer Orders';
                    trigger OnAction()
                    var
                        AJShippingLine: Record "AJ Shipping Line";
                        TransferOrders: Page "Transfer Orders";
                    begin
                        AJShippingCheck.AddLineInShippingAllowed();
                        AJShippingLine."Shipping No." := Rec."Shipping No.";
                        TransferOrders.SetLookupForAJShipping(AJShippingLine);
                        TransferOrders.LookupMode(true);
                        TransferOrders.RunModal();
                    end;
                }
                action("Get Sales Inv Header")
                {
                    ApplicationArea = All;
                    Promoted = false;
                    Visible = false;
                    Caption = 'Get Lines From Posted Sales Invoices';
                    trigger OnAction()
                    var
                        AJShippingLine: Record "AJ Shipping Line";
                        SalesInvoices: Page "Posted Sales Invoices";
                    begin
                        AJShippingCheck.AddLineInShippingAllowed();
                        AJShippingLine."Shipping No." := Rec."Shipping No.";
                        SalesInvoices.SetLookupForAJShipping(AJShippingLine);
                        SalesInvoices.LookupMode(true);
                        SalesInvoices.RunModal();
                    end;
                }
                action("Get Transfer Shipments")
                {
                    ApplicationArea = All;
                    Promoted = false;
                    Caption = 'Get Lines From Transfer Shipments';
                    trigger OnAction()
                    var
                        AJShippingLine: Record "AJ Shipping Line";
                        TransferShipments: Page "Posted Transfer Shipments";
                    begin
                        AJShippingCheck.AddLineInShippingAllowed();
                        AJShippingLine."Shipping No." := Rec."Shipping No.";
                        TransferShipments.SetLookupForAJShipping(AJShippingLine);
                        TransferShipments.LookupMode(true);
                        TransferShipments.RunModal();
                    end;
                }

            }
        }
    }
    trigger OnOpenPage()
    begin

    end;

    var
        AJShippingProcess: Codeunit "AJ Shipping Process";
        AJShippingCheck: Codeunit "AJ Shipping Check";

}