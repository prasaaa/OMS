package com.DBConnection;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionManager {

    private static String url = "jdbc:mysql://localhost:3306/omsdb";
    private static String drivername = "com.mysql.jdbc.Driver";
    private static String username = "root";
    private static String password = "prasa@123";
    private static Connection con;

    public static Connection getConnection() {
        //establishing the connection
        try {

            Class.forName(drivername);
            con = DriverManager.getConnection(url, username, password);

        } catch (Exception e) {
            System.out.println("an error in connection in connection manager class");
        }


        return con;
    }
}
