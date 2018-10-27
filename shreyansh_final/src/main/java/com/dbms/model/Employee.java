package com.dbms.model;

import java.sql.Date;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

public class Employee {
	@NotEmpty(message="required")
	private String username;
	private String name;
	@Email(message="Invalid mail")
	private String email;
	private Date dateofbirth;
	private String houseno;
	private String streetname;
	private String city;
	private int salary;
	private String gender;
	
	@NotEmpty(message="required")
	private String type;
	
	public Employee() {
		
	}
	
	public Employee(String userName, String name, String email, Date dateofbirth, String houseno, String streetName, String city, int salary, String gender) {
        this.username = userName;
    	this.name = name;
    	this.email = email;
        this.houseno = houseno;
        this.streetname = streetName;
        this.city = city;
        this.dateofbirth = dateofbirth;
        this.gender = gender;
        this.salary = salary;
    }
 
     // getters
     public String getUsername() {
        return username;
     }
     
     public String getName() {
        return name;
     }

     public String getHouseno() {
        return houseno;
     }

     public String getStreetname() {
        return streetname;
     }
     
     public String getCity() {
         return city;
     }
     
     public String getAddress() {
    	 return houseno + ", " + streetname + ", " + city;
     }
     
     public String getEmail() {
    	 return email;
     }
     
     public String getGender() {
    	 return gender;
     }
     
     public Date getDateofbirth() {
    	 return dateofbirth;
     }
     
     public int getSalary() {
    	 return salary;
     }
     
     // Setters
     public void setUsername(String newUsername) {
         username = newUsername;
     }
   
     public void setName(String newName) {
        name = newName;
     }

     public void setHouseno(String newHouseNo) {
    	 houseno = newHouseNo;
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
     
     public void setGender(String newGender) {
    	 gender = newGender;
     }
     
     public void setSalary(int newSalary) {
    	 salary = newSalary;
     }
     
     public void setDateofbirth(Date newdob) {
    	 dateofbirth = newdob;
     }
}
