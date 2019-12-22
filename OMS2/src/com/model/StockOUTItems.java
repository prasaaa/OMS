package com.model;

public class StockOUTItems extends InventoryStockOUT {

    private String barcodeNumber;
    private String description;

    public StockOUTItems(String customerOrderID, String itemID, String stockOUTDate, String remarks, String stockOUTID) {
        super(customerOrderID, itemID, stockOUTDate, remarks, stockOUTID);
    }

    public String getBarcodeNumber() {
        return barcodeNumber;
    }

    public void setBarcodeNumber(String barcodeNumber) {
        this.barcodeNumber = barcodeNumber;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
