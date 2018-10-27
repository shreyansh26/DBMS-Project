package com.dbms.model;

import org.hibernate.validator.constraints.NotEmpty;

public class RawMaterial {
	@NotEmpty(message="required")
	public String rawmaterialtype;
	
	public RawMaterial() {
		
	}
	
	public RawMaterial(String type) {
        this.rawmaterialtype = type;
    }
	
	public String getRawmaterialtype() {
        return rawmaterialtype;
    }
	
	public void setRawmaterialtype(String rtype) {
		rawmaterialtype = rtype;
    }
}