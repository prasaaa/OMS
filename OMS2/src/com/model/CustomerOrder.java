package com.model;

public class CustomerOrder {

    private String customerOrderID;
    private String customerName;
    private String location;
    private String branch;
    private OrderItem[] orders;

    public CustomerOrder() {
    }

    public CustomerOrder(String customerOrderID, String customerName, String location, String branch) {
        this.customerOrderID = customerOrderID;
        this.customerName = customerName;
        this.location = location;
        this.branch = branch;
    }

    public String getCustomerOrderID() {
        return customerOrderID;
    }

    public void setCustomerOrderID(String customerOrderID) {
        this.customerOrderID = customerOrderID;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getBranch() {
        return branch;
    }

    public void setBranch(String branch) {
        this.branch = branch;
    }

    public OrderItem[] getOrders() {
        return orders;
    }

    public void setOrders(OrderItem[] orders) {
        this.orders = orders;
    }
}
