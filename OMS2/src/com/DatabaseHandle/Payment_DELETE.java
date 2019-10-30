package com.DatabaseHandle;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.Controller.Payment_DELETE_Controller;

public class Payment_DELETE {
	private Connection c;
	public ResultSet rs;
	private PreparedStatement ps = null;
	private String query;
	private String payment_Id;
	private String sesname;
	
	public Payment_DELETE(Connection c,String query,String sesname)
	{
		
		this.sesname = sesname;
		this.c =  c;
		this.query = query;
		
	}
	
	public void delete_payment_table()
	{
		
	
		try {
			
			ps =  c.prepareStatement(query);
			ps.setString( 1,sesname);
			ps.executeUpdate();
			
		
		}catch (Exception e) {
			System.out.println(e);
		}
		
		
	}
}
