package com.example.domain;

import java.util.Date;

public class CompanyVO {

	private String companycode;
	private String companyname;
	private String companytype;
	private String companycorporate;
	private String companyaddress;
	private String companyceo;
	private String adminid;
	private String adminpassword;
	private Date opendate;
	private String logoimage;
	
	
	public String getCompanycode() {
		return companycode;
	}
	public void setCompanycode(String companycode) {
		this.companycode = companycode;
	}
	public String getCompanyname() {
		return companyname;
	}
	public void setCompanyname(String companyname) {
		this.companyname = companyname;
	}
	public String getCompanytype() {
		return companytype;
	}
	public void setCompanytype(String companytype) {
		this.companytype = companytype;
	}
	public String getCompanycorporate() {
		return companycorporate;
	}
	public void setCompanycorporate(String companycorporate) {
		this.companycorporate = companycorporate;
	}
	public String getCompanyaddress() {
		return companyaddress;
	}
	public void setCompanyaddress(String companyaddress) {
		this.companyaddress = companyaddress;
	}
	public String getCompanyceo() {
		return companyceo;
	}
	public void setCompanyceo(String companyceo) {
		this.companyceo = companyceo;
	}
	public String getAdminid() {
		return adminid;
	}
	public void setAdminid(String adminid) {
		this.adminid = adminid;
	}
	public String getAdminpassword() {
		return adminpassword;
	}
	public void setAdminpassword(String adminpassword) {
		this.adminpassword = adminpassword;
	}
	public Date getOpendate() {
		return opendate;
	}
	public void setOpendate(Date opendate) {
		this.opendate = opendate;
	}
	public String getLogoimage() {
		return logoimage;
	}
	public void setLogoimage(String logoimage) {
		this.logoimage = logoimage;
	}
	
	
	@Override
	public String toString() {
		return "CompanyVO [companycode=" + companycode + ", companyname=" + companyname + ", companytype=" + companytype
				+ ", companycorporate=" + companycorporate + ", companyaddress=" + companyaddress + ", companyceo="
				+ companyceo + ", adminid=" + adminid + ", adminpassword=" + adminpassword + ", opendate=" + opendate
				+ ", logoimage=" + logoimage + "]";
	}
	
	
	
	
}
