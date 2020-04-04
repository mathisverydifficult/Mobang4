package com.finalproject.mobang.user.dto;

import java.sql.Date;

// 유저들이 검색했던 기록을 저장하는 테이블
public class SearchDto {
	private int seqSh;
	private String email;
	private String contentSh;
	private Date dateSh;
	
	
	public SearchDto() {
		super();
	}
	public SearchDto(int seqSh, String email, String contentSh, Date dateSh) {
		super();
		this.seqSh = seqSh;
		this.email = email;
		this.contentSh = contentSh;
		this.dateSh = dateSh;
	}
	
	
	public int getSeqSh() {
		return seqSh;
	}
	public void setSeqSh(int seqSh) {
		this.seqSh = seqSh;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getContentSh() {
		return contentSh;
	}
	public void setContentSh(String contentSh) {
		this.contentSh = contentSh;
	}
	public Date getDateSh() {
		return dateSh;
	}
	public void setDateSh(Date dateSh) {
		this.dateSh = dateSh;
	}
	
	
	
}
