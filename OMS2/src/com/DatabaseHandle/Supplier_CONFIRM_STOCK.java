package com.DatabaseHandle;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.HashMap;
import java.util.Map;

import com.model.Supplier_Order;

public class Supplier_CONFIRM_STOCK {
	private PreparedStatement pcoiu;
	private String query;
	private Connection ccou;
	private HashMap<String, Integer> itemstoreupdate ;
	private String customerorderid;
	//(csoi, store_item_details, Supplier_Order.getCustomer_order_id()
	
	
	
	
	public Supplier_CONFIRM_STOCK(Connection ccou, HashMap<String, Integer> itemstoreupdate, String customerorderid) {
		super();
		this.ccou = ccou;
		this.itemstoreupdate = itemstoreupdate;
		this.customerorderid =  customerorderid;
	}




	public void updatesuplierorderimportitemstable()
	{
		try {
		for(Map.Entry<String,Integer> itemDetailupdate: itemstoreupdate.entrySet())
		{
			query = "UPDATE customer_order_table SET item_status = 'enough' where customer_Order_Id = '" + customerorderid+"'";
			pcoiu =  ccou.prepareStatement(query);				
		    pcoiu.executeUpdate();
			
			query =  "UPDATE customer_order_items_table SET need = NULL WHERE customer_Order_Id = ? AND item_Details_Id = ?";
			pcoiu =  ccou.prepareStatement(query);
			pcoiu.setString(1, customerorderid);
			pcoiu.setString(2, itemDetailupdate.getKey());							
			pcoiu.executeUpdate();
			
			
		}
		}catch(Exception e)
		{
			System.out.println("error in Supplier_CONFIRM_STOCK " + e);
		}

	}

}
