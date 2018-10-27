package com.dbms.dao;

import java.util.HashMap;
import java.util.List;

import com.dbms.model.Client;
import com.dbms.model.Delivery;
import com.dbms.model.Invoice;
import com.dbms.model.Order;
import com.dbms.model.Product;

public interface Productdao {
	public List<String> getProducts();
	public List<List<String>> getProductsAndPrice();
	public void finalPlaceOrder(Order order);
	public List<List<String>> getOrdersForClient(String username);
	public List<List<String>> getAllOrdersList();
	public List<List<String>> getSpecificOrdersList(String clientusername);
	public void updatePrices(Product product);
	public List<List<String>> getBillPrice(String id);
	public void saveInvoice(Invoice invoice);
	public List<List<String>> getInvoiceList();
	public List<List<String>> getCompletedOrdersList();
	public void updateDeliveryDetails(Delivery delivery);
	public List<List<String>> getSpecificInvoiceList(String username);
	public void updateOrderStatus(String orderid, String username, String type);
	public List<List<String>> getDeliveryList();
	public List<List<String>> getClientDeliveryList(String username);
}
