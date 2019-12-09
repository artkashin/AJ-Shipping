tableextension 37072453 "AJShippingHeaderArchExtension" extends "AJE Shipping Log Arch."
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
        }
        field(37072515; "Shipping Package Type"; Text[50])
        {
        }
        field(37072520; "Shipping Carrier Service"; Text[50])
        {

        }
        field(37072525; "Shipping Delivery Confirm"; Text[50])
        {

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
        field(37072565; "Shipping Options"; Text[50])
        {
        }
        field(37072570; "Web Order No."; Code[20])
        {
            TableRelation = "AJ Web Order Header";
        }
    }

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