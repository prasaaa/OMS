package com.DatabaseHandle;

import com.DBConnection.ConnectionManager;
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import java.io.FileOutputStream;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;


public class Report_PRINT {
	
	 private static Font catFont = new Font(Font.FontFamily.TIMES_ROMAN, 18,
	            Font.BOLD);
	 private static Font redFont = new Font(Font.FontFamily.TIMES_ROMAN, 18,
	            Font.NORMAL, BaseColor.RED);
	 private static Font subFont = new Font(Font.FontFamily.TIMES_ROMAN, 16,
	            Font.BOLD);
	 private static Font smallBold = new Font(Font.FontFamily.TIMES_ROMAN, 12,
	            Font.BOLD);
	private int count = 0;
	
	private ResultSet resultprint;
	

	public Report_PRINT(ResultSet resultprint) {
	
		System.out.println("came to the report print class");
		this.resultprint = resultprint;
	}
	
	 public Report_PRINT() {
		super();
	}

	private static void addEmptyLine(Paragraph paragraph, int number) 
	 {
        for (int i = 0; i < number; i++) {
            paragraph.add(new Paragraph(" "));
        }
	 }
	
	public void printsupplierreport()
	{
		System.out.println("inside the method");
		
		Document document = new Document();
		String timeStamp = new SimpleDateFormat("yyyyMMdd_HHmmss").format(Calendar.getInstance().getTime());
		
		try {
			
			PdfWriter.getInstance(document, new FileOutputStream("supplierreport"+timeStamp+".pdf"));
			document.open();
			PdfPCell cell1;
	        PdfPCell cell2;
	        PdfPCell cell3;
	        PdfPCell cell4;
	        PdfPCell cell5;
	        
	        Paragraph preface = new Paragraph();
	        
	        addEmptyLine(preface, 1);
	        
	        preface.add(new Paragraph("Supplier Report",redFont));

	        addEmptyLine(preface, 1);
	        
	        preface.add(new Paragraph(
	                "Report created by: " + "Administrator"+ ", " + new Date(),smallBold));
	        addEmptyLine(preface, 1);
	     

	        addEmptyLine(preface, 2);

	        document.add(preface);
	        resultprint.beforeFirst();
	        PdfPTable table = new PdfPTable(5);
			table.setWidthPercentage(100);
			
			
			
			
            
           // document.add(table);
			
			while(resultprint.next())
			{
				
				 table = new PdfPTable(5);
				table.setWidthPercentage(100);
				if(count==0)
				{
					cell1 = new PdfPCell(new Paragraph("Supplier Order Import ID"));
					cell2 = new PdfPCell(new Paragraph("Order Date"));
					cell3 = new PdfPCell(new Paragraph("Recieve Date"));
					cell4 = new PdfPCell(new Paragraph("Supplier ID"));
					cell5 = new PdfPCell(new Paragraph("Type"));
					count++;
				}else
				{
				cell1 = new PdfPCell(new Paragraph(resultprint.getString("supplier_order_im_id")));
				cell2 = new PdfPCell(new Paragraph(resultprint.getString("order_date")));
				cell3 = new PdfPCell(new Paragraph(resultprint.getString("recieve_date")));
				cell4 = new PdfPCell(new Paragraph(resultprint.getString("supplier_id")));
				cell5 = new PdfPCell(new Paragraph(resultprint.getString("type")));
				}
				
				
				table.addCell(cell1);
	            table.addCell(cell2);
	            table.addCell(cell3);
	            table.addCell(cell4);
	            table.addCell(cell5);
	            
	            document.add(table);
    
			}
			document.close();
		}catch(Exception e)
			{
				System.out.print("error in pdf supplier report " + e);
			}
			

		
	}
	
