package com.model;

public class ItemList {
	

	
	private String itemModelName;
	
	private String itemManufacturer;
	
	private String itemSupplier;
	
	private String itemType;
	
	private double buyingPrice;
	
	private double sellingPrice;
	
	private Items[] items;
	
	
	public ItemList() {
		itemModelName = "";
		itemManufacturer = "";
		itemSupplier = "";
		itemType = "";
		buyingPrice = 0;
		sellingPrice = 0;
		
	}
	
	public void setItems(Items[] item) {
		this.items = item;
	}
	
	public Items[] getItems() {
		return this.items;
	}
	
	
	public void setModel(String modelName) {
		this.itemModelName = modelName;
	} 
	
	public String getModel() {
		return this.itemModelName;
	}
	
	public void setManufacturer(String manufacturer) {
		this.itemManufacturer = manufacturer;
	}
	
	public String getManufacturer() {
		return this.itemManufacturer;
	}
	
	public void setSupplier(String supplier) {
		this.itemSupplier = supplier;
	}
	
	public String getSupplier() {
		return this.itemSupplier;
	}

	public void setType(String itemType) {
		this.itemType = itemType;
	}
	
	public String getType() {
		return this.itemType;
	}
	
	public void setBuyingPrice(double buyingPrice) {
		this.buyingPrice = buyingPrice;
	}
	
	public double getBuyingPrice() {
		return this.buyingPrice;
	}
	
	public void setSellingPrice(double sellingPrice) {
		this.sellingPrice = sellingPrice;
	}
	
	public double getSellingPrice() {
		return this.sellingPrice;
	}
	
	

}
