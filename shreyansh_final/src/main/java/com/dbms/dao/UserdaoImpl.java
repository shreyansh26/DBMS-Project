package com.dbms.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.sql.DataSource;

import com.dbms.model.Attendance;
import com.dbms.model.Client;
import com.dbms.model.Employee;
import com.dbms.model.Feedback;
import com.dbms.model.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class UserdaoImpl implements Userdao{
	
	@Autowired
	DataSource datasource;
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public UserdaoImpl() {
		
	}
	public UserdaoImpl(DataSource datasource) {
		this.jdbcTemplate = new JdbcTemplate(datasource);
	}
	public void saveOrUpdate(User user) {
		 BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		 String pwd = encoder.encode(user.getPassword());
		 String sql = "INSERT INTO USERS(username, password, name, mail) VALUES (?,?,?,?)";
		 jdbcTemplate.update(sql,new Object[] {user.getUsername(), pwd, user.getName(), user.getMail()});
		 System.out.println(user.getType());
		 if(user.getType().equals("client")) {
			 sql = "INSERT INTO USERS_ROLES(user, role) VALUES(?,?)";
			 jdbcTemplate.update(sql,new Object[] {user.getUsername(),"ROLE_CLIENT"});
			 saveOrUpdateClient(user);
		 }
		 if(user.getType().equals("employee")) {
			 sql = "INSERT INTO USERS_ROLES(user, role) VALUES(?,?)";
			 jdbcTemplate.update(sql,new Object[] {user.getUsername(),"ROLE_EMPLOYEE"});
			 saveOrUpdateEmployee(user);
		 }
	}
	public void delete(String username) {
		String sql = "DELETE FROM USERS WHERE username=?";
		jdbcTemplate.update(sql,username);
	}
	public User getUser(String username) {
		String sql = "SELECT * FROM USERS WHERE username='"+username+"'";
		return jdbcTemplate.query(sql,new ResultSetExtractor<User>() {
		
		public User extractData(ResultSet rs) throws SQLException,DataAccessException{
			if(rs.next()) {
				User user = new User();
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				user.setName(rs.getString("name"));
				user.setMail(rs.getString("mail"));
				return user;
			}
			return null;
		}
	});
		
	}
	
	public void editClientProfile(Client client) {
		String sql = "UPDATE clients SET name=?, building=?, streetname=?, city=?, mail=? where username=?";
		jdbcTemplate.update(sql, new Object [] {client.getName(), client.getBuildingno(), client.getStreetname(), client.getCity(), client.getMail(), client.getUsername()});
		System.out.println(client.getUsername());
	}
	
	public void saveOrUpdateClient(User user) {
		String sql="INSERT INTO clients(username, name, mail) VALUES(?,?,?)";
		jdbcTemplate.update(sql,new Object[] {user.getUsername(), user.getName(), user.getMail()});		
	}
	
	public Client getClient(String username) {
		String sql = "SELECT * FROM clients WHERE username='"+username+"'";
		return jdbcTemplate.query(sql,new ResultSetExtractor<Client>() {
		
		public Client extractData(ResultSet rs) throws SQLException,DataAccessException{
			if(rs.next()) {
				Client client = new Client();
				client.setUsername(rs.getString("username"));
				//user.setPassword(rs.getString("password"));
				client.setName(rs.getString("name"));
				client.setBuildingno(rs.getString("building"));
				client.setStreetname(rs.getString("streetname"));
				client.setCity(rs.getString("city"));
				client.setMail(rs.getString("mail"));
				return client;
			}
			return null;
		}
	});
		
	}
	
	public Employee getEmployee(String username) {
		String sql = "SELECT * FROM Employee WHERE username='"+username+"'";
		return jdbcTemplate.query(sql, new ResultSetExtractor<Employee>() {
		
		public Employee extractData(ResultSet rs) throws SQLException, DataAccessException{
			if(rs.next()) {
				Employee employee = new Employee();
				employee.setUsername(rs.getString("username"));
				//user.setPassword(rs.getString("password"));
				employee.setName(rs.getString("name"));
				employee.setEmail(rs.getString("email"));
				employee.setDateofbirth(rs.getDate("dateofbirth"));
				employee.setHouseno(rs.getString("houseno"));
				employee.setStreetname(rs.getString("streetname"));
				employee.setCity(rs.getString("city"));
				employee.setSalary(rs.getInt("salary"));
				employee.setGender(rs.getString("gender"));
				return employee;
			}
			return null;
		}
	});
		
	}
	
	public void saveOrUpdateEmployee(User user) {
		String sql="INSERT INTO Employee(username, name, email, salary) VALUES(?,?,?,?)";
		jdbcTemplate.update(sql,new Object[] {user.getUsername(), user.getName(), user.getMail(), user.getSalary()});		
	}
	
	public void editEmployeeProfile(Employee employee) {
		String sql = "UPDATE Employee SET name=?, email=?, dateofbirth=?, houseno=?, streetname=?, city=?, gender=? where username=?";
		jdbcTemplate.update(sql, new Object [] {employee.getName(), employee.getEmail(), employee.getDateofbirth(), employee.getHouseno(), employee.getStreetname(), employee.getCity(), employee.getGender(), employee.getUsername()});
		System.out.println(employee.getUsername());
	}
	
	public List<List<String>> getEmployeesList() {
		String sql = "SELECT * FROM Employee";
		return jdbcTemplate.query(sql, new ResultSetExtractor<List<List<String>>>() {
			public List<List<String>> extractData(ResultSet rs) throws SQLException, DataAccessException{
				List<List<String>> employeelist = new ArrayList<List<String>>();
				while(rs.next()) {
					List<String> temp = new ArrayList<>();
					String username = rs.getString("username");
					System.out.println(username);
					String name = rs.getString("name");
					String email = rs.getString("email");
					Date dateofbirth = rs.getDate("dateofbirth");
					String date2;
					if(dateofbirth == null)
						date2 = "";
					else
						date2 = dateofbirth.toString();
//					System.out.println(dateofbirth);
					String houseno = rs.getString("houseno");
					String streetname = rs.getString("streetname");
					String city = rs.getString("city");
					String address = houseno + ", " + streetname + ", " + city;
					String salary = Integer.toString(rs.getInt("salary"));
					String gender = rs.getString("gender");
				
					temp.add(username);
					temp.add(name);
					temp.add(gender);
					temp.add(date2);
					temp.add(email);
//					temp.add(address);
					temp.add(houseno);
					temp.add(streetname);
					temp.add(city);
					temp.add(salary);
					
					employeelist.add(temp);
				}
//				System.out.println("Hello");
//				System.out.println(Arrays.toString(employeelist.toArray()));
				return employeelist;
			}
		});
	}
	
	public List<List<String>> getClientsList() {
		String sql = "SELECT * FROM clients";
		return jdbcTemplate.query(sql, new ResultSetExtractor<List<List<String>>>() {
			public List<List<String>> extractData(ResultSet rs) throws SQLException, DataAccessException{
				List<List<String>> clientslist = new ArrayList<List<String>>();
				while(rs.next()) {
					List<String> temp = new ArrayList<>();
					String username = rs.getString("username");
					System.out.println(username);
					String name = rs.getString("name");
					String email = rs.getString("mail");
					String building = rs.getString("building");
					String streetname = rs.getString("streetname");
					String city = rs.getString("city");
					String address = building + ", " + streetname + ", " + city;
				
					temp.add(username);
					temp.add(name);
					temp.add(email);;
					temp.add(building);
					temp.add(streetname);
					temp.add(city);
					
					clientslist.add(temp);
				}
//				System.out.println("Hello");
//				System.out.println(Arrays.toString(employeelist.toArray()));
				return clientslist;
			}
		});
	}
	
	public List<List<String>> getEmployeesNameList() {
		String sql = "SELECT * FROM Employee";
		return jdbcTemplate.query(sql, new ResultSetExtractor<List<List<String>>>() {
			public List<List<String>> extractData(ResultSet rs) throws SQLException, DataAccessException{
				List<List<String>> employeenamelist = new ArrayList<List<String>>();
				while(rs.next()) {
					List<String> temp = new ArrayList<>();
					String username = rs.getString("username");
					String name = rs.getString("name");
					temp.add(username);
					temp.add(name);
					employeenamelist.add(temp);
				}
				return employeenamelist;
			}
		});
	}
	
	public void finallyMarkAttendance(Attendance attendance) {
		HashMap<String, String> attendancemap = attendance.getAttendancemap();
		if(attendancemap == null)
			return;
		Set<String> keys = attendancemap.keySet();
		
		Iterator<String> keysIterator = keys.iterator();
		
		while(keysIterator.hasNext()) {
			String key = keysIterator.next();
			System.out.println(key);
			String sql="INSERT IGNORE INTO Attendance(empusername, date, value) VALUES(?,?,?)";
			if(attendancemap.get(key) != null)
				jdbcTemplate.update(sql, new Object[] {key, attendance.getDate(), attendancemap.get(key)});
		}
	}
	
	public List<List<String>> getAllAttendanceList() {
		String sql = "select * from Attendance, Employee where empusername=username order by date desc;";
		return jdbcTemplate.query(sql, new ResultSetExtractor<List<List<String>>>() {
			public List<List<String>> extractData(ResultSet rs) throws SQLException, DataAccessException{
				List<List<String>> allattendancelist = new ArrayList<List<String>>();
				while(rs.next()) {
					List<String> temp = new ArrayList<>();
					String empusername = rs.getString("empusername");
					String name = rs.getString("name");
					String date = rs.getDate("date").toString();
					String value = rs.getString("value");
					temp.add(empusername);
					temp.add(name);
					temp.add(date);
					temp.add(value);
					allattendancelist.add(temp);
				}
				return allattendancelist;
			}
		});
	}
	
	public List<List<String>> getUserAttendanceList(String username) {
		String sql = "select * from Attendance, Employee where empusername=username and username='" + username + "' order by date desc;";
		return jdbcTemplate.query(sql, new ResultSetExtractor<List<List<String>>>() {
			public List<List<String>> extractData(ResultSet rs) throws SQLException, DataAccessException{
				List<List<String>> allattendancelist = new ArrayList<List<String>>();
				while(rs.next()) {
					List<String> temp = new ArrayList<>();
					String empusername = rs.getString("empusername");
					String name = rs.getString("name");
					String date = rs.getDate("date").toString();
					String value = rs.getString("value");
					temp.add(empusername);
					temp.add(name);
					temp.add(date);
					temp.add(value);
					allattendancelist.add(temp);
				}
				return allattendancelist;
			}
		});
	}
	
	public List<List<String>> getClientAttendanceList(String username) {
		String sql = "select * from Attendance, Employee where empusername=username and username='"+username+"' order by date desc;";
		return jdbcTemplate.query(sql, new ResultSetExtractor<List<List<String>>>() {
			public List<List<String>> extractData(ResultSet rs) throws SQLException, DataAccessException{
				List<List<String>> clientattendancelist = new ArrayList<List<String>>();
				while(rs.next()) {
					List<String> temp = new ArrayList<>();
					String date = rs.getDate("date").toString();
					String value = rs.getString("value");
					temp.add(date);
					temp.add(value);
					clientattendancelist.add(temp);
				}
				return clientattendancelist;
			}
		});
	}
	
	public void saveFeedback(Feedback feedback) {
		String sql="INSERT INTO Feedback(clientusername, date, feedbacktext) VALUES(?,?,?)";
		jdbcTemplate.update(sql,new Object[] {feedback.getClientusername(), feedback.getDate(), feedback.getFeedbacktext()});
	}
	
	public List<List<String>> getFeedbacks() {
		String sql = "Select * from Feedback, clients where clientusername=username";
		return jdbcTemplate.query(sql, new ResultSetExtractor<List<List<String>>>() {
			public List<List<String>> extractData(ResultSet rs) throws SQLException, DataAccessException{
				List<List<String>> submittedfeebacks = new ArrayList<List<String>>();
				while(rs.next()) {
					List<String> temp = new ArrayList<>();
					String clientusername = rs.getString("clientusername");
					String name = rs.getString("name");
					String date = rs.getDate("date").toString();
					String feedbacktext = rs.getString("feedbacktext");
					temp.add(clientusername);
					temp.add(name);
					temp.add(date);
					temp.add(feedbacktext);
					submittedfeebacks.add(temp);
				}
				return submittedfeebacks;
			}
		});
	}
}