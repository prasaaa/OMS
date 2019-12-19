package com.model;

public class Items extends InventoryStock {

    private String barcodeNumber;
    private String itemStatus;
    private String description;

    public Items(String itemID, String stockID, String stockINDate, String remarks) {
        super(itemID, stockID, stockINDate, remarks);
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getBarcode() {
        return this.barcodeNumber;
    }

    public void setBarcode(String barcodeNumber) {
        this.barcodeNumber = barcodeNumber;
    }

    public String getItemStatus() {
        return itemStatus;
    }

    public void setItemStatus(String itemStatus) {
        this.itemStatus = itemStatus;
    }


}
