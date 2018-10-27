package com.dbms.model;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

public class User{
	@NotEmpty(message="required")
	private String username;
	@NotEmpty(message="required")
	private String password;
	@NotEmpty(message="required")
	private String mPassword;
	@NotEmpty(message="required")
	private String name;
	
	@NotEmpty(message="required")
	@Email(message="Invalid mail")
	private String mail;
	
	@NotEmpty(message="required")
	private String type;
	
	private String salary;
	
	public User() {
		
	}
	
	public User(String uname,String pass,String mpass,String name, String mail) {
		this.username=uname;
		this.password=pass;
		this.mPassword=mpass;
		this.name=name;
		this.mail=mail;
	}
	
	public User(String uname,String pass) {
		this.username=uname;
		this.password=pass;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getmPassword() {
		return mPassword;
	}

	public void setmPassword(String mPassword) {
		this.mPassword = mPassword;
	}
	
	public String getType() {
		return type;
	}
	
	public void setType(String type) {
		this.type = type;
	}
	
	public String getSalary() {
		return salary;
	}
	
	public void setSalary(String salary) {
		this.salary = salary;
	}
	
}