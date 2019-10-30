package com.DatabaseHandle;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class Payment_UPDATE {
	private Connection c;
	public ResultSet rs;
	private PreparedStatement ps = null;
	private String query;
	
	
	
	public Payment_UPDATE(Connection c,String query)
	{
		
		
		this.c =  c;
		this.query = query;
		
	}
	
	public void update_payment_table()
	{
		try {
			
			ps =  c.prepareStatement(query);
			
			ps.executeUpdate();
			
		
		}catch (Exception e) {
			System.out.println(e);
		}
		
		
	}

}
