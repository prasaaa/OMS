package com.Utilities;

import org.intellij.lang.annotations.Language;

public class MySQLQueries {


    public static final String QUERY_INSERT_STOCK = "INSERT INTO `stock_in_items_table`(stock_in_id ,stock_in_date, remarks, item_id) VALUES (? , ?, ?, ?);";

    public static final String QUERY_INSERT_ITEM_LIST = "INSERT INTO `items_list_table` VALUES (?, ?, ?, NULL, ?, ?, NULL);";

    public static final String QUERY_SELECT_BY_STOCK_ID = "SELECT s.stock_in_id, i.item_id, u.supplier_id, i.item_type, s.stock_in_date, s.buying_price, s.quantity FROM `item_details_table` i INNER JOIN `stock_in_items_table` s ON s.item_id = i.item_id INNER JOIN item_supplier_table u ON u.item_id = i.item_id WHERE s.stock_in_id = ?;";

    public static final String QUERY_SELECT_BY_ITEM_MODEL = "SELECT s.stock_in_id, i.item_id, u.supplier_id, i.item_type, s.stock_in_date, s.buying_price, s.quantity FROM `item_details_table` i INNER JOIN `stock_in_items_table` s ON s.item_id = i.item_id INNER JOIN item_supplier_table u ON u.item_id = i.item_id WHERE i.item_model_name = ?;";

    public static final String QUERY_SELECT_BY_MANUFACTURER = "SELECT s.stock_in_id, i.item_id, u.supplier_id, i.item_type, s.stock_in_date, s.buying_price, s.quantity FROM `item_details_table` i INNER JOIN `stock_in_items_table` s ON s.item_id = i.item_id INNER JOIN item_supplier_table u ON u.item_id = i.item_id WHERE i.item_manufacturer = ?;";

    public static final String QUERY_SELECT_BY_SUPPLIER = "SELECT s.stock_in_id, i.item_id, u.supplier_id, i.item_type, s.stock_in_date, s.buying_price, s.quantity FROM `item_details_table` i INNER JOIN `stock_in_items_table` s ON s.item_id = i.item_id INNER JOIN item_supplier_table u ON u.item_id = i.item_id  WHERE u.supplier_id = ?;";

    public static final String QUERY_SELECT_BY_TYPE = "SELECT s.stock_in_id, i.item_id, u.supplier_id, i.item_type, s.stock_in_date, s.buying_price, s.quantity FROM `item_details_table` i INNER JOIN `stock_in_items_table` s ON s.item_id = i.item_id INNER JOIN item_supplier_table u ON u.item_id = i.item_id WHERE i.item_type = ?;";

    public static final String QUERY_SELECT_BY_DATE = "SELECT s.stock_in_id, i.item_id, u.supplier_id, i.item_type, s.stock_in_date, s.buying_price, s.quantity FROM `item_details_table` i INNER JOIN `stock_in_items_table` s ON s.item_id = i.item_id INNER JOIN item_supplier_table u ON u.item_id = i.item_id WHERE s.stock_in_date= ?;";
    @Language("MySQL")
    public static final String QUERY_SELECT_BY_BARCODE = "SELECT s.stock_in_id, idt.item_id, idt.item_model_name, idt.item_manufacturer, idt.item_supplier, idt.item_type, s.stock_in_date, s.remarks, idt.item_details, COUNT(CASE WHEN ilt.items_status LIKE '%Working%' THEN 1 END) AS workingCount, COUNT(CASE WHEN ilt.items_status LIKE '%Faulty%' THEN 1 END) AS faultCount FROM stock_in_items_table s INNER JOIN item_details_table idt ON s.item_id = idt.item_id INNER JOIN items_list_table ilt ON s.stock_in_id = ilt.stock_in_id " +
            "WHERE s.stock_in_id = (SELECT st.stock_in_id FROM items_list_table st WHERE st.barcode_number LIKE CONCAT('%' + ? + '%') ) " +
            "GROUP BY s.stock_in_id, idt.item_id, idt.item_model_name, idt.item_manufacturer, idt.item_supplier, idt.item_type, s.stock_in_date, s.remarks, idt.item_details;";

    public static final String QUERY_SELECT_ITEM_BY_BARCODE = "SELECT * FROM items_list_table WHERE barcode_number = ?;";
    public static final String QUERY_SELECT_ALL = "SELECT s.stock_in_id, i.item_id, i.item_supplier, i.item_type, s.stock_in_date FROM `stock_in_items_table` s INNER JOIN `item_details_table` i  ON s.item_id = i.item_id ";
    @Language("MySQL")
    public static final String QUERY_DELETE_STOCK_BY_STOCK_ID = "DELETE FROM stock_in_items_table WHERE stock_in_id = ?;";


