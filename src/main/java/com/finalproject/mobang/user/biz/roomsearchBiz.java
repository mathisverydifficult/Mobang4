package com.finalproject.mobang.user.biz;

import java.util.List;

import com.finalproject.mobang.user.dto.roomsearchDto;

public interface roomsearchBiz {
	
	public List<roomsearchDto> selectList();
	public roomsearchDto selectOne(int myno);
	public int insert(roomsearchDto dto);
	public int update(roomsearchDto dto);
	public int delete(int myno);
}
