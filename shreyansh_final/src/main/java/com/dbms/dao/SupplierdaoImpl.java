package com.dbms.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;

import com.dbms.model.RawMaterial;
import com.dbms.model.Supplier;
import com.dbms.model.User;

public class SupplierdaoImpl implements Supplierdao {
	@Autowired
	DataSource datasource;
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public SupplierdaoImpl() {
		
	}
	public SupplierdaoImpl(DataSource datasource) {
		this.jdbcTemplate = new JdbcTemplate(datasource);
	}
	
	public void addRawMaterial(RawMaterial rawmaterial) {
		String sql="INSERT INTO rawmaterials(type) VALUES(?)";
		jdbcTemplate.update(sql,new Object[] {rawmaterial.getRawmaterialtype()});		
	}
	
	public List<String> getRawMaterials() {
		String sql="SELECT * from rawmaterials";
		return jdbcTemplate.query(sql, new ResultSetExtractor<List<String>>() {
			@SuppressWarnings("null")
			public List<String> extractData(ResultSet rs) throws SQLException, DataAccessException{
				List<String> rawmaterials = new ArrayList<>();
				while(rs.next()) {
					String x = rs.getString("type");
					rawmaterials.add(x);
				}
//				System.out.println("Hello");
				System.out.println(Arrays.toString(rawmaterials.toArray()));
				return rawmaterials;
			}
		});		
	}
	
	public void saveSupplier(Supplier supplier) {
		HashMap<String, String> sellingitems = supplier.getSellingitems();
		if(sellingitems == null)
			return;
		Set<String> keys = sellingitems.keySet();
		
		Iterator<String> keysIterator = keys.iterator();
		String sql="INSERT IGNORE INTO Supplier(supname, buildingno, streetname, city, email, phoneno) VALUES(?,?,?,?,?,?)";
		jdbcTemplate.update(sql, new Object[] {supplier.getName(), supplier.getBuildingno(), supplier.getStreetname(), supplier.getCity(), supplier.getEmail(), supplier.getPhoneno()});
		
		while(keysIterator.hasNext()) {
			String key = keysIterator.next();
			System.out.println(key);
			String sql2="INSERT IGNORE INTO supplyRawMaterial(suppliername, goods) VALUES(?,?)";
			if(sellingitems.get(key).equals("yes"))
				jdbcTemplate.update(sql2, new Object[] {supplier.getName(), key});
		}
	}
	
	public List<List<String>> getSuppliersList() {
		String sql = "select * from Supplier, supplyRawMaterial where suppliername=supname order by goods;";
		return jdbcTemplate.query(sql, new ResultSetExtractor<List<List<String>>>() {
			public List<List<String>> extractData(ResultSet rs) throws SQLException, DataAccessException{
				List<List<String>> supplierslist = new ArrayList<List<String>>();
				while(rs.next()) {
					List<String> temp = new ArrayList<>();
					String supname = rs.getString("supname");
					String email = rs.getString("email");
					String building = rs.getString("buildingno");
					String streetname = rs.getString("streetname");
					String city = rs.getString("city");
					String phoneno = rs.getString("phoneno");
					String goods = rs.getString("goods");
					String address = building + ", " + streetname + ", " + city;
				
					temp.add(supname);
					temp.add(building);
					temp.add(streetname);
					temp.add(city);
					temp.add(email);
					temp.add(phoneno);
					temp.add(goods);
					supplierslist.add(temp);
				}
				return supplierslist;
			}
		});
	}
}
