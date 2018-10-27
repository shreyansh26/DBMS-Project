package com.dbms.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.dbms.model.Attendance;
import com.dbms.model.Client;
import com.dbms.model.Employee;
import com.dbms.model.Feedback;
import com.dbms.model.User;

public interface Userdao{
	@Autowired
	public void saveOrUpdate(User user);
	public void delete(String username);
	public User getUser(String username);
	public Client getClient(String username);
	public void editClientProfile(Client client);	
	public void saveOrUpdateClient(User user);
	public Employee getEmployee(String username);
	public void saveOrUpdateEmployee(User user);
	public void editEmployeeProfile(Employee employee);	
	public List<List<String>> getEmployeesList();
	public List<List<String>> getEmployeesNameList();
	public List<List<String>> getClientsList();
	public void finallyMarkAttendance(Attendance attendance);
	public List<List<String>> getAllAttendanceList();
	public List<List<String>> getUserAttendanceList(String username);
	public List<List<String>> getClientAttendanceList(String username);
	public void saveFeedback(Feedback feedback);
	public List<List<String>> getFeedbacks();
}