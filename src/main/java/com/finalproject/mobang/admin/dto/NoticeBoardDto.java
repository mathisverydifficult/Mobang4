package com.finalproject.mobang.admin.dto;

import java.sql.Date;

public class NoticeBoardDto {

	private int seqNt;
	private String titleNt;
	private String contentNt;
	private Date dateNt;
	
	
	
	public NoticeBoardDto() {
		super();
	}
	public NoticeBoardDto(int seqNt, String titleNt, String contentNt, Date dateNt) {
		super();
		this.seqNt = seqNt;
		this.titleNt = titleNt;
		this.contentNt = contentNt;
		this.dateNt = dateNt;
	}
	
	public int getSeqNt() {
		return seqNt;
	}
	public void setSeqNt(int seqNt) {
		this.seqNt = seqNt;
	}
	public String getTitleNt() {
		return titleNt;
	}
	public void setTitleNt(String titleNt) {
		this.titleNt = titleNt;
	}
	public String getContentNt() {
		return contentNt;
	}
	public void setContentNt(String contentNt) {
		this.contentNt = contentNt;
	}
	public Date getDateNt() {
		return dateNt;
	}
	public void setDateNt(Date dateNt) {
		this.dateNt = dateNt;
	}
	
	
	
	
}
