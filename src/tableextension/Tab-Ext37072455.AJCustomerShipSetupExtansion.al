tableextension 37072455 "AJCustomerShipSetupExtansion" extends "AJ Customer Shipping Log Setup"
{
    fields
    {
        field(37072400; "Def. Web Service Code"; Code[10])
        {
            TableRelation = "AJ Web Service";
        }
        field(37072405; "Def. Shipping Warehouse ID"; Code[40])
        {
            TableRelation = "AJ Web Service Warehouse"."Warehouse ID" WHERE("Web Service Code" = FIELD("Def. Web Service Code"));

            trigger OnValidate()
            var
                AJWebServiceWarehouse: Record "AJ Web Service Warehouse";
            begin
                TestField("Def. Web Service Code");
                if AJWebServiceWarehouse.Get("Def. Web Service Code", "Def. Shipping Warehouse ID") then begin
                    Validate("Def. Shipping Carrier Code", AJWebServiceWarehouse."Def. Shipping Carrier Code");
                    Validate("Def. Shipping Carrier Service", AJWebServiceWarehouse."Def. Shipping Carrier Service");
                    Validate("Def. Shipping Package Type", AJWebServiceWarehouse."Def. Shipping Package Type");

                    Validate("Def. Shipping Delivery Confirm", AJWebServiceWarehouse."Def. Shipping Delivery Confirm");
                    Validate("Def. Insure Shipment", AJWebServiceWarehouse."Def. Insure Shipment");
                    Validate("Def. Insurance Value", AJWebServiceWarehouse."Def. Insurance Value");
                    Validate("Def. Product Weight Unit", AJWebServiceWarehouse."Def. Product Weight Unit");
                end;
            end;
        }
        field(37072410; "Def. Shipping Carrier Code"; Text[50])
        {
            TableRelation = "AJ Web Carrier".Code WHERE("Web Service Code" = FIELD("Def. Web Service Code"));
            trigger OnValidate()
            begin
                "Def. Shipping Package Type" := ''; //trigger dodelat'
                "Def. Shipping Carrier Service" := '';
            end;
        }
        field(37072415; "Def. Shipping Package Type"; Text[50])
        {
            TableRelation = "AJ Web Carrier Package Type"."Package Code" WHERE("Web Service Code" = FIELD("Def. Web Service Code"),
                                                                                "Web Carrier Code" = FIELD("Def. Shipping Carrier Code"));

            trigger OnLookup()
            begin
                GetPackageCodeAndPackageName();
            end;
        }
        field(37072420; "Def. Shipping Delivery Confirm"; Text[50])
        {
            TableRelation = "AJ Web Service Constants"."Option Value" WHERE("Web Service Code" = FIELD("Def. Web Service Code"),
                                                                             Type = CONST(Confirmation));
        }
        field(37072425; "Def. Shipping Options"; Text[30])
        {
            TableRelation = "AJ Web Service Constants"."Option Value" WHERE("Web Service Code" = FIELD("Def. Web Service Code"),
                                                                             Type = CONST(Option),
                                                                             Blocked = CONST(false));
        }
        field(37072430; "Def. Shipping Insurance Provd"; Text[50])
        {
            TableRelation = "AJ Web Service Constants"."Option Value" WHERE("Web Service Code" = FIELD("Def. Web Service Code"),
                                                                             Type = CONST(Insurance));
        }
        field(37072435; "Def. Shipping Carrier Service"; Text[50])
        {
            TableRelation = "AJ Web Carrier Service"."Service  Code" WHERE("Web Service Code" = FIELD("Def. Web Service Code"),
                                                                            "Web Carrier Code" = FIELD("Def. Shipping Carrier Code"));
        }
        field(37072440; "Def. Insure Shipment"; Boolean)
        {
        }
        field(37072441; "Def. Insurance Value"; Option)
        {
            OptionMembers = Manual,Cost,Price;
        }
        field(37072445; "Def. Product Weight Unit"; Text[30])
        {
            TableRelation = "AJ Web Service Constants"."Option Value" WHERE(Type = CONST(Weight),
                                                                             "Web Service Code" = FIELD("Def. Web Service Code"));
        }
        field(37072446; "Def. Product Dimension Unit"; Text[30])
        {
        }
        field(37072447; "Def. Product Weight"; Decimal)
        {
        }
        field(37072448; "Def. Product Width"; Decimal)
        {
        }
        field(37072449; "Def. Product Length"; Decimal)
        {
        }
        field(37072450; "Def. Product Height"; Decimal)
        {
        }
    }
    local procedure GetPackageCodeAndPackageName()
    var
        AJWebCarrierPackage: Record "AJ Web Carrier Package Type";
    begin
        TestField("Def. Web Service Code");
        TestField("Def. Shipping Carrier Code");
        AJWebCarrierPackage.SetRange("Web Service Code", "Def. Web Service Code");
        AJWebCarrierPackage.SetRange("Web Carrier Code", "Def. Shipping Carrier Code");
        if PAGE.RunModal(0, AJWebCarrierPackage) = ACTION::LookupOK then
            "Def. Shipping Package Type" := AJWebCarrierPackage."Package Code";
    end;
}