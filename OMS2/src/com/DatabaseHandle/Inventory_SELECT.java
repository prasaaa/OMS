package com.DatabaseHandle;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;


public class Inventory_SELECT {

    private Connection c;
    private ResultSet rs;
    private Statement cs = null;
    private PreparedStatement ps = null;
    private String query;

    public Inventory_SELECT(Connection c, String query) {

        this.c = c;
        this.query = query;
    }


    public ResultSet get_inventory_table() {
        try {

            cs = c.createStatement();
            rs = cs.executeQuery(query);

        } catch (Exception e) {
            System.out.println(e);
        }

        return rs;
    }

    public ResultSet retreiveQueryData(String args) {

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
