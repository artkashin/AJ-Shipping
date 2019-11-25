table 37072402 "AJ Shipping Log Line"
{
    fields
    {
        field(1; "Shipping No."; Code[20])
        {
        }
        field(2; "Line No."; Integer)
        {
        }
        field(3; "Source Type"; Option)
        {
            OptionMembers = " ","BC Document",Item,Other;
        }
        field(4; "Source Document Type"; Option)
        {
            OptionMembers = " ",Quote,Order,Invoice,"Credit Memo","Blanket Order","Return Order";
        }
        field(5; "Source ID"; Text[30])
        {
            TableRelation = if ("Source Table" = const("36")) "Sales Header"."No." where("Document Type" = field("Source Document Type")) else
            if ("Source Table" = const("110")) "Sales Shipment Header"."No." else
            if ("Source Table" = const("112")) "Sales Invoice Header"."No." else
            if ("Source Table" = const("38")) "Purchase Header"."No." where("Document Type" = field("Source Document Type")) else
            if ("Source Table" = const("5740")) "Transfer Header"."No." else
            if ("Source Table" = const("5744")) "Transfer Shipment Header"."No." else
            if ("Source Table" = const(" "), "Source Type" = const(Item)) Item."No.";
            trigger OnValidate()
            begin

            end;
        }
        field(6; "Source Table"; Option)
        {
            OptionCaption = ' ,Sales Header,Sales Shipment Header,Sales Invoice Header,Purchase Header,Transfer Header,Transfer Shipment Header';
            OptionMembers = " ","36","110","112","38","5740","5744";
        }
        field(7; Description; Text[250])
        {
        }
        field(8; Quantity; Decimal)
        {
        }
        field(15; "Product Weight"; Decimal)
        {
        }
        field(16; "Product Width"; Decimal)
        {
        }
        field(17; "Product Length"; Decimal)
        {
        }
        field(18; "Product Height"; Decimal)
        {
        }
    }
    keys
    {
        key(Key1; "Shipping No.", "Line No.")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
        AJShipLine: Record "AJ Shipping Log Line";
    begin
        AJShipLine.Reset();
        AJShipLine.SetRange("Shipping No.", "Shipping No.");
        if AJShipLine.FindLast() then
            "Line No." := AJShipLine."Line No." + 1000
        else
            "Line No." := 1000;

        Quantity := 1;
    end;
}

