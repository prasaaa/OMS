package com.DatabaseHandle;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class Emp_SELECT {
	private Connection c;
	public ResultSet rs;
	private Statement cs = null;
	private String query;

	public Emp_SELECT(Connection c, String query) {

		this.c = c;
		this.query = query;
	}

	public ResultSet get_Emp_table() {
		try {

			cs = c.createStatement();
			rs = cs.executeQuery(query);

		} catch (Exception e) {
			System.out.println(e);
		}

		return rs;
	}

}
