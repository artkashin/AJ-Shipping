table 37072401 "AJ Shipping Header"
{
    DrillDownPageId = "AJ Shipping";
    LookupPageId = "AJ Shipping";
    fields
    {
        field(1; "Shipping No."; Code[20])
        {
        }
        field(10; "Order DateTime"; DateTime)
        {
        }
        field(20; "Created DateTime"; DateTime)
        {
            Caption = 'Nav Created DateTime';
        }
        field(21; "Ship Date"; Date)
        {
        }
        field(22; "Shipped DateTime"; DateTime)
        {
        }
        field(30; "B2C Shipping"; Boolean)
        {
        }
        field(40; "Product Weight"; Decimal)
        {
        }
        field(41; "Product Width"; Decimal)
        {
        }
        field(42; "Product Length"; Decimal)
        {
        }
        field(43; "Product Height"; Decimal)
        {
        }
        field(44; "Shp. Incoterms"; Text[30])
        {
        }
        field(45; "Shp. Hts Code"; Text[30])
        {
        }
        field(46; "Shp. Method"; Text[30])
        {
        }
        field(60; "Ship-from Location Code"; Code[10])
        {
            TableRelation = Location;

            trigger OnValidate()
            var
                Location: Record Location;
            begin
                if Location.Get("Ship-from Location Code") then;
                "Ship-from Name" := Location.Name;
                "Ship-from Company" := CopyStr(Location.Name, 1, MaxStrLen("Ship-from Company"));
                "Ship-from Address 1" := Location.Address;
                "Ship-from Address 2" := Location."Address 2";
                "Ship-from City" := Location.City;
                "Ship-from State" := CopyStr(Location.County, 1, MaxStrLen("Ship-from State"));
                "Ship-from Zip" := CopyStr(Location."Post Code", 1, MaxStrLen("Ship-from Zip"));
                "Ship-from Country Code" := Location."Country/Region Code";
                "Ship-from Phone" := Location."Phone No.";
            end;
        }
        field(61; "Ship-from Name"; Text[100])
        {
        }
        field(62; "Ship-from Zip"; Text[10])
        {
        }
        field(63; "Ship-from Country Code"; Text[10])
        {
        }
        field(64; "Ship-from State"; Text[20])
        {
        }
        field(65; "Ship-from City"; Text[50])
        {
        }
        field(66; "Ship-from Address 1"; Text[100])
        {
        }
        field(67; "Ship-from Address 2"; Text[80])
        {
        }
        field(68; "Ship-from Address 3"; Text[100])
        {
        }
        field(69; "Ship-from Phone"; Text[30])
        {
        }
        field(70; "Ship-from Company"; Text[80])
        {
        }
        field(71; "Ship-from Residential"; Boolean)
        {
        }
        field(72; "Ship-from Verified"; Text[30])
        {
        }
        field(73; "Ship-from E-mail"; Text[35])
        {
        }
        field(80; "Ship-To Customer Name"; Text[100])
        {
        }
        field(81; "Ship-To Customer Zip"; Text[10])
        {
        }
        field(82; "Ship-To Customer Country"; Text[10])
        {
        }
        field(83; "Ship-To Customer State"; Text[20])
        {
        }
        field(84; "Ship-To Customer City"; Text[50])
        {
        }
        field(85; "Ship-To Customer Address 1"; Text[100])
        {
        }
        field(86; "Ship-To Customer Address 2"; Text[100])
        {
        }
        field(87; "Ship-To Customer Phone"; Text[30])
        {
        }
        field(88; "Ship-To Company"; Text[100])
        {
        }
        field(89; "Ship-To Residential"; Boolean)
        {
        }
        field(90; "Ship-To Address Verified"; Text[30])
        {
        }
        field(91; "Ship-To Customer Address 3"; Text[50])
        {
        }
        field(92; "Ship-To E-mail"; Text[35])
        {
        }
        field(93; "Ship-To First Name"; Text[20])
        {
        }
        field(94; "Ship-To Last Name"; Text[20])
        {
        }
        field(110; "Cancel After Date"; Date)
        {
        }
        field(130; "Hold Until Date"; Date)
        {
        }
        field(140; "Document Type"; Option)
        {
            OptionMembers = Order,Return;
        }
        field(150; "Shipment Id"; Text[50])
        {
        }
        field(160; "Cancel Reason"; Option)
        {
            OptionMembers = " ",NoInventory,ShippingAddressUndeliverable,CustomerExchange,BuyerCanceled,GeneralAdjustment,CarrierCreditDecision,RiskAssessmentInformationNotValid,CarrierCoverageFailure,CustomerReturn,MerchandiseNotReceived;
        }
        field(170; "Latest Ship Date"; DateTime)
        {
        }
        field(180; "Total Quantity"; Decimal)
        {
            CalcFormula = Sum ("AJ Shipping Line".Quantity WHERE("Shipping No." = FIELD("Shipping No.")));
            DecimalPlaces = 0 : 2;
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Shipping No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var
        AJShippingSetup: Record "AJ Shipping Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
    begin
        if "Shipping No." = '' then begin
            AJShippingSetup.Get();
            AJShippingSetup.TestField("Shipping No. Series");
            "Shipping No." := NoSeriesManagement.GetNextNo(AJShippingSetup."Shipping No. Series", WorkDate(), true);
        end;
    end;

    trigger OnDelete()
    var
        AJShipLine: Record "AJ Shipping Line";
    begin
        AJShipLine.Reset();
        AJShipLine.SetRange("Shipping No.", "Shipping No.");
        if not AJShipLine.IsEmpty() then
            AJShipLine.DeleteAll(true);
    end;
}

