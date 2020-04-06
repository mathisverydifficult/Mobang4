package com.finalproject.mobang.user.biz;

import java.util.List;

import com.finalproject.mobang.user.dto.roomsearchDto;

public interface roomsearchBiz {
	
	public List<roomsearchDto> dibList(String email);
	public List<roomsearchDto> selectsearchList(String keyword, String email);
	public roomsearchDto selectOne(int myno, String email);
	public int insert(roomsearchDto dto);
	public int update(roomsearchDto dto);
	public int delete(int myno);
}
