tableextension 37072450 "AJShippingHeaderExtension" extends "AJE Shipping Log"
{
    fields
    {
        field(37072500; "Web Service Code"; Code[10])
        {
            TableRelation = "AJ Web Service";
        }
        field(37072502; "Carier Tracking Number"; Text[30])
        {
        }
        field(37072503; "Shipping Agent Label"; BLOB)
        {
        }
        field(37072504; "Ship-From Warehouse ID"; Code[40])
        {
            TableRelation = IF ("Web Service Code" = CONST('')) "AJ Web Service Warehouse"."Warehouse ID" WHERE("Web Service Code" = FIELD("Web Service Code"))
            ELSE
            IF ("Web Service Code" = FILTER(<> '')) "AJ Web Service Warehouse"."Warehouse ID" WHERE("Web Service Code" = FIELD("Web Service Code"));

            trigger OnValidate()
            var
                AJWebServiceWarehouse: Record "AJ Web Service Warehouse";
            begin
                TestField("Web Service Code");

                if AJWebServiceWarehouse.Get("Web Service Code", "Ship-From Warehouse ID") then begin
                    if AJWebServiceWarehouse."Def. Shipping Carrier Code" <> '' then
                        "Shipping Carrier Code" := AJWebServiceWarehouse."Def. Shipping Carrier Code";
                    if AJWebServiceWarehouse."Def. Shipping Carrier Service" <> '' then
                        Validate("Shipping Carrier Service", AJWebServiceWarehouse."Def. Shipping Carrier Service");
                    if AJWebServiceWarehouse."Def. Shipping Package Type" <> '' then
                        Validate("Shipping Package Type", AJWebServiceWarehouse."Def. Shipping Package Type");
                    if AJWebServiceWarehouse."Def. Shipping Delivery Confirm" <> '' then
                        "Shipping Delivery Confirm" := CopyStr(AJWebServiceWarehouse."Def. Shipping Delivery Confirm", 1, MaxStrLen("Shipping Delivery Confirm"));
                    if AJWebServiceWarehouse."Def. Product Weight Unit" <> '' then
                        "Product Weight Unit" := AJWebServiceWarehouse."Def. Product Weight Unit";
                end;
            end;
        }
        field(37072505; "Product Weight Unit"; Text[30])
        {
            TableRelation = "AJ Web Service Constants"."Option Value" WHERE("Web Service Code" = FIELD("Web Service Code"),
                                                                             Type = CONST(Weight));
        }
        field(37072506; "Product Dimension Unit"; Text[30])
        {
        }
        field(37072507; "Web Service Shipment ID"; Text[30])
        {
        }
        field(37072510; "Shipping Carrier Code"; Text[50])
        {
            trigger OnValidate()
            var
                AJWebCarrier: Record "AJ Web Carrier";
            begin
                TestField("Web Service Code");
                if Rec."Shipping Carrier Code" <> xRec."Shipping Carrier Code" then
                    if AJWebCarrier.Get("Web Service Code", "Shipping Carrier Code") then begin
                        Validate("Shipping Carrier Service", AJWebCarrier."Def. Shipping Carrier Service");
                        Validate("Shipping Package Type", AJWebCarrier."Def. Shipping Package Type");
                        Validate("Shipping Delivery Confirm", AJWebCarrier."Def. Shipping Delivery Confirm");
                        Validate("Shipping Options", AJWebCarrier."Def. Shipping Option");
                        // AJWebCarrier."Def. Shipping Insutance Provd";
                        //asd
                    end else begin
                        Validate("Shipping Carrier Service", '');
                        "Shipping Package Type" := '';
                        "Shipping Delivery Confirm" := '';
                        "Shipping Options" := '';
                    end;

            end;
        }
        field(37072515; "Shipping Package Type"; Text[50])
        {

            trigger OnValidate()
            var
                AJWebCarrierPackageType: Record "AJ Web Carrier Package Type";
                AJWebShippingProcess: Codeunit "AJ Web Shipping Process";
            begin
                TestField("Web Service Code");
                if Rec."Shipping Carrier Service" <> xRec."Shipping Package Type" then
                    AJWebShippingProcess.CancelShipLabel(Rec, true);
                if AJWebCarrierPackageType.Get("Web Service Code", "Shipping Carrier Code", "Shipping Package Type") then begin
                    if "Shipping Delivery Confirm" = '' then
                        Validate("Shipping Delivery Confirm", AJWebCarrierPackageType."Shipping Delivery Confirm");
                    Validate("Product Weight Unit", AJWebCarrierPackageType."Def. Weight Unit");
                    Validate("Product Weight", AJWebCarrierPackageType."Def. Weight");
                    Validate("Product Dimension Unit", AJWebCarrierPackageType."Def. Dimension Unit");
                    Validate("Product Width", AJWebCarrierPackageType."Def. Width");
                    Validate("Product Length", AJWebCarrierPackageType."Def. Length");
                    Validate("Product Height", AJWebCarrierPackageType."Def. Height");

                end;
            end;
        }
        field(37072520; "Shipping Carrier Service"; Text[50])
        {
            trigger OnValidate()
            var
                AJWebCarrierServices: Record "AJ Web Carrier Service";

            begin
                TestField("Web Service Code");

                if AJWebCarrierServices.Get("Web Service Code", "Shipping Carrier Code", "Shipping Carrier Service") then begin
                    if "International Shipment" then
                        AJWebCarrierServices.TestField(International, true);
                    Validate("Shipping Package Type", AJWebCarrierServices."Default Package Code");
                end;
            end;
        }
        field(37072525; "Shipping Delivery Confirm"; Text[50])
        {
            TableRelation = "AJ Web Service Constants"."Option Value" WHERE("Web Service Code" = FIELD("Web Service Code"),
                                                                             Type = CONST(Confirmation),
                                                                             Blocked = CONST(false));

        }
        field(37072530; "Insure Shipment"; Boolean)
        {
        }
        field(37072531; "Insured Value"; Decimal)
        {
        }
        field(37072532; "Additional Insurance Value"; Decimal)
        {
        }
        field(37072533; "Carier Insurance Cost"; Decimal)
        {
        }
        field(37072538; "Non Machinable"; Boolean)
        {
        }
        field(37072539; "Saturday Delivery"; Boolean)
        {
        }
        field(37072540; "Contains Alcohol"; Boolean)
        {
        }
        field(37072545; "Labels Created"; Boolean)
        {
            Editable = false;
        }
        field(37072550; "Labels Printed"; Boolean)
        {
            Editable = false;
        }
        field(37072551; "Bill-to Type"; Option)
        {
            OptionCaption = 'My Account,Recipient,Third Party,My Other Account';
            OptionMembers = my_account,recipient,third_party,my_other_account;
        }
        field(37072552; "Bill-To Account"; Text[30])
        {
        }
        field(37072553; "Bill-To Postal Code"; Text[10])
        {
        }
        field(37072554; "Bill-To Country Code"; Text[30])
        {
        }
        field(37072555; "Shipment Confirmed"; Boolean)
        {
        }
        field(37072556; "Custom Field 1"; Text[80])
        {
        }
        field(37072557; "Custom Field 2"; Text[80])
        {
        }
        field(37072558; "Custom Field 3"; Text[80])
        {
        }
        field(37072560; "Carier Shipping Charge"; Decimal)
        {
        }
        field(37072565; "Shipping Options"; Text[30])
        {
            TableRelation = "AJ Web Service Constants"."Option Value" WHERE("Web Service Code" = FIELD("Web Service Code"),
                                                                             Type = CONST(Option),
                                                                             Blocked = CONST(false));
        }
        field(37072570; "Web Order No."; Code[20])
        {
            TableRelation = "AJ Web Order Header";
        }
    }
    trigger OnInsert()
    begin
        FillByDefault();
    end;

    trigger OnModify()
    var
    begin
        if "Ship-From Warehouse ID" = '' then
            FindWebWarehouses("Ship-from Location Code");
    end;

    procedure FindWebWarehouses(LocationCode: Code[10])
    var
        AJWebWarehouses: Record "AJ Web Service Warehouse";
    begin
        if LocationCode = '' then
            exit;

        AJWebWarehouses.SetFilter("Location Code", LocationCode);
        if AJWebWarehouses.FindFirst() then
            "Ship-From Warehouse ID" := AJWebWarehouses."Warehouse ID";
    end;

    procedure FillByDefault()
    var
        AJShippingSetup: Record "AJE Shipping Log Setup";
        AJCustomerShippingSetup: Record "AJ Customer Shipping Log Setup";
    begin
        AJShippingSetup.Get();
        AJCustomerShippingSetup.Reset();
        AJCustomerShippingSetup.SetRange(Type, AJCustomerShippingSetup.Type::"All Customers");
        if AJCustomerShippingSetup.FindFirst() then begin
            "Web Service Code" := AJCustomerShippingSetup."Def. Web Service Code";
            "Shipping Carrier Code" := AJCustomerShippingSetup."Def. Shipping Carrier Code";
            "Shipping Carrier Service" := AJCustomerShippingSetup."Def. Shipping Carrier Service";
            "Shipping Package Type" := AJCustomerShippingSetup."Def. Shipping Package Type";
            "Shipping Delivery Confirm" := AJCustomerShippingSetup."Def. Shipping Delivery Confirm";
            "Shipping Options" := AJCustomerShippingSetup."Def. Shipping Options";
            "Product Weight Unit" := AJCustomerShippingSetup."Def. Product Weight Unit";
            "Product Dimension Unit" := AJCustomerShippingSetup."Def. Product Dimension Unit";

            if AJShippingSetup."Weight Option" = AJShippingSetup."Weight Option"::Default then begin
                "Product Weight" := AJCustomerShippingSetup."Def. Product Weight";
                "Product Width" := AJCustomerShippingSetup."Def. Product Width";
                "Product Length" := AJCustomerShippingSetup."Def. Product Length";
                "Product Height" := AJCustomerShippingSetup."Def. Product Height";
            end;
        end;
        FindWebWarehouses("Ship-from Location Code");
    end;

    procedure SetResponseContent(var value: HttpContent)
    var
        InStr: InStream;
        OutStr: OutStream;
    begin
        "Shipping Agent Label".CreateInStream(InStr);
        value.ReadAs(InStr);

        "Shipping Agent Label".CreateOutStream(OutStr);
        CopyStream(OutStr, InStr);
    end;

    procedure ViewAttachment()
    begin
        ViewInPdfViewer();
    end;

    procedure ViewInPdfViewer()
    var
        PdfViewer: Page "PDF Viewer";
    begin
        PdfViewer.LoadPdfFromBlob(ToBase64String());
        PdfViewer.Run();
    end;

    procedure ToBase64String() ReturnValue: Text
    var
        TempBlob: Record TempBlob temporary;
    begin
        CalcFields("Shipping Agent Label");
        if not "Shipping Agent Label".HasValue() then
            exit;

        TempBlob.Blob := "Shipping Agent Label";
        ReturnValue := TempBlob.ToBase64String();
    end;


}