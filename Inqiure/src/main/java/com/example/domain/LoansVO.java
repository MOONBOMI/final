package com.example.domain;

public class LoansVO {

	private String loans_companycode;
	private String loans_loansaccountcode;
	private String loans_repaymentday;
	private String loansamount;
	private String loansbalance;
	
	
	public String getLoans_companycode() {
		return loans_companycode;
	}
	public void setLoans_companycode(String loans_companycode) {
		this.loans_companycode = loans_companycode;
	}
	public String getLoans_loansaccountcode() {
		return loans_loansaccountcode;
	}
	public void setLoans_loansaccountcode(String loans_loansaccountcode) {
		this.loans_loansaccountcode = loans_loansaccountcode;
	}
	public String getLoans_repaymentday() {
		return loans_repaymentday;
	}
	public void setLoans_repaymentday(String loans_repaymentday) {
		this.loans_repaymentday = loans_repaymentday;
	}
	public String getLoansamount() {
		return loansamount;
	}
	public void setLoansamount(String loansamount) {
		this.loansamount = loansamount;
	}
	public String getLoansbalance() {
		return loansbalance;
	}
	public void setLoansbalance(String loansbalance) {
		this.loansbalance = loansbalance;
	}
	
	
	@Override
	public String toString() {
		return "LoansVO [loans_companycode=" + loans_companycode + ", loans_loansaccountcode=" + loans_loansaccountcode
				+ ", loans_repaymentday=" + loans_repaymentday + ", loansamount=" + loansamount + ", loansbalance="
				+ loansbalance + "]";
	}
	
	
}
