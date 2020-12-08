package com.example.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonFormat.Shape;

public class DepositAccountVO {

	private String depositaccountcode;
	private String depositaccountbankname;
	private String depositaccountname;
	private Number depositaccountrate;
	private Date depositaccount_startday;
	private Number depositaccountamount;
	
	
	public String getDepositaccountcode() {
		return depositaccountcode;
	}
	public void setDepositaccountcode(String depositaccountcode) {
		this.depositaccountcode = depositaccountcode;
	}
	public String getDepositaccountbankname() {
		return depositaccountbankname;
	}
	public void setDepositaccountbankname(String depositaccountbankname) {
		this.depositaccountbankname = depositaccountbankname;
	}
	public String getDepositaccountname() {
		return depositaccountname;
	}
	public void setDepositaccountname(String depositaccountname) {
		this.depositaccountname = depositaccountname;
	}
	public Number getDepositaccountrate() {
		return depositaccountrate;
	}
	public void setDepositaccountrate(Number depositaccountrate) {
		this.depositaccountrate = depositaccountrate;
	}
	public Date getDepositaccount_startday() {
		return depositaccount_startday;
	}
	public void setDepositaccount_startday(Date depositaccount_startday) {
		this.depositaccount_startday = depositaccount_startday;
	}
	public Number getDepositaccountamount() {
		return depositaccountamount;
	}
	public void setDepositaccountamount(Number depositaccountamount) {
		this.depositaccountamount = depositaccountamount;
	}
	
	
	@Override
	public String toString() {
		return "DepositAccountVO [depositaccountcode=" + depositaccountcode + ", depositaccountbankname="
				+ depositaccountbankname + ", depositaccountname=" + depositaccountname + ", depositaccountrate="
				+ depositaccountrate + ", depositaccount_startday=" + depositaccount_startday
				+ ", depositaccountamount=" + depositaccountamount + "]";
	}
	
	
	
	
}
