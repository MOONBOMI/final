package com.example.domain;

public class DepositVO {

	private String deposit_companycode;
	private String deposit_day;
	private String deposit_depositaccountcode;
	private String deposittype;
	private String depositamount;
	private String depositbalance;
	
	
	public String getDeposit_companycode() {
		return deposit_companycode;
	}
	public void setDeposit_companycode(String deposit_companycode) {
		this.deposit_companycode = deposit_companycode;
	}
	public String getDeposit_day() {
		return deposit_day;
	}
	public void setDeposit_day(String deposit_day) {
		this.deposit_day = deposit_day;
	}
	public String getDeposit_depositaccountcode() {
		return deposit_depositaccountcode;
	}
	public void setDeposit_depositaccountcode(String deposit_depositaccountcode) {
		this.deposit_depositaccountcode = deposit_depositaccountcode;
	}
	public String getDeposittype() {
		return deposittype;
	}
	public void setDeposittype(String deposittype) {
		this.deposittype = deposittype;
	}
	public String getDepositamount() {
		return depositamount;
	}
	public void setDepositamount(String depositamount) {
		this.depositamount = depositamount;
	}
	public String getDepositbalance() {
		return depositbalance;
	}
	public void setDepositbalance(String depositbalance) {
		this.depositbalance = depositbalance;
	}
	
	
	@Override
	public String toString() {
		return "DepositVO [deposit_companycode=" + deposit_companycode + ", deposit_day=" + deposit_day
				+ ", deposit_depositaccountcode=" + deposit_depositaccountcode + ", deposittype=" + deposittype
				+ ", depositamount=" + depositamount + ", depositbalance=" + depositbalance + "]";
	}
	
}
