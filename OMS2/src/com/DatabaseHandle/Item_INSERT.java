package com.DatabaseHandle;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Item_INSERT {
	private Connection coni;
	public ResultSet rs;
	private PreparedStatement ps = null;
	private String query;
	private String item_model_name, item_manufacturer, item_type, item_details,item_id,item_supplier;

	public Item_INSERT(Connection coni, String query, String item_id,String item_model_name, String item_manufacturer,String item_supplier,
			String item_type, String item_details ) {
		
		this.item_id =item_id;
		this.item_model_name = item_model_name;
		this.item_manufacturer = item_manufacturer;
		this.item_supplier = item_supplier;
		this.item_type = item_type;
		this.item_details = item_details;
		
		
		this.coni = coni;
		this.query = query;
		System.out.println("getid"+item_id);
	}
	

	public void insert_item_table() {
		try {

			
			ps = coni.prepareStatement(query);
			ps.setString(1, item_id);
			ps.setString(2, item_model_name);
			ps.setString(3, item_manufacturer);
			ps.setString(4, item_supplier);
			ps.setString(5, item_type);
			ps.setString(6, item_details);
			
		
			

			ps.execute();

		} catch (Exception e) {
			System.out.println(e);
		}

	}

}