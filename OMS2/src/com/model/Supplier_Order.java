package com.model;

import java.sql.ResultSet;

public class Supplier_Order {
	private static ResultSet sr = null;
	private static String inuse = "";
	private static String Customer_order_id = "";

	public static ResultSet getSr() {
		return sr;
	}

	public static void setSr(ResultSet sr) {
		Supplier_Order.sr = sr;
	}

	public static String getInuse() {
		return inuse;
	}

	public static void setInuse(String inuse) {
		Supplier_Order.inuse = inuse;
	}

	public static String getCustomer_order_id() {
		return Customer_order_id;
	}

	public static void setCustomer_order_id(String customer_order_id) {
		Customer_order_id = customer_order_id;
	}
	

}
