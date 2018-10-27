package com.dbms.model;

import java.util.HashMap;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

public class Supplier {
	private int id;
	@NotEmpty(message="required")
	private String name;
	private String buildingno;
	private String streetname;
	@NotEmpty(message="required")
	private String city;
	@Email(message="Invalid mail")
	private String email;
	@NotEmpty(message="required")
	private String phoneno;
	
	private HashMap<String, String> sellingitems;
	
	public Supplier() {
		
	}
	
	public Supplier(String name, String buildingNo, String streetName, String city, String email, String phoneno) {
    	this.name = name;
        this.buildingno = buildingNo;
        this.streetname = streetName;
        this.city = city;
        this.email = email;
        this.phoneno = phoneno;
    }
 
     // getters     
     public String getName() {
        return name;
     }

     public String getBuildingno() {
        return buildingno;
     }

     public String getStreetname() {
        return streetname;
     }
     
     public String getCity() {
         return city;
     }
     
     public String getAddress() {
    	 return buildingno + ", " + streetname + ", " + city;
     }
     
     public String getEmail() {
    	 return email;
     }
     
     public String getPhoneno() {
    	 return phoneno;
     }
     
     public HashMap<String, String> getSellingitems() {
    	 return sellingitems;
     }
     
     // Setters
     public void setName(String newName) {
        name = newName;
     }

     public void setBuildingno(String newBuildingNo) {
    	 buildingno = newBuildingNo;
     }

     public void setStreetname(String newStreetName) {
    	 streetname = newStreetName;
     }
     
     public void setCity(String newCity) {
    	 city = newCity;
     }
     
     public void setEmail(String newEmail) {
    	 email = newEmail;
     }
     
     public void setPhoneno(String newPhoneno) {
    	 phoneno = newPhoneno;
     }
     
     public void setSellingitems(HashMap<String, String> newlist) {
    	 sellingitems = newlist;
     }
}