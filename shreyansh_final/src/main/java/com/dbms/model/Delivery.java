package com.dbms.model;

import java.sql.Date;

public class Delivery {
	private String orderid;
	private String clntusername;
	private String modeoftransport;
	private String contactno;
	private Date date;
	private String type;
	
	public Delivery() {
		
	}
	
	public String getOrderid() {
		return orderid;
	}
	
	public String getClntusername() {
		return clntusername;
	}
	
	public String getModeoftransport() {
		return modeoftransport;
	}
	
	public String getContactno() {
		return contactno;
	}
	
	public Date getDate() {
		return date;
	}
	
	public String getType() {
		return type;
	}
	
	public void setOrderid(String ordid) {
		orderid = ordid;
	}
	
	public void setClntusername(String user) {
		clntusername = user;
	}
	
	public void setModeoftransport(String transport) {
		modeoftransport = transport;
	}
	
	public void setContactno(String contact) {
		contactno = contact;
	}
	
	public void setDate(Date dat) {
		date = dat;
	}
	
	public void setType(String types) {
		type = types;
	}
}
