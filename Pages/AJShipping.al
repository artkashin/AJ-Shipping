page 37072402 "AJ Shipping Card"
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
                field("No."; "No.")
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
                    ShowMandatory = true;
                    trigger OnValidate()
                    begin
                        SetControl();
                    end;
                }
                field("Ship-from Name"; "Ship-from Name")
                {
                    ApplicationArea = All;
                    Editable = LocationCodeFilled;
                }
                field("Ship-from Company"; "Ship-from Company")
                {
                    ApplicationArea = All;
                    Editable = LocationCodeFilled;
                    Importance = Additional;
                    ShowMandatory = true;
                }
                field("Ship-from Address 1"; "Ship-from Address 1")
                {
                    ApplicationArea = All;
                    Editable = LocationCodeFilled;
                    ShowMandatory = true;
                }
                field("Ship-from Address 2"; "Ship-from Address 2")
                {
                    ApplicationArea = All;
                    Editable = LocationCodeFilled;
                    Importance = Additional;
                }
                field("Ship-from Address 3"; "Ship-from Address 3")
                {
                    ApplicationArea = All;
                    Editable = LocationCodeFilled;
                    Importance = Additional;
                }
                field("Ship-from City"; "Ship-from City")
                {
                    ApplicationArea = All;
                    Editable = LocationCodeFilled;
                    Importance = Additional;
                    ShowMandatory = true;
                }
                field("Ship-from Zip"; "Ship-from Zip")
                {
                    ApplicationArea = All;
                    Editable = LocationCodeFilled;
                    Importance = Additional;
                    ShowMandatory = true;
                }
                field("Ship-from State"; "Ship-from State")
                {
                    ApplicationArea = All;
                    Editable = LocationCodeFilled;
                    Importance = Additional;
                    ShowMandatory = true;
                }
                field("Ship-from Country"; "Ship-from Country Code")
                {
                    ApplicationArea = All;
                    Editable = LocationCodeFilled;
                    Importance = Additional;
                }
                field("Ship-from Phone"; "Ship-from Phone")
                {
                    ApplicationArea = All;
                    Editable = LocationCodeFilled;
                    Importance = Additional;
                    ShowMandatory = true;
                }
                field("Ship-from E-mail"; "Ship-from E-mail")
                {
                    ApplicationArea = All;
                    Editable = LocationCodeFilled;
                    Importance = Additional;
                }
                field("Ship-from Verified"; "Ship-from Verified")
                {
                    ApplicationArea = All;
                    Editable = LocationCodeFilled;
                    Importance = Additional;
                }
            }
            group("Ship-To")
            {
                field("Ship-To Location Code"; "Ship-To Location Code")
                {
                    ApplicationArea = All;
                    Importance = Additional;
                    trigger OnValidate()
                    begin
                        SetControl();
                    end;
                }
                field("Ship-To Customer Name"; "Ship-To Customer Name")
                {
                    ApplicationArea = All;
                    Editable = LocationToCodeFilled;
                    ShowMandatory = true;
                    trigger OnValidate()
                    begin
                        Modify();
                    end;
                }
                field("Ship-To Company"; "Ship-To Company")
                {
                    ApplicationArea = All;
                    Editable = LocationToCodeFilled;
                    Importance = Additional;
                    trigger OnValidate()
                    begin
                        Modify();
                    end;
                }
                field("Ship-To Customer Address 1"; "Ship-To Customer Address 1")
                {
                    ApplicationArea = All;
                    Editable = LocationToCodeFilled;
                    ShowMandatory = true;
                    trigger OnValidate()
                    begin
                        Modify();
                    end;
                }
                field("Ship-To Customer Address 2"; "Ship-To Customer Address 2")
                {
                    ApplicationArea = All;
                    Editable = LocationToCodeFilled;
                    Importance = Additional;
                    trigger OnValidate()
                    begin
                        Modify();
                    end;
                }
                field("Ship-To Customer Address 3"; "Ship-To Customer Address 3")
                {
                    ApplicationArea = All;
                    Editable = LocationToCodeFilled;
                    Importance = Additional;
                    trigger OnValidate()
                    begin
                        Modify();
                    end;
                }
                field("Ship-To Customer City"; "Ship-To Customer City")
                {
                    ApplicationArea = All;
                    Editable = LocationToCodeFilled;
                    ShowMandatory = true;
                    trigger OnValidate()
                    begin
                        Modify();
                    end;
                }
                field("Ship-To Customer Zip"; "Ship-To Customer Zip")
                {
                    ApplicationArea = All;
                    Editable = LocationToCodeFilled;
                    ShowMandatory = true;
                    trigger OnValidate()
                    begin
                        Modify();
                    end;
                }
                field("Ship-To Customer State"; "Ship-To Customer State")
                {
                    ApplicationArea = All;
                    Editable = LocationToCodeFilled;
                    ShowMandatory = true;
                    trigger OnValidate()
                    begin
                        Modify();
                    end;
                }
                field("Ship-To Customer Country"; "Ship-To Customer Country")
                {
                    ApplicationArea = All;
                    Editable = LocationToCodeFilled;
                    Importance = Additional;
                    trigger OnValidate()
                    begin
                        Modify();
                    end;
                }
                field("Ship-To Customer Phone"; "Ship-To Customer Phone")
                {
                    ApplicationArea = All;
                    Editable = LocationToCodeFilled;
                    Importance = Additional;
                    trigger OnValidate()
                    begin
                        Modify();
                    end;
                }
                field("Ship-To E-mail"; "Ship-To E-mail")
                {
                    ApplicationArea = All;
                    Editable = LocationToCodeFilled;
                    Importance = Additional;
                    trigger OnValidate()
                    begin
                        Modify();
                    end;
                }
                field("Ship-To Address Verified"; "Ship-To Address Verified")
                {
                    ApplicationArea = All;
                    Editable = LocationToCodeFilled;
                    Importance = Additional;
                }
            }
            group("Dimensions")
            {
                field("Weight Unit of Measure"; "Weight Unit of Measure")
                {
                    Visible = false;
                    ApplicationArea = All;
                    Importance = Additional;
                }
                field("Dimension Unit of Measure"; "Dimension Unit of Measure")
                {
                    Visible = false;
                    ApplicationArea = All;
                    Importance = Additional;
                }
                field(AJWOH_PrdWgt; "Product Weight")
                {
                    ApplicationArea = All;
                    Caption = 'Product Weight';
                    ShowMandatory = true;
                }
                field(AJWOH_PrdW; "Product Width")
                {
                    ApplicationArea = All;
                    Caption = 'Product Width';
                    ShowMandatory = true;
                }
                field(AJWOH_PrdL; "Product Length")
                {
                    ApplicationArea = All;
                    Caption = 'Product Lenght';
                    ShowMandatory = true;
                }
                field(AJWOH_PrdH; "Product Height")
                {
                    ApplicationArea = All;
                    Caption = 'Product Height';
                    ShowMandatory = true;
                }
            }
            part(Control1000000043; "AJ Shipping Subform")
            {
                ApplicationArea = All;
                Caption = 'Lines';
                SubPageLink = "Shipping No." = field("No.");
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
                    var
                    begin
                        //BindSubscription(AJShipmentEventSub);

                        //if Confirm('Move this document to the archive?') then                        
                        AJShippingProcess.ArchiveShipping(Rec);

                        //UnbindSubscription(AJShipmentEventSub);                        
                    end;
                }
            }
            group("Get Lines")
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
                        AJShippingLine."Shipping No." := Rec."No.";
                        AJShippingCheck.AddLineInShippingAllowed(AJShippingLine);
                        SalesHeader.Reset();
                        SalesHeader.SetFilter("Document Type", '<>%1|<>%2', SalesHeader."Document Type"::"Credit Memo", SalesHeader."Document Type"::Quote);
                        if "Ship-from Location Code" <> '' then
                            SalesHeader.SetRange("Location Code", "Ship-from Location Code");

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
                        SalesShpHeader: Record "Sales Shipment Header";
                        SalesShipmet: Page "Posted Sales Shipments";
                    begin
                        AJShippingLine."Shipping No." := Rec."No.";
                        AJShippingCheck.AddLineInShippingAllowed(AJShippingLine);
                        if "Ship-from Location Code" <> '' then begin
                            SalesShpHeader.SetRange("Location Code", "Ship-from Location Code");
                            SalesShipmet.SetTableView(SalesShpHeader);
                        end;
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
                        PurchaseHeader: Record "Purchase Header";
                        PurchList: Page "Purchase List";
                    begin
                        AJShippingLine."Shipping No." := Rec."No.";
                        AJShippingCheck.AddLineInShippingAllowed(AJShippingLine);
                        if "Ship-from Location Code" <> '' then begin
                            PurchaseHeader.SetRange("Location Code", "Ship-from Location Code");
                            PurchList.SetTableView(PurchaseHeader);
                        end;
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
                        TransferHeader: Record "Transfer Header";
                        TransferOrders: Page "Transfer Orders";
                    begin
                        AJShippingLine."Shipping No." := Rec."No.";
                        AJShippingCheck.AddLineInShippingAllowed(AJShippingLine);
                        if "Ship-from Location Code" <> '' then begin
                            TransferHeader.SetRange("Transfer-from Code", "Ship-from Location Code");
                            TransferOrders.SetTableView(TransferHeader);
                        end;
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
                        AJShippingLine."Shipping No." := Rec."No.";
                        AJShippingCheck.AddLineInShippingAllowed(AJShippingLine);
                        AJShippingLine.Description := "Ship-from Location Code";
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
                        AJShippingLine."Shipping No." := Rec."No.";
                        AJShippingCheck.AddLineInShippingAllowed(AJShippingLine);

                        AJShippingLine.Description := "Ship-from Location Code";
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
        SetControl();
    end;

    local procedure SetControl()
    var

    begin
        if "Ship-from Location Code" = '' then
            LocationCodeFilled := true
        else
            LocationCodeFilled := false;

        if "Ship-To Location Code" = '' then
            LocationToCodeFilled := true
        else
            LocationToCodeFilled := false;

    end;

    var
        AJShippingProcess: Codeunit "AJ Shipping Process";
        AJShippingCheck: Codeunit "AJ Shipping Check";
        LocationCodeFilled: boolean;
        LocationToCodeFilled: Boolean;

}