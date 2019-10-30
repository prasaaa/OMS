package com.DatabaseHandle;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class Repair_INSERT {
	
	private Connection c;
	public ResultSet rs;
	private PreparedStatement ps = null;
	private String query,querypayment;
	private String cusOrdId;
	private String error;
	
	//(c, query, customerid, error);
	public Repair_INSERT(Connection c,String query,String cusOrdId,String error)
	{
		this.cusOrdId = cusOrdId;
		this.error = error;
		this.c =  c;
		this.query = query;
	}
	
	public void insert_repair_table()
	{
		try {
			String timeStamp = new SimpleDateFormat("yyyy_MM_dd_HH_mm_ss").format(Calendar.getInstance().getTime());
			String orderid_combine =  cusOrdId + timeStamp;
			String order_Date =  new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
			ps =  c.prepareStatement(query);
			ps.setString( 1,orderid_combine);
			ps.setString(2,order_Date);
			ps.setString(3,error);
			ps.setString(4,cusOrdId);
			ps.execute();
			
			
			
			
			
		}catch (Exception e) {
			System.out.println(e);
		}
		
		
		
	}

}
