package com.dbms.model;

import java.sql.Date;

public class Feedback {
	private String clientusername;
	private Date date;
	private String feedbacktext;
	
	public Feedback() {
		
	}
	
	public Feedback(String clientusername, Date date, String feedbacktext) {
		this.clientusername = clientusername;
		this.date = date;
		this.feedbacktext = feedbacktext;
	}
	
	public String getClientusername() {
		return clientusername;
	}
	
	public Date getDate() {
		return date;
	}
	
	public String getFeedbacktext() {
		return feedbacktext;
	}
	
	public void setClientusername(String username) {
		clientusername = username;
	}
	
	public void setDate(Date dat) {
		date = dat;
	}
	
	public void setFeedbacktext(String body) {
		feedbacktext = body;
	}
}
