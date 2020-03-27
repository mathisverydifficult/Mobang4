package com.finalproject.mobang.user.dto;

import java.util.Date;

public class reviewDto {
	private String myno; 
	private String myname;
	private String mytitle;
	private String mycontent;
	private Date mydate;
	
	public reviewDto() {}
	
	public reviewDto(String myno, String myname, String mytitle, String mycontent, Date mydate) {
		super();
		this.myno = myno;
		this.myname = myname;
		this.mytitle = mytitle;
		this.mycontent = mycontent;
		this.mydate = mydate;
	}

	public String getMyno() {
		return myno;
	}

	public void setMyno(String myno) {
		this.myno = myno;
	}

	public String getMyname() {
		return myname;
	}

	public void setMyname(String myname) {
		this.myname = myname;
	}

	public String getMytitle() {
		return mytitle;
	}

	public void setMytitle(String mytitle) {
		this.mytitle = mytitle;
	}

	public String getMycontent() {
		return mycontent;
	}

	public void setMycontent(String mycontent) {
		this.mycontent = mycontent;
	}

	public Date getMydate() {
		return mydate;
	}

	public void setMydate(Date mydate) {
		this.mydate = mydate;
	}
	
	
	
	
}
