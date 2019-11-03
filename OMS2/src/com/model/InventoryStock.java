package com.model;

public class InventoryStock {

    private ItemList itemList;
    private String stockID;
    private String stockINDate;
    private String remarks;
    private long quantity;


    public InventoryStock() {
    }

    public ItemList getItemList() {
        return this.itemList;
    }

    public void setItemList(ItemList itemList) {
        this.itemList = itemList;
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

	public long getQuantity() {
		return quantity;
	}

	public void setQuantity(long quantity) {
		this.quantity = quantity;
	}



}