	public void printrepairreport()
	{
		
		System.out.println("inside the method");
		
		Document document = new Document();
		String timeStamp = new SimpleDateFormat("yyyyMMdd_HHmmss").format(Calendar.getInstance().getTime());
		
		try {
			resultprint.beforeFirst();
			PdfWriter.getInstance(document, new FileOutputStream("Repairreport"+timeStamp+".pdf"));
			document.open();
			PdfPCell cell1;
	        PdfPCell cell2;
	        PdfPCell cell3;
	        PdfPCell cell4;
	  
	        
	        Paragraph preface = new Paragraph();
	        
	        addEmptyLine(preface, 1);
	        
	        preface.add(new Paragraph("Repair Report",redFont));

	        addEmptyLine(preface, 1);
	        
	        preface.add(new Paragraph(
	                "Report created on: " + " " + new Date(),smallBold));
	        addEmptyLine(preface, 1);
	     

	        addEmptyLine(preface, 2);

	        document.add(preface);
	        resultprint.beforeFirst();
	        
	        
	        PdfPTable table = new PdfPTable(4);
			table.setWidthPercentage(100);
			
			
			
			
			
         
            
            //document.add(table);
			
			while(resultprint.next())
			{
				
				
				table = new PdfPTable(4);
				table.setWidthPercentage(100);
				if(count == 0)
				{
					cell1 = new PdfPCell(new Paragraph("Repair ID"));
					cell2 = new PdfPCell(new Paragraph("Order Date"));
					cell3 = new PdfPCell(new Paragraph("Error"));
					cell4 = new PdfPCell(new Paragraph("Customer ID"));
					count++;
					resultprint.beforeFirst();
				}
				else {
				cell1 = new PdfPCell(new Paragraph(resultprint.getString("repair_Id")));
				cell2 = new PdfPCell(new Paragraph(resultprint.getString("order_Date")));
				cell3 = new PdfPCell(new Paragraph(resultprint.getString("error")));
				cell4 = new PdfPCell(new Paragraph(resultprint.getString("customer_Id")));
				}
				
				
				
				table.addCell(cell1);
	            table.addCell(cell2);
	            table.addCell(cell3);
	            table.addCell(cell4);
	            
	            
	            document.add(table);

            }
            document.close();
        } catch (Exception e) {
            System.out.print("error in pdf repair report " + e);
        }

    }

