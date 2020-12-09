package com.example.domain;

public class CostAccountVO {
	private String costaccountcode;
	private String costaccountname;
	
	
	public String getCostaccountcode() {
		return costaccountcode;
	}
	public void setCostaccountcode(String costaccountcode) {
		this.costaccountcode = costaccountcode;
	}
	public String getCostaccountname() {
		return costaccountname;
	}
	public void setCostaccountname(String costaccountname) {
		this.costaccountname = costaccountname;
	}
	
	
	@Override
	public String toString() {
		return "CostAccountVO [costaccountcode=" + costaccountcode + ", costaccountname=" + costaccountname + "]";
	}

	
}
