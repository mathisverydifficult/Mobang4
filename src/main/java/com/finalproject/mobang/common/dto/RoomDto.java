package com.finalproject.mobang.common.dto;

import com.finalproject.mobang.agent.dto.AgentJoinDto;

// test sql creat&insert 수정했어요
public class RoomDto extends AgentJoinDto {
	
	private int no_rm;
	private String email;
//	private String phone_rm;
//	private String agtname_rm;
//	private String plusyn_rm;
	private String title_rm;
	private String picture_rm;
	private String animal_rm;
	private String elevator_rm;
	private String veranda_rm;
	private String roomin_rm;
	private String content_rm;
	private String aircon_rm;
	private String washer_rm;
	private String gasrange_rm;
	private String induction_rm;
	private String desk_rm;
	private String tv_rm;
	private String ref_rm;
	private String bed_rm;
	private String showhouse_rm;
	private String closet_rm;
	private String microwave_rm;
	private String sink_rm;
	private String rent_rm;
	private String roomprice_rm;
	private String expense_rm;
	private String roomtype_rm;;
	private String addr_rm;
	private String addr_dt_rm;
	private String roomsize_rm;
	private String roomsize2_rm;
	private String floor_rm;
	private String floor2_rm;
	private String parking_rm;
	
	public RoomDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
// 인서트 결과 셀렉트원
	public RoomDto(String rent_rm, String roomprice_rm, String roomtype_rm, String addr_rm, String addr_dt_rm,
			String roomsize_rm, String roomsize2_rm) {
		super();
		this.rent_rm = rent_rm;
		this.roomprice_rm = roomprice_rm;
		this.roomtype_rm = roomtype_rm;
		this.addr_rm = addr_rm;
		this.addr_dt_rm = addr_dt_rm;
		this.roomsize_rm = roomsize_rm;
		this.roomsize2_rm = roomsize2_rm;
	}


// 중개사 리스트
	public RoomDto(String title_rm, String picture_rm, String roomprice_rm, String expense_rm,
			String roomtype_rm,String rent_rm, String roomsize_rm, String floor_rm) {
		this.title_rm = title_rm;
		this.picture_rm = picture_rm;
		this.roomprice_rm = roomprice_rm;
		this.expense_rm = expense_rm;
		this.roomtype_rm = roomtype_rm;
		this.rent_rm=rent_rm;
		this.roomsize_rm = roomsize_rm;
		this.floor_rm = floor_rm;
	}



	public RoomDto(int no_rm, String email, String title_rm,
			String picture_rm,String animal_rm, String elevator_rm,
			String veranda_rm, String roomin_rm, String content_rm, String aircon_rm, String washer_rm,
			String gasrange_rm, String induction_rm, String desk_rm, String tv_rm, String ref_rm, String bed_rm,
			String showhouse_rm, String closet_rm, String microwave_rm, String sink_rm, String rent_rm,
			String roomprice_rm, String expense_rm, String roomtype_rm, String addr_rm, String addr_dt_rm,
			String roomsize_rm, String roomsize2_rm, String floor_rm, String floor2_rm, String parking_rm) {
		super();
		this.no_rm = no_rm;
		this.email = email;
		this.title_rm = title_rm;
		this.picture_rm = picture_rm;
		this.animal_rm = animal_rm;
		this.elevator_rm = elevator_rm;
		this.veranda_rm = veranda_rm;
		this.roomin_rm = roomin_rm;
		this.content_rm = content_rm;
		this.aircon_rm = aircon_rm;
		this.washer_rm = washer_rm;
		this.gasrange_rm = gasrange_rm;
		this.induction_rm = induction_rm;
		this.desk_rm = desk_rm;
		this.tv_rm = tv_rm;
		this.ref_rm = ref_rm;
		this.bed_rm = bed_rm;
		this.showhouse_rm = showhouse_rm;
		this.closet_rm = closet_rm;
		this.microwave_rm = microwave_rm;
		this.sink_rm=sink_rm;
		this.rent_rm = rent_rm;
		this.roomprice_rm = roomprice_rm;
		this.expense_rm = expense_rm;
		this.roomtype_rm = roomtype_rm;
		this.addr_rm = addr_rm;
		this.addr_dt_rm = addr_dt_rm;
		this.roomsize_rm = roomsize_rm;
		this.roomsize2_rm = roomsize2_rm;
		this.floor_rm = floor_rm;
		this.floor2_rm = floor2_rm;
		this.parking_rm = parking_rm;
	}

	public int getNo_rm() {
		return no_rm;
	}

