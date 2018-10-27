package com.dbms.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;

import com.dbms.model.Client;
import com.dbms.model.Delivery;
import com.dbms.model.Invoice;
import com.dbms.model.Order;
import com.dbms.model.Product;

public class ProductdaoImpl implements Productdao{
	@Autowired
	DataSource datasource;
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public ProductdaoImpl() {
		
	}
	public ProductdaoImpl(DataSource datasource) {
		this.jdbcTemplate = new JdbcTemplate(datasource);
	}
	
	public List<String> getProducts() {
		String sql = "SELECT * from Product";
		return jdbcTemplate.query(sql, new ResultSetExtractor<List<String>>() {
			@SuppressWarnings("null")
			public List<String> extractData(ResultSet rs) throws SQLException, DataAccessException{
				List<String> products = new ArrayList<>();
				while(rs.next()) {
					String x = rs.getString("producttype");
					System.out.println(x);
					products.add(x);
				}
//				System.out.println("Hello");
				System.out.println(Arrays.toString(products.toArray()));
				return products;
			}
		});
	}
	
	public List<List<String>> getProductsAndPrice() {
		String sql = "SELECT * from Product";
		return jdbcTemplate.query(sql, new ResultSetExtractor<List<List<String>>>() {
			@SuppressWarnings("null")
			public List<List<String>> extractData(ResultSet rs) throws SQLException, DataAccessException{
				List<List<String>> productsandprice = new ArrayList<List<String>>();
				while(rs.next()) {
					List<String> temp = new ArrayList<>();
					String type = rs.getString("producttype");
					String price = rs.getString("cost");
					temp.add(type);
					temp.add(price);
					productsandprice.add(temp);
				}
//				System.out.println("Hello");
//				System.out.println(Arrays.toString(products.toArray()));
				return productsandprice;
			}
		});
	}
	
	public void finalPlaceOrder(Order order) {
		HashMap<String, Integer> orders = order.getOrderquantity();
		Set<String> keys = orders.keySet();
		
		Iterator<String> keysIterator = keys.iterator();
		
		while(keysIterator.hasNext()) {
			String key = keysIterator.next();
			System.out.println(key);
			String sql="INSERT INTO orders(orderid, clientusername, typeofgood, quantity) VALUES(?,?,?,?)";
			jdbcTemplate.update(sql, new Object[] {order.getOrderid(), order.getClientusername(), key, orders.get(key)});
		}
	}
	
	public List<List<String>> getOrdersForClient(String username) {
		String sql = "SELECT * FROM orders WHERE clientusername='"+username+"'";
		return jdbcTemplate.query(sql, new ResultSetExtractor<List<List<String>>>() {
			@SuppressWarnings("null")
			public List<List<String>> extractData(ResultSet rs) throws SQLException, DataAccessException{
				List<List<String>> orderdetails = new ArrayList<List<String>>();
				while(rs.next()) {
					List<String> temp = new ArrayList<>();
					String id = rs.getString("orderid");
					String quantity = Integer.toString(rs.getInt("quantity"));
//					System.out.println(quantity);
					String typeofgood = rs.getString("typeofgood");
					String status = rs.getString("status");
					if(!quantity.equals("0")) {
						temp.add(id);
						temp.add(typeofgood);
						temp.add(quantity);
						temp.add(status);
						orderdetails.add(temp);
					}
				}
//				System.out.println("Hello");
//				System.out.println(Arrays.toString(products.toArray()));
				return orderdetails;
			}
		});
	}
	
	public List<List<String>> getAllOrdersList() {
		String sql = "SELECT * FROM orders";
		return jdbcTemplate.query(sql, new ResultSetExtractor<List<List<String>>>() {
			@SuppressWarnings("null")
			public List<List<String>> extractData(ResultSet rs) throws SQLException, DataAccessException{
				List<List<String>> orderdetails = new ArrayList<List<String>>();
				while(rs.next()) {
					List<String> temp = new ArrayList<>();
					String id = rs.getString("orderid");
					String username = rs.getString("clientusername");
					String quantity = Integer.toString(rs.getInt("quantity"));
//					System.out.println(quantity);
					String typeofgood = rs.getString("typeofgood");
					String status = rs.getString("status");
					if(!quantity.equals("0")) {
						temp.add(id);
						temp.add(username);
						temp.add(typeofgood);
						temp.add(quantity);
						temp.add(status);
						orderdetails.add(temp);
					}
				}
//				System.out.println("Hello");
//				System.out.println(Arrays.toString(products.toArray()));
				return orderdetails;
			}
		});
	}
	
