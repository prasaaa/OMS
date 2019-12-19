package com.model;

public class InventoryStock {

    protected String itemID;
    protected String stockID;
    protected String stockINDate;
    protected String remarks;
    private Items[] items;


    public InventoryStock() {

    }

    public InventoryStock(String itemID, String stockID, String stockINDate, String remarks) {
        this.itemID = itemID;
        this.stockID = stockID;
        this.stockINDate = stockINDate;
        this.remarks = remarks;
    }

    public String getDate() {
        return this.stockINDate;
    }

    public void setDate(String stockINDate) {
        this.stockINDate = stockINDate;
    }

    public String getRemarks() {
        return this.remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public String getStockID() {
        return stockID;
    }

    public void setStockID(String stockID) {
        this.stockID = stockID;
    }

    public Items[] getItems() {
        return this.items;
    }

    public void setItems(Items[] item) {
        this.items = item;
    }

    public String getItemID() {
        return itemID;
    }

    public void setItemID(String itemID) {
        this.itemID = itemID;
    }
}
