package com.DatabaseHandle;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class Payment_SELECT {
	private Connection c;
	public ResultSet rs;
	private PreparedStatement pss = null;
	private String query;
	
	
	
	
	public Payment_SELECT(Connection c,String query)
	{

		this.c =  c;
		this.query = query;
	}
	
	public ResultSet get_payment_table()
	{
		try {
			
			pss =  c.prepareStatement(query);

			rs = pss.executeQuery();
			
		
		}catch (Exception e) {
			System.out.println(e);
		}
	
		return rs;
	}

}
