package com.DatabaseHandle;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Customer_Order_SELECT {
	private Connection c;
	public ResultSet rs;
	private PreparedStatement psco = null;
	private String query;
	private String id;
	private String cus_name;
	
	public Customer_Order_SELECT(Connection c,String query,String id)
	{
		this.id =  id;
		
		this.c =  c;
		this.query = query;
	}
	
	public ResultSet get_customer_order_table()
	{
		try {
			
			psco =  c.prepareStatement(query);
			psco.setString(1, id);
			
			rs = psco.executeQuery();
			
		
		}catch (Exception e) {
			System.out.println(e);
		}
	
		return rs;
	}

}
