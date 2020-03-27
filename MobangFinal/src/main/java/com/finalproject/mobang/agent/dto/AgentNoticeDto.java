package com.finalproject.mobang.agent.dto;

import java.util.Date;

public class AgentNoticeDto {

	private int seq_nt;
	private String title_nt;
	private String content_nt;
	private Date date_nt;

	public AgentNoticeDto() {

	}

	public AgentNoticeDto(int seq_nt, String title_nt, String content_nt, Date date_nt) {
		this.seq_nt = seq_nt;
		this.title_nt = title_nt;
		this.content_nt = content_nt;
		this.date_nt = date_nt;
	}

	public int getSeq_nt() {
		return seq_nt;
	}

	public void setSeq_nt(int seq_nt) {
		this.seq_nt = seq_nt;
	}

	public String getTitle_nt() {
		return title_nt;
	}

	public void setTitle_nt(String title_nt) {
		this.title_nt = title_nt;
	}

	public String getContent_nt() {
		return content_nt;
	}

	public void setContent_nt(String content_nt) {
		this.content_nt = content_nt;
	}

	public Date getDate_nt() {
		return date_nt;
	}

	public void setDate_nt(Date date_nt) {
		this.date_nt = date_nt;
	}
	
	
}
