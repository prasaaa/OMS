package com.DatabaseHandle;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Update_ItemDetails {
	private String item_id, item_model_name, item_manufacturer, item_type, item_details, item_supplier;
	private Double buying_price,selling_price;
	private Connection coni;
	private String query;
	public ResultSet rs;
	private PreparedStatement ps = null;

	public Update_ItemDetails(Connection coni, String query, String item_model_name,
			String item_manufacturer, String item_supplier, String item_type, String item_details,String item_id) {
	
		this.item_model_name = item_model_name;
		this.item_manufacturer = item_manufacturer;
		this.item_supplier = item_supplier;
		this.item_type = item_type;
		this.item_details = item_details;
		this.item_id = item_id;	

		this.coni = coni;
		this.query = query;
	}

	public void update_item_table() {
		try {

			ps = coni.prepareStatement(query);
			/* ps.setInt(1, emp_id); */
			ps.setString(1, item_model_name);
			ps.setString(2, item_manufacturer);
			ps.setString(3, item_supplier);
			ps.setString(4, item_type);
			ps.setString(5, item_details);
			ps.setString(6, item_id);
			

			ps.executeUpdate();

		} catch (Exception e) {
			System.out.println(e);
		}
		
	}

}
