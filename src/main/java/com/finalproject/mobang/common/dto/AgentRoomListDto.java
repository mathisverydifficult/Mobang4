package com.finalproject.mobang.common.dto;

public class AgentRoomListDto {
	
//TITLE_RM,PICTURE_RM,ROOMTYPE_RM,RENT_RM,ROOMPRICE_RM,FLOOR_RM,ROOMSIZE_RM,EXPENSE_RM,PLUSYN_AGT
	private String title_rm;
	private String picture_rm;
	private String roomtype;
	private String rent_rm;
	private String roomprice_rm;
	private String floor_rm;
	private String roomsize_rm;
	private String expense_rm;
	private String plusyn_agt;
	
	
	public AgentRoomListDto(String title_rm, String picture_rm, String roomtype, String rent_rm, String roomprice_rm,
			String floor_rm, String roomsize_rm, String expense_rm, String plusyn_agt) {
		super();
		this.title_rm = title_rm;
		this.picture_rm = picture_rm;
		this.roomtype = roomtype;
		this.rent_rm = rent_rm;
		this.roomprice_rm = roomprice_rm;
		this.floor_rm = floor_rm;
		this.roomsize_rm = roomsize_rm;
		this.expense_rm = expense_rm;
		this.plusyn_agt = plusyn_agt;
	}
	public AgentRoomListDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getTitle_rm() {
		return title_rm;
	}
	public void setTitle_rm(String title_rm) {
		this.title_rm = title_rm;
	}
	public String getPicture_rm() {
		return picture_rm;
	}
	public void setPicture_rm(String picture_rm) {
		this.picture_rm = picture_rm;
	}
	public String getRoomtype() {
		return roomtype;
	}
	public void setRoomtype(String roomtype) {
		this.roomtype = roomtype;
	}
	public String getRent_rm() {
		return rent_rm;
	}
	public void setRent_rm(String rent_rm) {
		this.rent_rm = rent_rm;
	}
	public String getRoomprice_rm() {
		return roomprice_rm;
	}
	public void setRoomprice_rm(String roomprice_rm) {
		this.roomprice_rm = roomprice_rm;
	}
	public String getFloor_rm() {
		return floor_rm;
	}
	public void setFloor_rm(String floor_rm) {
		this.floor_rm = floor_rm;
	}
	public String getRoomsize_rm() {
		return roomsize_rm;
	}
	public void setRoomsize_rm(String roomsize_rm) {
		this.roomsize_rm = roomsize_rm;
	}
	public String getExpense_rm() {
		return expense_rm;
	}
	public void setExpense_rm(String expense_rm) {
		this.expense_rm = expense_rm;
	}
	public String getPlusyn_agt() {
		return plusyn_agt;
	}
	public void setPlusyn_agt(String plusyn_agt) {
		this.plusyn_agt = plusyn_agt;
	}
	
	

}
