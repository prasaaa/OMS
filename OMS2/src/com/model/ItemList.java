package com.model;

public class ItemList {


	private String itemID; 
	
    private String supplierID;

    private String itemType;

    private double buyingPrice;


    private Items[] items;


    public ItemList() {

        supplierID = "";
        itemType = "";
        buyingPrice = 0;


    }

    public Items[] getItems() {
        return this.items;
    }

    public void setItems(Items[] item) {
        this.items = item;
    }

    public String getSupplier() {
        return this.supplierID;
    }

    public void setSupplier(String supplier) {
        this.supplierID = supplier;
    }

    public String getType() {
        return this.itemType;
    }

    public void setType(String itemType) {
        this.itemType = itemType;
    }

    public double getBuyingPrice() {
        return this.buyingPrice;
    }

    public void setBuyingPrice(double buyingPrice) {
        this.buyingPrice = buyingPrice;
    }


	public String getItemID() {
		return itemID;
	}

	public void setItemID(String itemID) {
		this.itemID = itemID;
	}


}