    public static final String QUERY_GET_ALL_STOCK_OUT = "SELECT s.stock_out_id, i.item_id, i.item_type, s.stock_out_date, s.selling_price, s.quantity, s.customer_order_id FROM `stock_out_items_table` s INNER JOIN `item_details_table` i ON i.item_id = s.item_id;";


    public static final String QUERY_INSERT_STOCK_OUT = "INSERT INTO `stock_out_items_table` VALUES (NULL, NULL, ?, ?, ?, ?, ?, ?);";

    public static final String QUERY_UPDATE_STOCK_OUT_ID = "UPDATE `items_list_table` SET stock_out_id = ? WHERE item_id = ? AND stock_out_id IS NULL AND barcode_number = ? AND item_status LIKE '%Working%';";

    public static final String QUERY_SELECT_BARCODES_BY_ITEM_ID = "SELECT barcode_number FROM `items_list_table` WHERE item_id = ?;";

    public static final String QUERY_VALIDATE_CUSTOMER_ORDER_ID = "SELECT customer_Order_Id FROM `customer_order_table` WHERE customer_Order_Id = ?;";

    public static final String QUERY_SELECT_ALL_CUSTOMER_ORDERS = "SELECT co.customer_Order_Id, c.customer_Name, co.order_Date, co.required_Date, co.order_Status, co.order_Type FROM `customer_order_table` co, `customer_table` c WHERE c.customer_Id = co.customer_Id;";

    public static final String QUERY_SELECT_STOCK_OUT_BY_ID = "SELECT s.stock_out_id, s.item_id, i.item_type, s.stock_out_date, s.quantity, s.customer_order_id FROM `stock_out_items_table` s INNER JOIN `item_details_table` i ON i.item_id = s.item_id WHERE s.stock_out_id = ?;";

    public static final String QUERY_SELECT_STOCK_OUT_BY_BARCODE = "SELECT s.stock_out_id, s.item_id, i.item_type, s.stock_out_date, s.selling_price,s.quantity, s.customer_order_id FROM `stock_out_items_table` s INNER JOIN `item_details_table` i ON i.item_id = s.item_id INNER JOIN items_list_table l ON l.item_id = i.item_id WHERE l.stock_out_id IS NOT NULL AND l.barcode_number = ?;";

    public static final String QUERY_SELECT_STOCK_OUT_BY_MODEL = "SELECT s.stock_out_id, s.item_id, i.item_type, s.stock_out_date, s.selling_price, s.quantity, s.customer_order_id FROM `stock_out_items_table` s INNER JOIN `item_details_table` i ON i.item_id = s.item_id WHERE i.item_model_name = ?;";

    public static final String QUERY_SELECT_STOCK_OUT_BY_TYPE = "SELECT s.stock_out_id, s.item_id, i.item_type, s.stock_out_date, s.selling_price, s.quantity, s.customer_order_id FROM `stock_out_items_table` s INNER JOIN `item_details_table` i ON i.item_id = s.item_id WHERE i.item_type = ?";

    public static final String QUERY_SELECT_STOCK_OUT_BY_DATE = "SELECT s.stock_out_id, s.item_id, i.item_type, s.stock_out_date, s.selling_price, s.quantity, s.customer_order_id FROM `stock_out_items_table` s INNER JOIN `item_details_table` i ON i.item_id = s.item_id WHERE s.stock_out_date = ?;";

    public static final String QUERY_SELECT_STOCK_OUT_BY_CUSTOMER = "SELECT s.stock_out_id, s.item_id, i.item_type, s.stock_out_date, s.selling_price, s.quantity, s.customer_order_id FROM `stock_out_items_table` s INNER JOIN `item_details_table` i ON i.item_id = s.item_id INNER JOIN customer_order_table c ON c.customer_Order_Id = s.customer_order_id INNER JOIN `customer_table` cu ON c.customer_Id = cu.customer_Id WHERE cu.customer_Name = ?;";

    public static final String QUERY_SELECT_STOCK_OUT_BY_ORDER = "SELECT s.stock_out_id, s.item_id, i.item_type, s.stock_out_date, s.selling_price, s.quantity, s.customer_order_id FROM `stock_out_items_table` s INNER JOIN `item_details_table` i ON i.item_id = s.item_id WHERE s.customer_order_id = ?";

