package com.DatabaseHandle;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Emp_Update {
	private Connection c;
	public ResultSet rs;
	private PreparedStatement ps = null;
	private String query;
	private String emp_name, emp_address, emp_gender, emp_birth, emp_phone, emp_type, emp_email;
	private int emp_id;

	public Emp_Update(Connection c, String query, String emp_name, String emp_address, String emp_gender,
			String emp_birth, String emp_phone, String emp_type, String emp_email ,Integer emp_id) {

		this.emp_name = emp_name;
		this.emp_address = emp_address;
		this.emp_gender = emp_gender;
		this.emp_birth = emp_birth;
		this.emp_phone = emp_phone;
		this.emp_type = emp_type;
		this.emp_email = emp_email;
		this.emp_id = emp_id;

		this.c = c;
		this.query = query;

	}


	public void update_Emp_table() {
		try {

			ps = c.prepareStatement(query);
			/* ps.setInt(1, emp_id); */
			ps.setString(1, emp_name);
			ps.setString(2, emp_address);
			ps.setString(3, emp_gender);
			ps.setString(4, emp_birth);
			ps.setString(5, emp_phone);
			ps.setString(6, emp_type);
			ps.setString(7, emp_email);
			
			 ps.setInt(8, emp_id); 

			ps.executeUpdate();

		} catch (Exception e) {
			System.out.println(e);
		}

	}

}
