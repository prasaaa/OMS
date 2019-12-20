package com.DatabaseHandle;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class Payment_INSERT {
	private Connection c;
	public ResultSet rs;
	private PreparedStatement psp = null;
	private String supplier_id_Combine , order_Date,query,sup_type;
	private Double tot_price;
	
	
	
	public Payment_INSERT(Connection c,String query)
	{
		
		this.c =  c;
		this.query = query;
	}
	
	public void setsupplierpaymentdetails(String id,String date,Double tot)
	{
		this.supplier_id_Combine = id;
		this.order_Date = date;
		this.tot_price = tot;
		
	}
	
	public void insert_supplier_payment_table(String sup_type)
	{
		
		try {
			
			psp =  c.prepareStatement(query);
			psp.setString(1, supplier_id_Combine);
			psp.setString(2, order_Date);
			psp.setDouble(3,tot_price);
			psp.setString(4, "pending");
			if(sup_type.equals("I"))
			{
				psp.setString(5, "supplier_import");
			}
			else
			{
				psp.setString(5, "supplier_local");
			}
			psp.execute();
			//INSERT into supplier payment import table
			query = "INSERT INTO supplier_payment_import_table(payment_Id,supplier_order_im_id) VALUES(?,?)" ;
			psp =  c.prepareStatement(query);
			psp.setString(1,supplier_id_Combine);
			psp.setString(2,supplier_id_Combine );
			psp.execute();
		
		}catch (Exception e) {
			System.out.println(e);
		}
		
		
	}
	public void insert_customer_payment()
	{
		
	}

}
