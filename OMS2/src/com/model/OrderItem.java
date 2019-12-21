package com.model;

public class OrderItem extends CustomerOrder {

    private String itemID;
    private int needs;
    private int quantity;


    public OrderItem(String customerOrderID, String customerName, String location, String branch) {
        super(customerOrderID, customerName, location, branch);
    }

    public String getItemID() {
        return itemID;
    }

    public void setItemID(String itemID) {
        this.itemID = itemID;
    }

    public int getNeeds() {
        return needs;
    }

    public void setNeeds(int needs) {
        this.needs = needs;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
