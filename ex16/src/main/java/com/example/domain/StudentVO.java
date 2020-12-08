package com.example.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonFormat.Shape;


public class StudentVO {
	private int rn;
	public int getRn() {
		return rn;
	}
	public void setRn(int rn) {
		this.rn = rn;
	}
	private String scode;
	private String sname;
	private String dept;
	@JsonFormat(shape=Shape.STRING, pattern = "yyyy-MM-dd", timezone = "GMT+9")
	private Date birthday;
	@Override
	public String toString() {
		return "StudnetVO [scode=" + scode + ", sname=" + sname + ", dept=" + dept + ", birthday=" + birthday + "]";
	}
	public String getScode() {
		return scode;
	}
	public void setScode(String scode) {
		this.scode = scode;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
}