    public static final String QUERY_SELECT_ORDER_BY_ID = "SELECT co.customer_Order_Id, c.customer_Name, co.order_Date, co.required_Date, co.order_Status, co.order_Type FROM `customer_order_table` co, `customer_table` c WHERE c.customer_Id = co.customer_Id AND co.customer_Order_Id = ?";

    public static final String QUERY_SELECT_ORDER_BY_CUSTOMER = "SELECT co.customer_Order_Id, c.customer_Name, co.order_Date, co.required_Date, co.order_Status, co.order_Type FROM `customer_order_table` co, `customer_table` c WHERE c.customer_Id = co.customer_Id AND c.customer_Name = ?;";

    public static final String QUERY_SELECT_ORDER_BY_ORDER_DATE = "SELECT co.customer_Order_Id, c.customer_Name, co.order_Date, co.required_Date, co.order_Status, co.order_Type FROM `customer_order_table` co, `customer_table` c WHERE c.customer_Id = co.customer_Id AND co.order_Date = ?;";

    public static final String QUERY_SELECT_ORDER_BY_REQ_DATE = "SELECT co.customer_Order_Id, c.customer_Name, co.order_Date, co.required_Date, co.order_Status, co.order_Type FROM `customer_order_table` co, `customer_table` c WHERE c.customer_Id = co.customer_Id AND co.required_Date = ?";

    public static final String QUERY_SELECT_ORDER_BY_STATUS = "SELECT co.customer_Order_Id, c.customer_Name, co.order_Date, co.required_Date, co.order_Status, co.order_Type FROM `customer_order_table` co, `customer_table` c WHERE c.customer_Id = co.customer_Id AND co.order_Status = ?";

    public static final String QUERY_SELECT_ORDER_BY_TYPE = "SELECT co.customer_Order_Id, c.customer_Name, co.order_Date, co.required_Date, co.order_Status, co.order_Type FROM `customer_order_table` co, `customer_table` c WHERE c.customer_Id = co.customer_Id AND co.order_Type = ?;";

    public static final String QUERY_SELECT_STOCK_OUT_ID = "SELECT stock_out_id FROM `stock_out_items_table` WHERE item_id = ? AND index_number = (SELECT MAX(index_number) FROM `stock_out_items_table` WHERE item_id = ?);";

    public static final String QUERY_DELETE_STOCK_OUT_BY_ID = "DELETE FROM `stock_out_items_table` WHERE stock_out_id = ?;";

    public static final String QUERY_DELETE_STOCK_OUT_BY_MODEL = "DELETE s FROM `stock_out_items_table` s INNER JOIN `item_details_table` i ON i.item_id = s.item_id WHERE i.item_model_name = ?;";

    public static final String QUERY_UPDATE_ITEM_BY_BARCODE = "UPDATE `items_list_table` SET stock_out_id = NULL WHERE barcode_number = ?;";

    public static final String QUERY_UPDATE_STOCK_OUT_QUANTITY = "UPDATE `stock_out_items_table` s JOIN `items_list_table` i ON i.stock_out_id = s.stock_out_id SET quantity = quantity - 1 WHERE barcode_number = ?;";

    public static final String QUERY_DELETE_STOCK_OUT_BY_BARCODE = "DELETE s FROM `stock_out_items_table` s INNER JOIN `items_list_table` i ON i.stock_out_id = s.stock_out_id WHERE i.barcode_number = ?;";

    public static final String QUERY_DELETE_STOCK_OUT_BY_DATE = "DELETE FROM `stock_out_items_table` WHERE stock_out_date = ?;";

    public static final String QUERY_DELETE_STOCK_OUT_BY_TYPE = "DELETE s FROM `stock_out_items_table` s INNER JOIN `item_details_table` i ON s.item_id = i.item_id WHERE item_type = ?";

    public static final String QUERY_DELETE_STOCK_OUT_BY_CUSTOMER = "DELETE s FROM `stock_out_items_table` s INNER JOIN `customer_Order_Table` c ON c.customer_Order_Id = s.customer_order_id INNER JOIN `customer_table` cu ON cu.customer_Id = c.customer_Id WHERE cu.customer_Name = ?;";

    public static final String QUERY_DELETE_STOCK_OUT_BY_ORDER = "DELETE FROM `stock_out_items_table` WHERE customer_Order_Id = ?;";


    public static final String QUERY_SELECT_ALL_ITEM_INFO = "SELECT d.item_model_name, d.item_manufacturer, d.item_type, s.supplier_id, d.item_id FROM item_details_table d INNER JOIN item_supplier_table s ON s.item_id = d.item_id;";


