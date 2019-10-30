package com.model;

public class Items extends ItemList {
	
	private String barcodeNumber;
	private String itemStatus;
	
	public Items() {
		super();
	}
	
	public void setBarcode(String barcodeNumber) {
		this.barcodeNumber = barcodeNumber;
	}
	
	public String getBarcode() {
		return this.barcodeNumber;
	}

	public String getItemStatus() {
		return itemStatus;
	}

	public void setItemStatus(String itemStatus) {
		this.itemStatus = itemStatus;
	}

}
