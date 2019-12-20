package com.DatabaseHandle;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

public class Supplier_Order_INSERT {
	private Connection ccoi;
	public ResultSet rs;
	private PreparedStatement pcoi = null;
	private HashMap<String, Integer> items = new HashMap<String, Integer>();
	private String supplier_Id;
	private String estimated_Date;
	private String query;
	private String supplier_id_Combine;
	private Double tot_price;
	private String sup_type;
	private Payment_INSERT pi = null ;
	
	
	//private String customer_Order_Id;
	private String order_Date;
	
	public  Supplier_Order_INSERT(Connection c, String supplier_Id, String estimated_Date,HashMap<String, Integer> item_save,Double buy_price,String sup_type)
	{
		this.ccoi =  c;
		this.supplier_Id = supplier_Id;
		this.estimated_Date = estimated_Date;
		this.items.putAll(item_save);
		tot_price = buy_price;
		this.sup_type =  sup_type;
		
	}
	
	public void insert_supplier_order_table()
	{
		try {
			String timeStamp = new SimpleDateFormat("yyyy_MM_dd_HH_mm_ss").format(Calendar.getInstance().getTime());
			order_Date =  new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
			
			
				
			//INSERT INTO SUPPLIER TABLE
			System.out.println("came to import");
			System.out.println("this is the order date " + order_Date);
			supplier_id_Combine =  supplier_Id + timeStamp+ "_im";
			
			query = "INSERT INTO supplier_order_import_table(supplier_order_im_id,order_date,recieve_date,supplier_id) VALUES(?,?,?,?)";
			pcoi =  ccoi.prepareStatement(query);
			pcoi.setString(1, supplier_id_Combine);
			pcoi.setString(2, order_Date);
			pcoi.setString(3, estimated_Date);
			pcoi.setString(4, supplier_Id);
			pcoi.execute();
			System.out.println("came after insert supplier table");
			
			//insert into main payment table
			query = "INSERT INTO payment_table(payment_Id,pay_date,price,status,type) VALUES(?,?,?,?,?)";
			pi =  new Payment_INSERT(ccoi, query);
			pi.setsupplierpaymentdetails("pay_" + supplier_id_Combine, order_Date, tot_price);
			pi.insert_supplier_payment_table(sup_type);
			
			System.out.println("customer id combine  " + supplier_id_Combine);
			System.out.println("required date " + estimated_Date);
			System.out.println("came after insert main payment table");
			
			//INSERT into supplier payment import table
			query = "INSERT INTO supplier_payment_import_table(payment_Id,supplier_order_im_id) VALUES(?,?)" ;
			pcoi =  ccoi.prepareStatement(query);
			pcoi.setString(1,"pay_" + supplier_id_Combine);
			pcoi.setString(2,supplier_id_Combine );
			pcoi.execute();
			System.out.println("came after supplier iport payment");

		}catch(Exception e)
		{
			System.out.println("error in first try " + e);
		}
		try {
			
			System.out.println("came to second try");
			for(Map.Entry<String,Integer> itemDetail: items.entrySet())
			{
				query =  "INSERT INTO supplier_order_import_items_table (supplier_order_im_id, recieve_date,item_details_id,quantity) VALUES (?,?,?,?)";
				pcoi =  ccoi.prepareStatement(query);
				pcoi.setString(1, supplier_id_Combine);
				pcoi.setString(2, estimated_Date);
				pcoi.setString(3, itemDetail.getKey());
				pcoi.setInt(4, itemDetail.getValue());				
				pcoi.execute();
			}

		ccoi.close();
		}catch (Exception e) {
			System.out.println("second try error " + e);
	}

	}
	
}
