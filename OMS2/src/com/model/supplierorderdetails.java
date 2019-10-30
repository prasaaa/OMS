package com.model;

public class supplierorderdetails {
	private String supplier_order_id;
	private String orderdate;
	private String recievedate;
	private String Supplierid;
	private String type;
	public supplierorderdetails(String supplier_order_id, String orderdate, String recievedate, String supplierid,String type) {
		
		this.supplier_order_id = supplier_order_id;
		this.orderdate = orderdate;
		this.recievedate = recievedate;
		this.type =  type;
		Supplierid = supplierid;
	}
	
	
	public supplierorderdetails() {
		super();
	}


	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getSupplier_order_id() {
		return supplier_order_id;
	}
	public void setSupplier_order_id(String supplier_order_id) {
		this.supplier_order_id = supplier_order_id;
	}
	public String getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(String orderdate) {
		this.orderdate = orderdate;
	}
	public String getRecievedate() {
		return recievedate;
	}
	public void setRecievedate(String recievedate) {
		this.recievedate = recievedate;
	}
	public String getSupplierid() {
		return Supplierid;
	}
	public void setSupplierid(String supplierid) {
		Supplierid = supplierid;
	}
	
	
	

}
