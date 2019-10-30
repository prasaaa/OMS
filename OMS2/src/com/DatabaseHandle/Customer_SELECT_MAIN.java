package com.DatabaseHandle;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class Customer_SELECT_MAIN {

	private Connection c;
	public ResultSet rs;
	private Statement cs = null;
	private String query;
	
	
	public Customer_SELECT_MAIN(Connection c,String query)
	{
		
		this.c =  c;
		this.query = query;
	}
	
	public ResultSet get_customer_order_table()
	{
		try {
			
			cs =  c.createStatement();
			rs =  cs.executeQuery(query);
		
		}catch (Exception e) {
			System.out.println(e);
		}
		
		return rs;
	}
}
