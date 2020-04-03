package com.finalproject.mobang.agent.dto;

public class AgentProductDto {
	
	private String name_it;
	private String addr_pay;
	private String startdate_pay;
	private String enddate_pay;
	private String price_it;
	private String email;
	
	public AgentProductDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AgentProductDto(String name_it, String addr_pay, String startdate_pay, String enddate_pay, String price_it) {
		super();
		this.name_it = name_it;
		this.addr_pay = addr_pay;
		this.startdate_pay = startdate_pay;
		this.enddate_pay = enddate_pay;
		this.price_it = price_it;
	}
	public String getName_it() {
		return name_it;
	}
	public void setName_it(String name_it) {
		this.name_it = name_it;
	}
	public String getAddr_pay() {
		return addr_pay;
	}
	public void setAddr_pay(String addr_pay) {
		this.addr_pay = addr_pay;
	}
	public String getStartdate_pay() {
		return startdate_pay;
	}
	public void setStartdate_pay(String startdate_pay) {
		this.startdate_pay = startdate_pay;
	}
	public String getEnddate_pay() {
		return enddate_pay;
	}
	public void setEnddate_pay(String enddate_pay) {
		this.enddate_pay = enddate_pay;
	}
	public String getPrice_it() {
		return price_it;
	}
	public void setPrice_it(String price_it) {
		this.price_it = price_it;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	
	

}
