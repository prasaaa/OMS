package com.DatabaseHandle;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Inventory_INSERT {

    ResultSet rs = null;
    private Connection c;
    private PreparedStatement ps = null;
    private String query;

    public Inventory_INSERT(Connection c, String query) {

        this.c = c;
        this.query = query;
    }

    public boolean checkAvailability(String barcodeNumber) {
        try {
            ps = c.prepareStatement(query);
            ps.setString(1, barcodeNumber);

            rs = ps.executeQuery();

            if (rs.next()) {
                rs.close();
                return false;
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                ps.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }


        return true;
    }

    public boolean checkAvailability(String barcodeNumber, String stockINID) {
        try {
            ps = c.prepareStatement(query);
            ps.setString(1, barcodeNumber);
            ps.setString(2, stockINID);

            rs = ps.executeQuery();

            if (rs.next()) {
                rs.close();
                return false;
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                ps.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }


        return true;
    }

    public boolean Insert_Item(String itemID, String modelName, String manufacturer, String itemType, double sppitem) {
        try {

            ps = c.prepareStatement(query);

            ps.setString(1, itemID);
            ps.setString(2, modelName);
            ps.setString(3, manufacturer);
            ps.setString(4, itemType);
            ps.setDouble(5, sppitem);

            ps.execute();

            return true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    public String getItemID(String modelName, String manufacturer, String supplier) {

        String itemID = "";

        try {
            ps = c.prepareStatement(query);
            ps.setString(1, modelName);
            ps.setString(2, manufacturer);
            ps.setString(3, supplier);

            rs = ps.executeQuery();

            if (rs.next()) {

                itemID = rs.getString(1);

            }

            return itemID;

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                rs.close();
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }

        return itemID;

    }

    public boolean InsertStock(String stockID, String stockINDate, String remarks, String itemID) {

        try {

            ps = c.prepareStatement(query);
            ps.setString(1, stockID);
            ps.setString(2, stockINDate);
            ps.setString(3, remarks);
            ps.setString(4, itemID);

            ps.execute();

            return true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;

    }

    public String getStockID(String itemID) {

        String stockID = "";

        try {
            ps = c.prepareStatement(query);

            ps.setString(1, itemID);
            ps.setString(2, itemID);

            rs = ps.executeQuery();

            if (rs.next()) {

                stockID = rs.getString(1);

            }


            return stockID;

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                rs.close();
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }

        return stockID;
    }

    public long getQuantity(String stockID) {

        long quantity = 0;

        try {
            ps = c.prepareStatement(query);

            ps.setString(1, stockID);

            rs = ps.executeQuery();

            if (rs.next()) {

                quantity = rs.getLong(1);

            }

            return quantity;


        } catch (Exception e) {
            e.printStackTrace();
        }

        return quantity;
    }

    public boolean InsertItemList(String itemID, String barcodeNumber, String itemStatus, String description, String stockID) {
        try {
            ps = c.prepareStatement(query);

            ps.setString(1, itemID);
            ps.setString(2, barcodeNumber);
            ps.setString(3, itemStatus);
            ps.setString(4, description);
            ps.setString(5, stockID);


            ps.execute();

            return true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    public boolean InsertStockOUT(String stockOutID, String custOrderID, String itemID, String stockOUTDate, String remarks) {
        try {
            ps = c.prepareStatement(query);

            ps.setString(1, stockOutID);
            ps.setString(2, custOrderID);
            ps.setString(3, itemID);
            ps.setString(4, stockOUTDate);
            ps.setString(5, remarks);

            ps.execute();

            return true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    public boolean InsertItemSupplier(String itemID, String supplerId, double buyingPrice) {
        try {
            ps = c.prepareStatement(query);

            ps.setString(1, itemID);
            ps.setString(2, supplerId);
            ps.setDouble(3, buyingPrice);

            ps.execute();

            return true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    public List<String> getBarcodeList(String itemID) {

        List<String> list = new ArrayList<>();

        try {

            ps = c.prepareStatement(query);

            ps.setString(1, itemID);

            rs = ps.executeQuery();

            if (rs.first()) {

                do {
                    list.add(rs.getString(1));
                } while (rs.next());
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                rs.close();
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }

        return list;

    }

}
