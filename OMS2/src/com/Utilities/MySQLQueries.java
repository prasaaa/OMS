package com.Utilities;

public class MySQLQueries {
	
	public static final String QUERY_INSERT_ITEM_MODEL = "INSERT INTO `item_model_table` VALUES (?) ON DUPLICATE KEY UPDATE item_model_name = item_model_name;";
	
	public static final String QUERY_INSERT_ITEM = "INSERT INTO item_details_table VALUES ( NULL , ?, ?, ?, ?, ?, ?)" + 
			"  ON DUPLICATE KEY UPDATE buying_price = VALUES(buying_price), selling_price = VALUES(selling_price)";
	
	public static final String QUERY_SELECT_ITEM_ID = "SELECT item_id FROM item_details_table WHERE item_model_name = ? AND item_manufacturer = ? AND item_supplier = ?;";
	
	public static final String QUERY_INSERT_STOCK = "INSERT INTO stock_in_items_table VALUES ( NULL , NULL, ?, ? , ?, ?);";
	
	public static final String QUERY_SELECT_STOCK_ID = "SELECT stock_id FROM stock_in_items_table WHERE item_id = ? AND index_number = (SELECT MAX(index_number) FROM stock_in_items_table WHERE item_id = ?);";
	
	public static final String QUERY_INSERT_ITEM_LIST = "INSERT INTO items_list_table VALUES (?, ?, ?, ?, NULL);";
	
	public static final String QUERY_SELECT_BY_STOCK_ID = "SELECT s.stock_id, i.item_model_name, i.item_manufacturer, i.item_supplier, i.item_type, s.stock_in_date, s.no_of_items FROM `item_details_table` i INNER JOIN `stock_in_items_table` s ON s.item_id = i.item_id WHERE s.stock_id = ?;";
	
	public static final String QUERY_SELECT_BY_ITEM_MODEL = "SELECT s.stock_id, i.item_model_name, i.item_manufacturer, i.item_supplier, i.item_type, s.stock_in_date, s.no_of_items FROM `item_details_table` i INNER JOIN `stock_in_items_table` s ON s.item_id = i.item_id WHERE i.item_model_name = ?;";
	
	public static final String QUERY_SELECT_BY_MANUFACTURER = "SELECT s.stock_id, i.item_model_name, i.item_manufacturer, i.item_supplier, i.item_type, s.stock_in_date, s.no_of_items FROM `item_details_table` i INNER JOIN `stock_in_items_table` s ON s.item_id = i.item_id WHERE i.item_manufacturer = ?;";
	
	public static final String QUERY_SELECT_BY_SUPPLIER = "SELECT s.stock_id, i.item_model_name, i.item_manufacturer, i.item_supplier, i.item_type, s.stock_in_date, s.no_of_items FROM `item_details_table` i INNER JOIN `stock_in_items_table` s ON s.item_id = i.item_id WHERE i.item_supplier = ?;";
	
	public static final String QUERY_SELECT_BY_TYPE = "SELECT s.stock_id, i.item_model_name, i.item_manufacturer, i.item_supplier, i.item_type, s.stock_in_date, s.no_of_items FROM `item_details_table` i INNER JOIN `stock_in_items_table` s ON s.item_id = i.item_id WHERE i.item_type = ?;";
	
	public static final String QUERY_SELECT_BY_DATE = "SELECT s.stock_id, i.item_model_name, i.item_manufacturer, i.item_supplier, i.item_type, s.stock_in_date, s.no_of_items FROM `item_details_table` i INNER JOIN `stock_in_items_table` s ON s.item_id = i.item_id WHERE s.stock_in_date= ?;";
	
	public static final String QUERY_SELECT_BY_BARCODE = "SELECT s.stock_id, i.item_model_name, i.item_manufacturer, i.item_supplier, i.item_type, s.stock_in_date, s.no_of_items FROM `item_details_table` i, `stock_in_items_table` s , `items_list_table` l WHERE l.barcode_number LIKE CONCAT('%', ? ,'%') AND s.item_id = i.item_id AND l.stock_id = s.stock_id;";
	
