codeunit 37072401 "AJ Shipping Process"
{
    procedure MoveToArchive(AJShipHeader: Record "AJ Shipping Header")
    var
        AJShipLine: Record "AJ Shipping Line";
        AJShipHeaderArch: Record "AJ Shipping Header Arch.";
        AJShipLineArch: Record "AJ Shipping Line Arch.";
    begin
        AJShipHeaderArch.Init();
        AJShipHeaderArch.TransferFields(AJShipHeader);
        AJShipHeaderArch."Created DateTime" := CurrentDateTime();
        AJShipHeaderArch.Insert(true);

        AJShipLine.SetRange("Shipping No.", AJShipHeader."Shipping No.");
        if AJShipLine.FindSet() then
            repeat
                AJShipLineArch.Init();
                AJShipLineArch.TransferFields(AJShipLine);
                AJShipLineArch.Insert();
            until AJShipLine.Next() = 0;

        AJShipHeader.Delete(true);
    end;

    procedure CreateShipping(AJShippingLine: Record "AJ Shipping Line"; RecordID: RecordId)
    begin
        CreateBCShipping(AJShippingLine, RecordID);
    end;

    local procedure CreateBCShipping(AJShipLine: Record "AJ Shipping Line"; RecordID: RecordId)
    var
        AJShipHeader: Record "AJ Shipping Header";
        AJFilShippingProcess: Codeunit "AJ Fill Shipping Process";
    begin
        AJShipSetup.Get();

        AJShipHeader.Init();
        AJShipHeader."Ship Date" := Today();
        AJShipHeader."Created DateTime" := CurrentDateTime();
        AJShipHeader."B2C Shipping" := AJShipSetup."B2C Shipping";
        AJShipHeader.Insert(true);

        // Add shipping line
        case AJShipLine."Source Table" of
            AJShipLine."Source Table"::"36":
                AJFilShippingProcess.CreateLineFromSalesHeader(RecordID, AJShipHeader, AJShipLine);
            AJShipLine."Source Table"::"38":
                AJFilShippingProcess.CreateLineFromPurchaseHeader(RecordID, AJShipHeader, AJShipLine);
            AJShipLine."Source Table"::"112":
                AJFilShippingProcess.CreateLineFromSalesInvHeader(RecordID, AJShipHeader, AJShipLine);
            AJShipLine."Source Table"::"110":
                AJFilShippingProcess.CreateLineFromSalesShipHeader(RecordID, AJShipHeader, AJShipLine);
            AJShipLine."Source Table"::"5740":
                AJFilShippingProcess.CreateLineFromTransferHeader(RecordID, AJShipHeader, AJShipLine);
            AJShipLine."Source Table"::"5744":
                AJFilShippingProcess.CreateLineFromTransferShpHeader(RecordID, AJShipHeader, AJShipLine);
        end;
        // Populate hedaer fields from line
        AJFilShippingProcess.PopulateShippingHeaderFromLine(AJShipLine);
        Page.Run(0, AJShipHeader);
    end;

    var
        AJShipSetup: Record "AJ Shipping Setup";
}