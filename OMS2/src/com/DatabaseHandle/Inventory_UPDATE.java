package com.DatabaseHandle;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Inventory_UPDATE {
	private Connection c;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	private String query;

	public Inventory_UPDATE(Connection c, String query) {

		this.c = c;
		this.query = query;
	}

	

	
	public long updateStatus(String model, String stockOutID, long quantity) {
		
		long rowCount = 0;
	
		try {

			ps =  c.prepareStatement(query);
			ps.setString(1, model);
			ps.setString(2, stockOutID);
			ps.setLong(3, quantity);
			
			
			rowCount = ps.executeUpdate();


		} catch (Exception e) {
			System.out.println(e);
		}

		return rowCount;
	}
	
	
}
