package com.DatabaseHandle;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import com.itextpdf.text.log.SysoLogger;



public class Customer_order_INSERT {
	private Connection ccoi;
	public ResultSet rs;
	private PreparedStatement pcoi = null;
	private HashMap<String, Integer> items = new HashMap<String, Integer>();
	private String customer_Id;
	private String required_Date;
	private String query;
	private String customer_id_Combine;
	private String customer_order_type;
	//private String customer_Order_Id;
	private String order_Date;
	private String order_Status;
	private String order_Type;
	private int remain= 0;
	private String status;
	private double tot;
	
	public  Customer_order_INSERT(Connection c, String customer_Id, String required_Date,HashMap<String, Integer> item_save,String type,double tot)
	{
		this.ccoi =  c;
		this.customer_Id = customer_Id;
		this.required_Date = required_Date;
		this.items.putAll(item_save);
		this.customer_order_type =  type;
		this.tot = tot;
	}
	
	public void insert_customer_order_table()
	{
		System.out.println("this is order type " + customer_order_type);
		try {
			String timeStamp = new SimpleDateFormat("yyyy_MM_dd_HH_mm_ss").format(Calendar.getInstance().getTime());
			customer_id_Combine =  customer_Id + timeStamp;
			order_Date =  new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
			query = "INSERT INTO customer_order_table(customer_Order_Id,customer_Id,order_Date,required_Date,order_Status,order_Type) VALUES(?,?,?,?,?,?)";
			pcoi =  ccoi.prepareStatement(query);
			pcoi.setString(1, customer_id_Combine);
			pcoi.setString(2, customer_Id);
			pcoi.setString(3, order_Date);
			pcoi.setString(4, required_Date);
			pcoi.setString(5, order_Status);
			pcoi.setString(6, customer_order_type);
			pcoi.execute();
			
			
			String currenttime =  new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
			//customer_id_Combine =  customer_Id + timeStamp;
			System.out.println("customer id combine  " + customer_id_Combine);
			System.out.println("required date " + required_Date);
			System.out.println("order type " + customer_order_type);
			System.out.println("current  date " + currenttime);
		
		}catch(Exception e)
		{
			System.out.println(e);
		}
		try {
			for(Map.Entry<String,Integer> itemDetail: items.entrySet())
			{
				query =  "INSERT INTO customer_order_items_table (customer_Order_Id, item_Details_Id,quantity) VALUES (?,?,?)";
				pcoi =  ccoi.prepareStatement(query);
				pcoi.setString(1, customer_id_Combine);
				pcoi.setString(2, itemDetail.getKey());
				pcoi.setInt(3, itemDetail.getValue());				
				pcoi.execute();
			}

		
		}catch (Exception e) {
			System.out.println(e);
	}
		try {
			//checking the stock availability
			status =  "not_checked";
			for(Map.Entry<String,Integer> itemDetail: items.entrySet())
			{
				query =  "SELECT COUNT(item_id) FROM items_list_table WHERE item_id = '"+itemDetail.getKey()+"' AND stock_out_id IS NULL AND customer_Order_Id IS NULL";
				pcoi =  ccoi.prepareStatement(query);				
				rs =  pcoi.executeQuery();
				while(rs.next())
				{
					if(rs.getInt(1) == 0 && !status.equals("not_checked") && rs.getInt(1) < itemDetail.getValue())
					{
						query = "UPDATE customer_order_table SET item_status = 'Not_enough' where customer_Order_Id = '" + customer_id_Combine+"'";
						status = "checked";
						pcoi =  ccoi.prepareStatement(query);				
					    pcoi.executeUpdate();
					}
					else if(rs.getInt(1) < itemDetail.getValue())
					{
						
						query = "UPDATE customer_order_table SET item_status = 'Not_enough' where customer_Order_Id = '" + customer_id_Combine+"'";
						status = "checked";
						pcoi =  ccoi.prepareStatement(query);				
					    pcoi.execute();
					    
						remain = itemDetail.getValue() - rs.getInt(1);
						query = "UPDATE customer_order_items_table SET need = "+remain+"  where customer_Order_Id = '" + customer_id_Combine+"' AND item_Details_Id = '"+itemDetail.getKey()+"'";
						pcoi =  ccoi.prepareStatement(query);				
					    pcoi.execute();
					}
					else
					{
						remain = itemDetail.getValue() - rs.getInt(1);
						query = "UPDATE  customer_order_items_table  SET need = 0 where customer_Order_Id = '" + customer_id_Combine+"' AND item_id = '"+itemDetail.getKey()+"'";
						pcoi =  ccoi.prepareStatement(query);				
					    pcoi.execute();
					}
				}
				if(status.equals("not_checked"))
				{
					query = "UPDATE customer_order_table SET item_status = 'enough' where customer_Order_Id = '" + customer_id_Combine+"'";
					
					pcoi =  ccoi.prepareStatement(query);				
				    pcoi.execute();
				}
			}
			
		}catch (Exception e) {
			System.out.println("error in stock available catch " + e);
		}
		

	}
	

}
