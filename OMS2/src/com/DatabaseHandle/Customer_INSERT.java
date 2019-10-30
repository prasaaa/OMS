package com.DatabaseHandle;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Customer_INSERT {
	
	private Connection c;
	private PreparedStatement ps = null;
	private String query,id,name,loc,branch;
	
	

	public Customer_INSERT(Connection c, String query,String name,String loc,String branch) {

		this.c = c;
		this.query = query;
		this.name =  name;
		this.loc = loc;
		this.branch = branch;
	}

	public void insert_customer_table() {

		try {

			ps = c.prepareStatement(query);
			ps.setString(1,name +"_"+branch);
			ps.setString(2, name);
			ps.setString(3, loc);
			ps.setString(4, branch);
			ps.execute();

		} catch (Exception e) {
			System.out.println(e);
		}

	}

}
