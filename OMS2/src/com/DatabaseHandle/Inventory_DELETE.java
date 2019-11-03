package com.DatabaseHandle;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class Inventory_DELETE {

    private Connection c;
    private PreparedStatement ps = null;
    private ResultSet rs = null;
    private String query;

    public Inventory_DELETE(Connection c, String query) {

        this.c = c;
        this.query = query;
    }


    public int deleteQueryData(String args) {

        int rowCount = 0;

        try {

            ps = c.prepareStatement(query);
            ps.setString(1, args);


            rowCount = ps.executeUpdate();


        } catch (Exception e) {
            System.out.println(e);
        }

        return rowCount;
    }

    public int updateQueryData(String args) {

        int rowCount = 0;

        try {

            ps = c.prepareStatement(query);
            ps.setString(1, args);


            rowCount = ps.executeUpdate();


        } catch (Exception e) {
            System.out.println(e);
        }

        return rowCount;
    }

    public ResultSet retreiveID(String args) {

        try {

            ps = c.prepareStatement(query);
            ps.setString(1, args);


            rs = ps.executeQuery();


        } catch (Exception e) {
            System.out.println(e);
        }

        return rs;
    }
}
