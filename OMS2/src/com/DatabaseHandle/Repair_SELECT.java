package com.DatabaseHandle;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Repair_SELECT {

	
	private Connection c;
	public ResultSet rs;
	private String query;
	private PreparedStatement prs = null;
	private int cusOrdId;
	private int repairId;
	private int startDate;
	private int endDate;
	
	
	public Repair_SELECT(Connection c,String query)
	{
		
		this.c =  c;
		this.query = query;
		 
	}
	
	public ResultSet get_repair_table()
	{
		try {
			prs  = c.prepareStatement(query);
			prs.setInt(1,cusOrdId);
			prs.setInt(2, repairId);
			prs.setInt(3,startDate);
			prs.setInt(4,endDate);
			rs = prs.executeQuery();
			
			
		
		}catch (Exception e) {
			System.out.println(e);
		}
		
		return rs;
	}
	
}
