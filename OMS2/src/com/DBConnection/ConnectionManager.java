package com.DBConnection;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionManager {

    private static Connection con;

    private ConnectionManager() {
    }


    public static synchronized Connection getConnection() {
        //establishing the connection
        try {

            String drivername = "com.mysql.jdbc.Driver";
            Class.forName(drivername);
            String url = "jdbc:mysql://localhost:3306/omsdb";
            String password = "root";
            String username = "root";


            con = DriverManager.getConnection(url, username, password);

        } catch (Exception e) {
            System.out.println("an error in connection in connection manager class");
        }


        return con;
    }
}
