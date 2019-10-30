package com.model;

public class Repairdetails {
	private String repairid=null; 
    private String orderdate=null;
    private String error=null;
    private String Customerid=null;
    
    
	public Repairdetails(String repairid, String orderdate, String error, String customerid) {
		
		this.repairid = repairid;
		this.orderdate = orderdate;
		this.error = error;
		Customerid = customerid;
	}
	public String getRepairid() {
		return repairid;
	}
	public void setRepairid(String repairid) {
		this.repairid = repairid;
	}
	public String getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(String orderdate) {
		this.orderdate = orderdate;
	}
	public String getError() {
		return error;
	}
	public void setError(String error) {
		this.error = error;
	}
	public String getCustomerid() {
		return Customerid;
	}
	public void setCustomerid(String customerid) {
		Customerid = customerid;
	}
    
    
    

}
