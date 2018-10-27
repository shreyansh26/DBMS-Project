package com.dbms.model;
import java.util.*;

import org.hibernate.validator.constraints.NotEmpty;

public class Order {
	@NotEmpty(message="required")
	private String orderid;
	@NotEmpty(message="required")
	private String clientusername;
    HashMap<String, Integer> orderquantity = new HashMap<>();
    private String status;
    
    public Order() {
    }
 
    public Order(String orderid, String clientusername) {
        this.orderid = orderid;
        this.clientusername = clientusername;
    }
    
    // getters and setters
     
     public String getOrderid() {
    	return orderid;
     }
     
     public String getClientusername() {
         return clientusername;
     }
     
     public HashMap<String, Integer> getOrderquantity() {
    	 return orderquantity;
     }
     
     public String getStatus() {
         return status;
     }
     
     public void setOrderid(String newOrderId) {
    	orderid = newOrderId;
     }
     
     public void setClientusername(String newClientUsername) {
         clientusername = newClientUsername;
     }
     
     public void setOrderquantity(HashMap<String, Integer> newOrderquantity) {
    	 orderquantity = newOrderquantity;
     }
     
     public void setStatus(String newStatus) {
     	status = newStatus;
      }
}