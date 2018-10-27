package com.dbms.model;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

public class Client {
	@NotEmpty(message="required")
	private String username;
	private String name;
	private String buildingno;
	private String streetname;
	private String city;
	@Email(message="Invalid mail")
	private String mail;
	
	@NotEmpty(message="required")
	private String type;
	
	public Client() {
		
	}
	
	public Client(String userName, String name, String buildingNo, String streetName, String city, String email) {
        this.username = userName;
    	this.name = name;
        this.buildingno = buildingNo;
        this.streetname = streetName;
        this.city = city;
        this.mail = email;
    }
 
     // getters
     public String getUsername() {
        return username;
     }
     
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
     
     public String getMail() {
    	 return mail;
     }
     
     // Setters
     public void setUsername(String newUsername) {
         username = newUsername;
     }
   
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
     
     public void setMail(String newEmail) {
    	 mail = newEmail;
     }
}