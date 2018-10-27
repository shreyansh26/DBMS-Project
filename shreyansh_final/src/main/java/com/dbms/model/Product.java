package com.dbms.model;

import java.util.HashMap;

public class Product {
	private String producttype;
	private HashMap<String, Integer> costlist;
	
	public Product() {
		
	}
	
	public Product(String ptype) {
        this.producttype = ptype;
    }
	
	public String getProducttype() {
        return producttype;
    }
	
	public HashMap<String, Integer> getCostlist() {
        return costlist;
    }
	
	public void setProducttype(String ptype) {
		producttype = ptype;
    }
	
	public void setCostlist(HashMap<String, Integer> cost) {
		costlist = cost;
    }
}