    public boolean printstockreport() {

        System.out.println("inside the stock method");

        Document document = new Document();
        String timeStamp = new SimpleDateFormat("yyyyMMdd_HHmmss").format(Calendar.getInstance().getTime());

        try {

            PdfWriter.getInstance(document, new FileOutputStream("D:/Reports/stockreport" + timeStamp + ".pdf"));
            document.open();
            PdfPCell cell1;
            PdfPCell cell2;
            PdfPCell cell3;
            PdfPCell cell4;
            PdfPCell cell5;
            PdfPCell cell6;
            PdfPCell cell7;


            Paragraph preface = new Paragraph();

            addEmptyLine(preface, 1);

            preface.add(new Paragraph("Stock Report", redFont));

            addEmptyLine(preface, 1);

            preface.add(new Paragraph(
                    "Report created on: " + " " + new Date(), smallBold));
            addEmptyLine(preface, 1);


            addEmptyLine(preface, 2);

            document.add(preface);
            resultprint.beforeFirst();


            PdfPTable table = new PdfPTable(7);
            table.setWidthPercentage(100);


            cell1 = new PdfPCell(new Paragraph("Stock ID"));
            cell2 = new PdfPCell(new Paragraph("Items Model Name"));
            cell3 = new PdfPCell(new Paragraph("Manufacturer"));
            cell4 = new PdfPCell(new Paragraph("Supplier"));
            cell5 = new PdfPCell(new Paragraph("Item Type"));
            cell6 = new PdfPCell(new Paragraph("Received Date"));
            cell7 = new PdfPCell(new Paragraph("Quantity"));

            table.addCell(cell1);
            table.addCell(cell2);
            table.addCell(cell3);
            table.addCell(cell4);
            table.addCell(cell5);
            table.addCell(cell6);
            table.addCell(cell7);

            document.add(table);

            while (resultprint.next()) {

                table = new PdfPTable(7);
                table.setWidthPercentage(100);

                cell1 = new PdfPCell(new Paragraph(resultprint.getString(1)));
                cell2 = new PdfPCell(new Paragraph(resultprint.getString(2)));
                cell3 = new PdfPCell(new Paragraph(resultprint.getString(3)));
                cell4 = new PdfPCell(new Paragraph(resultprint.getString(4)));
                cell5 = new PdfPCell(new Paragraph(resultprint.getString(5)));
                cell6 = new PdfPCell(new Paragraph(resultprint.getString(6)));
                cell7 = new PdfPCell(new Paragraph(resultprint.getString(7)));


                table.addCell(cell1);
                table.addCell(cell2);
                table.addCell(cell3);
                table.addCell(cell4);
                table.addCell(cell5);
                table.addCell(cell6);
                table.addCell(cell7);


                document.add(table);

            }

            document.close();
            return true;
        } catch (Throwable e) {
            System.out.print("error in pdf stock report " + e);
            e.printStackTrace();
            return false;
        }

    }
	public void printemp()
	{
		
		
		
		Document document = new Document();
		String timeStamp = new SimpleDateFormat("yyyyMMdd_HHmmss").format(Calendar.getInstance().getTime());
		
		try {
			resultprint.beforeFirst();
			PdfWriter.getInstance(document, new FileOutputStream("Empreport"+timeStamp+".pdf"));
			document.open();
			PdfPCell cell1;
	        PdfPCell cell2;
	        PdfPCell cell3;
	        PdfPCell cell4;
	        PdfPCell cell5;
	  
	        
	        Paragraph preface = new Paragraph();
	        
	        addEmptyLine(preface, 1);
	        
	        preface.add(new Paragraph("Repair Report",redFont));

	        addEmptyLine(preface, 1);
	        
	        preface.add(new Paragraph(
	                "Report created on: " + " " + new Date(),smallBold));
	        addEmptyLine(preface, 1);
	     

	        addEmptyLine(preface, 2);

	        document.add(preface);
	        resultprint.beforeFirst();
	        
	        
	        PdfPTable table = new PdfPTable(4);
			
		
			while(resultprint.next())
			{
				
				table = new PdfPTable(4);
				table.setWidthPercentage(100);
				cell1 = new PdfPCell(new Paragraph(resultprint.getString(1)));
				cell2 = new PdfPCell(new Paragraph(resultprint.getString(2)));
				cell3 = new PdfPCell(new Paragraph(resultprint.getString(3)));
				cell4 = new PdfPCell(new Paragraph(resultprint.getString(4)));
				cell5 = new PdfPCell(new Paragraph(resultprint.getString(5)));
				
				
				
				table.addCell(cell1);
	            table.addCell(cell2);
	            table.addCell(cell3);
	            table.addCell(cell4);
	            table.addCell(cell5);
	            
	            
	            document.add(table);
    
			}
			document.close();
		}catch(Exception e)
			{
				System.out.print("error in pdf emp report " + e);
			}
		
	}
	
	public void printpayment()
	{
		
		
		
		Document document = new Document();
		String timeStamp = new SimpleDateFormat("yyyyMMdd_HHmmss").format(Calendar.getInstance().getTime());
		
		try {
			resultprint.beforeFirst();
			PdfWriter.getInstance(document, new FileOutputStream("Paymentreport"+timeStamp+".pdf"));
			document.open();
			PdfPCell cell1;
	        PdfPCell cell2;
	        PdfPCell cell3;
	        PdfPCell cell4;
	        PdfPCell cell5;
	        PdfPCell cell6;
	        PdfPCell cell7;
	        PdfPCell cell8;
	  
	        
	        Paragraph preface = new Paragraph();
	        
	        addEmptyLine(preface, 1);
	        
	        preface.add(new Paragraph("Payment Report",redFont));

	        addEmptyLine(preface, 1);
	        
	        preface.add(new Paragraph(
	                "Report created on: " + " " + new Date(),smallBold));
	        addEmptyLine(preface, 1);
	     

	        addEmptyLine(preface, 2);

	        document.add(preface);
	        resultprint.beforeFirst();
	        
	        
	        PdfPTable table = new PdfPTable(6);
			
		
			while(resultprint.next())
			{
				
				table = new PdfPTable(6);
				table.setWidthPercentage(100);
				if(count == 0)
				{
					cell1 = new PdfPCell(new Paragraph("Payment ID"));
					cell2 = new PdfPCell(new Paragraph("Pay Date"));
					cell3 = new PdfPCell(new Paragraph("Price"));
					cell4 = new PdfPCell(new Paragraph("Status"));
					cell5 = new PdfPCell(new Paragraph("Type"));
					cell6 = new PdfPCell(new Paragraph("Next Payment"));
					
					count++;
					resultprint.beforeFirst();
				}else
				{
					cell1 = new PdfPCell(new Paragraph(resultprint.getString(1)));
					cell2 = new PdfPCell(new Paragraph(resultprint.getString(2)));
					cell3 = new PdfPCell(new Paragraph(resultprint.getString(3)));
					cell4 = new PdfPCell(new Paragraph(resultprint.getString(4)));
					cell5 = new PdfPCell(new Paragraph(resultprint.getString(5)));
					cell6 = new PdfPCell(new Paragraph(resultprint.getString(6)));
					
				}
				
				
				
				table.addCell(cell1);
	            table.addCell(cell2);
	            table.addCell(cell3);
	            table.addCell(cell4);
	            table.addCell(cell5);
	            table.addCell(cell6);
	            
	            
	            document.add(table);
    
			}
			document.close();
		}catch(Exception e)
			{
				System.out.print("error in pdf emp report " + e);
			}
		
	}
	