	public static final String QUERY_SELECT_ALL = "SELECT s.stock_id, i.item_model_name, i.item_manufacturer, i.item_supplier, i.item_type, s.stock_in_date, s.no_of_items FROM `item_details_table` i INNER JOIN `stock_in_items_table` s ON s.item_id = i.item_id;";
	
	public static final String QUERY_SELECT_COLUMNS = "SELECT item_model_name, item_manufacturer, item_supplier FROM item_details_table;";
	
	public static final String QUERY_DELETE_BY_BARCODE = "DELETE FROM items_list_table WHERE barcode_number LIKE CONCAT('%', ? ,'%');";
	
	public static final String QUERY_SELECT_STOCK_ID_BY_BARCODE = "SELECT stock_id FROM items_list_table WHERE barcode_number LIKE CONCAT('%', ? ,'%');";
	
	public static final String QUERY_UPDATE_QUANTITY = "UPDATE stock_in_items_table SET no_of_items = no_of_items - 1 WHERE stock_id = ?;";
	
	public static final String QUERY_DELETE_STOCK_BY_STOCK_ID = "DELETE FROM stock_in_items_table WHERE stock_id = ?;";
	
	public static final String QUERY_DELETE_ITEMS_BY_STOCK_ID = "DELETE FROM items_list_table WHERE stock_id = ?;";
	
	public static final String QUERY_DELETE_BY_MODEL_NAME = "DELETE FROM item_model_table WHERE item_model_name = ?;";
	
	public static final String QUERY_SELECT_ITEM_ID_BY_MODEL_NAME = "SELECT item_id FROM item_details_table WHERE item_model_name = ?;";
	
	public static final String QUERY_DELETE_STOCK_BY_ITEM_ID = "DELETE FROM stock_in_items_table WHERE item_id = ?;";
	
	public static final String QUERY_DELETE_ITEMS_BY_ITEM_ID = "DELETE FROM items_list_table WHERE item_id = ?;";
	
	public static final String QUERY_DELETE_BY_MANUFACTURER = "DELETE FROM item_details_table WHERE item_manufacturer = ?;";
	
	public static final String QUERY_SELECT_ITEM_ID_BY_MANUFACTURER = "SELECT item_id FROM item_details_table WHERE item_manufacturer = ?;";
	
	public static final String QUERY_DELETE_BY_SUPPLIER = "DELETE FROM item_details_table WHERE item_supplier = ?;";
	
	public static final String QUERY_SELECT_ITEM_ID_BY_SUPPLIER = "SELECT item_id FROM item_details_table WHERE item_supplier = ?;";
	
	public static final String QUERY_DELETE_BY_ITEM_TYPE = "DELETE FROM item_details_table WHERE item_type = ?;";
	
	public static final String QUERY_SELECT_ITEM_ID_BY_ITEM_TYPE = "SELECT item_id FROM item_details_table WHERE item_type = ?;";
	
	public static final String QUERY_DELETE_BY_DATE = "DELETE FROM stock_in_items_table WHERE stock_in_date = ?;";
	
	public static final String QUERY_SELECT_STOCK_ID_BY_DATE = "SELECT stock_id FROM stock_in_items_table WHERE stock_in_date = ?;";
	
	public static final String QUERY_GET_QUANTITY = "SELECT no_of_items FROM stock_in_items_table WHERE stock_id = ?;";
	
	public static final String QUERY_GET_ALL_STOCK_OUT = "SELECT s.stock_out_id, s.item_model_name, i.item_type, s.stock_out_date, s.quantity, s.customer_order_id FROM `stock_out_items_table` s INNER JOIN `item_details_table` i ON i.item_model_name = s.item_model_name;";
	
	public static final String QUERY_GET_ALL_CUST_ORDER = "SELECT * FROM `customer_order_table`;";
	
	public static final String QUERY_INSERT_STOCK_OUT = "INSERT INTO `stock_out_items_table` VALUES (NULL, NULL, ?, ?, ?, ?, ?);";
	
	public static final String QUERY_UPDATE_STOCK_OUT_ID = "UPDATE `items_list_table` SET stock_out_id = ? WHERE item_model_name = ? AND stock_out_id IS NULL ORDER BY item_model_name LIMIT ?;";
	
