package com.example.domain;

public class LcategoryVO {

	private String lcategorycode;
	private String lcategoryname;
	
	
	public String getLcategorycode() {
		return lcategorycode;
	}
	public void setLcategorycode(String lcategorycode) {
		this.lcategorycode = lcategorycode;
	}
	public String getLcategoryname() {
		return lcategoryname;
	}
	public void setLcategoryname(String lcategoryname) {
		this.lcategoryname = lcategoryname;
	}
	
	
	@Override
	public String toString() {
		return "LcategoryVO [lcategorycode=" + lcategorycode + ", lcategoryname=" + lcategoryname + "]";
	}

}
