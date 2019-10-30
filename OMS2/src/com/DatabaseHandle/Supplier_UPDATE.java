package com.DatabaseHandle;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class Supplier_UPDATE {
	
	private Connection c;
	public ResultSet rs;
	private Statement cs = null;
	private String query;
	
	
	public Supplier_UPDATE(Connection c,String query)
	{		
		this.c =  c;
		this.query = query;
	}
	
	public void get_supplier_table()
	{
		try {
			
			cs =  c.createStatement();
			cs.executeUpdate(query);
		
		}catch (Exception e) {
			System.out.println(e);
		}
		
		
	}

}
