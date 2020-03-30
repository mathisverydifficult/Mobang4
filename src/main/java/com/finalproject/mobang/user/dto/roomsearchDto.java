package com.finalproject.mobang.user.dto;

public class roomsearchDto {
	private int myno;
	private String myname;
	private String mytitle;
	private String mycontent;
	private String mypath;
	private String mypremium;
	private String myaddress;
	
	public roomsearchDto() {}
	
	public roomsearchDto(int myno, String myname, String mytitle, String mycontent, String mypath, String mypremium, String myaddress) {
		
		this.myno = myno;
		this.myname = myname;
		this.mytitle = mytitle;
		this.mycontent = mycontent;
		this.mypath = mypath;
		this.mypremium = mypremium;
		this.myaddress = myaddress;
	}

	public int getMyno() {
		return myno;
	}

	public void setMyno(int myno) {
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

	public String getMypath() {
		return mypath;
	}

	public void setMypath(String mypath) {
		this.mypath = mypath;
	}

	public String getMypremium() {
		return mypremium;
	}

	public void setMypremium(String mypremium) {
		this.mypremium = mypremium;
	}

	public String getMyaddress() {
		return myaddress;
	}

	public void setMyaddress(String myaddress) {
		this.myaddress = myaddress;
	}
	
	
	
}