	public void PaymentInvoice(String customerorderid)
	{
		Document document = new Document();
		String timeStamp = new SimpleDateFormat("yyyyMMdd_HHmmss").format(Calendar.getInstance().getTime());
		
		try {
			
			PdfWriter.getInstance(document, new FileOutputStream("Paymentreport"+timeStamp+".pdf"));
			document.open();
			PdfPCell cell1;
	        PdfPCell cell2;
	        PdfPCell cell3;
	       
	  
	        
	        Paragraph preface = new Paragraph();
	        
	        addEmptyLine(preface, 1);
	        preface.setAlignment(Element.ALIGN_CENTER);
	        preface.add(new Paragraph("Automated Barcode Solutions",redFont));
	        addEmptyLine(preface, 1);
	        preface.add(new Paragraph("No.BX 16 MANNING Town,Mawath Road,Colombo 08",smallBold));
	        addEmptyLine(preface, 1);
	        preface.add(new Paragraph("Tel/Fax :94 0112683801,94 (0) 11 3137283",smallBold));
	        addEmptyLine(preface, 1);
	        preface.setAlignment(Element.ALIGN_LEFT);
	        preface.add(new Paragraph("Name : "+customerorderid ,smallBold));
	        addEmptyLine(preface, 1);
	        
	        
	        addEmptyLine(preface, 1);
	        
	        
	        preface.add(new Paragraph(
	                "Report created on: " + " " + new Date(),smallBold));
	        addEmptyLine(preface, 1);
	     

	        addEmptyLine(preface, 2);

	        document.add(preface);
	        
	        System.out.println("came to 532");
	        
	        PdfPTable table = new PdfPTable(3);
			Main_SELECT itemsget =  new Main_SELECT(ConnectionManager.getConnection(), "SELECT * FROM supplier_order_import_items_table WHERE supplier_order_im_id = '"+customerorderid+"'");
			resultprint =  itemsget.get_table();
			while(resultprint.next())
			{
				
				
				table = new PdfPTable(3);
				table.setWidthPercentage(100);
				if(count == 0)
				{
					cell1 = new PdfPCell(new Paragraph("Order No"));
					cell2 = new PdfPCell(new Paragraph("Description"));
					cell3 = new PdfPCell(new Paragraph("QTY"));
					count++;
					resultprint.beforeFirst();
				}else
				{
					cell1 = new PdfPCell(new Paragraph("  "));
					cell2 = new PdfPCell(new Paragraph(resultprint.getString("item_details_id")));
					cell3 = new PdfPCell(new Paragraph(String.valueOf( resultprint.getInt("quantity"))));
	
				}
				
				
				
				table.addCell(cell1);
	            table.addCell(cell2);
	            table.addCell(cell3);
	           
	            
	            
	            document.add(table);
    
			}
			addEmptyLine(preface, 1);
	        preface.add(new Paragraph("Recieved BY :.... ",smallBold));
	        addEmptyLine(preface, 1);
	        preface.add(new Paragraph("Delivered BY :.... ",smallBold));
	        addEmptyLine(preface, 1);
	        preface.add(new Paragraph("Issued by :.... ",smallBold));
	        document.add(preface);
			document.close();
		}catch(Exception e)
			{
				System.out.print("error in pdf emp report " + e);
			}
	}
	
	
	
	

}
