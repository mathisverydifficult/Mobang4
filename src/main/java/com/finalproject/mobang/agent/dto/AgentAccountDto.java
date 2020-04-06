package com.finalproject.mobang.agent.dto;

public class AgentAccountDto {
	
	private String agtname_agt;
	private String qualno_agt;
	private String comno_agt;
	private String addr_agt;
	private String name_agt;
	private String userfile;
	private String name;
	private String email;
	private String phone;
	
	public AgentAccountDto() {
		super();
		// TODO Auto-generated constructor stub
	}



	public AgentAccountDto(String agtname_agt, String qualno_agt, String comno_agt, String addr_agt, String name_agt,
			String userfile, String name, String email, String phone) {
		super();
		this.agtname_agt = agtname_agt;
		this.qualno_agt = qualno_agt;
		this.comno_agt = comno_agt;
		this.addr_agt = addr_agt;
		this.name_agt = name_agt;
		this.userfile = userfile;
		this.name = name;
		this.email = email;
		this.phone = phone;
	}

	
	public String getUserfile() {
		return userfile;
	}
	
	
	
	public void setUserfile(String userfile) {
		this.userfile = userfile;
	}
	
	


	public String getAgtname_agt() {
		return agtname_agt;
	}

	public void setAgtname_agt(String agtname_agt) {
		this.agtname_agt = agtname_agt;
	}

	public String getQualno_agt() {
		return qualno_agt;
	}

	public void setQualno_agt(String qualno_agt) {
		this.qualno_agt = qualno_agt;
	}

	public String getComno_agt() {
		return comno_agt;
	}

	public void setComno_agt(String comno_agt) {
		this.comno_agt = comno_agt;
	}

	public String getAddr_agt() {
		return addr_agt;
	}

	public void setAddr_agt(String addr_agt) {
		this.addr_agt = addr_agt;
	}

	public String getName_agt() {
		return name_agt;
	}

	public void setName_agt(String name_agt) {
		this.name_agt = name_agt;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	
	

}
