package com.DatabaseHandle;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.DBConnection.ConnectionManager;

public class LoginDao {
	 
public String authenticateUser(LoginBean loginBean)
{
 String userName = loginBean.getUserName();
 String password = loginBean.getPassword();
 
 Connection con = null;
 Statement statement = null;
 ResultSet resultSet = null;
 
 String emp_email = "";
 String emp_password = "";
 String emp_type = "";
 
 try
 {
	 con = ConnectionManager.getConnection();
			/* con = DBConnection.createConnection(); */
 statement = con.createStatement();
 resultSet = statement.executeQuery("select emp_email,emp_password,emp_type from emp");
 
 while(resultSet.next())
 {
	 emp_email = resultSet.getString("emp_email");
	 emp_password = resultSet.getString("emp_password");
	 emp_type = resultSet.getString("emp_type");
 
 if(userName.equals(emp_email) && password.equals(emp_password) && emp_type.equals("Admin"))
	 return "Admin_Role";
 else if(userName.equals(emp_email) && password.equals(emp_password) && emp_type.equals("Manager"))
	 return "Editor_Role";
 else if(userName.equals(emp_email) && password.equals(emp_password) && emp_type.equals("Accountant"))
	 return "Accountant";				
 }
 }
 catch(SQLException e)
 {
 e.printStackTrace();
 }
 return "Invalid user credentials";
}
}