	public void setNo_rm(int no_rm) {
		this.no_rm = no_rm;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
//
//	public String getPhone_rm() {
//		return phone_rm;
//	}
//
//	public void setPhone_rm(String phone_rm) {
//		this.phone_rm = phone_rm;
//	}
//
//	public String getAgtname_rm() {
//		return agtname_rm;
//	}
//
//	public void setAgtname_rm(String agtname_rm) {
//		this.agtname_rm = agtname_rm;
//	}
//
//	public String getPlusyn_rm() {
//		return plusyn_rm;
//	}
//
//	public void setPlusyn_rm(String plusyn_rm) {
//		this.plusyn_rm = plusyn_rm;
//	}

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

//	public String getHeat_rm() {
//		return heat_rm;
//	}
//
//	public void setHeat_rm(String heat_rm) {
//		this.heat_rm = heat_rm;
//	}
//
//	public String getBuiltin_rm() {
//		return builtin_rm;
//	}
//
//	public void setBuiltin_rm(String builtin_rm) {
//		this.builtin_rm = builtin_rm;
//	}

	public String getAnimal_rm() {
		return animal_rm;
	}

	public void setAnimal_rm(String animal_rm) {
		this.animal_rm = animal_rm;
	}

	public String getElevator_rm() {
		return elevator_rm;
	}

	public void setElevator_rm(String elevator_rm) {
		this.elevator_rm = elevator_rm;
	}

	public String getVeranda_rm() {
		return veranda_rm;
	}

	public void setVeranda_rm(String veranda_rm) {
		this.veranda_rm = veranda_rm;
	}

	public String getRoomin_rm() {
		return roomin_rm;
	}

	public void setRoomin_rm(String roomin_rm) {
		this.roomin_rm = roomin_rm;
	}

	public String getContent_rm() {
		return content_rm;
	}

	public void setContent_rm(String content_rm) {
		this.content_rm = content_rm;
	}

	public String getAircon_rm() {
		return aircon_rm;
	}

	public void setAircon_rm(String aircon_rm) {
		this.aircon_rm = aircon_rm;
	}

	public String getWasher_rm() {
		return washer_rm;
	}

	public void setWasher_rm(String washer_rm) {
		this.washer_rm = washer_rm;
	}

	public String getGasrange_rm() {
		return gasrange_rm;
	}

	public void setGasrange_rm(String gasrange_rm) {
		this.gasrange_rm = gasrange_rm;
	}

	public String getInduction_rm() {
		return induction_rm;
	}

	public void setInduction_rm(String induction_rm) {
		this.induction_rm = induction_rm;
	}

	public String getDesk_rm() {
		return desk_rm;
	}

	public void setDesk_rm(String desk_rm) {
		this.desk_rm = desk_rm;
	}

	public String getTv_rm() {
		return tv_rm;
	}

	public void setTv_rm(String tv_rm) {
		this.tv_rm = tv_rm;
	}

	public String getRef_rm() {
		return ref_rm;
	}

	public void setRef_rm(String ref_rm) {
		this.ref_rm = ref_rm;
	}

	public String getBed_rm() {
		return bed_rm;
	}

	public void setBed_rm(String bed_rm) {
		this.bed_rm = bed_rm;
	}

	public String getShowhouse_rm() {
		return showhouse_rm;
	}

	public void setShowhouse_rm(String showhouse_rm) {
		this.showhouse_rm = showhouse_rm;
	}

	public String getCloset_rm() {
		return closet_rm;
	}

	public void setCloset_rm(String closet_rm) {
		this.closet_rm = closet_rm;
	}

	public String getMicrowave_rm() {
		return microwave_rm;
	}

	public void setMicrowave_rm(String microwave_rm) {
		this.microwave_rm = microwave_rm;
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

	public String getExpense_rm() {
		return expense_rm;
	}

	public void setExpense_rm(String expense_rm) {
		this.expense_rm = expense_rm;
	}

	public String getRoomtype_rm() {
		return roomtype_rm;
	}

	public void setRoomtype_rm(String roomtype_rm) {
		this.roomtype_rm = roomtype_rm;
	}

	public String getAddr_rm() {
		return addr_rm;
	}

	public void setAddr_rm(String addr_rm) {
		this.addr_rm = addr_rm;
	}

	public String getAddr_dt_rm() {
		return addr_dt_rm;
	}

	public void setAddr_dt_rm(String addr_dt_rm) {
		this.addr_dt_rm = addr_dt_rm;
	}

	public String getRoomsize_rm() {
		return roomsize_rm;
	}

	public void setRoomsize_rm(String roomsize_rm) {
		this.roomsize_rm = roomsize_rm;
	}

	public String getRoomsize2_rm() {
		return roomsize2_rm;
	}

	public void setRoomsize2_rm(String roomsize2_rm) {
		this.roomsize2_rm = roomsize2_rm;
	}

	public String getFloor_rm() {
		return floor_rm;
	}

	public void setFloor_rm(String floor_rm) {
		this.floor_rm = floor_rm;
	}

	public String getFloor2_rm() {
		return floor2_rm;
	}

	public void setFloor2_rm(String floor2_rm) {
		this.floor2_rm = floor2_rm;
	}

	public String getParking_rm() {
		return parking_rm;
	}

	public void setParking_rm(String parking_rm) {
		this.parking_rm = parking_rm;
	}

	public String getSink_rm() {
		return sink_rm;
	}

	public void setSink_rm(String sink_rm) {
		this.sink_rm = sink_rm;
	}

	
}
