package com.finalproject.mobang.agent.dto;

import java.util.Date;

public class AgentNoticeDto {

	private int noticeno;
	private String noticetitle;
	private String noticecon;
	private Date noticedate;

	public AgentNoticeDto() {

	}

	public AgentNoticeDto(int noticeno, String noticetitle, String noticecon, Date noticedate) {
		this.noticeno = noticeno;
		this.noticetitle = noticetitle;
		this.noticecon = noticecon;
		this.noticedate = noticedate;
	}

	public int getNoticeno() {
		return noticeno;
	}

	public void setNoticeno(int noticeno) {
		this.noticeno = noticeno;
	}

	public String getNoticetitle() {
		return noticetitle;
	}

	public void setNoticetitle(String noticetitle) {
		this.noticetitle = noticetitle;
	}

	public String getNoticecon() {
		return noticecon;
	}

	public void setNoticecon(String noticecon) {
		this.noticecon = noticecon;
	}

	public Date getNoticedate() {
		return noticedate;
	}

	public void setNoticedate(Date noticedate) {
		this.noticedate = noticedate;
	}
	
	
}
