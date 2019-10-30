package com.model;

public class InventoryStock {
	
	private ItemList itemList;
	private String stockINDate;
	private String remarks;
	private long quantity;
	
	
	public InventoryStock() {
	}
	
	public void setItemList(ItemList itemList) {
		this.itemList = itemList;
	}
	
	public ItemList getItemList() {
		return this.itemList;
	}
	
	public void setDate(String stockINDate) {
		this.stockINDate = stockINDate;
	}
	
	public String getDate() {
		return this.stockINDate;
	}
	
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	
	public String getRemarks() {	
		return this.remarks;
	}
	
	public void setQuantity(long quantity) {
		this.quantity = quantity;
	}
	
	public long getQuantity() {
		return this.quantity;
	} 
	
	
	
	
}
