package com.DatabaseHandle;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Inventory_INSERT {

	private Connection c;
	private PreparedStatement ps = null;
	private String query;
	ResultSet rs = null;

	public Inventory_INSERT(Connection c, String query) {

		this.c = c;
		this.query = query;
	}

	public boolean Insert_Item(String modelName, String manufacturer, String supplier, String itemType, double bppitem,
			double sppitem) {
		try {

			ps = c.prepareStatement(query);
			ps.setString(1, modelName);
			ps.setString(2, manufacturer);
			ps.setString(3, supplier);
			ps.setString(4, itemType);
			ps.setDouble(5, bppitem);
			ps.setDouble(6, sppitem);

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

	public boolean InsertStock(String itemID, long quantity, String stockINDate, String remarks) {

		try {

			ps = c.prepareStatement(query);
			ps.setString(1, itemID);
			ps.setLong(2, quantity);
			ps.setString(3, stockINDate);
			ps.setString(4, remarks);

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

	public boolean InsertItemList(String itemID, String stockID, String barcodeNumber, String itemModel) {
		try {
			ps = c.prepareStatement(query);

			ps.setString(1, itemID);
			ps.setString(2, stockID);
			ps.setString(3, barcodeNumber);
			ps.setString(4, itemModel);
			
			ps.execute();

			return true;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;
	}

	public boolean InsertStock(String model, long quantity, String date, String customerID, String remarks) {
		try {
			ps = c.prepareStatement(query);

			ps.setString(1, model);
			ps.setLong(2, quantity);
			ps.setString(3, date);
			ps.setString(4, customerID);
			ps.setString(5, remarks);

			ps.execute();

			return true;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;
	}
	
	public boolean InsertItemModel(String model) {
		try {
			ps = c.prepareStatement(query);

			ps.setString(1, model);

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