	public List<List<String>> getSpecificOrdersList(String clientusername) {
		String sql = "SELECT * FROM orders WHERE clientusername='"+clientusername+"'";
		return jdbcTemplate.query(sql, new ResultSetExtractor<List<List<String>>>() {
			@SuppressWarnings("null")
			public List<List<String>> extractData(ResultSet rs) throws SQLException, DataAccessException{
				List<List<String>> orderdetails = new ArrayList<List<String>>();
				while(rs.next()) {
					List<String> temp = new ArrayList<>();
					String id = rs.getString("orderid");
					String quantity = Integer.toString(rs.getInt("quantity"));
//					System.out.println(quantity);
					String typeofgood = rs.getString("typeofgood");
					String status = rs.getString("status");
					if(!quantity.equals("0")) {
						temp.add(id);
						temp.add(typeofgood);
						temp.add(quantity);
						temp.add(status);
						orderdetails.add(temp);
					}
				}
//				System.out.println("Hello");
//				System.out.println(Arrays.toString(products.toArray()));
				return orderdetails;
			}
		});
	}
	
	public void updatePrices(Product product) {
		HashMap<String, Integer> costlist = product.getCostlist();
		if(costlist == null)
			return;
		
		Set<String> keys = costlist.keySet();
		
		Iterator<String> keysIterator = keys.iterator();
		
		while(keysIterator.hasNext()) {
			String key = keysIterator.next();
			System.out.println(key);
			if(costlist.get(key) != null) {
				String sql="Update Product set cost=? where producttype like ?;";
				jdbcTemplate.update(sql, new Object[] {costlist.get(key), key});
			}
		}
	}
	
	public List<List<String>> getBillPrice(String id) {
		String sql = "select username, name, typeofgood, quantity*cost as total from orders, Product, clients where orderid='" + id + "' and typeofgood=producttype and clientusername=username";
		return jdbcTemplate.query(sql, new ResultSetExtractor<List<List<String>>>() {
			@SuppressWarnings("null")
			public List<List<String>> extractData(ResultSet rs) throws SQLException, DataAccessException{
				List<List<String>> orderdetails = new ArrayList<List<String>>();
				while(rs.next()) {
					List<String> temp = new ArrayList<>();
					String username = rs.getString("username");
					String name = rs.getString("name");
					String typeofgood = rs.getString("typeofgood");
					String cost = Integer.toString(rs.getInt("total"));
					temp.add(name);
					temp.add(typeofgood);
					temp.add(cost);
					temp.add(username);
					orderdetails.add(temp);
				}
//				System.out.println("Hello");
//				System.out.println(Arrays.toString(products.toArray()));
				return orderdetails;
			}
		});
	}
	
	public void saveInvoice(Invoice invoice) {
		String sql="INSERT INTO Invoice(clientusername, orderid, gendate, duedate, amount) VALUES(?,?,?,?,?)";
		jdbcTemplate.update(sql, new Object[] {invoice.getClientusername(), invoice.getOrderid(), invoice.getGendate(), invoice.getDuedate(), invoice.getAmount()});
	}
	
	public List<List<String>> getInvoiceList() {
		String sql = "select * from Invoice, clients where clientusername=username order by gendate desc;";
		return jdbcTemplate.query(sql, new ResultSetExtractor<List<List<String>>>() {
			@SuppressWarnings("null")
			public List<List<String>> extractData(ResultSet rs) throws SQLException, DataAccessException{
				List<List<String>> invoicelist = new ArrayList<List<String>>();
				while(rs.next()) {
					List<String> temp = new ArrayList<>();
					String username = rs.getString("clientusername");
					String name = rs.getString("name");
					String orderid = rs.getString("orderid");
					String gendate = rs.getDate("gendate").toString();
					String duedate = rs.getDate("duedate").toString();
					String amount = Integer.toString(rs.getInt("amount"));
//					System.out.println(quantity);
					temp.add(username);
					temp.add(name);
					temp.add(orderid);
					temp.add(gendate);
					temp.add(duedate);
					temp.add(amount);
					invoicelist.add(temp);
				}
//				System.out.println("Hello");
//				System.out.println(Arrays.toString(products.toArray()));
				return invoicelist;
			}
		});
	}
	
