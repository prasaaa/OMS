package com.DatabaseHandle;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Cus_Details_Update {
	private Connection c;
	public ResultSet rs;
	private PreparedStatement ps = null;
	private String query;
	private String customer_Id, customer_Name, location, branch;

	public Cus_Details_Update(Connection c, String query, String customer_Name, String location, String branch,
			String customer_Id) {

		this.customer_Name = customer_Name;
		this.location = location;
		this.branch = branch;
		this.customer_Id = customer_Id;

		this.c = c;
		this.query = query;

	}

	public void update_Cus_Details_table() {
		try {
			ps = c.prepareStatement(query);
			ps.setString(1, customer_Name );
			ps.setString(2, location);
			ps.setString(3, branch);
			ps.setString(4, customer_Id);
			
			ps.executeUpdate();

			/*
			 * ps = c.prepareStatement(query); ps.setInt(1, emp_id); ps.setString(1,
			 * customer_Name); ps.setString(2, location); ps.setString(3, branch);
			 * ps.setString(4, customer_Id);
			 * 
			 * ps.setString(5, emp_phone); ps.setString(6, emp_type); ps.setString(7,
			 * emp_email);
			 * 
			 * ps.setInt(8, emp_id);
			 * 
			 * ps.executeUpdate();
			 */

		} catch (Exception e) {
			System.out.println(e);
		}

	}

}
