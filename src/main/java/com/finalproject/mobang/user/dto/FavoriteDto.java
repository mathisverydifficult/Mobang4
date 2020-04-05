package com.finalproject.mobang.user.dto;

import java.sql.Date;

public class FavoriteDto {
	private String email;
	private int recentFv;
	private int dibsFv;
	private Date dateFv;
	private String roomEx;
	
	
	public FavoriteDto() {
		super();
	}
	public FavoriteDto(String email, int recentFv, int dibsFv, Date dateFv, String roomEx) {
		super();
		this.email = email;
		this.recentFv = recentFv;
		this.dibsFv = dibsFv;
		this.dateFv = dateFv;
		this.roomEx = roomEx;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getRecentFv() {
		return recentFv;
	}
	public void setRecentFv(int recentFv) {
		this.recentFv = recentFv;
	}
	public int getDibsFv() {
		return dibsFv;
	}
	public void setDibsFv(int dibsFv) {
		this.dibsFv = dibsFv;
	}
	public Date getDateFv() {
		return dateFv;
	}
	public void setDateFv(Date dateFv) {
		this.dateFv = dateFv;
	}
	public String getRoomEx() {
		return roomEx;
	}
	public void setRoomEx(String roomEx) {
		this.roomEx = roomEx;
	}
	
	
}
