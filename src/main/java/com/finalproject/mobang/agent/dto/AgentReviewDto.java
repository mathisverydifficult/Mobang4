package com.finalproject.mobang.agent.dto;

import java.util.Date;

public class AgentReviewDto {
	
	private String email;
	private String agemail;
	private String rcontent;
	private String star;
	private Date rdate;
	private String titlet_q;
	private String title_q;
	private String content_q;
	private Date date_q;
	
	public AgentReviewDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	public AgentReviewDto(String email, String agemail, String rcontent, String star, Date rdate, String titlet_q,
			String title_q, String content_q, Date date_q) {
		super();
		this.email = email;
		this.agemail = agemail;
		this.rcontent = rcontent;
		this.star = star;
		this.rdate = rdate;
		this.titlet_q = titlet_q;
		this.title_q = title_q;
		this.content_q = content_q;
		this.date_q = date_q;
	}

	


	public String getContent_q() {
		return content_q;
	}


	public void setContent_q(String content_q) {
		this.content_q = content_q;
	}


	public Date getRdate() {
		return rdate;
	}


	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}


	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAgemail() {
		return agemail;
	}
	public void setAgemail(String agemail) {
		this.agemail = agemail;
	}
	public String getRcontent() {
		return rcontent;
	}
	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}
	public String getStar() {
		return star;
	}
	public void setStar(String star) {
		this.star = star;
	}
	public String getTitlet_q() {
		return titlet_q;
	}
	public void setTitlet_q(String titlet_q) {
		this.titlet_q = titlet_q;
	}
	public String getTitle_q() {
		return title_q;
	}
	public void setTitle_q(String title_q) {
		this.title_q = title_q;
	}
	public Date getDate_q() {
		return date_q;
	}
	public void setDate_q(Date date_q) {
		this.date_q = date_q;
	}
	
	

}
