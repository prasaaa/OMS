package com.Utilities;

import org.intellij.lang.annotations.Language;

public class MySQLQueries {


    public static final String QUERY_INSERT_STOCK = "INSERT INTO `stock_in_items_table`(stock_in_id ,stock_in_date, remarks, item_id) VALUES (? , ?, ?, ?);";
    @Language("MySQL")
    public static final String QUERY_INSERT_ITEM_LIST = "INSERT INTO `items_list_table`(item_id, barcode_number, items_status, description, stock_in_id) VALUES (?, ?, ?, ?, ?);";
    @Language("MySQL")
    public static final String QUERY_SELECT_BY_BARCODE = "SELECT s.stock_in_id, idt.item_id, idt.item_model_name, idt.item_manufacturer, idt.item_supplier, idt.item_type, s.stock_in_date, s.remarks, idt.item_details, COUNT(CASE WHEN ilt.items_status LIKE '%Working%' THEN 1 END) AS workingCount, COUNT(CASE WHEN ilt.items_status LIKE '%Faulty%' THEN 1 END) AS faultCount FROM stock_in_items_table s INNER JOIN item_details_table idt ON s.item_id = idt.item_id INNER JOIN items_list_table ilt ON s.stock_in_id = ilt.stock_in_id " +
            "WHERE s.stock_in_id = (SELECT st.stock_in_id FROM items_list_table st WHERE st.barcode_number LIKE CONCAT('%' + ? + '%') ) " +
            "GROUP BY s.stock_in_id, idt.item_id, idt.item_model_name, idt.item_manufacturer, idt.item_supplier, idt.item_type, s.stock_in_date, s.remarks, idt.item_details;";

    public static final String QUERY_SELECT_ITEM_BY_BARCODE = "SELECT * FROM items_list_table WHERE barcode_number = ?;";
    public static final String QUERY_SELECT_ALL = "SELECT s.stock_in_id, i.item_id, i.item_supplier, i.item_type, s.stock_in_date FROM `stock_in_items_table` s INNER JOIN `item_details_table` i  ON s.item_id = i.item_id ";
    @Language("MySQL")
    public static final String QUERY_DELETE_STOCK_BY_STOCK_ID = "DELETE FROM stock_in_items_table WHERE stock_in_id = ?;";



    public static final String QUERY_SELECT_ALL_CUSTOMER_ORDERS = "SELECT co.customer_Order_Id, c.customer_Name, co.order_Date, co.required_Date, co.order_Status, co.order_Type FROM `customer_order_table` co, `customer_table` c WHERE c.customer_Id = co.customer_Id;";


    public static final String QUERY_GET_ALL_ITEM_DETAILS = "SELECT i.item_id, i.item_model_name, i.item_manufacturer, i.item_type, i.item_supplier, i.item_details FROM item_details_table i;";
    @Language("MySQL")
    public static final String QUERY_GET_STOCK_TABLE = "SELECT s.stock_in_id, idt.item_id, idt.item_model_name, idt.item_manufacturer, idt.item_supplier, idt.item_type, s.stock_in_date, s.remarks, idt.item_details, COUNT(CASE WHEN ilt.items_status LIKE '%Working%' THEN 1 END) AS workingCount, COUNT(CASE WHEN ilt.items_status LIKE '%Faulty%' THEN 1 END) AS faultCount FROM stock_in_items_table s INNER JOIN item_details_table idt ON s.item_id = idt.item_id INNER JOIN items_list_table ilt ON s.stock_in_id = ilt.stock_in_id " +
            "GROUP BY s.stock_in_id, idt.item_id, idt.item_model_name, idt.item_manufacturer, idt.item_supplier, idt.item_type, s.stock_in_date, s.remarks, idt.item_details;";

    @Language("MySQL")
    public static final String QUERY_GET_WORKING_STOCK_BY_STOCK_ID = "SELECT ilt.barcode_number, ilt.description FROM items_list_table ilt WHERE ilt.items_status LIKE '%Working%' AND ilt.stock_in_id = ?;";
    @Language("MySQL")
    public static final String QUERY_GET_FAULT_STOCK_BY_STOCK_ID = "SELECT  ilt.barcode_number, ilt.description FROM items_list_table ilt WHERE ilt.items_status LIKE '%Faulty%' AND ilt.stock_in_id = ?;";


    @Language("MySQL")
    public static final String QUERY_UPDATE_STOCK_IN_TABLE = "UPDATE stock_in_items_table SET stock_in_date = ?, remarks = ?, item_id = ? WHERE stock_in_id = ?";

    @Language("MySQL")
    public static final String QUERY_DELETE_ITEMS_BY_STOCK_ID = "DELETE FROM items_list_table WHERE stock_in_id = ?";

    @Language("MySQL")
    public static final String QUERY_GET_ALL_OTHER_ITEMS = "SELECT * FROM items_list_table WHERE barcode_number = ? AND stock_in_id != ?;";
}
