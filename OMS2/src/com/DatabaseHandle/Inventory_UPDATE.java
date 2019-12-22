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


    public long updateStock(String stockINDate, String remarks, String itemID, String stockINID) {

        long rowCount = 0;

        try {

            ps = c.prepareStatement(query);
            ps.setString(1, stockINDate);
            ps.setString(2, remarks);
            ps.setString(3, itemID);
            ps.setString(4, stockINID);


            rowCount = ps.executeUpdate();


        } catch (Exception e) {
            System.out.println(e);
        }

        return rowCount;
    }


}
