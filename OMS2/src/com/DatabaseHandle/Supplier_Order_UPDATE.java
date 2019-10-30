package com.DatabaseHandle;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Supplier_Order_UPDATE {

	
    private String query;
    private Connection c;
	public ResultSet rs;
	private PreparedStatement ps = null;
	
    public Supplier_Order_UPDATE(Connection c,String query)
	{
		
		
		this.c =  c;
		this.query = query;
		
	}
	
	public void update_supplier_order_table()
	{
		try {
			
			ps =  c.prepareStatement(query);
			
			ps.executeUpdate();
			
		
		}catch (Exception e) {
			System.out.println(e);
		}
		
		
	}

}