	public static final String QUERY_GET_ITEM_QUANTITY = "SELECT COUNT(*) FROM items_list_table WHERE item_model_name = ? AND stock_out_id IS NULL;";
	
	public static final String QUERY_SELECT_BARCODES_BY_ITEM_ID = "SELECT barcode_number FROM `items_list_table` WHERE item_id = ?;";
	
	public static final String QUERY_VALIDATE_CUSTOMER_ORDER_ID = "SELECT customer_Order_Id FROM `customer_order_table` WHERE customer_Order_Id = ?;";
	
	public static final String QUERY_SELECT_ALL_CUSTOMER_ORDERS = "SELECT co.customer_Order_Id, c.customer_Name, co.order_Date, co.required_Date, co.order_Status, co.order_Type FROM `customer_order_table` co, `customer_table` c WHERE c.customer_Id = co.customer_Id;";
	
	public static final String QUERY_VALIDATE_ITEM_MODEL = "SELECT * FROM `item_model_table` WHERE item_model_name = ?;";
	
	public static final String QUERY_SELECT_STOCK_OUT_BY_ID = "SELECT s.stock_out_id, s.item_model_name, i.item_type, s.stock_out_date, s.quantity, s.customer_order_id FROM `stock_out_items_table` s INNER JOIN `item_details_table` i ON i.item_model_name = s.item_model_name WHERE s.stock_out_id = ?;";
	
	public static final String QUERY_SELECT_STOCK_OUT_BY_BARCODE = "SELECT s.stock_out_id, s.item_model_name, i.item_type, s.stock_out_date, s.quantity, s.customer_order_id FROM `stock_out_items_table` s INNER JOIN `item_details_table` i ON i.item_model_name = s.item_model_name INNER JOIN items_list_table l ON l.item_model_name = i.item_model_name WHERE l.stock_out_id IS NOT NULL AND l.barcode_number = ?;";
	
	public static final String QUERY_SELECT_STOCK_OUT_BY_MODEL = "SELECT s.stock_out_id, s.item_model_name, i.item_type, s.stock_out_date, s.quantity, s.customer_order_id FROM `stock_out_items_table` s INNER JOIN `item_details_table` i ON i.item_model_name = s.item_model_name WHERE s.item_model_name = ?;";
	
	public static final String QUERY_SELECT_STOCK_OUT_BY_TYPE = "SELECT s.stock_out_id, s.item_model_name, i.item_type, s.stock_out_date, s.quantity, s.customer_order_id FROM `stock_out_items_table` s INNER JOIN `item_details_table` i ON i.item_model_name = s.item_model_name WHERE i.item_type = ?";
	
	public static final String QUERY_SELECT_STOCK_OUT_BY_DATE = "SELECT s.stock_out_id, s.item_model_name, i.item_type, s.stock_out_date, s.quantity, s.customer_order_id FROM `stock_out_items_table` s INNER JOIN `item_details_table` i ON i.item_model_name = s.item_model_name WHERE s.stock_out_date = ?;";
	
	public static final String QUERY_SELECT_STOCK_OUT_BY_CUSTOMER = "SELECT s.stock_out_id, s.item_model_name, i.item_type, s.stock_out_date, s.quantity, s.customer_order_id FROM `item_details_table` i INNER JOIN `stock_out_items_table` s ON i.item_model_name = s.item_model_name INNER JOIN customer_order_table c ON c.customer_Order_Id = s.customer_order_id INNER JOIN `customer_table` cu ON c.customer_Id = cu.customer_Id WHERE cu.customer_Name = ?;";
	
	public static final String QUERY_SELECT_STOCK_OUT_BY_ORDER = "SELECT s.stock_out_id, s.item_model_name, i.item_type, s.stock_out_date, s.quantity, s.customer_order_id FROM `stock_out_items_table` s INNER JOIN `item_details_table` i ON i.item_model_name = s.item_model_name WHERE s.customer_order_id = ?";
	
	public static final String QUERY_SELECT_ORDER_BY_ID = "SELECT co.customer_Order_Id, c.customer_Name, co.order_Date, co.required_Date, co.order_Status, co.order_Type FROM `customer_order_table` co, `customer_table` c WHERE c.customer_Id = co.customer_Id AND co.customer_Order_Id = ?";
	
