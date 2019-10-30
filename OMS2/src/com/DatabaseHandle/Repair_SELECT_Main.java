package com.DatabaseHandle;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Repair_SELECT_Main {
	
	private Connection c;
	public ResultSet rs;
	private String query;
	private PreparedStatement prs = null;
	
	
	
	public Repair_SELECT_Main(Connection c,String query)
	{
		
		this.c =  c;
		this.query = query;
	
	}
	
	public ResultSet get_repair_table()
	{
		try {
			prs  = c.prepareStatement(query);
			
			rs = prs.executeQuery();
			
			
		
		}catch (Exception e) {
			System.out.println(e);
		}
		
		return rs;
	}
	

}
