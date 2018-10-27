package com.dbms.dao;

import java.util.List;

import com.dbms.model.RawMaterial;
import com.dbms.model.Supplier;

public interface Supplierdao {
	public void addRawMaterial(RawMaterial rawmaterial);
	public List<String> getRawMaterials();
	public void saveSupplier(Supplier supplier);
	public List<List<String>> getSuppliersList();
}