	public static final String QUERY_SELECT_ORDER_BY_CUSTOMER = "SELECT co.customer_Order_Id, c.customer_Name, co.order_Date, co.required_Date, co.order_Status, co.order_Type FROM `customer_order_table` co, `customer_table` c WHERE c.customer_Id = co.customer_Id AND c.customer_Name = ?;";
	
	public static final String QUERY_SELECT_ORDER_BY_ORDER_DATE = "SELECT co.customer_Order_Id, c.customer_Name, co.order_Date, co.required_Date, co.order_Status, co.order_Type FROM `customer_order_table` co, `customer_table` c WHERE c.customer_Id = co.customer_Id AND co.order_Date = ?;";
	
	public static final String QUERY_SELECT_ORDER_BY_REQ_DATE = "SELECT co.customer_Order_Id, c.customer_Name, co.order_Date, co.required_Date, co.order_Status, co.order_Type FROM `customer_order_table` co, `customer_table` c WHERE c.customer_Id = co.customer_Id AND co.required_Date = ?";
	
	public static final String QUERY_SELECT_ORDER_BY_STATUS = "SELECT co.customer_Order_Id, c.customer_Name, co.order_Date, co.required_Date, co.order_Status, co.order_Type FROM `customer_order_table` co, `customer_table` c WHERE c.customer_Id = co.customer_Id AND co.order_Status = ?";
	
	public static final String QUERY_SELECT_ORDER_BY_TYPE = "SELECT co.customer_Order_Id, c.customer_Name, co.order_Date, co.required_Date, co.order_Status, co.order_Type FROM `customer_order_table` co, `customer_table` c WHERE c.customer_Id = co.customer_Id AND co.order_Type = ?;";
	
	public static final String QUERY_SELECT_STOCK_OUT_ID = "SELECT stock_out_id FROM `stock_out_items_table` WHERE item_model_name = ? AND index_number = (SELECT MAX(index_number) FROM `stock_out_items_table` WHERE item_model_name = ?);";
	
	public static final String QUERY_DELETE_STOCK_OUT_BY_ID = "DELETE FROM `stock_out_items_table` WHERE stock_out_id = ?;";
	
	public static final String QUERY_DELETE_STOCK_OUT_BY_MODEL = "DELETE FROM `stock_out_items_table` WHERE item_model_name = ?;";
	
	public static final String QUERY_UPDATE_ITEM_BY_BARCODE = "UPDATE `items_list_table` SET stock_out_id = NULL WHERE barcode_number = ?;";
	
	public static final String QUERY_UPDATE_STOCK_OUT_QUANTITY = "UPDATE `stock_out_items_table` s JOIN `items_list_table` i ON i.stock_out_id = s.stock_out_id SET quantity = quantity - 1 WHERE barcode_number = ?;";
	
	public static final String QUERY_DELETE_STOCK_OUT_BY_BARCODE = "DELETE s FROM `stock_out_items_table` s INNER JOIN `items_list_table` i ON i.stock_out_id = s.stock_out_id WHERE s.quantity = 0 AND i.barcode_number = ?;";
	
	public static final String QUERY_DELETE_STOCK_OUT_BY_DATE = "DELETE FROM `stock_out_items_table` WHERE stock_out_date = ?;";
	
	public static final String QUERY_DELETE_STOCK_OUT_BY_TYPE = "DELETE s FROM `stock_out_items_table` s INNER JOIN `item_details_table` i ON s.item_model_name = i.item_model_name WHERE item_type = ?";
	
	public static final String QUERY_DELETE_STOCK_OUT_BY_CUSTOMER = "DELETE s FROM `stock_out_items_table` s INNER JOIN `customer_Order_Table` c ON c.customer_Order_Id = s.customer_order_id INNER JOIN `customer_table` cu ON cu.customer_Id = c.customer_Id WHERE cu.customer_Name = ?;";

	public static final String QUERY_DELETE_STOCK_OUT_BY_ORDER = "DELETE FROM `stock_out_items_table` WHERE customer_Order_Id = ?;";

}
