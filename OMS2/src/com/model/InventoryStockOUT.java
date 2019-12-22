package com.model;

public class InventoryStockOUT {
    protected String customerOrderID;
    protected String itemID;
    protected String stockOUTDate;
    protected String remarks;
    protected String stockOUTID;
    private StockOUTItems[] stockOUTItems;

    public InventoryStockOUT() {
    }

    public InventoryStockOUT(String customerOrderID, String itemID, String stockOUTDate, String remarks, String stockOUTID) {
        this.customerOrderID = customerOrderID;
        this.itemID = itemID;
        this.stockOUTDate = stockOUTDate;
        this.remarks = remarks;
        this.stockOUTID = stockOUTID;
    }

    public String getCustomerOrderID() {
        return customerOrderID;
    }

    public void setCustomerOrderID(String customerOrderID) {
        this.customerOrderID = customerOrderID;
    }

    public String getItemID() {
        return itemID;
    }

    public void setItemID(String itemID) {
        this.itemID = itemID;
    }

    public String getStockOUTDate() {
        return stockOUTDate;
    }

    public void setStockOUTDate(String stockOUTDate) {
        this.stockOUTDate = stockOUTDate;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public String getStockOUTID() {
        return stockOUTID;
    }

    public void setStockOUTID(String stockOUTID) {
        this.stockOUTID = stockOUTID;
    }

    public StockOUTItems[] getStockOUTItems() {
        return stockOUTItems;
    }

    public void setStockOUTItems(StockOUTItems[] stockOUTItems) {
        this.stockOUTItems = stockOUTItems;
    }
}