    public static final String QUERY_SELECT_ITEM_BY_ITEM_MODEL = "SELECT d.item_model_name, d.item_manufacturer, d.item_type, s.supplier_id, d.item_id FROM item_details_table d INNER JOIN item_supplier_table s ON s.item_id = d.item_id WHERE d.item_model_name = ?;";

    public static final String QUERY_SELECT_ITEM_BY_MANUFACTURER = "SELECT d.item_model_name, d.item_manufacturer, d.item_type, s.supplier_id, d.item_id FROM item_details_table d INNER JOIN item_supplier_table s ON s.item_id = d.item_id WHERE d.item_manufacturer = ?;";

    public static final String QUERY_SELECT_ITEM_BY_SUPPLIER = "SELECT d.item_model_name, d.item_manufacturer, d.item_type, s.supplier_id, d.item_id FROM item_details_table d INNER JOIN item_supplier_table s ON s.item_id = d.item_id WHERE s.supplier_id = ?;";

    public static final String QUERY_SELECT_ITEM_BY_TYPE = "SELECT d.item_model_name, d.item_manufacturer, d.item_type, s.supplier_id, d.item_id FROM item_details_table d INNER JOIN item_supplier_table s ON s.item_id = d.item_id WHERE d.item_type = ?;";

    public static final String QUERY_SELECT_ALL_ITEM_DETAILS = "SELECT item_model_name, item_manufacturer, item_type, item_id FROM item_details_table;";

    public static final String QUERY_GET_ITEM_BY_TYPE = "SELECT item_model_name, item_manufacturer, item_type, item_id FROM item_details_table WHERE item_type = ?;";

    public static final String QUERY_GET_ITEM_BY_MANUFACTURER = "SELECT item_model_name, item_manufacturer, item_type, item_id FROM item_details_table WHERE item_manufacturer = ?;";

    public static final String QUERY_GET_ITEM_BY_ITEM_MODEL = "SELECT item_model_name, item_manufacturer, item_type, item_id FROM item_details_table WHERE item_model_name =?;";


    public static final String QUERY_GET_FAULTY_ITEMS = "SELECT COUNT(barcode_number) FROM items_list_table WHERE item_id = ? AND stock_out_id IS NULL AND item_status LIKE '%Faulty%';";

    public static final String QUERY_SELECT_STOCK_OUT_BY_MANUFACTURER = "SELECT s.stock_out_id, s.item_id, i.item_type, s.stock_out_date, s.selling_price, s.quantity, s.customer_order_id FROM `stock_out_items_table` s INNER JOIN `item_details_table` i ON i.item_id = s.item_id WHERE i.item_manufacturer = ?";

    public static final String QUERY_DELETE_STOCK_OUT_BY_MANUFACTURER = "";

    public static final String QUERY_GET_ALL_ITEM_DETAILS = "SELECT i.item_id, i.item_model_name, i.item_manufacturer, i.item_type, i.item_supplier, i.item_details FROM item_details_table i;";
    @Language("MySQL")
    public static final String QUERY_GET_STOCK_TABLE = "SELECT s.stock_in_id, idt.item_id, idt.item_model_name, idt.item_manufacturer, idt.item_supplier, idt.item_type, s.stock_in_date, s.remarks, idt.item_details, COUNT(CASE WHEN ilt.items_status LIKE '%Working%' THEN 1 END) AS workingCount, COUNT(CASE WHEN ilt.items_status LIKE '%Faulty%' THEN 1 END) AS faultCount FROM stock_in_items_table s INNER JOIN item_details_table idt ON s.item_id = idt.item_id INNER JOIN items_list_table ilt ON s.stock_in_id = ilt.stock_in_id " +
            "GROUP BY s.stock_in_id, idt.item_id, idt.item_model_name, idt.item_manufacturer, idt.item_supplier, idt.item_type, s.stock_in_date, s.remarks, idt.item_details;";

    @Language("MySQL")
    public static final String QUERY_GET_WORKING_STOCK_BY_STOCK_ID = "SELECT ilt.barcode_number, ilt.description FROM items_list_table ilt WHERE ilt.items_status LIKE '%Working%' AND ilt.stock_in_id = ?;";
    @Language("MySQL")
    public static final String QUERY_GET_FAULT_STOCK_BY_STOCK_ID = "SELECT  ilt.barcode_number, ilt.description FROM items_list_table ilt WHERE ilt.items_status LIKE '%Faulty%' AND ilt.stock_in_id = ?;";

}
