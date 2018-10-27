package com.dbms.model;

import java.sql.Date;
import java.util.HashMap;

public class Attendance {
	private String empusername;
	private Date date;
	private String value;
	private HashMap<String, String> attendancemap;

	public Attendance() {
		
	}
	
	public Attendance(String user, Date date, String value) {
		this.empusername = user;
		this.date = date;
		this.value = value;
	}
	
	public String getEmpusername() {
		return empusername;
	}
	
	public Date getDate() {
		return date;
	}
	
	public String getValue() {
		return value;
	}
	
	public HashMap<String, String> getAttendancemap() {
		return attendancemap;
	}
	
	public void setEmpusername(String username) {
		empusername = username;
	}
	
	public void setDate(Date dat) {
		date = dat;
	}
	
	public void setValue(String val) {
		value = val;
	}
	
	public void setAttendancemap(HashMap<String, String> attmap) {
		attendancemap = attmap;
	}
}
