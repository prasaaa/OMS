package com.model;

public class ItemList {


    private String itemID;
    private String supplierID;
    private Items[] items;

    public ItemList() {
    }

    public String getSupplierID() {
        return supplierID;
    }

    public void setSupplierID(String supplierID) {
        this.supplierID = supplierID;
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
