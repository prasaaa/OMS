package com.DatabaseHandle;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Emp_INSERT {
	private Connection c;
	public ResultSet rs;
	private PreparedStatement ps = null;
	private String query;
	private String emp_name, emp_address, emp_gender, emp_birth, emp_phone, emp_type, emp_email,emp_password;

	public Emp_INSERT(Connection c, String query, String emp_name, String emp_address, String emp_gender,
			String emp_birth, String emp_phone, String emp_type, String emp_email,String emp_password) {

		this.emp_name = emp_name;
		this.emp_address = emp_address;
		this.emp_gender = emp_gender;
		this.emp_birth = emp_birth;
		this.emp_phone = emp_phone;
		this.emp_type = emp_type;
		this.emp_email = emp_email;
		this.emp_password = emp_password;

		this.c = c;
		this.query = query;
	}

	public void insert_Emp_table() {

		try {

			ps = c.prepareStatement(query);

			ps.setString(1, emp_name);
			ps.setString(2, emp_address);
			ps.setString(3, emp_gender);
			ps.setString(4, emp_birth);
			ps.setString(5, emp_phone);
			ps.setString(6, emp_type);
			ps.setString(7, emp_email);
			ps.setString(8, emp_password);

			ps.execute();

		} catch (Exception e) {
			System.out.println(e);
		}

	}

}
