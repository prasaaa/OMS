package com.model;

import java.text.SimpleDateFormat;
import java.util.Calendar;

public class payment {
	
	private String paymentid;
	private String paydate;
	private double price;
	private String status;
	private String type;
	private String due_date;
	
	
	
	
	
	public payment(String paymentid, String price, String status, String type, String due_date) {
		
		this.paymentid = paymentid;
        paydate = new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
        this.price = Double.parseDouble(price);
		this.status = status;
		this.type = type;
		this.due_date = due_date;
	}
	
	
	
	public payment() {
		
	}



	public String getPaymentid() {
		return paymentid;
	}
	public void setPaymentid(String paymentid) {
		this.paymentid = paymentid;
	}
	public String getPaydate() {
		return paydate;
	}
	public void setPaydate(String paydate) {
		this.paydate = paydate;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getDue_date() {
		if(due_date.equals(null))
		{
			return null;
		}
		else
		{
		return due_date;
		}
	}
	public void setDue_date(String due_date) {
		this.due_date = due_date;
	}
	
	
	

}