	public List<List<String>> getSpecificInvoiceList(String username) {
		String sql = "select * from Invoice, clients where clientusername=username and username='" + username + "' order by gendate desc";
		return jdbcTemplate.query(sql, new ResultSetExtractor<List<List<String>>>() {
			@SuppressWarnings("null")
			public List<List<String>> extractData(ResultSet rs) throws SQLException, DataAccessException{
				List<List<String>> specificinvoicelist = new ArrayList<List<String>>();
				while(rs.next()) {
					List<String> temp = new ArrayList<>();
					String orderid = rs.getString("orderid");
					String gendate = rs.getDate("gendate").toString();
					String duedate = rs.getDate("duedate").toString();
					String amount = Integer.toString(rs.getInt("amount"));
//					System.out.println(quantity);
					temp.add(orderid);
					temp.add(gendate);
					temp.add(duedate);
					temp.add(amount);
					specificinvoicelist.add(temp);
				}
//				System.out.println("Hello");
//				System.out.println(Arrays.toString(products.toArray()));
				return specificinvoicelist;
			}
		});
	}
	
	public void updateOrderStatus(String orderid, String username, String type) {
		String sql = "Update orders set status='Done' where clientusername=? and orderid=? and typeofgood=?";
		jdbcTemplate.update(sql, new Object[] {username, orderid, type});
		System.out.println(orderid + " " + username + " " + type);
	}
	
	public List<List<String>> getCompletedOrdersList() {
		String sql = "select * from orders where status='Done' and orderid not in(select orderid from delivery)";
		return jdbcTemplate.query(sql, new ResultSetExtractor<List<List<String>>>() {
			@SuppressWarnings("null")
			public List<List<String>> extractData(ResultSet rs) throws SQLException, DataAccessException{
				List<List<String>> orderdetails = new ArrayList<List<String>>();
				while(rs.next()) {
					List<String> temp = new ArrayList<>();
					String id = rs.getString("orderid");
					String username = rs.getString("clientusername");
					String quantity = Integer.toString(rs.getInt("quantity"));
//					System.out.println(quantity);
					String typeofgood = rs.getString("typeofgood");
					if(!quantity.equals("0")) {
						temp.add(id);
						temp.add(username);
						temp.add(typeofgood);
						temp.add(quantity);
						orderdetails.add(temp);
					}
				}
//				System.out.println("Hello");
//				System.out.println(Arrays.toString(products.toArray()));
				return orderdetails;
			}
		});
	}
	
	public void updateDeliveryDetails(Delivery delivery) {
		String sql = "Insert IGNORE into delivery(orderid, clntusername, item, modeoftransport, contactno, date) values (?,?,?,?,?,?)";
		jdbcTemplate.update(sql, new Object[] {delivery.getOrderid(), delivery.getClntusername(), delivery.getType(), delivery.getModeoftransport(), delivery.getContactno(), delivery.getDate()});
	}
	
	public List<List<String>> getDeliveryList() {
		String sql = "select * from delivery";
		return jdbcTemplate.query(sql, new ResultSetExtractor<List<List<String>>>() {
			@SuppressWarnings("null")
			public List<List<String>> extractData(ResultSet rs) throws SQLException, DataAccessException{
				List<List<String>> deliverylist = new ArrayList<List<String>>();
				while(rs.next()) {
					List<String> temp = new ArrayList<>();
					String username = rs.getString("clntusername");
					String orderid = rs.getString("orderid");
					String date = rs.getDate("date").toString();
					String item = rs.getString("item");
					String modeoftransport = rs.getString("modeoftransport");
					String contactno = rs.getString("contactno");
//					System.out.println(quantity);
					temp.add(username);
					temp.add(orderid);
					temp.add(date);
					temp.add(item);
					temp.add(modeoftransport);
					temp.add(contactno);
					deliverylist.add(temp);
				}
//				System.out.println("Hello");
//				System.out.println(Arrays.toString(products.toArray()));
				return deliverylist;
			}
		});
	}
	
	public List<List<String>> getClientDeliveryList(String username) {
		String sql = "select * from delivery where clntusername='" + username + "'";
		return jdbcTemplate.query(sql, new ResultSetExtractor<List<List<String>>>() {
			@SuppressWarnings("null")
			public List<List<String>> extractData(ResultSet rs) throws SQLException, DataAccessException{
				List<List<String>> deliverylist = new ArrayList<List<String>>();
				while(rs.next()) {
					List<String> temp = new ArrayList<>();
					String orderid = rs.getString("orderid");
					String date = rs.getDate("date").toString();
					String item = rs.getString("item");
					String modeoftransport = rs.getString("modeoftransport");
					String contactno = rs.getString("contactno");
//					System.out.println(quantity);
					temp.add(orderid);
					temp.add(date);
					temp.add(item);
					temp.add(modeoftransport);
					temp.add(contactno);
					deliverylist.add(temp);
				}
//				System.out.println("Hello");
//				System.out.println(Arrays.toString(products.toArray()));
				return deliverylist;
			}
		});
	}
}
