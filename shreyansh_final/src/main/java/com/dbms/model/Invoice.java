package com.dbms.model;

import java.sql.Date;

public class Invoice {
	private String clientusername;
	private Date gendate;
	private Date duedate;
	private Integer amount;
	private String orderid;

	public Invoice() {
		
	}
	
	public Invoice(String clientusername, Date gendate, Date duedate, Integer amount, String orderid) {
		this.clientusername = clientusername;
		this.gendate = gendate;
		this.duedate = duedate;
		this.orderid = orderid;
	}
	
	public String getClientusername() {
		return clientusername;
	}
	
	public Date getGendate() {
		return gendate;
	}
	
	public Date getDuedate() {
		return duedate;
	}
	
	public Integer getAmount() {
		return amount;
	}
	
	public String getOrderid() {
		return orderid;
	}
	
	public void setClientusername(String username) {
		clientusername = username;
	}
	
	public void setGendate(Date dat) {
		gendate = dat;
	}
	
	public void setDuedate(Date dat) {
		duedate = dat;
	}
	
	public void setAmount(Integer amt) {
		amount = amt;
	}
	
	public void setOrderid(String id) {
		orderid = id;
	}
}
