package com.example.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class CostVO {

	private String cost_companycode;
	private String cost_day;
	private String cost_costaccountcode;
	private String costamount;
	
	
	public String getCost_companycode() {
		return cost_companycode;
	}
	public void setCost_companycode(String cost_companycode) {
		this.cost_companycode = cost_companycode;
	}
	public String getCost_day() {
		return cost_day;
	}
	public void setCost_day(String cost_day) {
		this.cost_day = cost_day;
	}
	public String getCost_costaccountcode() {
		return cost_costaccountcode;
	}
	public void setCost_costaccountcode(String cost_costaccountcode) {
		this.cost_costaccountcode = cost_costaccountcode;
	}
	public String getCostamount() {
		return costamount;
	}
	public void setCostamount(String costamount) {
		this.costamount = costamount;
	}
	
	
	@Override
	public String toString() {
		return "CostVO [cost_companycode=" + cost_companycode + ", cost_day=" + cost_day + ", cost_costaccountcode="
				+ cost_costaccountcode + ", costamount=" + costamount + "]";
	}
	
	
}
