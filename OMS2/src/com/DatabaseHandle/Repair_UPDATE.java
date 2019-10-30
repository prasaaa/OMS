package com.DatabaseHandle;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.Controller.Repair_UPDATE_Controller;

public class Repair_UPDATE {
	
	private Connection c;
	public ResultSet rs;
	private PreparedStatement ps = null;
	private String query;
	private String cusOrdId;
	private String repairId;
	private String orderdate;
	private String error;

	
	
	public Repair_UPDATE(Connection c,String query,String orderdate,String error,String cusid)
	//coniu,query,orderdate,error,cusOrdId,sessionId);

	{
		 
		
		this.c =  c;
		this.query = query;
		
		this.orderdate = orderdate;
		this.error = error;
		cusOrdId = cusid;
	}
	
	public void update_repair_table()
	{
		try {
			
			ps =  c.prepareStatement(query);
			
			
			ps.executeUpdate();
			
		
		}catch (Exception e) {
			System.out.println(e);
		}
		
		
	}

}
