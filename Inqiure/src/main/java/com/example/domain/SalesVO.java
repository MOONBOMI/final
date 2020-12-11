package com.example.domain;

public class SalesVO {

	private String sno;
	private String sales_companycode;
	private String sales_day;
	private String sales_categorycode;
	private String paytype;
	private String salesamount;
	private String salescount;
	private String salestype;
	
	
	public String getSno() {
		return sno;
	}
	public void setSno(String sno) {
		this.sno = sno;
	}
	public String getSales_companycode() {
		return sales_companycode;
	}
	public void setSales_companycode(String sales_companycode) {
		this.sales_companycode = sales_companycode;
	}
	public String getSales_day() {
		return sales_day;
	}
	public void setSales_day(String sales_day) {
		this.sales_day = sales_day;
	}
	public String getSales_categorycode() {
		return sales_categorycode;
	}
	public void setSales_categorycode(String sales_categorycode) {
		this.sales_categorycode = sales_categorycode;
	}
	public String getPaytype() {
		return paytype;
	}
	public void setPaytype(String paytype) {
		this.paytype = paytype;
	}
	public String getSalesamount() {
		return salesamount;
	}
	public void setSalesamount(String salesamount) {
		this.salesamount = salesamount;
	}
	public String getSalescount() {
		return salescount;
	}
	public void setSalescount(String salescount) {
		this.salescount = salescount;
	}
	public String getSalestype() {
		return salestype;
	}
	public void setSalestype(String salestype) {
		this.salestype = salestype;
	}
	
	
	@Override
	public String toString() {
		return "SalesVO [sno=" + sno + ", sales_companycode=" + sales_companycode + ", sales_day=" + sales_day
				+ ", sales_categorycode=" + sales_categorycode + ", paytype=" + paytype + ", salesamount=" + salesamount
				+ ", salescount=" + salescount + ", salestype=" + salestype + "]";
	}
	
	
}
